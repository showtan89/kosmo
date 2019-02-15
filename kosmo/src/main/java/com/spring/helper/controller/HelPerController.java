package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.helper.service.BoardService;

@Controller
public class HelPerController{

	private static final Logger logger = LoggerFactory.getLogger(HelPerController.class);

	@Autowired
	BoardService service;

	@RequestMapping("/")
	public String root(HttpServletResponse res, HttpServletRequest req) throws Exception {
		logger.info("메인화면 로딩 중....");
		return "index";
	}

	@RequestMapping("index")
	public String index(HttpServletRequest req,Model model,Authentication authentication) throws Exception {
		logger.info("메인화면 로딩 중....");
		if(req.getParameter("loginPage")!=null);
		model.addAttribute("loginPage",req.getParameter("loginPage"));
		//이름 가져오기    
		if(req.getParameter("login")!=null) { 
			String username = authentication.getName();
			logger.info("접속자 : " + username);
			model.addAttribute("name",username);
		}  
		return "index";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		logger.info("logout 중....");
		/*System.out.println("체크3:"+req.getSession().getAttribute("userVO").toString());
		req.getSession().removeAttribute("userVO");
		System.out.println("체크4:"+req.getSession().getAttribute("userVO").toString());*/
		return "index";
	}
	//로그인 버튼
	@Secured({"ROLE_USER","ROLE_ADMIN"}) 
	@RequestMapping("loginCheck")
	public String loginCheck(HttpServletRequest req) {
		logger.info("loginCheck 로딩 중....");
		String referer = req.getHeader("Referer"); //전 페이지로 이동 
		return "redirect:"+referer;
	}

	//로그인 페이지
	@RequestMapping("loginPage")
	public String loginPage(Model model) {
		logger.info("loginPage 로딩 중....");
		return "login";
	}
	
	//권한 없음 페이지 테스트중
	@RequestMapping("error403")
	public String error403(HttpServletRequest req) {
		logger.info("error403 로딩 중....");
		return "error403";
	}
	
	@RequestMapping("content")
	public String contents() {
		logger.info("content 로딩 중....");
		return "board/content/content";
	}

	// 동욱이 시작
	@RequestMapping("knowledge")
	public void knowledge(HttpServletResponse res) throws Exception {
		logger.info("knowledge 로딩 중....");
		res.sendRedirect("knowledgeBoardList");
	}
	@RequestMapping("legalinfo")
	public String legalinfo(HttpServletResponse res) throws Exception {
		logger.info("legalinfo 로딩 중....");
		return "info/legalinfo/legalinfoList";
	}
	
	// 동욱이 종료

	// 재영 시작
	@RequestMapping("realestate")
	public void realestate(HttpServletResponse res) throws Exception {
		logger.info("realestate 로딩 중....");
		res.sendRedirect("realestateBoardList");
	}
	
	@RequestMapping("news")
	public void news(HttpServletResponse res) throws Exception {
		logger.info("news 로딩 중....");
		res.sendRedirect("newsBoard");
	}
	
	// 재영 끝

	// 진호 시작-------------------------------------------
	@RequestMapping("onedayclass")
	public void onedayclass(HttpServletResponse res) throws Exception {
		logger.info("onedayclass 로딩 중....");
		res.sendRedirect("onedayclassBoardList");
	}
	// 진호 끝---------------------------------

	//민석이 시작+++++++++++++++++++++++++++++++

	//알람 게시판으로 이동
	@Secured({"ROLE_USER","ROLE_ADMIN"}) 
	@RequestMapping("alarmBoard")
	public String alarmBoard(HttpServletRequest req,Model model) {
		logger.info("alarmBoard 로딩 중....");

		if(req.getParameter("loginPage")!=null);
		model.addAttribute("loginPage",req.getParameter("loginPage"));

		service.commentAlarmBoard(req, model);
		service.messageAlarmBoard(req, model);
		service.messageSendList(req, model);
		return "board/message/alarmBoard";
	}
	// 댓글 알람 삭제
	@RequestMapping("commentAlarmDelete")
	public String commentAlarmDelete(HttpServletRequest req,Model model) {
		logger.info("commentAlarmDelete 로딩 중....");

		service.commentAlarmDelete(req, model);

		return "board/message/commentAlarmDelete";
	}
	
	//민석이 끝++++++++++++++++++++++++++++++++

	

}
