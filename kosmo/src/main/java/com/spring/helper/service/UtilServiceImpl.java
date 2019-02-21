package com.spring.helper.service;


import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.helper.dao.UtilDAO;
import com.spring.helper.method.vision.GoogleVision;
import com.spring.helper.vo.jsonVO.weather.EarthQuakeVO;

@Service
public class UtilServiceImpl implements UtilService {

	@Autowired
	UtilDAO utilDAO;
	
	@Autowired
	GoogleVision gv;
	
	private static final Logger logger = LoggerFactory.getLogger(UtilServiceImpl.class);
	//재영 서비스 시작
	
	//이미지 검색 ----------- 이미지 업로드 부분이라 경로 통일이 필요함   - URL 방식 
	public Map<String,Object> imageSearchURLPro(MultipartHttpServletRequest req) throws Exception {
		logger.info("URL 검색");
		String urlPath ="";
		//이미지가 업로드 되는 실제 위치 경로 구하기 (깃 working tree 경로)
		String[] imgArray = gv.imgUploader(req);
		String imgPathString = imgArray[0]; 
		String imgName = imgArray[1];
		logger.info("*** imgPath : " + imgPathString);
		//이미지 경로를 외부 접속 가능하게 변환 - http://115.91.88.226:2222/project/ 형식
		urlPath = gv.makeImgURL(imgPathString);
		logger.info("*** newPath : " + urlPath);
		PrintStream out = System.out;
		//여기서 이제 값을 받아야함
		Thread.sleep(2000);
		Map<String,Object> result = gv.detectLabelsGcs(urlPath, out);
		result.put("imgName", imgName);
		return result;
	}
	//이미지 검색 -- 로컬 검색
	public Map<String,Object> imageSearchLocalPro(MultipartHttpServletRequest req) throws Exception {
		logger.info("Local 검색");
		//이미지가 업로드 되는 실제 위치 경로 구하기 (깃 working tree 경로) - 로컬 경로
		String[] imgArray = gv.imgUploader(req);
		String imgPathString = imgArray[0]; 
		String imgName = imgArray[1];
		logger.info("*** imgPath : " + imgPathString);
		PrintStream out = System.out;
		Thread.sleep(5000);
		String searchType = req.getParameter("searchType");
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		if(searchType.equals("label")) {//라벨 검색
			result = gv.detectLabels(imgPathString, out);
		}else if(searchType.equals("web")) {// 웹검색
			result = gv.detectWebDetections(imgPathString, out);
		}else if(searchType.equals("text")) {//텍스트 검색
			result = gv.detectText(imgPathString, out);
		}else if(searchType.equals("hand")) {// 손글씨 검색
			result = gv.detectDocumentText(imgPathString, out);
		}else if(searchType.equals("landmark")) {//랜드마크 검색 
			result = gv.detectLandmarks(imgPathString, out);
		}
		
		result.put("imgName", imgName);
		result.put("type", searchType);
		return result;
	}
	
	//지진 정보 가져오기 
	public EarthQuakeVO earthQuakeView(HttpServletRequest req) throws Exception{
		if(req.getParameter("tmSeq") !=null) {
			int tmSeq = Integer.parseInt(req.getParameter("tmSeq"));
			return utilDAO.selectEarthQuake(tmSeq);
		}else {
			return utilDAO.selectEarthQuake();
		}
	}
	//재영 서비스 끝
	
}
