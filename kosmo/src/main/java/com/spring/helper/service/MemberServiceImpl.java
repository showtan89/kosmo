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
	
	@Override
	public void memberIdConfirm(HttpServletRequest req, Model model) {
		
		String memberId = req.getParameter("memberId");
		
		int selectCnt = memberdao.memberIdConfirm(memberId);
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("memberId", memberId);
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
		
		int pageSize = 20; 		// 한 페이지당 출력할 글 갯수
		int pageBlock = 10; 		// 한 블럭당 페이지 갯수
		int cnt = 0;       		// 글 갯수
		int start = 0;	   		// 현재 페이지 시작 글번호
		int end = 0;	   		// 현재 페이지 마지막 글번호
		String pageNum = ""; 	// 페이지 번호
		int currentPage = 0;    // 현재 페이지
		int pageCount = 0;      // 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		cnt = memberdao.getCnt();
		pageNum = req.getParameter("pageNum");

		if(pageNum== null) {
			pageNum = "1"; // 첫페이지를 1로 주겠다.
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCount = (cnt / pageSize) +(cnt % pageSize > 0 ? 1 : 0);

		//현재 페이지 시작 글번호
		start = (currentPage-1) * pageSize + 1;

		//현재 페이지 마지막 글번호
		end = start + pageSize -1;
		if(end > cnt) end = cnt;	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		if(cnt > 0) {
			List<UserVO> uvos = memberdao.hostMemberList(map);
			model.addAttribute("uvos", uvos);
		}

		// 시작페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		// 마지막 페이지
		endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		
		req.setAttribute("cnt", cnt); // 글갯수
		req.setAttribute("pageNum", pageNum); // 페이지 번호
		
		if(cnt >0) {
			req.setAttribute("startPage", startPage); // 시작 페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}

	}

	// 원데이 클래스 신청 목록
	@Override
	public void addAuthority(HttpServletRequest req, Model model) {
		
		int pageSize = 20; 		// 한 페이지당 출력할 글 갯수
		int pageBlock = 10; 		// 한 블럭당 페이지 갯수
		int cnt = 0;       		// 글 갯수
		int start = 0;	   		// 현재 페이지 시작 글번호
		int end = 0;	   		// 현재 페이지 마지막 글번호
		String pageNum = ""; 	// 페이지 번호
		int currentPage = 0;    // 현재 페이지
		int pageCount = 0;      // 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		cnt = memberdao.getApplyCnt();
		pageNum = req.getParameter("pageNum");

		if(pageNum== null) {
			pageNum = "1"; // 첫페이지를 1로 주겠다.
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCount = (cnt / pageSize) +(cnt % pageSize > 0 ? 1 : 0);

		//현재 페이지 시작 글번호
		start = (currentPage-1) * pageSize + 1;

		//현재 페이지 마지막 글번호
		end = start + pageSize -1;
		if(end > cnt) end = cnt;	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		if(cnt > 0) {
			List<UserVO> uvos = memberdao.addAuthority(map);
			model.addAttribute("uvos", uvos);
		}

		// 시작페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		// 마지막 페이지
		endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		
		req.setAttribute("cnt", cnt); // 글갯수
		req.setAttribute("pageNum", pageNum); // 페이지 번호
		
		if(cnt >0) {
			req.setAttribute("startPage", startPage); // 시작 페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}
		 
	}

	// 클래스 개설 승인
	@Override
	public void applyAuthority(HttpServletRequest req, Model model) {
		
		String memberEmail = req.getParameter("memberEmail");
		
		int updateCnt = memberdao.applyAuthority(memberEmail);
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("memberEmail", memberEmail);
	}

	// 멤버 찾기
	@Override
	public void memberSearch(HttpServletRequest req, Model model) {
		
		String text = req.getParameter("search");
		
		int pageSize = 20;
		int pageBlock = 10;
		int cnt = 0;
		int start = 0;	 
		int end = 0;
		String pageNum = ""; 
		int currentPage = 0;
		int pageCount = 0;
		int startPage = 0;	
		int endPage = 0;	
		
		cnt = memberdao.getSearchCnt(text);
		
		pageNum = req.getParameter("pageNum");

		if(pageNum== null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		
		pageCount = (cnt / pageSize) +(cnt % pageSize > 0 ? 1 : 0);

		start = (currentPage-1) * pageSize + 1;

		end = start + pageSize -1;
		
		if(end > cnt) end = cnt;	

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("text", text);

		if(cnt > 0) {
			List<UserVO> uvos = memberdao.memberSearch(map);
			model.addAttribute("uvos", uvos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1;
		
		if(currentPage % pageBlock == 0) startPage -= pageBlock;

		
		endPage = startPage + pageBlock-1;
		
		if(endPage > pageCount) endPage = pageCount;

		
		req.setAttribute("cnt", cnt);
		req.setAttribute("pageNum", pageNum);

		if(cnt >0) {
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("currentPage", currentPage);
		}

	}


	// 대호 메소드 종료 ===================================================

}
