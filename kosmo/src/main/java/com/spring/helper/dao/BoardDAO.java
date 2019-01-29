package com.spring.helper.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.helper.vo.BoardVO.ChattingAlarmVO;
import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.MessageAlarmVO;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;
import com.spring.helper.vo.BoardVO.RealestateVO;
import com.spring.helper.vo.BoardVO.UserVO;
import com.spring.helper.vo.BoardVO.kCommentVO;
import com.spring.helper.vo.BoardVO.onedayclassVO;


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
	public int commentReadCnt(String memId);

	// 채팅 알람 갯수
	public int chattingReadCnt(String memId);

	// 댓글 알람 리스트
	public List<CommentAlarmVO> chattingReadList(Map<String, Object> map);

	// 채팅알람 리스트
	public List<ChattingAlarmVO> commentReadList(Map<String, Object> map);

	// 댓글 알람 지우기
	public int commentDelete (int commentnumber);

	// 채팅 알람 지우기
	public int chattingDelete (int chattingnumber);
	
	public int commentAlarmCnt(String memEmail);
	
	public int chattingAlarmCnt(String memEmail);

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

	// 게시글 수정 처리
	public int onedayclassModifyUpdate(onedayclassVO vo);

	// 글 쓰기 처리
	public int onedayclassInsertBoard(onedayclassVO vo);

	// 글 삭제 처리
	public int onedayclassDeleteBoard(int onedayclassNumber);

	// 계좌번호 업데이트
	/*public int onedayclassAccountUpdate(int onedayclassNumber);*/


	// 진호 메소드 종료--------------------------------------


}
