package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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
	public String loginPage() {
		logger.info("loginPage 로딩 중....");
		return "login";
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
	// 동욱이 종료

	// 재영 시작
	@RequestMapping("realestate")
	public void realestate(HttpServletResponse res) throws Exception {
		logger.info("realestate 로딩 중....");
		res.sendRedirect("realestateBoardList");
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

		service.alarmBoard(req, model);
		return "board/message/alarmBoard";
	}
	// 댓글 알람 삭제
	@RequestMapping("commentAlarmDelete")
	public String commentAlarmDelete(HttpServletRequest req,Model model) {
		logger.info("commentAlarmDelete 로딩 중....");

		service.commentAlarmDelete(req, model);

		return "board/message/commentAlarmDelete";
	}
	@RequestMapping("chattingAlarmDelete")
	public String chattingAlarmDelete(HttpServletRequest req,Model model) {
		logger.info("chattingAlarmDelete 로딩 중.....");
		
		service.chattingAlarmDelete(req, model);
		
		return "board/message/chattingAlarmDelete";
	}
	// ajax 댓글 알람 진행중
	@Scheduled(cron = "0 * * * * *" )
	public void scheduleRun(HttpServletRequest req,Model model) {
		logger.info("스케쥴러러러러러러러러러러");

		service.alarmServiceCnt(req, model);

	}
	/*@RequestMapping("commentAlarm")
	public String commentAlarm(HttpServletRequest req,Model model) {
		logger.info("commentAlarmDelete 로딩 중....");

		return "";*/
	
	//민석이 끝++++++++++++++++++++++++++++++++



	// 대호 시작
	@RequestMapping("memberConfirmidForm")
	public String memberConfirmidForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("memberConfirmidForm 로딩 중..");
		service.memberConfirmidForm(req, model);

		return "board/memberInput/memberConfirmidForm";
	}

	@RequestMapping("memberInputPro")
	public String memberInputPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("memberInputPro 로딩 중.."); 
		service.memberInputPro(req, model);

		return "board/memberInput/memberInputPro";
	}

	@RequestMapping("memberEmailConfirmed")
	public String memberEmailConfirmed(HttpServletRequest req, Model model) throws Exception {
		logger.info("memberEmailConfirmed 로딩 중..");
		service.memberEmailConfirmed(req, model);

		return "board/memberInput/memberEmailConfirmed";
	}
	
	@RequestMapping("myPage")
	public String myPage(HttpServletRequest req, Model model) throws Exception {
		logger.info("myPage 로딩 중..");
		
		return "myPage/myPage";
	}
	
	@RequestMapping("memberModifyPro")
	public String memberModifyPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("memberModifyPro 로딩 중..");
		service.memberModifyPro(req, model);
		
		return "myPage/memberModifyPro";
	}
	
	@RequestMapping("memberDeleteForm")
	public String memberDeleteForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("memberDeleteForm 로딩 중..");
		
		return "myPage/memberDeleteForm";
	}
	
	@RequestMapping("memberDeletePro")
	public String memberDeletePro(HttpServletRequest req, Model model) throws Exception {
		logger.info("memberDeletePro 로딩 중..");
		service.memberDeletePro(req, model);
		
		return "myPage/memberDeletePro";
	}
	
	@RequestMapping("goodBye")
	public String goodBye(HttpServletRequest req, Model model) throws Exception {
		logger.info("goodBye 로딩 중..");
		
		return "myPage/goodBye";
	}
	// 대호 끝

}
