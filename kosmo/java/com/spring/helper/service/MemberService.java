package com.spring.helper.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MemberService {
	
	// 대호 시작 =================================================================
	public void memberConfirmidForm(HttpServletRequest req, Model model);

	public void memberInputPro(HttpServletRequest req, Model model);
	
	public void memberIdConfirm(HttpServletRequest req, Model model);

	public void memberEmailConfirmed(HttpServletRequest req, Model model);

	public void memberModifyPro(HttpServletRequest req, Model model);

	public void memberDeletePro(HttpServletRequest req, Model model);
	
	public void hostMemberList(HttpServletRequest req, Model model);
	
	public void addAuthority(HttpServletRequest req, Model model);
	
	public void applyAuthority(HttpServletRequest req, Model model);
	
	public void memberSearch(HttpServletRequest req, Model model);
	// 대호 끝 ==================================================================

}
