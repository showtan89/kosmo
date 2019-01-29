package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);

	//재영 InfoController 시작 ====================================================================================

	//부동산 게시판 글쓰기 실행
	@RequestMapping("newsBoard")
	public String newsBoard(HttpServletRequest req, Model model) throws Exception {
		logger.info("newsBoard 로딩 중....");
		//Integer realestateInsertArticle = service.realestateInsertArticle(req, model);
		return "info/news/newsBoardList";
	}
	
	//재영 InfoController 끝 ====================================================================================



}
