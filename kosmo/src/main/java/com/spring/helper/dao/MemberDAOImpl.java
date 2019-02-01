package com.spring.helper.dao;

import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.spring.helper.vo.BoardVO.UserVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	JavaMailSender sender;
	
	// 대호 메소드 시작 ======================================================
	// 이메일 중복 확인
	@Override
	public int memberConfirmidForm(String email) {
		return sqlSession.selectOne("com.spring.helper.dao.MemberDAO.memberConfirmidForm", email);
	}
	
	// ID (이름) 중복 확인
	@Override
	public int memberIdConfirm(String memberId) {
		return sqlSession.selectOne("com.spring.helper.dao.MemberDAO.memberIdConfirm", memberId);
	}


	// 회원 가입 완료
	@Override
	public int memberInputPro(Map<String, Object> map) {
		return sqlSession.insert("com.spring.helper.dao.MemberDAO.memberInputPro", map);
	}
	
	

	// 이메일 키 메일로 전송
	@Override
	public void sendEmailKey(Map<String, Object> map) {

		try {

			MimeMessage message = sender.createMimeMessage();

			message.setSubject("[Welkome!]Thanks to join us");

			String txt = "<img src='https://i.ibb.co/G75krLG/welkome.png'><br><hr>Welcome to Welkome!<br>Please click the link below to complete email authentication." + "<br>"
					+ "<a href='http://localhost/project/memberEmailConfirmed?emailKey=" + (String)map.get("emailKey") + "'> Click this Link </a>";

			message.setText(txt, "UTF-8", "html");

			message.setFrom(new InternetAddress("admin@helper.shop"));
			message.addRecipient(RecipientType.TO, new InternetAddress((String) map.get("memberEmail")));
			sender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 이메일 인증 완료
	@Override
	public int memberEmailConfirmed(String emailKey) {
		return sqlSession.update("com.spring.helper.dao.MemberDAO.memberEmailConfirmed", emailKey);
	}

	// 회원 정보 수정
	@Override
	public int memberModifyPro(Map<String, Object> map) {
		return sqlSession.update("com.spring.helper.dao.MemberDAO.memberModifyPro", map);
	}

	// 회원 탈퇴 확인
	@Override
	public int memberDeleteForm(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.helper.dao.MemberDAO.memberDeleteForm", map);
	}
	
	// 회원 탈퇴 (ROLE_GUEST, enabled = 0)
	@Override
	public int memberDeletePro(Map<String, Object> map) {
		return sqlSession.update("com.spring.helper.dao.MemberDAO.memberDeletePro", map);
	}

	// 회원 목록
	@Override
	public List<UserVO> hostMemberList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.helper.dao.MemberDAO.hostMemberList", map);
	}

	@Override
	public int getCnt() {
		return sqlSession.selectOne("com.spring.helper.dao.MemberDAO.getCnt");
	}

	@Override
	public int getApplyCnt() {
		return sqlSession.selectOne("com.spring.helper.dao.MemberDAO.getApplyCnt");
	}

	@Override
	public List<UserVO> addAuthority(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.helper.dao.MemberDAO.addAuthority", map);
	}

	@Override
	public int applyAuthority(String memberEmail) {
		return sqlSession.update("com.spring.helper.dao.MemberDAO.applyAuthority", memberEmail);
	}

	@Override
	public int getSearchCnt(String text) {
		return sqlSession.selectOne("com.spring.helper.dao.MemberDAO.getSearchCnt", text);
	}

	@Override
	public List<UserVO> memberSearch(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.helper.dao.MemberDAO.memberSearch", map);
	}


	// 대호 메소드 종료 ======================================================


}
