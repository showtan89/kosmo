package com.spring.helper.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.helper.method.method.GetJsonData;
import com.spring.helper.service.UtilService;
import com.spring.helper.vo.jsonVO.weather.EarthQuakeVO;

@RestController
public class UtilRestController {

	private static final Logger logger = LoggerFactory.getLogger(UtilRestController.class);

	@Autowired
	UtilService utilService;

	@Autowired
	GetJsonData getJson;
	
	//재영 시작 ==========================================================
	//@Secured({"ROLE_USER","ROLE_ADMIN"}) 아직 사용하지말자
	@RequestMapping(value="imageSearchPro", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> imageSearchPro(MultipartHttpServletRequest req) throws Exception{
		logger.info("imageSearchPro 로딩 중....");
		Map<String,Object> map = new HashMap<String,Object>();
		//map = utilService.imageSearchURLPro(req, model); // URL 방식 계속 에러 떠서 방식 바꿈... 씁
		map = utilService.imageSearchLocalPro(req);
		ResponseEntity<Map<String,Object>> entity = null;
		if(map.get("imgName").toString().length()==0) {
			entity = new ResponseEntity<>(map,HttpStatus.BAD_REQUEST);
		}else {
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		}
		return entity;
	}
	
	//레이더 정보 얻기
	@RequestMapping(value="weatherRadarSearch", method= RequestMethod.GET)
	public ResponseEntity<String> weatherRadarSearch(HttpServletRequest req) throws Exception{
		logger.info("weatherRadarSearch 로딩 중....");
		JSONObject result = getJson.getRadarInfo();
		if(result.length()==0) {
			return new ResponseEntity<String>(result.toString(),HttpStatus.BAD_REQUEST);
		}else {
			return new ResponseEntity<String>(result.toString(),HttpStatus.OK);
		}
	}
	
	//날씨 예보 가져오기
	@RequestMapping(value="forecastSearch", method= RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> forecastSearch(HttpServletRequest req) throws Exception{
		logger.info("forecastSearch 로딩 중....");
		JSONObject result = getJson.getForeInfo();
		if(result.length()==0) {
			logger.info("실패");
			return new ResponseEntity<String>(result.toString(),HttpStatus.BAD_REQUEST);
		}else {
			logger.info("성공");
			return new ResponseEntity<String>(result.toString(),HttpStatus.OK);
		}
	}
	
	//최신 지진 정보 가져오기
	@RequestMapping(value="earthQuakeView", method= RequestMethod.GET)
	public ResponseEntity<EarthQuakeVO> earthQuakeView(HttpServletRequest req) throws Exception{
		logger.info("earthQuakeView 로딩 중....");
		EarthQuakeVO vo = utilService.earthQuakeView(req);
		if(vo == null) {
			return new ResponseEntity<EarthQuakeVO>(vo,HttpStatus.BAD_REQUEST);
		}else {
			return new ResponseEntity<EarthQuakeVO>(vo,HttpStatus.OK);
		}
	}
	 
	//미세 먼지 정보 가져오기
	@RequestMapping(value="dustInfo", method= RequestMethod.GET)
	public ResponseEntity<String> dustInfo(HttpServletRequest req) throws Exception{
		logger.info("dustInfo 로딩 중....");
		JSONObject result = getJson.dustInfo();
		if(result.length()==0) {
			logger.info("실패");
			return new ResponseEntity<String>(result.toString(),HttpStatus.BAD_REQUEST);
		}else {
			logger.info("성공");
			return new ResponseEntity<String>(result.toString(),HttpStatus.OK);
		}
	}
	
	//재영 끝 ==========================================================
}
