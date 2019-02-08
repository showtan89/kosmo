package com.spring.helper.method.vision;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.protobuf.ByteString;

@Component
public class GoogleVision {

	/*<!-- 1 구글 API -->
	구글 클라우드 스토리지에 업로드 후 검색하는 것이 보다 깔끔하나
	클라우드를 경우하는 경우 작업량이 배가 되기 때문에
	스토리지 사용하지 않고, 비전 API만 사용
	<dependency>
		<groupId>com.google.cloud</groupId>
		<artifactId>google-cloud-vision</artifactId>
		<version>1.49.0</version>
	</dependency> 
	<dependency>
		<groupId>com.google.cloud</groupId>
		<artifactId>google-cloud-storage</artifactId>
		<version>1.49.0</version>
	</dependency>

	<!-- 2 환경변수 설정-->
	사용량 측정이 되어야 하기 때문에 인가된 시스템에서만 사용하게끔
	해당 JSON 파일을 사용자 및 시스템 환경변수에 아래의 이름과 경로를 등록해 주어야 함.
	GOOGLE_APPLICATION_CREDENTIALS=[C:\Users\panga\Image Search Test-0c679512b292.json] */

	//빈에서 GIT working tree 경로를 가져온다
	@Resource(name="songUploadPath")
	String imgPath;

	//이미지 주소 변경하기
	public String makeImgURL(String imgPathString) {
		imgPathString = imgPathString.replace("\\\\", "/");
		imgPathString = imgPathString.replace("\\", "/");
		imgPathString = imgPathString.replace("C:/Users/panga/git/kosmo1/kosmo/src/main/webapp/", "http://115.91.88.226:2222/project/");
		return imgPathString;
	}
	
	//이미지 업로더 하구 경로를 리턴
	public String[] imgUploader(MultipartHttpServletRequest req) throws Exception{
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/img/search/");
		String newPath = imgPath +"search\\";
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyyMMdd_HHmmss_", Locale.KOREA );
		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format (currentTime);
		String imgPathString = "";
		String imgName = "";
		if(req.getFile("inputImageFile").getOriginalFilename().length() != 0) {
			MultipartFile file = req.getFile("inputImageFile");
			file.transferTo(new File(saveDir+file.getOriginalFilename()));
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(newPath +mTime+ file.getOriginalFilename());
			imgPathString = newPath +mTime+ file.getOriginalFilename();
			int data = 0;
			imgName = mTime+file.getOriginalFilename();
			while((data = fis.read()) != -1) {
				fos.write(data);  
			}
			fis.close();
			fos.close();
		}
		String [] arr = {imgPathString,imgName};
		return arr;
	}

	//이미지의 전반적인 분석
	public void gvGetLabel(String imgPath) throws IOException {

		//하위 폴더 설정 해주기
		//imgPath = imgPath + "newPATH";

		// 구글 VISION 객체 생성
		try (ImageAnnotatorClient vision = ImageAnnotatorClient.create()) {

			// 이미지의 경로
			String fileName1 = "C:/demo-image.jpg";
			String fileName2 = "C:/img1.jpg";
			String fileName3 = "C:/img2.jpg";
			String fileName4 = "C:/img3.jpg";
			String fileName5 = imgPath;

			// 이미지를 메모리에 올림
			Path path = Paths.get(fileName4);
			byte[] data = Files.readAllBytes(path);
			ByteString imgBytes = ByteString.copyFrom(data);

			// 이미지에 대한 분석 요청
			List<AnnotateImageRequest> requests = new ArrayList<>();
			Image img = Image.newBuilder().setContent(imgBytes).build();
			Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
			AnnotateImageRequest request = AnnotateImageRequest.newBuilder()
					.addFeatures(feat)
					.setImage(img)
					.build();
			requests.add(request);

			// 이미지 파일의 내용 가져오기
			BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.printf("Error: %s\n", res.getError().getMessage());
					return;
				}
				for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
					annotation.getAllFields().forEach((k, v) ->
					System.out.printf("%s : %s\n", k, v.toString()));
				}
			}
		}
	}

	//직접 경로 줘서 이미지 구하기
	public static void detectLabels(String filePath, PrintStream out) throws Exception, IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		AnnotateImageRequest request =
				AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					return;
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
					annotation.getAllFields().forEach((k, v) -> out.printf("%s : %s\n", k, v.toString()));
				}
			}
		}
	}

	//외부 URL로 이미지 정보 구하기
	public static Map<String,Object> detectLabelsGcs(String imgPath, PrintStream out) throws Exception, IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();
		//이미지 저장이 구글 클라우스 스토리지가 아니라 사용 불가
		//ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(gcsPath).build();
		ImageSource imgSource = ImageSource.newBuilder().setImageUri(imgPath).build();
		Image img = Image.newBuilder().setSource(imgSource).build();
		System.out.println("img===>"+img.getSource());
		Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		AnnotateImageRequest request =
				AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);
		//System.out.println("request===>"+requests.toString());
		Map<String,Object> map = new HashMap<String,Object>();
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();
			
			String error = "";
			List<String> desc = new ArrayList<String>();
			List<Float> score = new ArrayList<Float>();
			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					error = res.getError().getMessage();
					map.put("error", error);
					return map;
				}
				map.put("error", null);
				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
					desc.add(annotation.getDescription());
					score.add(annotation.getScore());
					annotation.getAllFields().forEach((k, v) -> out.printf("%s : %s\n", k, v.toString()));
				}
			}
			map.put("desc", desc);
			map.put("score", score);
		}
		return map;
	}
}
