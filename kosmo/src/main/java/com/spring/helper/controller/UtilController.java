package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UtilController {

	private static final Logger logger = LoggerFactory.getLogger(UtilController.class);

	//재영 UtilController 시작 ====================================================================================

	//이미지 검색 기능
	@RequestMapping("imageSearch")
	public String imageSearch(HttpServletRequest req, Model model) throws Exception {
		logger.info("imageSearch 로딩 중....");
		return "util/image/imageSearch";
	}

	//재영 UtilController 끝 ====================================================================================
	
}
