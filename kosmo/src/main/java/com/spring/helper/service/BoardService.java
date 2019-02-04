package com.spring.helper.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;
import com.spring.helper.vo.BoardVO.oCommentVO;

public interface BoardService {

	// 동욱이 메소드 시작(지식인 게시판 관련)
	// 파일업로드 테스트
	public void test(MultipartHttpServletRequest req, Model model);
	// 지식인게시판 리스트 출력
	public void knowledgeBoardList(HttpServletRequest req,Model model);
	// 질문등록 처리
	public void knowledgeInsertArticle(HttpServletRequest req,Model model);
	// 질문수정 폼 이동
	public void knowledgeModifyForm(HttpServletRequest req,Model model);
	// 질문수정 처리
	public void knowledgeModifyPro(HttpServletRequest req,Model model);
	// 질문삭제 처리
	public void knowledgeDeleteForm(HttpServletRequest req,Model model);
	// 지식인게시판 글 상세페이지 출력
	public void knowledgeDetailForm(HttpServletRequest req,Model model);
	// 답변등록 처리
	public void knowledgeCommentPro(HttpServletRequest req,Model model);
	// 답변수정 처리
	public void kCommentModifyUpdate(HttpServletRequest req,Model model);
	// 답변삭제 처리
	public void kCommentdelete(HttpServletRequest req,Model model);
	// 답변 목록 리스트 출력
	public void knowledgeCommentList(HttpServletRequest req,Model model);
	// 채택 처리
	public void knowledgeSelectComent(HttpServletRequest req,Model model);
	// 조회수 증가
	public void knowledgeAddReadCnt(HttpServletRequest req,Model model);
	// 동욱이 메소드 종료 


	//재영 boardService 시작 ===============================================================================================
	
	//부동산 게시판 글 목록 보기
	public void realestateGetArticleList(HttpServletRequest req, Model model);
	//부동산 게시판 글 쓰기
	public Integer realestateInsertArticle(HttpServletRequest req, Model model);
	//부동산 게시판 글 상세 페이지
	public void realestateGetArticle(HttpServletRequest req, Model model);
	//부동산 게시판 글 수정
	public Integer realestateModifyUpdate(HttpServletRequest req, Model model);
	//부동산 게시판 글 삭제
	public Integer realestateDeleteArticle(HttpServletRequest req);
	// 부동산 게시판 댓글 가져오기
	public List<RealestateCommentsVO> realestateGetCommentsList(HttpServletRequest req, Model model);
	//부동산 게시판 댓글 달기
	public Integer realestateCommentPro(RealestateCommentsVO cVO, HttpServletRequest req);
	//부동산 게시판 댓글 삭제
	public Integer realestateCommentsDelete(int rCommentNumber);
	//부동산 게시판 더미 데이터생성기 - 현재 버튼 주석 처리
	public void realestateDummyMaker(HttpServletRequest req, Model model);
	
	//재영 boardService 끝 ===============================================================================================


	//민석이 시작+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	//알람 게시판 
	public void alarmBoard(HttpServletRequest req, Model model);
	// 댓글 알람 
	//public List<CommentAlarmVO> commentAlarm(HttpServletRequest req, Model model);
	// 댓글 알람 지우기
	public void commentAlarmDelete(HttpServletRequest req, Model model);

	// 채팅알람 지우기
	public void chattingAlarmDelete(HttpServletRequest req, Model model);
	//ajax 댓글 알람
	
	public Integer alarmServiceCnt(HttpServletRequest req);
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

	// 글 삭제 처리
	public void onedayclassDeletePro(HttpServletRequest req, Model model);

	// 클래스개설 권한 신청 처리페이지
	public void onedayclassAuthorityPro(HttpServletRequest req, Model model);
	
	// 원데이클래스 게시판 댓글 가져오기
	public ArrayList<oCommentVO> getoCommentList(HttpServletRequest req, Model model);


	//진호 끝-----------------------------------------------------------

	// 대호 시작 =================
	
	public void emergency(HttpServletRequest req, Model model) throws Exception;
	
	// 대호 끝 ==================
}
