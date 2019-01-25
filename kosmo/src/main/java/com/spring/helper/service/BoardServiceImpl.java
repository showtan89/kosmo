package com.spring.helper.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.helper.dao.BoardDAO;
import com.spring.helper.method.method.BoardMethod;
import com.spring.helper.vo.BoardVO.CommentAlarmVO;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.MessageAlarmVO;
import com.spring.helper.vo.BoardVO.PageVO;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;
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
	// 파일업로드 테스트
	@Override
	public void test(MultipartHttpServletRequest req,Model model) {
		MultipartFile file = req.getFile("test");
		String saveDir = req.getRealPath("/resources/img/");
		String realDir = req.getSession().getServletContext().getRealPath("/resources/img/");
		System.out.println("realDir"+realDir);
		System.out.println("saveDir"+saveDir);
		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename())); // 파일데이터를 읽어서 저장
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
			int data = 0;
			while((data = fis.read()) != -1){
				fos.write(data);
			}
			fis.close();
			fos.close();
			String images = file.getOriginalFilename();
			int insertcnt =boardDao.test(images);
			req.setAttribute("insertcnt", insertcnt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
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
	// 질문수정 폼 이동
	@Override
	public void knowledgeModifyForm(HttpServletRequest req, Model model) {
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		String pageNum = req.getParameter("pageNum"); 
		String btn_select = req.getParameter("btn_select");
		KnowledgeVO Knowledge = boardDao.knowledgeModifyForm(knowledgeNumber);
		model.addAttribute("Knowledge",Knowledge);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("btn_select",btn_select);
	}
	// 질문수정 처리
	@Override
	public void knowledgeModifyPro(HttpServletRequest req, Model model) {
		String pageNum = req.getParameter("pageNum"); 
		String btn_select = req.getParameter("btn_select");
		String knowledgeSubject = req.getParameter("knowledgeSubject");
		String knowledgeContent = req.getParameter("knowledgeContent");
		String knowledgeOpenCheck = req.getParameter("knowledgeOpenCheck");
		String knowledgeCategory = req.getParameter("knowledgeCategory");
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		int knowledgeReward = Integer.parseInt(req.getParameter("addReward"));
		KnowledgeVO Knowledge = new KnowledgeVO();
		Knowledge.setKnowledgeNumber(knowledgeNumber);
		Knowledge.setKnowledgeReward(knowledgeReward);
		Knowledge.setKnowledgeSubject(knowledgeSubject);
		Knowledge.setKnowledgeContent(knowledgeContent);
		Knowledge.setKnowledgeOpenCheck(knowledgeOpenCheck);
		Knowledge.setKnowledgeCategory(knowledgeCategory);
		int Knowledgeupdatecnt = boardDao.knowledgeModifyPro(Knowledge);
		model.addAttribute("knowledgeNumber",knowledgeNumber);
		model.addAttribute("Knowledgeupdatecnt",Knowledgeupdatecnt);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("btn_select",btn_select);
	}
	// 질문삭제 처리
	@Override
	public void knowledgeDeleteForm(HttpServletRequest req, Model model) {
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		System.out.println(knowledgeNumber);
		String pageNum = req.getParameter("pageNum"); 
		String btn_select = req.getParameter("btn_select");
		int knowledgedeletecnt = boardDao.knowledgeDeleteForm(knowledgeNumber);
		model.addAttribute("knowledgedeletecnt",knowledgedeletecnt);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("btn_select",btn_select);
	}
	// 지식인게시판 게시글 상세페이지 출력
	@Override
	public void knowledgeDetailForm(HttpServletRequest req, Model model) {
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		KnowledgeVO Knowledge = new KnowledgeVO();
		Knowledge = boardDao.knowledgeGetArticle(knowledgeNumber);
		model.addAttribute("dtos",Knowledge);
		int emailcheck = 0;
		req.setAttribute("emailcheck", emailcheck);
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
	// 답변 수정 처리
	@Override
	public void kCommentModifyUpdate(HttpServletRequest req, Model model) {
		String kCommentContent = req.getParameter("kCommentContent");
		String kCommentTemp1 = req.getParameter("kCommentTemp2");
		int kCommentNumber = Integer.parseInt(req.getParameter("kCommentNumber"));
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kCommentContent", kCommentContent);
		map.put("kCommentTemp1", kCommentTemp1);
		map.put("kCommentNumber", kCommentNumber);
		int kCommentModifycnt = boardDao.kCommentModifyUpdate(map);
		req.setAttribute("knowledgeNumber", knowledgeNumber);
		req.setAttribute("kCommentNumber", kCommentNumber);
		req.setAttribute("kCommentModifycnt", kCommentModifycnt);
	}
	// 답변 삭제 처리
	@Override
	public void kCommentdelete(HttpServletRequest req, Model model) {
		int kCommentNumber = Integer.parseInt(req.getParameter("kCommentNumber"));
		System.out.println(kCommentNumber);
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		System.out.println(knowledgeNumber);
		int kCommentdeletecnt =  boardDao.kCommentdelete(kCommentNumber);
		model.addAttribute("knowledgeNumber",knowledgeNumber);
		model.addAttribute("kCommentdeletecnt",kCommentdeletecnt);
	}
	// 답변 등록 리스트 출력
	@Override
	public void knowledgeCommentList(HttpServletRequest req, Model model) {
		int knowledgeNumber = Integer.parseInt(req.getParameter("knowledgeNumber"));
		int cnt = boardDao.knowledgeCommentListCnt(knowledgeNumber);
		int emailcheck = 0;
		if(cnt > 0) {
			ArrayList<kCommentVO> kCommentVO = boardDao.knowledgeCommentList(knowledgeNumber);
			req.setAttribute("kCommentVO", kCommentVO);
			UserVO user = (UserVO)req.getSession().getAttribute("userVO");
			for(kCommentVO cc : kCommentVO) {
				if(cc.getMemberEmail().equals(user.getMemberEmail())){
					emailcheck = 1;
				}
			}
		}
		req.setAttribute("emailcheck", emailcheck);
	}

	// 동욱이 메소드 종료


	//재영 boardServiceImpl 시작 /////////////////////////////////////////////////////////////////////////////////////////////////

	@Autowired
	BoardMethod boardMethod;

	//부동산 게시판 글 목록 보기
	@Override
	public void realestateGetArticleList(HttpServletRequest req, Model model) {
		//파라미터(검색조건) VO에 담기
		RealestateVO rVO = boardMethod.getParameterRealestateVO(req); 
		//검색 조건에 대한 게시글 갯수 구하기
		Integer cnt = boardDao.realestateGetArticleCnt(rVO);
		//검색 조건에 대한 게시글 갯수로 페이지 구하기
		int pageNum = 1;
		if(req.getParameter("pageNum")!=null) {
			int temp = Integer.parseInt(req.getParameter("pageNum"));
			if(temp>1) pageNum = temp;
		}
		PageVO pVO = boardMethod.getRealestatePageVO(pageNum,cnt);
		List<RealestateVO> list = new ArrayList<RealestateVO>();
		pVO.setPageNum(String.valueOf(pageNum));
		rVO.setRealestateStart(pVO.getStartNumber());
		rVO.setRealestateEnd(pVO.getEndNumber());
		list = boardDao.realestateGetArticleList(rVO);
		logger.info(pVO.toString());
		model.addAttribute("list", list);
		model.addAttribute("pVO", pVO);
	}

	// Json 시도하다가 검색 조건 들어가서 시작 
	/*@Override
	public RealestateVO realestateGetVO(HttpServletRequest req) {
		//파라미터(검색조건) VO에 담기
		RealestateVO rVO = boardMethod.getParameterRealestateVO(req); 
		return rVO;
	}*/
	
	//부동산 게시판 페이지 만들기
	/*@Override
	public PageVO realestateListPage(HttpServletRequest req, RealestateVO rVO) {
		//검색 조건에 대한 게시글 갯수 구하기
		Integer cnt = boardDao.getRealestateCount(rVO);
		
		//검색 조건에 대한 게시글 갯수로 페이지 구하기
		int pageNum = 1;
		if(req.getParameter("pageNum")!=null) {
			int temp = Integer.parseInt(req.getParameter("pageNum"));
			if(temp>1) pageNum = temp;
		}
		PageVO pVO = boardMethod.getRealestatePageVO(pageNum,cnt);
		logger.info(pVO.toString());
		pVO.setPageNum(String.valueOf(pageNum));
		return pVO;
	}
	
	//부동산 게시판 글 목록 보기
	@Override
	public List<RealestateVO> realestateListJson(RealestateVO rVO, int startNumber, int endNumber) {
		List<RealestateVO> list = new ArrayList<RealestateVO>();
		rVO.setRealestateStart(startNumber);
		rVO.setRealestateEnd(endNumber);
		list = boardDao.realestateList(rVO);
		return list;
	}*/
	// Json 시도하다가 검색 조건 들어가서 보류 끝
	
	//부동산 게시판 글 상세 페이지 
	@Override
	public void realestateGetArticle(HttpServletRequest req, Model model) {
		if(req.getParameter("realestateNumber") != null) {
			int realestateNumber = Integer.parseInt(req.getParameter("realestateNumber"));
			RealestateVO rVO = boardDao.realestateGetArticle(realestateNumber);
			if(rVO != null) {
				logger.info(rVO.toString());
				model.addAttribute("rVO",rVO);
			}else {
				logger.info("에러이니 페이지 되돌리기 기능넣기!!!");
			}
		}else {
			logger.info("에러이니 페이지 되돌리기 기능넣기!!!");
		}
	}

	// 부동산 게시판 댓글 가져오기
	@Override
	public List<RealestateCommentsVO> realestateGetCommentsList(HttpServletRequest req, Model model){
		int realestateNumber = Integer.parseInt(req.getParameter("realestateNumber"));
		return boardDao.realestateGetCommentsList(realestateNumber);
	};
	
	//부동산 게시판 댓글 달기
	@Override
	public Integer realestateCommentPro(RealestateCommentsVO cVO, HttpServletRequest req) {
		if(req.getSession().getAttribute("userVO")==null) {
			return 0;
		}else {
			UserVO uVO = (UserVO)req.getSession().getAttribute("userVO");
			logger.info(uVO.toString());
			cVO.setMemberId(uVO.getMemberId());
			cVO.setMemberEmail(uVO.getMemberEmail());
			return boardDao.realestateCommentPro(cVO);
		}
	}
	
	//부동산 게시판 댓글 삭제
	@Override
	public Integer realestateCommentsDelete(int rCommentNumber) {
		return boardDao.realestateCommentsDelete(rCommentNumber);
	}
	
	//부동산 게시판 글 쓰기
	@Override
	public Integer realestateInsertArticle(HttpServletRequest req, Model model) {
		RealestateVO rVO = boardMethod.getFullRealestateVO(req); 
		logger.info(rVO.toString());
		return boardDao.realestateInsertArticle(rVO);
	}

	//부동산 게시판 더미 데이터생성기 - 현재 버튼 주석 처리
	@Override
	public void realestateDummyMaker(HttpServletRequest req, Model model) {
		RealestateVO rVO = boardMethod.realestateDummyDataMaker(); 
		logger.info(rVO.toString());
		Integer realestateWriteProResult = boardDao.realestateInsertArticle(rVO);
		logger.info(realestateWriteProResult.toString());
	}

	//재영 boardServiceImpl 끝 /////////////////////////////////////////////////////////////////////////////////////////////////


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

	// 글 목록 상세페이지
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
	
	// 수정 상세 페이지

	// 수정 폼 - 비밀번호
	@Override
	public void onedayclassModifyForm(HttpServletRequest req, Model model) {
		int onedayclassNumber = Integer.parseInt(req.getParameter("onedayclassNumber"));
		boardDao.onedayclassAddReadCnt(onedayclassNumber);
		onedayclassVO vo = boardDao.onedayclassGetArticle(onedayclassNumber);
		
		model.addAttribute("dto", vo);
		model.addAttribute("onedayclassNumber", onedayclassNumber);
	}
	// 수정 처리
	@Override
	public void onedayclassModifyPro(HttpServletRequest req, Model model) {

		int onedayclassNumber = Integer.parseInt(req.getParameter("onedayclassNumber"));
		/*int pageNum = Integer.parseInt(req.getParameter("pageNum"));*/
		
		onedayclassVO vo = new onedayclassVO();
		
		vo.setOnedayclassNumber(onedayclassNumber);
		vo.setOnedayclassSubject(req.getParameter("onedayclassSubject"));
		vo.setOnedayclassLocation(req.getParameter("onedayclassLocation"));
		vo.setOnedayclassRecruitment(req.getParameter("onedayclassRecruitment"));
		vo.setOnedayclassPrice(Integer.parseInt(req.getParameter("onedayclassPrice")));
		vo.setOnedayclassCategory(req.getParameter("onedayclassCategory"));
		vo.setOnedayclassContent(req.getParameter("onedayclassContent"));
		vo.setOnedayclassImg2(req.getParameter("onedayclassImg2"));
		vo.setOnedayclassImg3(req.getParameter("onedayclassImg3"));
		vo.setOnedayclassDeadlineCheck(req.getParameter("onedayclassDeadlineCheck"));
		/*System.out.println("vo나오나?" + vo.toString());*/
		int updateCnt = boardDao.onedayclassModifyUpdate(vo);
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("onedayclassNumber", onedayclassNumber);
		/*model.addAttribute("pageNum", pageNum);*/
		

	}
	
	// 글쓰기 페이지
	@Override
	public void onedayclassWriteForm(HttpServletRequest req, Model model) {
		
		int onedayclassNumber = Integer.parseInt(req.getParameter("onedayclassNumber"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("onedayclassNumber", onedayclassNumber);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 글 처리 페이지
	@Override
	public void onedayclassWritePro(HttpServletRequest req, Model model) {


		onedayclassVO vo = new onedayclassVO();
		
		/*int pageNum = Integer.parseInt(req.getParameter("pageNum"));*/
		/*vo.setOnedayclassNumber(Integer.parseInt(req.getParameter("onedayclassNumber")));*/

		vo.setOnedayclassSubject(req.getParameter("onedayclassSubject"));
		vo.setOnedayclassLocation(req.getParameter("onedayclassLocation"));
		vo.setOnedayclassRecruitment(req.getParameter("onedayclassRecruitment"));
		vo.setOnedayclassPrice(Integer.parseInt(req.getParameter("onedayclassPrice")));
		vo.setOnedayclassCategory(req.getParameter("onedayclassCategory"));
		vo.setOnedayclassContent(req.getParameter("onedayclassContent"));
		vo.setOnedayclassDeadlineCheck(req.getParameter("onedayclassDeadlineCheck"));
		
		int onedayclassInsertCnt = boardDao.onedayclassInsertBoard(vo);
		
		model.addAttribute("onedayclassInsertCnt", onedayclassInsertCnt);
		/*model.addAttribute("pageNum", pageNum);*/
	}
	
	// 글 삭제 처리
	@Override
	public void onedayclassDeletePro(HttpServletRequest req, Model model) {

		int onedayclassNumber = Integer.parseInt(req.getParameter("onedayclassNumber"));
		
		int onedayclassDeleteCnt = boardDao.onedayclassDeleteBoard(onedayclassNumber);
		
		model.addAttribute("onedayclassDeleteCnt", onedayclassDeleteCnt);

	}
	//진호 메소드 종료---------------------------------------------------
	
	// 대호 메소드 시작 ===================================================
	// 이메일 (아이디) 중복 확인
	@Override
	public void memberConfirmidForm(HttpServletRequest req, Model model) {
		
		String email = (String)req.getParameter("email");
		
		int selectCnt = boardDao.memberConfirmidForm(email);
		
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
		
		
		int insertCnt = boardDao.memberInputPro(map);
		
		if (insertCnt == 1) {
			boardDao.sendEmailKey(map);
		}
		
		model.addAttribute("insertCnt", insertCnt);
	}
	
	// 이메일 인증 완료
	@Override
	public void memberEmailConfirmed(HttpServletRequest req, Model model) {
		
		String emailKey = req.getParameter("emailKey");
		
		int updateCnt = boardDao.memberEmailConfirmed(emailKey);
		
		model.addAttribute("updateCnt", updateCnt);
	}
	
	// 대호 메소드 종료 ===================================================

}
