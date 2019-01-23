package com.spring.helper.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BoardService {

	// 동욱이 메소드 시작(지식인 게시판 관련)
	// 지식인게시판 리스트 출력
	public void knowledgeBoardList(HttpServletRequest req,Model model);
	// 질문등록 처리
	public void knowledgeInsertArticle(HttpServletRequest req,Model model);
	// 지식인게시판 글 상세페이지 출력
	public void knowledgeDetailForm(HttpServletRequest req,Model model);
	// 답변등록 처리
	public void knowledgeCommentPro(HttpServletRequest req,Model model);
	// 댓글 목록 리스트 출력
	public void knowledgeCommentList(HttpServletRequest req,Model model);
	// 동욱이 메소드 종료


	//재영 boardService 시작

	public void realestateWritePro(HttpServletRequest req, Model model);

	public void realestateList(HttpServletRequest req, Model model);
	
	public void realestateDummyMaker(HttpServletRequest req, Model model);

	//재영 boardService 끝
	
	
	//민석이 시작+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	public void messageForm(HttpServletRequest req, Model model);
//	public List<> alarm(HttpServletRequest req, Model model);
	
	/*messagePro
	messageAlarmForm
	messageAlarmPro*/
	
	//민석이 종료+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	//진호 시작----------------------------------------------------------
	// 글 목록
	public void onedayclassBoardList(HttpServletRequest req, Model model);

	// 상세페이지
	public void onedayclassDetailForm(HttpServletRequest req, Model model);
	
	// 수정 상세 페이지
	public void onedayclassModifyForm(HttpServletRequest req, Model model);
	
	// 수정 처리
	public void onedayclassModifyPro(HttpServletRequest req, Model model);
	
	// 글쓰기 페이지
	public void onedayclassWriteForm(HttpServletRequest req, Model model);
	
	// 글 처리 페이지
	public void onedayclassWritePro(HttpServletRequest req, Model model);
	

	
	
	//진호 끝-----------------------------------------------------------
}
