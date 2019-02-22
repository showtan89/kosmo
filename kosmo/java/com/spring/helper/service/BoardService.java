package com.spring.helper.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.helper.vo.BoardVO.ChattingAllVO;
import com.spring.helper.vo.BoardVO.ChattingVO;
import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.MessageVO;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;
import com.spring.helper.vo.BoardVO.oCommentVO;
import com.spring.helper.vo.BoardVO.onedayclassVO;
import com.spring.helper.vo.BoardVO.reservationVO;

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
	public Integer realestateInsertArticle(MultipartHttpServletRequest req, Model model) throws Exception;
	//부동산 게시판 글 상세 페이지
	public void realestateGetArticle(HttpServletRequest req, Model model);
	//부동산 게시판 글 수정
	public Integer realestateModifyUpdate(MultipartHttpServletRequest req, Model model) throws Exception;
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
	//댓글 알람 게시판 
	public void commentAlarmBoard(HttpServletRequest req, Model model);
	
	//쪽지 알람 게시판
	public void messageAlarmBoard(HttpServletRequest req, Model model);
	
	// 댓글 알람 지우기
	public void commentAlarmDelete(HttpServletRequest req, Model model);

	//받은 쪽지 지우기
	public void messageDelete(HttpServletRequest req, Model model);
	
	// 보낸쪽지 삭제
	public void fMessageDelete(HttpServletRequest req, Model model);
	//ajax 댓글 알람
	public Integer alarmServiceCnt(HttpServletRequest req);
	
	// 쪽지 보내기
	public Integer sendMessage(HttpServletRequest req, Model model);
	
	// 보낸 쪽지 보기
	public void messageSendList(HttpServletRequest req, Model model);
	
	
	
	
	// 채팅 글뿌리기
	public List<ChattingVO> chatting(HttpServletRequest req, Model model);
	
	// 채팅 글 쓰기
	public Integer chattingWrite(ChattingVO cVO, HttpServletRequest req);
	
	// 채팅 글뿌리기
	public List<ChattingAllVO> chattingAll(HttpServletRequest req, Model model);
		
	// 채팅 글 쓰기
	public Integer chattingWriteAll(ChattingAllVO cVO, HttpServletRequest req);

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
	
	// 댓글 목록
	public List<oCommentVO> getoCommentList(HttpServletRequest req, Model model);

	// 댓글 쓰기
	public void oCommentCreate(oCommentVO dto);
	
	// 댓글 하나 조회
	public oCommentVO readOneComment(HttpServletRequest req);
	
	// 댓글 수정
	public int updateComment(oCommentVO vo);
	
	// 댓글 삭제
	public Integer deleteComment(int oCommentNumber);
	
	// 인원 수 변경(예약)
	public int peopleUpdate(onedayclassVO vo);
	
	// 예약테이블 추가
	public void reservationInsert(reservationVO dto);

	// 예약 리스트 출력
	public void reservationList(HttpServletRequest req, Model model);
	
	//진호 끝-----------------------------------------------------------

	// 대호 시작 =================


	public void emergency(HttpServletRequest req, Model model) throws Exception;
	
	

	// 대호 끝 ==================
}
