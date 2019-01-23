package com.spring.helper.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.MessageAlarmVO;
import com.spring.helper.vo.BoardVO.RealestateVO;
import com.spring.helper.vo.BoardVO.kCommentVO;
import com.spring.helper.vo.BoardVO.onedayclassVO;


public interface BoardDAO {

	// 동욱이 메소드 시작(지식인게시판)
	// 지식인 게시판 출력 자료 갯수 구하기
	public int knowledgeGetArticleCnt();
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
	// 답변삭제 처리
	public int kCommentdelete(int kCommentNumber);
	// 답변 갯수 구하기
	public int knowledgeCommentListCnt(int knowledgeNumber);
	// 답변 리스트 출력
	public ArrayList<kCommentVO> knowledgeCommentList(int knowledgeNumber);
	
	// 동욱이 메소드 종료




	//재영 boardDAO 시작

	public List<RealestateVO> realestateGetArticleList(RealestateVO rVO);

	public RealestateVO realestateGetArticle(int realestateNumber);
	
	public Integer realestateGetArticleCnt(RealestateVO rVO);

	public Integer realestateInsertArticle(RealestateVO rVO);


	//재영 boardDAO 끝

	//민석이 메소드 시작+++++++++++++++++++++++++++++++

	public int messageReadCnt1();

	public int messageReadCnt2();

	public List<CommentAlarmVO> messageReadList(Map<String, Object> map);

	public List<MessageAlarmVO> commentReadList(Map<String, Object> map);

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

	
	// 진호 메소드 종료--------------------------------------
	
	
}
