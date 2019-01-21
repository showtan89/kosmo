package com.spring.helper.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.helper.dao.BoardDAO;
import com.spring.helper.method.method.BoardMethod;
import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.MessageAlarmVO;
import com.spring.helper.vo.BoardVO.RealestateVO;
import com.spring.helper.vo.BoardVO.UserVO;
import com.spring.helper.vo.BoardVO.kCommentVO;
import com.spring.helper.vo.BoardVO.onedayclassVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDao;

	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	// 동욱이 메소드 시작(지식인게시판)
	// 지식인게시판 리스트 출력
	@Override
	public void knowledgeBoardList(HttpServletRequest req, Model model) {
		int pageSize = 10; 		// 한 페이지당 출력할 글 갯수
		if(req.getParameter("btn_select")!=null) {
			pageSize = Integer.parseInt(req.getParameter("btn_select"));
		}
		int pageBlock = 3; 		// 한 블럭당 페이지 갯수
		int cnt = 0;       		// 글 갯수
		int start = 0;	   		// 현재 페이지 시작 글번호
		int end = 0;	   		// 현재 페이지 마지막 글번호
		int number = 0;    		// 출력용 글번호
		String pageNum = ""; 	// 페이지 번호
		int currentPage = 0;    // 현재 페이지
		int pageCount = 0;      // 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		cnt = boardDao.knowledgeGetArticleCnt();
		pageNum = req.getParameter("pageNum");

		if(pageNum== null) {
			pageNum = "1"; // 첫페이지를 1로 주겠다.
		}
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		System.out.println("currentPage : "+currentPage);

		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCount = (cnt / pageSize) +(cnt % pageSize > 0 ? 1 : 0);

		//현재 페이지 시작 글번호
		// 1 = (1 - 1) * 5 + 1
		start = (currentPage-1) * pageSize + 1;

		//현재 페이지 마지막 글번호
		//5 = 1 + 5 - 1;
		end = start + pageSize -1;
		if(end > cnt) end = cnt;	
		// 출력용 글번호
		number = cnt - (currentPage -1)* pageSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		if(cnt>0) {
			// 게시글 목록 조회
			Map<Integer, Integer> map2 = new HashMap<Integer, Integer>();
			ArrayList<KnowledgeVO> dtos = boardDao.knowledgeGetArticleList(map);
			int i=0;
			for (KnowledgeVO c : dtos) {
				Integer knowledgeCommentListCnt = boardDao.knowledgeCommentListCnt(c.getKnowledgeNumber());
				map2.put(i,knowledgeCommentListCnt);
				i++;
			}
			req.setAttribute("kcommentCnt",map2);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 1건
			String pageSize2 = String.valueOf(pageSize);
			model.addAttribute("btn_select", pageSize2);
		}

		// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)

		// 시작페이지 1 = (1/3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		// 마지막 페이지 3 = 1 + 3 - 1
		endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		req.setAttribute("cnt", cnt); // 글갯수
		req.setAttribute("number", number); // 출력용 글번호
		req.setAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt >0) {
			req.setAttribute("startPage", startPage); // 시작 페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}

	}
	//질문등록 처리
	@Override
	public void knowledgeInsertArticle(HttpServletRequest req, Model model) {
		String knowledgeSubject = req.getParameter("knowledgeSubject");
		String knowledgeContent = req.getParameter("knowledgeContent");
		String knowledgeOpenCheck = req.getParameter("knowledgeOpenCheck");
		String knowledgeCategory = req.getParameter("knowledgeCategory");
		int knowledgeReward = Integer.parseInt(req.getParameter("addReward"));
		KnowledgeVO Knowledge = new KnowledgeVO();
		UserVO userVO = (UserVO)req.getSession().getAttribute("userVO");
		Knowledge.setMemberEmail(userVO.getMemberEmail());
		Knowledge.setMemberId(userVO.getMemberId());
		Knowledge.setKnowledgeReward(knowledgeReward);
		Knowledge.setKnowledgeSubject(knowledgeSubject);
		Knowledge.setKnowledgeContent(knowledgeContent);
		Knowledge.setKnowledgeOpenCheck(knowledgeOpenCheck);
		Knowledge.setKnowledgeCategory(knowledgeCategory);
		int insertcnt = boardDao.knowledgeInsertArticle(Knowledge);
		model.addAttribute("insertcnt",insertcnt);

	}
	// 지식인게시판 게시글 상세페이지 출력
	@Override
	public void knowledgeDetailForm(HttpServletRequest req, Model model) {
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		KnowledgeVO Knowledge = new KnowledgeVO();
		Knowledge = boardDao.knowledgeGetArticle(knowledgeNumber);
		model.addAttribute("dtos",Knowledge);
	}
	// 답변 등록 처리
	@Override
	public void knowledgeCommentPro(HttpServletRequest req, Model model) {
		String kCommentContent = req.getParameter("kCommentContent");
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		String kCommentTemp1 = req.getParameter("kCommentTemp1");
		String knowledgememberId = req.getParameter("knowledgememberId");
		UserVO userVO = (UserVO)req.getSession().getAttribute("userVO");
		String memberEmail = userVO.getMemberEmail();
		String memberId = userVO.getMemberId();
		String memberCountry = userVO.getMemberCountry();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kCommentContent", kCommentContent);
		map.put("knowledgeNumber", knowledgeNumber);
		map.put("kCommentTemp1", kCommentTemp1);
		map.put("memberId", memberId);
		map.put("memberNumber", userVO.getMemberNumber());
		map.put("memberEmail", memberEmail);
		map.put("memberId", memberId);
		map.put("memberCountry", memberCountry);
		int kCommentCnt = boardDao.knowledgeCommentPro(map);
		req.setAttribute("knowledgeNumber", knowledgeNumber);
		req.setAttribute("kCommentCnt", kCommentCnt);
	}

	// 댓글 등록 리스트 출력
	@Override
	public void knowledgeCommentList(HttpServletRequest req, Model model) {
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		int cnt = boardDao.knowledgeCommentListCnt(knowledgeNumber);
		if(cnt > 0) {
		ArrayList<kCommentVO> kCommentVO = boardDao.knowledgeCommentList(knowledgeNumber);
		req.setAttribute("kCommentVO", kCommentVO);
		}
	}
	
	// 동욱이 메소드 종료


	//재영 boardServiceImpl 시작====================================================================================

	@Autowired
	BoardMethod boardMethod;

	//부동산 게시판 글 목록 보기
	@Override
	public void realestateList(HttpServletRequest req, Model model) {

		//파라미터(검색조건) VO에 담기
		RealestateVO rVO = boardMethod.getParameterRealestateVO(req); 

		//검색 조건에 대한 게시글 갯수 구하기
		Integer cnt = boardDao.getRealestateCount(rVO);
		/*//검색 조건에 대한 게시글 갯수로 페이지 구하기
			PageVO pVO = boardMethod.getRealestatePageVO(cnt);

			logger.info(rVO.toString());

			List<RealestateVO> list = boardDao.realestateList(rVO);

			model.addAttribute("list", list);*/

	}

	//부동산 게시판 글 쓰기
	@Override
	public void realestateWritePro(HttpServletRequest req, Model model) {

		RealestateVO rVO = boardMethod.getFullRealestateVO(req); 

		logger.info(rVO.toString());

		Integer realestateWriteProResult = boardDao.realestateWritePro(rVO);

		logger.info(realestateWriteProResult.toString());
	}

	//부동산 게시판 글 쓰기
	@Override
	public void realestateDummyMaker(HttpServletRequest req, Model model) {
		RealestateVO rVO = boardMethod.getFullRealestateVO(req); 
		logger.info(rVO.toString());
		Integer realestateWriteProResult = boardDao.realestateWritePro(rVO);
		logger.info(realestateWriteProResult.toString());
	}

	//재영 boardServiceImpl 끝


	//민석이 메소드 시작+++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@Override
	public void messageForm(HttpServletRequest req, Model model) {
		// 페이징
		int pageSize = 10; 		// 한페이지당 출력할 글 갯수
		int pageBlock = 5; 		// 한 블럭당 페이지 갯수

		int cnt = 0; 			// 글갯수
		int start = 0; 			// 현재 페이지 시작 글번호
		int end = 0; 			// 현재 페이지 마지막 글번호
		int number = 0; 		// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage=0;		// 현재페이지

		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지

		//	String strId = (String)req.getSession().getAttribute("memId"); 

		//5단계 글갯수 구하기
		cnt = boardDao.messageReadCnt1()+ boardDao.messageReadCnt2();
		System.out.println("글 갯수cnt ===============: "+cnt);

		pageNum = req.getParameter("pageNum");

		if(pageNum == null) {
			pageNum = "1"; //첫페이지를 1페이지로 지정
		}
		
		//재영 boardServiceImpl 끝

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);//현재 페이지 : 1
		System.out.println("쪽수 구하기currentPage : "+currentPage);

		// 페이지 갯수 6 = (30 / 5)+(0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); //페이지 갯수 + 나머지가 있으면 1

		// 현재 페이지 시작 글번호1 (페이지별)
		// 1 = (1-1) * 5 + 1
		start = (currentPage -1) * pageSize +1;

		// 현재 페이지 마지막 글번호(페이지별)
		// 5 = 1 + 5 -1;
		end = start + pageSize - 1 ;

		System.out.println("start : " + start);
		System.out.println("end : " + end);
		System.out.println("cnt : " + cnt);

		if(end > cnt) end = cnt;

		// 출력용 글번호
		// 30 = 30 -(1 - 1) * 5
		number = cnt - (currentPage -1) * pageSize;  // 출력용 글번호
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if(cnt > 0) {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);

			//5-2. 게시글 목록 조회
			List<CommentAlarmVO> mos =boardDao.messageReadList(map);

			// 큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
			req.setAttribute("mos", mos);

			List<MessageAlarmVO> cos = boardDao.commentReadList(map);
			req.setAttribute("cos", cos);

		}
		//6단계. request나 session에 처리 겨로가를 저장(jsp에 전달하기 위함)

		// 시작페이지
		//1=(1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock ==0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);			


		// 마지막 페이지
		// 3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage=pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("=======================");

		req.setAttribute("cnt", cnt);// 글갯수
		req.setAttribute("number", number); // 출력용 글번호
		req.setAttribute("pageNum", pageNum); // 페이지 번호

		if(cnt > 0) {
			req.setAttribute("startPage", startPage); // 시작 페이지
			req.setAttribute("endPage", endPage); // 마지막 페이지
			req.setAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount); // 페이지 갯수
			req.setAttribute("currentPage", currentPage); // 현재페이지
		}
		System.out.println("1");
		System.out.println("pageNum : "+pageNum);
		System.out.println("글목록");
	}
	//민석이 메소드 종료++++++++++++++++++++++++++++++++++++++++++++++++++
	
	//진호 메소드 시작---------------------------------------------------
	// 게시글 목록
	@Override
	public void onedayclassBoardList(HttpServletRequest req, Model model) {
		System.out.println("서비스시작~");
		// 3단계. 화면으로 부터 입력받은 값을 받아온다.
		int pageSize = 9;		// 한페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한블록당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글번호
		int end = 0;			// 현재 페이지 마지막 글번호
		int number = 0;			// 출력용 글번호
		String pageNum = ""; 	// 페이지 번호
		int currentPage = 0; 	// 현재페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		cnt = boardDao.onedayclassGetArticleCnt();
		
		System.out.println("cnt:" + cnt);
		
		if(req.getParameter("pageNum") != null) {
			pageNum = req.getParameter("pageNum").toString();
		}else {
			pageNum = "1"; // 첫페이지를 1페이지로 지정
		}

		// 글 48건 기준
		currentPage = Integer.parseInt(pageNum); // 현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);
		
		// 페이지 갯수
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);  // 페이지 갯수 + 나머지 있으면 1
		
		// 현재 페이지 시작번호(페이지별)
		// 1 = (1 - 1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;
		
		// 현재 페이지 마지막 글번호(페이지별)
		// 5 = 1 + 5 -1;
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);	
		
		if(cnt > 0) {
			// 5-2. 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<onedayclassVO> dtos = boardDao.onedayclassGetArticleList(map);
			
			req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록  cf)작은 바구니: 게시글1건

			System.out.println("dtos 나오냐?" + dtos+" / cnt :"+cnt);
		}

		// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		
		// 시작페이지
		// 1 = (1 /3) * 3 + 1;  int계산이므로 (1/3)이 0이 됨
		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);		
		
		// 마지막 페이지
		// 3 = 1 + 3 -1;
		endPage = startPage + pageBlock -1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("===================");
		
		req.setAttribute("cnt", cnt); 	// 글갯수
		req.setAttribute("number", number); 	// 출력용 글번호
		req.setAttribute("pageNum", pageNum); 	// 페이지 번호
		
		if(cnt > 0) {
			req.setAttribute("startPage", startPage); 		//시작페이지
			req.setAttribute("endPage", endPage); 			//마지막 페이지
			req.setAttribute("pageBlock", pageBlock); 		// 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount); 		// 페이지 갯수
			req.setAttribute("currentPage", currentPage); 	// 현재페이지
		}
		
		
	}

	// 상세페이지
	@Override
	public void onedayclassDetailForm(HttpServletRequest req, Model model) {
		
		// 3단계. 화면으로 부터 입력받은 값을 받아온다.
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int onedayclassNumber = Integer.parseInt(req.getParameter("onedayclassNumber"));
		
		boardDao.onedayclassAddReadCnt(onedayclassNumber);
		onedayclassVO vo = boardDao.onedayclassGetArticle(onedayclassNumber);
		
		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("onedayclassNumber", onedayclassNumber);
	}
	//진호 메소드 종료---------------------------------------------------
	
	
}
