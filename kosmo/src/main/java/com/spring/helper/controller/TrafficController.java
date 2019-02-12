package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.spring.helper.service.InfoService;

@Controller
public class TrafficController {

	private static final Logger logger = LoggerFactory.getLogger(TrafficController.class);
	
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
	
}
