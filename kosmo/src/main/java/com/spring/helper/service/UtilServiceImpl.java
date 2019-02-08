package com.spring.helper.service;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.helper.dao.UtilDAO;
import com.spring.helper.method.vision.GoogleVision;

@Service
public class UtilServiceImpl implements UtilService {

	@Autowired
	UtilDAO utilDAO;
	
	@Autowired
	GoogleVision gv;
	
	private static final Logger logger = LoggerFactory.getLogger(UtilServiceImpl.class);
	//재영 서비스 시작
	
	//이미지 검색
	public Map<String,Object> imageSearchPro(MultipartHttpServletRequest req, Model model) throws Exception {
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
		Map<String,Object> result = gv.detectLabelsGcs(urlPath, out);
		result.put("imgName", imgName);
		return result;
	}
	
	//재영 서비스 끝
	
}
