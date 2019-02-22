package com.spring.helper.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.helper.vo.BoardVO.ChattingAllVO;
import com.spring.helper.vo.BoardVO.ChattingVO;
import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.FromMessageVO;
import com.spring.helper.vo.BoardVO.HospitalVO;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.MessageAlarmVO;
import com.spring.helper.vo.BoardVO.MessageVO;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;
import com.spring.helper.vo.BoardVO.RealestateVO;
import com.spring.helper.vo.BoardVO.UserVO;
import com.spring.helper.vo.BoardVO.kCommentVO;
import com.spring.helper.vo.BoardVO.oCommentVO;
import com.spring.helper.vo.BoardVO.onedayclassVO;
import com.spring.helper.vo.BoardVO.reservationVO;


public interface BoardDAO {

	// 동욱이 메소드 시작(지식인게시판)
	// 파일업로드 테스트
	public int test(String images);
	// 지식인 게시판 출력 자료 갯수 구하기
	public int knowledgeGetArticleCnt(Map<String, Object> map);
	// 지식인 게시판 리스트 출력
	public ArrayList<KnowledgeVO> knowledgeGetArticleList(Map<String, Object> map);
	// 질문등록 처리
	public int knowledgeInsertArticle(KnowledgeVO Knowledge);
	// 질문수정 폼 이동
	public KnowledgeVO knowledgeModifyForm(int knowledgeNumber);
	// 질문수정 처리
	public int knowledgeModifyPro(KnowledgeVO Knowledge);
	// 질문삭제 처리
	public int knowledgeDeleteForm(int knowledgeNumber);
	// 지식인게시판 게시글 상세페이지 출력
	public KnowledgeVO knowledgeGetArticle(int knowledgeNumber);
	// 답변작성 처리
	public int knowledgeCommentPro(Map<String, Object> map);
	// 답변수정 처리
	public int kCommentModifyUpdate(Map<String, Object> map);
	// 답변삭제 처리
	public int kCommentdelete(int kCommentNumber);
	// 답변 갯수 구하기
	public int knowledgeCommentListCnt(int knowledgeNumber);
	// 답변 리스트 출력
	public ArrayList<kCommentVO> knowledgeCommentList(int knowledgeNumber);

	// 채택 처리
	public int knowledgeSelectComent(Map<String, Object> map);
	// 조회수 증가
	public int knowledgeAddReadCnt(int knowledgeNumber);
	// 동욱이 메소드 종료




	//재영 boardDAO 시작 ===============================================================================================

	//부동산 게시판 글 목록 보기
	public List<RealestateVO> realestateGetArticleList(RealestateVO rVO);
	//부동산 게시판 글 목록 갯수 카운트
	public Integer realestateGetArticleCnt(RealestateVO rVO);
	//부동산 게시판 글 쓰기
	public Integer realestateInsertArticle(RealestateVO rVO);
	//부동산 게시판 글 상세 페이지
	public RealestateVO realestateGetArticle(int realestateNumber);
	//부동산 게시판 글 수정
	public Integer realestateModifyUpdate(RealestateVO rVO);
	//부동산 게시판 글 삭제
	public Integer realestateDeleteArticle(int realestateNumber);
	// 부동산 게시판 댓글 가져오기
	public List<RealestateCommentsVO> realestateGetCommentsList(int realestateNumber);
	//부동산 게시판 댓글 달기
	public Integer realestateCommentPro(RealestateCommentsVO cVO);
	//부동산 게시판 댓글 삭제
	public Integer realestateCommentsDelete(int rCommentNumber);

	//재영 boardDAO 끝===============================================================================================

	//민석이 메소드 시작+++++++++++++++++++++++++++++++

	// 댓글 알람 갯수
	public int commentReadCnt(String memEmail);

	// 채팅 알람 갯수
	public int messageReadCnt(String memberId);

	// 쪽지 리스트
	public List<MessageVO> messageReadList(Map<String, Object> map);
	
	// 채팅알람 리스트
	public List<CommentAlarmVO> commentReadList(Map<String, Object> map);

	// 댓글 알람 지우기
	public int commentDelete (int commentnumber);

	// 받은 쪽지  지우기
	public int messageDelete (int messageNumber);
	
	// 보낸 쪽지 지우기
	public int fMessageDelete (int fMessageNumber);

	// ajax 알람 갯수 
	public int commentAlarmCnt(String memEmail);

	public int messageCnt(String memberId);

	// 쪽지 보내기
	public int sendMessage(Map<String, Object> map);
	
	// 보낸 쪽지 갯수
	public int messageSendListCnt(String memberId);
	
	// 보낸 쪽지 리스트
	public List<FromMessageVO> messageSendList(Map<String, Object> map);
	
	// 채팅 글뿌리기
	public List<ChattingVO> chatting(String chattingContry);
	
	//채팅 글쓰기
	public int chattingWrite(ChattingVO vo);
	
	//세계 채팅 글뿌리기
	public List<ChattingAllVO> chattingAll(String chattingAllContry);
		
	//세계 채팅 글쓰기
	public int chattingWriteAll(ChattingAllVO vo);

	//민석이 메소드 종료+++++++++++++++++++++++++++++++



	// 진호 메소드 시작----------------------------------

	// 게시글 갯수 구하기
	public int onedayclassGetArticleCnt();

	// 게시글 목록조회
	public ArrayList<onedayclassVO> onedayclassGetArticleList(Map<String, Object> map);

	// 조회수 증가
	public int onedayclassAddReadCnt(int onedayclassNumber);

	// 게시글 상세 페이지, 수정을 위한 상세페이지
	public onedayclassVO onedayclassGetArticle(int onedayclassNumber);
	
	// 종료여부 메퍼에서 확인해서 리턴
	public Map<String, Object> onedayclassEndCheck(int onedayclassNumber);

	// 게시글 수정 처리
	public int onedayclassModifyUpdate(onedayclassVO vo);

	// 글 쓰기 처리
	public int onedayclassInsertBoard(onedayclassVO vo);

	// 글 삭제 처리
	public int onedayclassDeleteBoard(int onedayclassNumber);

	// 계좌번호 업데이트
	public int onedayclassAccountUpdate(Map<String, Object> map);

	
	// 댓글 목록
	public List<oCommentVO> getoCommentList(int onedayclassNumber, int start, int end);

	// 댓글 쓰기
	public void oCommentCreate(oCommentVO dto);

	// 댓글 하나 조회
	public oCommentVO readOneComment(int oCommentNumber);

	// 댓글 수정
	public int updateComment(oCommentVO vo);
	
	// 댓글 삭제
	public Integer deleteComment(int oCommentNumber);
	
	// 인원 수 변경
	public int peopleUpdate(onedayclassVO vo);

	// 인원 수 가져오기
	public Map<String, Object> getPeopleChange(int onedayclassNumber);
	
	// 예약테이블 추가
	public void reservationInsert(reservationVO dto);
	
	// 예약리스트 갯수
	public int reservationGetCnt();
	
	// 예약리스트 출력1
	public ArrayList<onedayclassVO> reservationGetList(Map<String, Object> map);
	
	// 예약리스트 출력2
	public ArrayList<reservationVO> reservationGetList2(Map<String, Object> map);
	
	// 예약리스트 출력3
	public ArrayList<Map<String, Object>> reservationGetList3(Map<String, Object> map);
	
	// 진호 메소드 종료--------------------------------------

	// 대호 시작 ============================================
	public List<HospitalVO> emergency();
	
	public int emergencyCnt();
	// 대호 종료 ============================================

	

	
	



}
