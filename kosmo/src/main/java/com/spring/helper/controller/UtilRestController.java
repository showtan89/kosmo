package com.spring.helper.controller;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
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
	// 동욱 시작
	
	// 버스 도착정보 구하기
	@RequestMapping(value="getRealTimeStation", method= RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> getRealTimeStation(HttpServletRequest req) throws Exception{
		logger.info("getRealTimeStation 로딩 중....");
		String localStationID = req.getParameter("localStationID");
		JSONObject result = getJson.getRealTimeStationInfo(localStationID);
		if(result.length()==0) {
			System.out.println("실패");
			return new ResponseEntity<String>(result.toString(),HttpStatus.BAD_REQUEST);
		}else {
			System.out.println("통과");
			return new ResponseEntity<String>(result.toString(),HttpStatus.OK);
		}
	}
	// 버스 번호 구하기
	@RequestMapping(value="getBusRealTimeNo", method= RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> getBusRealTimeNo(HttpServletRequest req) throws Exception{
		logger.info("getBusRealTimeNo 로딩 중....");
		String route = req.getParameter("route");
		String url = "http://openapi.gbis.go.kr/ws/rest/busrouteservice/info?serviceKey=GdoR86lqZXehbYz0fIJrJjrCLQq9UHQg9pk2RA8UgEhtJI8vJ45t8O%2B8p6N3QaDDUUkB1kUa1Ra%2BwQnLK%2FcHuQ%3D%3D&routeId="+route;
		RestTemplate restTemplate = new RestTemplate();
		URI uri = new URI(url);
		System.out.println("요청주소"+uri);
		String response = restTemplate.getForObject(uri, String.class);
		org.json.JSONObject result = XML.toJSONObject(response);
		if(result.length()==0) {
			System.out.println("실패");
			return new ResponseEntity<String>(result.toString(),HttpStatus.BAD_REQUEST);
		}else {
			System.out.println("통과");
			return new ResponseEntity<String>(result.toString(),HttpStatus.OK);
		}
	}
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
			System.out.println("실패");
			return new ResponseEntity<String>(result.toString(),HttpStatus.BAD_REQUEST);
		}else {
			System.out.println("통과");
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
	
	//재영 끝 ==========================================================
}
