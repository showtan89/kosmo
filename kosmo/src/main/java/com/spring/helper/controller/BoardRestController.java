package com.spring.helper.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.helper.dao.BoardDAO;
import com.spring.helper.service.BoardService;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;

@RestController
public class BoardRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	
	@Autowired
	BoardService service;
	
	@Autowired
	BoardDAO boardDao;
	// 지식인 게시판 리스트 출력 호출
	@RequestMapping(value="KnowledgeListJson", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> KnowledgeListJson(HttpServletRequest req, Model model) throws Exception{
		logger.info("KnowledgeListJson - GET 호출");
		
		Map<String, Object> map = new HashMap<String, Object>();
		String knowledgeCategory = "No";
		String search = "No";
		if(req.getParameter("knowledgeCategory") != null ) {
			System.out.println("전체일경우1"+req.getParameter("knowledgeCategory"));
			model.addAttribute("knowledgeCategory","All");
			if(!req.getParameter("knowledgeCategory").equals("All")) {
				System.out.println("전체일경우2"+req.getParameter("knowledgeCategory"));
				knowledgeCategory= req.getParameter("knowledgeCategory");
				model.addAttribute("knowledgeCategory",knowledgeCategory);
			}
		} else {
			model.addAttribute("knowledgeCategory","All");
		}
		if(req.getParameter("search") != null && req.getParameter("search")!="") {
			search= req.getParameter("search");
		}
		String selectchk=req.getParameter("selectchk");
		map.put("selectchk", selectchk);
		map.put("knowledgeCategory", knowledgeCategory);
		map.put("search", search);
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
		cnt = boardDao.knowledgeGetArticleCnt(map);
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
		
		map.put("start", start);
		map.put("end", end);
		ArrayList<KnowledgeVO> dtos = null;
		int[] dtos2;
		dtos2 = new int[50];
		if(cnt>0) {
			// 게시글 목록 조회
			Map<Integer, Integer> map2 = new HashMap<Integer, Integer>();
			dtos = boardDao.knowledgeGetArticleList(map);
			int i=0;
			for (KnowledgeVO c : dtos) {
				Integer knowledgeCommentListCnt = boardDao.knowledgeCommentListCnt(c.getKnowledgeNumber());
				dtos2[i] =knowledgeCommentListCnt;
				i++;
			}
			req.setAttribute("kcommentCnt",map2);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니 1건
			map.put("dtos", dtos);
			String pageSize2 = String.valueOf(pageSize);
			model.addAttribute("btn_select", pageSize2);
			map.put("btn_select", pageSize2);
			map.put("dtos2", dtos2);
		}

		// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)

		// 시작페이지 1 = (1/3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		// 마지막 페이지 3 = 1 + 3 - 1
		endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		map.put("cnt", cnt); // 글갯수
		req.setAttribute("number", number); // 출력용 글번호
		req.setAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt >0) {
			map.put("startPage", startPage); // 시작 페이지
			map.put("endPage", endPage); // 마지막 페이지
			map.put("pageBlock", pageBlock); // 출력할 페이지 갯수
			map.put("pageCount", pageCount); // 페이지 갯수
			map.put("currentPage", currentPage); // 현재페이지
		}
		map.put("pageNum", pageNum);
		
		return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	}
	
	
	// 부동산 댓글 출력 호출
	@RequestMapping(value="realestateCommentsJson", method = RequestMethod.GET)
	public ResponseEntity<List<RealestateCommentsVO>> realestateCommentsJson(HttpServletRequest req, Model model) throws Exception{
		logger.info("realestateCommentsJson - GET 호출");
		List<RealestateCommentsVO> list = service.realestateGetCommentsList(req,model); //댓글 리스트 가져오기
		return new ResponseEntity<>(list,HttpStatus.OK);
		
	}
	
	// 부동산 댓글 등록 호출
	@RequestMapping(value="realestateCommentsJson", method = RequestMethod.POST) //VO로 받는 부분
	public ResponseEntity<String> realestateCommentsWrite(@RequestBody RealestateCommentsVO cVO, HttpServletRequest req, Model model) throws Exception{
		logger.info("realestateCommentsJson - POST 호출");
		Integer realestateInsertArticle = service.realestateCommentPro(cVO, req); //댓글 등록 실행
		ResponseEntity<String> entity = null;
		if(realestateInsertArticle==0||realestateInsertArticle==null) {
			entity = new ResponseEntity<String>("FAILED",HttpStatus.BAD_REQUEST);
		}else {
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}
		return entity;
	}
	
	// 부동산 댓글 삭제 호출
	@RequestMapping(value="realestateCommentsJson", method = RequestMethod.DELETE)
	public ResponseEntity<String> realestateCommentsDelete(@RequestBody String cNumber, HttpServletRequest req, Model model) throws Exception{
		logger.info("realestateCommentsJson - DELETE 호출");
		String cNum = cNumber.replace("{\"cNumber\":", "").replace("}",""); //깔끔하게 받을 방법이 없을까?
		Integer commentNumber = Integer.valueOf(cNum);
		Integer realestateDeleteArticle = service.realestateCommentsDelete(commentNumber); //삭제 실행
		ResponseEntity<String> entity = null;
		if(realestateDeleteArticle==0||realestateDeleteArticle==null) {
			entity = new ResponseEntity<String>("FAILED",HttpStatus.BAD_REQUEST);
		}else {
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}
		return entity;
	}
	
	//수정 안해요!!!
/*	@RequestMapping(value="realestateCommentsJson", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> realestateCommentsModify(HttpServletRequest req, Model model) throws Exception{
		logger.info("realestateCommentsJson - PUT 호출");
		Integer realestateInsertArticle = service.realestateInsertArticle(req, model);
		ResponseEntity<String> entity = null;
		if(realestateInsertArticle==0||realestateInsertArticle==null) {
			entity = new ResponseEntity<String>("FAILED",HttpStatus.BAD_REQUEST);
		}else {
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}
		return entity;
	}*/
	
	//헤더 알람 갯수 카운트
	@RequestMapping(value="alarmCnt", method = RequestMethod.GET)
	ResponseEntity<Integer> alarmCnt(HttpServletRequest req ){
		logger.info("alarmCnt 호출");
		Integer alarmServiceCnt = service.alarmServiceCnt(req); 
		return new ResponseEntity<Integer>(alarmServiceCnt,HttpStatus.OK);
	}
	
}
