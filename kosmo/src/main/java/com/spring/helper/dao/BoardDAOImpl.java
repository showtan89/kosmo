package com.spring.helper.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.spring.helper.vo.BoardVO.ChattingVO;
import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.MessageAlarmVO;
import com.spring.helper.vo.BoardVO.MessageVO;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;
import com.spring.helper.vo.BoardVO.RealestateVO;
import com.spring.helper.vo.BoardVO.UserVO;
import com.spring.helper.vo.BoardVO.kCommentVO;
import com.spring.helper.vo.BoardVO.oCommentVO;
import com.spring.helper.vo.BoardVO.onedayclassVO;



@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	JavaMailSender sender;

	// 동욱이 메소드 시작
	// 파일업로드 테스트
	@Override
	public int test(String images) {
		return sqlSession.insert("com.spring.helper.dao.BoardDAO.imagesupload",images);
	}
	// 지식인 게시판 게시글 갯수 구하기
	@Override
	public int knowledgeGetArticleCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.knowledgeGetArticleCnt",map);
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
		sqlSession.update("com.spring.helper.dao.BoardDAO.knowledgeSelectComent",Knowledge);
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
	// 채택 처리
	@Override
	public int knowledgeSelectComent(Map<String, Object> map) {
		// 질문자 포인트 차감
		int cnt = 0;
		cnt = sqlSession.update("com.spring.helper.dao.BoardDAO.knowledgeSelectComent2",map);
		// 글 채택완료 처리
		if(cnt == 1)
			cnt = sqlSession.update("com.spring.helper.dao.BoardDAO.knowledgeSelectComent3",map);
		return cnt;
	}
	// 조회수 증가
	@Override
	public int knowledgeAddReadCnt(int knowledgeNumber) {
		return sqlSession.update("com.spring.helper.dao.BoardDAO.knowledgeAddReadCnt",knowledgeNumber);
	}
	// 동욱이 메소드 종료



	//재영 boardDAOImpl 시작 ===============================================================================================

	//부동산 게시판 글 목록 보기
	@Override
	public List<RealestateVO> realestateGetArticleList(RealestateVO rVO) {
		return sqlSession.getMapper(BoardDAO.class).realestateGetArticleList(rVO);
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

	//부동산 게시판 글 상세 페이지
	@Override
	public RealestateVO realestateGetArticle(int realestateNumber) {
		return sqlSession.getMapper(BoardDAO.class).realestateGetArticle(realestateNumber);
	}

	//부동산 게시판 글 수정
	public Integer realestateModifyUpdate(RealestateVO rVO) {
		return sqlSession.getMapper(BoardDAO.class).realestateModifyUpdate(rVO);
	}

	//부동산 게시판 글 삭제
	public Integer realestateDeleteArticle(int realestateNumber) {
		sqlSession.insert("com.spring.helper.dao.BoardDAO.realestateDeleteComments",realestateNumber);
		return sqlSession.insert("com.spring.helper.dao.BoardDAO.realestateDeleteArticle",realestateNumber);
	}

	// 부동산 게시판 댓글 가져오기
	public List<RealestateCommentsVO> realestateGetCommentsList(int realestateNumber){
		return sqlSession.getMapper(BoardDAO.class).realestateGetCommentsList(realestateNumber);
	}

	//부동산 게시판 댓글 달기
	public Integer realestateCommentPro(RealestateCommentsVO cVO) {
		Integer insertResult = sqlSession.insert("com.spring.helper.dao.BoardDAO.realestateCommentPro",cVO);
		if(insertResult==1) {
			sqlSession.insert("com.spring.helper.dao.BoardDAO.realestateCommentPro2",cVO);
		}
		return insertResult;
	}

	//부동산 게시판 댓글 삭제
	public Integer realestateCommentsDelete(int rCommentNumber) {
		return sqlSession.getMapper(BoardDAO.class).realestateCommentsDelete(rCommentNumber);
	}

	// 재영 boardDAOImpl 끝 ===============================================================================================


	//민석이 메소드 시작+++++++++++++++++++++++++++++++++++++++++++++++++

	// 코멘트 알람 갯수 구하기
	@Override
	public int commentReadCnt(String memEmail) {
		sqlSession.update("com.spring.helper.dao.BoardDAO.commentReadList2", memEmail);
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.commentReadCnt", memEmail);
	}
	// 쪽지 알람 갯수 구하기
	@Override
	public int messageReadCnt(String memberId) {
		sqlSession.update("com.spring.helper.dao.BoardDAO.messageReadList2", memberId);
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.messageReadCnt", memberId);
	}

	//쪽지 알람 리스트
	@Override
	public List<MessageVO> messageReadList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.helper.dao.BoardDAO.messageReadList", map);
	}
	// 댓글 알람 리스트
	@Override
	public List<CommentAlarmVO> commentReadList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.helper.dao.BoardDAO.commentReadList", map);
	}

	//ajax 댓글 알람

	//댓글 알람 삭제
	@Override
	public int commentDelete(int commentnumber) {
		return sqlSession.delete("com.spring.helper.dao.BoardDAO.commentDelete", commentnumber);
	}

	//채팅 알람 삭제
	@Override
	public int messageDelete(int messagenumber) {
		return sqlSession.delete("com.spring.helper.dao.BoardDAO.messageDelete", messagenumber);
	}
	//댓글 알람 갯수
	@Override
	public int commentAlarmCnt(String memEmail) {
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.commentAlarmCnt", memEmail);
	}
	
	//쪽지 알람 갯수
	@Override
	public int messageCnt(String memberId) {
		return sqlSession.selectOne("com.spring.helper.dao.BoardDAO.messageCnt", memberId);
	}
	// 쪽지 보내기 처리
	@Override
	public int sendMessage(Map<String, Object> map) {
		return sqlSession.insert("com.spring.helper.dao.BoardDAO.sendMessage", map);
	}
	// 채팅 글뿌리기
	@Override
	public List<ChattingVO> chatting(){
		return sqlSession.selectList("com.spring.helper.dao.BoardDAO.chatting");
	}
	// 채팅 글 쓰기
	@Override
	public int chattingWrite(ChattingVO vo) {
		return sqlSession.insert("com.spring.helper.dao.BoardDAO.chattingWrite", vo);
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

	// 글 쓰기 처리
	@Override
	public int onedayclassInsertBoard(onedayclassVO vo) {

		BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
		int onedayclassInsertCnt = boardDao.onedayclassInsertBoard(vo);
		return onedayclassInsertCnt;
	}

	// 글 삭제 처리
	@Override
	public int onedayclassDeleteBoard(int onedayclassNumber) {

		BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
		int onedayclassDeleteCnt = boardDao.onedayclassDeleteBoard(onedayclassNumber);
		return onedayclassDeleteCnt;
	}

	// 계좌번호 업데이트
	@Override
	public int onedayclassAccountUpdate(Map<String, Object> map) {
		return sqlSession.update("com.spring.helper.dao.BoardDAO.onedayclassAccountUpdate", map);
	}

	// 원데이게시판 댓글 리스트 출력
	@Override
	public ArrayList<oCommentVO> getoCommentList(int onedayclassNumber) {

		return sqlSession.getMapper(BoardDAO.class).getoCommentList(onedayclassNumber);
	}
	

	// 진호 메소드 종료------------------------------------------------



}
