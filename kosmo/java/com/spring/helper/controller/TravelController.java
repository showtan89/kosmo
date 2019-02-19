package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelController {

	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);

	// 동욱 시작
	//환율 정보
	@RequestMapping("exchangerate")
	public String exchangerate(HttpServletRequest req, Model model) throws Exception{
		logger.info("exchangerate 로딩 중....");
		return "travel/Exchangerate/Exchangerate";
	}
	
	//재영 TravelController 시작 ====================================================================================

	//날씨????????????????????
	@RequestMapping("weather")
	public String weather() throws Exception {
		logger.info("weather 로딩 중....");
		return "travel/weather/weather";
	}
	
	//이벤트????????????????????
	@RequestMapping("eventculture")
	public String eventculture() throws Exception {
		logger.info("eventculture 로딩 중....");
		return "travel/event/eventculture";
	}
	
	//관광 게시판
	@RequestMapping("travelBoard")
	public String travelBoard(HttpServletRequest req, Model model) throws Exception {
		logger.info("travelBoard 로딩 중....");
		return "travel/travel/travelBoardList";
	}
	//재영 TravelController 끝 ====================================================================================

}
