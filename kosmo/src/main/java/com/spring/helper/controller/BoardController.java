package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.helper.service.BoardService;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService service;
	
	// 동욱이 메소드 시작
	// 질문하기 Form 이동
	@RequestMapping("knowledgeBoardList")
	public String knowledgeBoardList(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeBoardList 로딩 중....");
		service.knowledgeBoardList(req, model);
		return "board/knowledge/knowledge";
	}

	@Secured("ROLE_USER")
	@RequestMapping("knowledgeWriteForm")
	public String knowledgeWriteForm() throws Exception {
		logger.info("knowledgeWriteForm 로딩 중....");
		return "board/knowledge/knowledgeWriteForm";
	}

	// 질문등록 처리
	@RequestMapping("knowledgeWritePro")
	public String knowledgeWritePro(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeWritePro 로딩 중....");
		service.knowledgeInsertArticle(req, model);
		return "board/knowledge/knowledgeWritePro";
	}

	// 게시글 클릭시 글 상세페이지 출력
	@RequestMapping("knowledgeDetailForm")
	public String knowledgeDetailForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeDetailForm 로딩 중....");
		service.knowledgeDetailForm(req, model);
		service.knowledgeCommentList(req,model);
		return "board/knowledge/knowledgeDetailForm";
	}

	// 답변등록 처리
	@Secured("ROLE_USER")
	@RequestMapping("knowledgeCommentPro")
	public String knowledgeCommentPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeCommentPro 로딩 중....");
		service.knowledgeCommentPro(req, model);
		return "board/knowledge/knowledgeWritePro";
	}


	// 동욱이 메소드 종료


	//재영 BoardController 시작

	//부동산 게시판 글 목록 페이지로 이동
	@RequestMapping("realestateList")
	public String realestateList(HttpServletRequest req, Model model) throws Exception {
		logger.info("realestateList 로딩 중....");
		service.realestateList(req, model);
		return "board/realestate/realestate";
	}

	//부동산 게시판 글쓰기 페이지로 이동
	@Secured({"ROLE_ADMIN","ROLE_USER"})
	@RequestMapping("realestateWrite")
	public String realestateWrite(HttpServletRequest req, Model model) throws Exception {
		logger.info("realestateWrite 로딩 중....");
		if(req.getParameter("loginPage")!=null);
		model.addAttribute("loginPage",req.getParameter("loginPage"));
		return "board/realestate/realestateWrite";
	}

	//부동산 게시판 글쓰기 실행
	@RequestMapping("realestateWritePro")
	public String realestateWritePro(HttpServletRequest req, Model model) throws Exception {
		logger.info("realestateWritePro 로딩 중....");
		service.realestateWritePro(req, model);
		return "board/realestate/realestate";
	}

	//재영 BoardController 끝

}
