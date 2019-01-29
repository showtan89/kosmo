package com.spring.helper.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.helper.dao.MemberDAO;
import com.spring.helper.vo.BoardVO.UserVO;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberdao;
	

	// 대호 메소드 시작 ===================================================
	// 이메일 (아이디) 중복 확인
	@Override
	public void memberConfirmidForm(HttpServletRequest req, Model model) {

		String email = (String)req.getParameter("email");

		int selectCnt = memberdao.memberConfirmidForm(email);

		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("email", email);
	}

	// 회원가입 처리
	@Override
	public void memberInputPro(HttpServletRequest req, Model model) {

		String memberCountry = req.getParameter("memberCountry");
		String memberEmail = req.getParameter("memberEmail");
		String password = req.getParameter("password");
		String memberId = req.getParameter("memberId");

		StringBuffer temp = new StringBuffer();
		Random random = new Random();

		for ( int i = 0; i < 6; i++ ) {

			int rIndex = random.nextInt(2);

			switch (rIndex) {
			case 0 : // A-Z
				temp.append((char)((int)(random.nextInt(26)) + 65));
				break;
			case 1 : // 0-9
				temp.append((random.nextInt(10)));
				break;
			}
		}

		String emailKey = temp.toString();


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberCountry", memberCountry);
		map.put("memberEmail", memberEmail);
		map.put("password", password);
		map.put("memberId", memberId);
		map.put("emailKey", emailKey);


		int insertCnt = memberdao.memberInputPro(map);

		if (insertCnt == 1) {
			memberdao.sendEmailKey(map);
		}

		model.addAttribute("insertCnt", insertCnt);
	}

	// 이메일 인증 완료
	@Override
	public void memberEmailConfirmed(HttpServletRequest req, Model model) {

		String emailKey = req.getParameter("emailKey");

		int updateCnt = memberdao.memberEmailConfirmed(emailKey);

		model.addAttribute("updateCnt", updateCnt);
	}

	// 회원정보 수정
	@Override
	public void memberModifyPro(HttpServletRequest req, Model model) {

		String password = req.getParameter("password");
		String memberCountry = req.getParameter("memberCountry");

		UserVO userVO = (UserVO)req.getSession().getAttribute("userVO");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("password", password);
		map.put("memberCountry", memberCountry);
		map.put("memberEmail", userVO.getMemberEmail());

		int updateCnt = memberdao.memberModifyPro(map);

		if (updateCnt == 1) {
			userVO.setPassword(password);
			userVO.setMemberCountry(memberCountry);
		}

		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("memberId", userVO.getMemberId());
	}

	// 회원 탈퇴
	@Override
	public void memberDeletePro(HttpServletRequest req, Model model) {

		String password = req.getParameter("password");

		UserVO userVO = (UserVO)req.getSession().getAttribute("userVO");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("password", password);
		map.put("memberEmail", userVO.getMemberEmail());

		int selectCnt = memberdao.memberDeleteForm(map);

		if (selectCnt == 1) {
			int updateCnt = memberdao.memberDeletePro(map);
			model.addAttribute("updateCnt", updateCnt);
		} else {
			model.addAttribute("selectCnt", selectCnt);
		}
	}

	// 유저 리스트
	@Override
	public void hostMemberList(HttpServletRequest req, Model model) {
			
		List<UserVO> uvos = memberdao.hostMemberList();
		model.addAttribute("uvos", uvos);

	}


	// 대호 메소드 종료 ===================================================

}
