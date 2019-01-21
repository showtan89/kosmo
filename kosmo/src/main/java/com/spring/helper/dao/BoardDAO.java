package com.spring.helper.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.MessageAlarmVO;
import com.spring.helper.vo.BoardVO.RealestateVO;
import com.spring.helper.vo.BoardVO.kCommentVO;


public interface BoardDAO {

	// 동욱이 메소드 시작(지식인게시판)
	// 지식인 게시판 출력 자료 갯수 구하기
	public int knowledgeGetArticleCnt();
	// 지식인 게시판 리스트 출력
	public ArrayList<KnowledgeVO> knowledgeGetArticleList(Map<String, Object> map);
	// 질문등록 처리
	public int knowledgeInsertArticle(KnowledgeVO Knowledge);
	// 지식인게시판 게시글 상세페이지 출력
	public KnowledgeVO knowledgeGetArticle(int knowledgeNumber);
	// 댓글작성 처리
	public int knowledgeCommentPro(Map<String, Object> map);
	// 댓글 갯수 구하기
	public int knowledgeCommentListCnt(int knowledgeNumber);
	// 댓글 리스트 출력
	public ArrayList<kCommentVO> knowledgeCommentList(int knowledgeNumber);
	
	// 동욱이 메소드 종료




	//재영 boardDAO 시작

	//public List<RealestateVO> realestateList(RealestateVO rVO);

	public Integer getRealestateCount(RealestateVO rVO);

	public Integer realestateWritePro(RealestateVO rVO);


	//재영 boardDAO 끝

	//민석이 메소드 시작+++++++++++++++++++++++++++++++

	public int messageReadCnt1();

	public int messageReadCnt2();

	public List<CommentAlarmVO> messageReadList(Map<String, Object> map);

	public List<MessageAlarmVO> commentReadList(Map<String, Object> map);

	//민석이 메소드 종료+++++++++++++++++++++++++++++++
}
