package com.spring.helper.method.vision;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
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
import com.google.cloud.vision.v1.LocationInfo;
import com.google.cloud.vision.v1.TextAnnotation;
import com.google.cloud.vision.v1.WebDetection;
import com.google.cloud.vision.v1.WebDetection.WebEntity;
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

	//이미지 업로드 하구 경로를 리턴
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

	//로컬 이미지 경로로 LABEL 정보 구하기
	public static Map<String,Object> detectLabels(String filePath, PrintStream out) throws Exception, IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		AnnotateImageRequest request =
				AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		Map<String,Object> map = new HashMap<String,Object>(); //리턴 용 맵 생성
		String error = "";
		List<String> desc = new ArrayList<String>();
		List<Float> score = new ArrayList<Float>();

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();
			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					error = res.getError().getMessage();
					map.put("error", error);
					return map;
				}
				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
					desc.add(annotation.getDescription());
					score.add(annotation.getScore());
					annotation.getAllFields().forEach((k, v) -> out.printf("%s : %s\n", k, v.toString()));
				}
				map.put("desc", desc);
				map.put("score", score);
			}
			return map;
		}
	}

	//URL 이미지 경로로 LABEL 정보 구하기
	public static Map<String,Object> detectLabelsGcs(String imgPath, PrintStream out) throws Exception, IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();
		ImageSource imgSource = ImageSource.newBuilder().setImageUri(imgPath).build();
		Image img = Image.newBuilder().setSource(imgSource).build();
		System.out.println("img===>"+img.getSource());
		Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		AnnotateImageRequest request =
				AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		Map<String,Object> map = new HashMap<String,Object>();
		String error = "";
		List<String> desc = new ArrayList<String>();
		List<Float> score = new ArrayList<Float>();

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();
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

	// web 검색 결과 
	public static Map<String,Object> detectWebDetections(String filePath, PrintStream out) throws Exception,
	IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.WEB_DETECTION).build();
		AnnotateImageRequest request =
				AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		Map<String,Object> map = new HashMap<String,Object>();
		String error = "";
		List<String> desc = new ArrayList<String>();
		List<Float> score = new ArrayList<Float>();

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					error = res.getError().getMessage();
					map.put("error", error);
					return map;
				}

				// Search the web for usages of the image. You could use these signals later
				// for user input moderation or linking external references.
				// For a full list of available annotations, see http://g.co/cloud/vision/docs
				WebDetection annotation = res.getWebDetection();
				out.println("Entity:Id:Score");
				out.println("===============");
				for (WebEntity entity : annotation.getWebEntitiesList()) {
					if(!entity.getDescription().equals("")) {
						desc.add(entity.getDescription());
						score.add(entity.getScore());
					}
					out.println(entity.getDescription() + " : " + entity.getEntityId() + " : "
							+ entity.getScore());
				}
				map.put("desc", desc);
				map.put("score", score);
				// 불필요
				/*for (WebLabel label : annotation.getBestGuessLabelsList()) {
					out.format("\nBest guess label: %s", label.getLabel());
				}
				out.println("\nPages with matching images: Score\n==");
				for (WebPage page : annotation.getPagesWithMatchingImagesList()) {
					out.println(page.getUrl() + " : " + page.getScore());
				}
				out.println("\nPages with partially matching images: Score\n==");
				for (WebImage image : annotation.getPartialMatchingImagesList()) {
					out.println(image.getUrl() + " : " + image.getScore());
				}
				out.println("\nPages with fully matching images: Score\n==");
				for (WebImage image : annotation.getFullMatchingImagesList()) {
					out.println(image.getUrl() + " : " + image.getScore());
				}
				out.println("\nPages with visually similar images: Score\n==");
				for (WebImage image : annotation.getVisuallySimilarImagesList()) {
					out.println(image.getUrl() + " : " + image.getScore());
				}*/
			}
		}
		return map;
	}

	// text 인식 # 1
	public static Map<String,Object> detectText(String filePath, PrintStream out) throws Exception, IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		AnnotateImageRequest request =
				AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		Map<String,Object> map = new HashMap<String,Object>();
		String error = "";
		List<String> result = new ArrayList<String>();

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					error = res.getError().getMessage();
					map.put("error", error);
					return map;
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
					result.add(annotation.getDescription());
					/*out.printf("Text: %s\n", annotation.getDescription());
					out.printf("Position : %s\n", annotation.getBoundingPoly());*/
				}
				map.put("result", result);
				System.out.println("Map:"+map.toString());
			}
		}return map;
	}

	// text 인식 # 2
	public static Map<String,Object> detectDocumentText(String filePath, PrintStream out) throws Exception,
	IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.DOCUMENT_TEXT_DETECTION).build();
		AnnotateImageRequest request =
				AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		Map<String,Object> map = new HashMap<String,Object>();
		String error = "";
		List<String> result = new ArrayList<String>();

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();
			client.close();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					error = res.getError().getMessage();
					map.put("error", error);
					return map;
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				TextAnnotation annotation = res.getFullTextAnnotation();
				/*for (Page page: annotation.getPagesList()) {
					String pageText = "";
					for (Block block : page.getBlocksList()) {
						String blockText = "";
						for (Paragraph para : block.getParagraphsList()) {
							String paraText = "";
							for (Word word: para.getWordsList()) {
								String wordText = "";
								for (Symbol symbol: word.getSymbolsList()) {
									wordText = wordText + symbol.getText();
									out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),
											symbol.getConfidence());
								}
								out.format("Word text: %s (confidence: %f)\n\n", wordText, word.getConfidence());
								paraText = String.format("%s %s", paraText, wordText);
							}
							// Output Example using Paragraph:
							out.println("\nParagraph: \n" + paraText);
							out.format("Paragraph Confidence: %f\n", para.getConfidence());
							blockText = blockText + paraText;
						}
						pageText = pageText + blockText;
					}
				}*/
				result.add(annotation.getText());
				map.put("result", result);
				out.println(annotation.getText());
			}
		}return map;
	}

	//랜드마크 검색
	public static Map<String,Object> detectLandmarks(String filePath, PrintStream out) throws Exception,
	IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.LANDMARK_DETECTION).build();
		AnnotateImageRequest request =
				AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		Map<String,Object> map = new HashMap<String,Object>();
		String error = "";
		String name = "";
		String lat = "";
		String lng = "";
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();
			
			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					error = res.getError().getMessage();
					map.put("error", error);
					return map;				
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getLandmarkAnnotationsList()) {
					LocationInfo info = annotation.getLocationsList().listIterator().next();
					out.printf("Landmark: %s\n %s\n", annotation.getDescription(), info.getLatLng());
					name = annotation.getDescription();
					String temp[] = String.valueOf(info.getLatLng()).split("longitude:");
					lat = temp[0].replace("latitude: ", "");
					lng = temp[1].replace(" ","");
					if(name.length() == 0) {
						map.put("search", "no");
						System.out.println("노검색");
					}else {
						map.put("search", "yes");
						System.out.println("예스검색");
					}
				}
			}
			map.put("name", name);
			map.put("lat", lat);
			map.put("lng", lng);
			System.out.println(map.toString());
		}return map;
	}
}
