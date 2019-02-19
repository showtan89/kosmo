package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.helper.service.BoardService;
import com.spring.helper.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(HelPerController.class);

	@Autowired
	MemberService service;
	
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
	
	@RequestMapping("memberIdConfirm")
	public String memberIdConfirm(HttpServletRequest req, Model model) throws Exception {
		logger.info("memberIdConfirm 로딩 중..");
		service.memberIdConfirm(req, model);

		return "board/memberInput/memberIdConfirm";
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
	
	@RequestMapping("adminPage")
	public String adminPage(HttpServletRequest req, Model model) throws Exception {
		logger.info("adminPage 로딩 중..");
		
		return "myPage/adminPage";
	}
	
	@RequestMapping("hostMemberList")
	public String hostMemberList(HttpServletRequest req, Model model) throws Exception {
		logger.info("hostMemberList 로딩 중..");
		
		service.hostMemberList(req, model);
		
		return "myPage/hostMemberList";
	}
	
	@RequestMapping("addAuthority")
	public String addAuthority(HttpServletRequest req, Model model) throws Exception {
		logger.info("addAuthority 로딩 중..");
		
		service.addAuthority(req, model);
		
		return "myPage/addAuthority";
	}
	
	@RequestMapping("applyAuthority")
	public String applyAuthority(HttpServletRequest req, Model model) throws Exception {
		logger.info("applyAuthority 로딩 중..");
		
		service.applyAuthority(req, model);
		
		return "myPage/applyAuthority";
	}
	
	@RequestMapping("memberSearch")
	public String memberSearch(HttpServletRequest req, Model model) throws Exception {
		logger.info("memberSearch 로딩 중..");
		
		service.memberSearch(req, model);
		
		return "myPage/memberSearch";
	}
	// 대호 끝
	
}
