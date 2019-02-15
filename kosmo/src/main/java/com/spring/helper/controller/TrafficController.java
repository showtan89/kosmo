package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.helper.service.BoardService;

//import com.spring.helper.service.InfoService;

@Controller
public class TrafficController {

	@Autowired
	BoardService service;

	private static final Logger logger = LoggerFactory.getLogger(TrafficController.class);
	
	// 동욱 시작
	@RequestMapping("getDirections")
	public String getDirections(HttpServletRequest req,Model model) {
		logger.info("getDirections 로딩 중.....");
		return "traffic/getDirections";
	}
	
	@RequestMapping("dkssudehddnr")
	public String test(HttpServletRequest req,Model model) {
		logger.info("test 로딩 중.....");
		return "traffic/test";
	}
	@RequestMapping("dkssudehddnr2")
	public String test2(HttpServletRequest req,Model model) {
		logger.info("test 로딩 중.....");
		return "traffic/test2";
	}
	
	// 동욱 종료
	
	
	// 다문화 외국인 취업정보 게시판
	@RequestMapping("getAddresspop")
	public String ehfhaudwnth(HttpServletRequest req, Model model) throws Exception {
		logger.info("getAddresspop 로딩 중///");

		return "traffic/getAddresspop";
	}
	@RequestMapping("getAddresspop2")
	public String getAddresspop2(HttpServletRequest req, Model model) throws Exception {
		logger.info("getAddresspop2 로딩 중///");

		return "traffic/getDirections";
	}
	
	
	// 대호 시작 ==================================================================
		
		
		@RequestMapping("emergency")
		public String emergency(HttpServletRequest req,Model model) throws Exception {
			logger.info("emergency 로딩 중..");
			//service.emergency(req, model); json 형식 제공으로 변경 - 재영
			return "traffic/emergency";
		}
		
		@RequestMapping("restaurantlocation")
		public String restaurantlocation() {
			return "traffic/restaurantlocation";
		}
		
		// 대호 종료 ==================================================================
}
