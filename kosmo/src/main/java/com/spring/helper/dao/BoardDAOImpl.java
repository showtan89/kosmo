package com.spring.helper.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.MessageAlarmVO;
import com.spring.helper.vo.BoardVO.RealestateVO;
import com.spring.helper.vo.BoardVO.kCommentVO;
import com.spring.helper.vo.BoardVO.onedayclassVO;


@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;

	// 동욱이 메소드 시작
	// 지식인 게시판 게시글 갯수 구하기
	@Override
	public int knowledgeGetArticleCnt() {
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.knowledgeGetArticleCnt");
	}
	// 지식인 게시판 리스트 출력
	@Override
	public ArrayList<KnowledgeVO> knowledgeGetArticleList(Map<String, Object> map) {
		ArrayList<KnowledgeVO> dtos = null;
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dtos = dao.knowledgeGetArticleList(map);
		return dtos;
	}
	// 질문등록 처리
	@Override
	public int knowledgeInsertArticle(KnowledgeVO Knowledge) {

		return sqlSession.insert("com.spring.helper.dao.BoardDAO.knowledgeInsertArticle",Knowledge);
	}
	// 지식인 게시판 게시글 상세페이지 출력
	@Override
	public KnowledgeVO knowledgeGetArticle(int knowledgeNumber) {
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.knowledgeGetArticle",knowledgeNumber);
	}
	// 답변등록 처리
	@Override
	public int knowledgeCommentPro(Map<String, Object> map) {
		// 답변등록 처리 시 답장 처리
		sqlSession.insert("com.spring.helper.dao.BoardDAO.knowledgeCommentPro2",map);
		// TODO Auto-generated method stub
		return sqlSession.insert("com.spring.helper.dao.BoardDAO.knowledgeCommentPro",map);
	}
	// 댓글 갯수 구하기
	@Override
	public int knowledgeCommentListCnt(int knowledgeNumber) {

		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.knowledgeCommentListCnt",knowledgeNumber);
	}
	// 댓글 리스트 출력
	@Override
	public ArrayList<kCommentVO> knowledgeCommentList(int knowledgeNumber) {
		ArrayList<kCommentVO> dtos = null;
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dtos = dao.knowledgeCommentList(knowledgeNumber);
		return dtos;
	}
	// 동욱이 메소드 종료



	//재영 boardDAOImpl 시작

	//부동산 게시판 글 목록 보기
	@Override
	public List<RealestateVO> realestateList(RealestateVO rVO) {
		return sqlSession.getMapper(BoardDAO.class).realestateList(rVO);
	}
	
	//부동산 게시판 글 상세 페이지
	@Override
	public RealestateVO realestateView(int realestateNumber) {
		return sqlSession.getMapper(BoardDAO.class).realestateView(realestateNumber);
	}

	//부동산 게시판 글 목록 갯수 카운트
	@Override
	public Integer getRealestateCount(RealestateVO rVO) {
		return sqlSession.getMapper(BoardDAO.class).getRealestateCount(rVO);
	}

	//부동산 게시판 글 쓰기
	public Integer realestateWritePro(RealestateVO rVO) {
		return sqlSession.getMapper(BoardDAO.class).realestateWritePro(rVO);
	}



	//민석이 메소드 시작+++++++++++++++++++++++++++++++++++++++++++++++++

	@Override
	public int messageReadCnt1() {
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.messageReadCnt1");
	}

	@Override
	public int messageReadCnt2() {
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.messageReadCnt2");
	}


	@Override
	public List<CommentAlarmVO> messageReadList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.helper.dao.BoardDAO.messageReadList", map);
	}

	@Override
	public List<MessageAlarmVO> commentReadList(Map<String, Object> map) {

		return sqlSession.selectList("com.spring.helper.dao.BoardDAO.commentReadList", map);
	}


	//민석에 메소드 종료+++++++++++++++++++++++++++++++++++++++++++++++++++



	// 진호 메소드 시작---------------------------------------------------

	// 게시글 갯수 구하기
	@Override
	public int onedayclassGetArticleCnt() {

		BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
		int selectCnt = boardDao.onedayclassGetArticleCnt();
		return selectCnt;
	}

	// 게시글 목록 조회
	@Override
	public ArrayList<onedayclassVO> onedayclassGetArticleList(Map<String, Object> map) {

		ArrayList<onedayclassVO> dtos = null;
		BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
		dtos = boardDao.onedayclassGetArticleList(map);
		return dtos;
	}

	// 조회수 증가
	@Override
	public int onedayclassAddReadCnt(int onedayclassNumber) {

		BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
		int updateCnt = boardDao.onedayclassAddReadCnt(onedayclassNumber);
		return updateCnt;
	}

	// 게시글 상세페이지, 수정을 위한 상세페이지
	@Override
	public onedayclassVO onedayclassGetArticle(int onedayclassNumber) {

		BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
		return boardDao.onedayclassGetArticle(onedayclassNumber);
	}

	// 진호 메소드 종료------------------------------------------------

}
