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
	// 파일업로드 테스트
	@Override
	public int test(String images) {
		return sqlSession.insert("com.spring.helper.dao.BoardDAO.imagesupload",images);
	}
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
	// 질문수정 폼 이동
	@Override
	public KnowledgeVO knowledgeModifyForm(int knowledgeNumber) {
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.knowledgeModifyForm",knowledgeNumber);
	}

	// 질문수정 처리
	@Override
	public int knowledgeModifyPro(KnowledgeVO Knowledge) {
		return sqlSession.update("com.spring.helper.dao.BoardDAO.knowledgeModifyPro",Knowledge);
	}
	// 질문삭제 처리
	@Override
	public int knowledgeDeleteForm(int knowledgeNumber) {
		sqlSession.delete("com.spring.helper.dao.BoardDAO.knowledgeDeleteForm2",knowledgeNumber);
		return sqlSession.delete("com.spring.helper.dao.BoardDAO.knowledgeDeleteForm",knowledgeNumber);
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
		// 답변등록 처리 시 포인트 처리
		sqlSession.update("com.spring.helper.dao.BoardDAO.knowledgeCommentPro3",map);
		// TODO Auto-generated method stub
		return sqlSession.insert("com.spring.helper.dao.BoardDAO.knowledgeCommentPro",map);
	}
	// 답변수정 처리
	@Override
	public int kCommentModifyUpdate(Map<String, Object> map) {
		return sqlSession.update("com.spring.helper.dao.BoardDAO.kCommentModifyUpdate",map);
	}
	// 답변삭제 처리
	@Override
	public int kCommentdelete(int kCommentNumber) {
		return sqlSession.insert("com.spring.helper.dao.BoardDAO.kCommentdelete",kCommentNumber);
	}
	// 답변 갯수 구하기
	@Override
	public int knowledgeCommentListCnt(int knowledgeNumber) {

		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.knowledgeCommentListCnt",knowledgeNumber);
	}
	// 답변 리스트 출력
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
	public List<RealestateVO> realestateGetArticleList(RealestateVO rVO) {
		return sqlSession.getMapper(BoardDAO.class).realestateGetArticleList(rVO);
	}
	
	//부동산 게시판 글 상세 페이지
	@Override
	public RealestateVO realestateGetArticle(int realestateNumber) {
		return sqlSession.getMapper(BoardDAO.class).realestateGetArticle(realestateNumber);
	}

	//부동산 게시판 글 목록 갯수 카운트
	@Override
	public Integer realestateGetArticleCnt(RealestateVO rVO) {
		return sqlSession.getMapper(BoardDAO.class).realestateGetArticleCnt(rVO);
	}

	//부동산 게시판 글 쓰기
	public Integer realestateInsertArticle(RealestateVO rVO) {
		return sqlSession.getMapper(BoardDAO.class).realestateInsertArticle(rVO);
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

	// 수정 처리
	@Override
	public int onedayclassModifyUpdate(onedayclassVO vo) {

		BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
		int updateCnt = boardDao.onedayclassModifyUpdate(vo);
		return updateCnt;
	}
	
	
	
	// 진호 메소드 종료------------------------------------------------
	

}
