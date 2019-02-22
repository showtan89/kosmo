package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.helper.service.UtilService;

import com.spring.helper.service.UtilService;

@Controller
public class UtilController {
	
	@Autowired
	UtilService service;

	private static final Logger logger = LoggerFactory.getLogger(UtilController.class);

	@Autowired
	UtilService utilService;
	
	// 동욱 시작
	//환율 정보
	@RequestMapping("exchangerate")
	public String exchangerate(HttpServletRequest req, Model model) throws Exception{
		logger.info("exchangerate 로딩 중....");
		return "util/Exchangerate/Exchangerate";
	}
	
	//재영 UtilController 시작 ====================================================================================

	//이미지 검색 페이지 이동
	@RequestMapping("imageSearch")
	public String imageSearch(HttpServletRequest req, Model model) throws Exception {
		logger.info("imageSearch 로딩 중....");
		return "util/image/imageSearch";
	}
	//재영 UtilController 끝 ====================================================================================
	
	
	// 대호 시작 =======================================================
	@RequestMapping("convertSize")
	public String convertSize(HttpServletRequest req, Model model) throws Exception {
		logger.info("convertSize 로딩 중..");
		
		return "util/convert/convertSize";
	}
	
	// 대호 끝 =======================================================
}
