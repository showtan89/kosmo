package com.spring.helper.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.CharacterData;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.spring.helper.dao.BoardDAO;
import com.spring.helper.service.BoardService;
import com.spring.helper.vo.BoardVO.ChattingAllVO;
import com.spring.helper.vo.BoardVO.ChattingVO;
import com.spring.helper.vo.BoardVO.KnowledgeVO;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;
import com.spring.helper.vo.BoardVO.oCommentVO;
import com.spring.helper.vo.jsonVO.news.jsonlegalinfo;

@RestController
public class BoardRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	
	@Autowired
	BoardService service;
	
	@Autowired
	BoardDAO boardDao;
	
	//길찾기 주소정보 가져오기
	@RequestMapping(value="AddressJson", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public ResponseEntity<String> AddressJson(HttpServletRequest req, Model model) throws Exception{
		logger.info("AddressJson 로딩 중....");
				BufferedReader br = null;
				String x1 = req.getParameter("x1");
				String y1 = req.getParameter("y1");
				String x2 = req.getParameter("x2");
				String y2 = req.getParameter("y2");
				System.out.println(x1);
				System.out.println(y1);
				System.out.println(x2);
				System.out.println(y2);
	            String urlstr = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+x1+"&SY="+y1+"&EX="+x2+"&EY="+y2+"&apiKey=hnsqv%2Bnl81sOEEMyauqSk2DiKsoH%2BY2VTPN4c2%2FhmB0";
	            URL url = new URL(urlstr);
	            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
	            urlconnection.setRequestMethod("GET");
	            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
	            String result = "";
	            String line;
	            while((line = br.readLine()) != null) {
	                result = result + line + "\n";
	                
	            }
	            System.out.println(result);
		return new ResponseEntity<String>(result,HttpStatus.OK);
	}
	
	// 환율정보 가져오기
	@RequestMapping(value="exchangeratejson", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public ResponseEntity<String> exchangeratejson(HttpServletRequest req, Model model) throws Exception{
		 BufferedReader br = null;
	            String urlstr = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=XLm9HNCZCeP55wg6CqSfNfgUnyjsPb13&searchdate=20190103&data=AP01";
	            URL url = new URL(urlstr);
	            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
	            urlconnection.setRequestMethod("GET");
	            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
	            String result = "";
	            String line;
	            while((line = br.readLine()) != null) {
	                result = result + line + "\n";
	                
	            }
	            System.out.println(result);
		return new ResponseEntity<String>(result,HttpStatus.OK);
	}
	// 법률 정보 가져오기
	@RequestMapping(value="legalinfoListJson", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<jsonlegalinfo>> legalinfoListJson(HttpServletRequest req, Model model) throws Exception{
				// XML 데이터 읽어올 주소
				String search = req.getParameter("search");
				String catitle = req.getParameter("catitle");
				System.out.println(catitle);
				String url = "http://www.law.go.kr/DRF/lawSearch.do?OC=elwksl2&target=elaw&type=XML&search=1&display=100&query="+search+"&page=1";
				if(!catitle.equals("ALL") && search=="") {
					url = "http://www.law.go.kr/DRF/lawSearch.do?OC=elwksl2&target=elaw&type=XML&search=1&display=100&query="+catitle+"&page=1";
					System.out.println("1번url");
				} else if(catitle.equals("ALL") && search=="") {
					url = "http://www.law.go.kr/DRF/lawSearch.do?OC=elwksl2&target=elaw&type=XML&search=1&display=100&page=1";
					System.out.println("2번url");
				} else if(search!=""){
					url = "http://www.law.go.kr/DRF/lawSearch.do?OC=elwksl2&target=elaw&type=XML&search=1&display=100&query="+search+"&page=1";
					System.out.println("3번url");
				}
				
				// XML 데이터 파싱 부분
				System.out.println(url);
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				    NodeList nodes = doc.getElementsByTagName("law");
				    ArrayList<jsonlegalinfo> ss = new ArrayList<jsonlegalinfo>();
				    for (int i = 0; i < nodes.getLength(); i++) {
				    	jsonlegalinfo vo = new jsonlegalinfo();
				      Element element = (Element) nodes.item(i);
				      NodeList title = element.getElementsByTagName("법령명한글");
				      Element line = (Element)title.item(0);
				      NodeList title4 = element.getElementsByTagName("소관부처명");
				      Element line4 = (Element)title4.item(0);
				  	vo.setDepartment(getCharacterDataFromElement(line4));
				  	NodeList title5 = element.getElementsByTagName("제개정구분명");
				  	 Element line5 = (Element)title5.item(0);
				 	vo.setClassification(getCharacterDataFromElement(line5));
					NodeList title6 = element.getElementsByTagName("법령구분명");
					 Element line6 = (Element)title6.item(0);
						vo.setTypeofAct(getCharacterDataFromElement(line6));
					NodeList title7 = element.getElementsByTagName("공포번호");
					 Element line7 = (Element)title7.item(0);
						vo.setFearnumber(getCharacterDataFromElement(line7));
					NodeList title8 = element.getElementsByTagName("공포일자");
					 Element line8 = (Element)title8.item(0);
						vo.setFeardate(getCharacterDataFromElement(line8));
					NodeList title9 = element.getElementsByTagName("시행일자");
					 Element line9 = (Element)title9.item(0);
						vo.setEffectiveDate(getCharacterDataFromElement(line9));
				      
				      vo.setLawListHangul(getCharacterDataFromElement(line));
				      if(element.getElementsByTagName("법령명영문")!=null) {
			    		  NodeList title2 = element.getElementsByTagName("법령명영문");
			    		  String test;
			    		  for(int j=0;j<title2.getLength();j++) {
			    			  Element line2 = (Element)title2.item(j);
			    			  test =getCharacterDataFromElement(line2);
				    		  if(element.getElementsByTagName("법령상세링크")!=null) {
					    		  NodeList title3 = element.getElementsByTagName("법령상세링크");
					    		  String test2;
					    		  for(int k=0;k<title3.getLength();k++) {
						    		  Element line3 = (Element)title3.item(k);
						    		  test2 =getCharacterDataFromElement(line3);
						    		  test2= test2.replace("/DRF/lawService.do?OC=elwksl2&target=elaw&MST=", "");
						    		  test2= test2.replace("&type=HTML&mobileYn=", "");
						    		  vo.setLawlistlink(test2);
					    		  }
						    	 
					    	  }
				    		  vo.setLawListEnglish(test);
			    		  }
				      }
				      ss.add(vo);
			      }
		return new ResponseEntity<ArrayList<jsonlegalinfo>>(ss,HttpStatus.OK);
	}
	@RequestMapping(value="legalinfoDetailJson", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<jsonlegalinfo>> legalinfoDetailJson(HttpServletRequest req, Model model) throws Exception{
				// XML 데이터 읽어올 주소
				String address = req.getParameter("address");
				System.out.println(address);
				String url = "http://www.law.go.kr/DRF/lawService.do?OC=elwksl2&target=elaw&MST="+address+"&type=XML&mobileYn=";
				
				System.out.println(url);
				// XML 데이터 파싱 부분
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				NodeList lsNmEng = doc.getElementsByTagName("lsNmEng");
				Element element2 = (Element) lsNmEng.item(0);
				String lsNm = getCharacterDataFromElement(element2);
				NodeList nodes = doc.getElementsByTagName("Jo");
				ArrayList<jsonlegalinfo> ss = new ArrayList<jsonlegalinfo>();
				    for (int i = 0; i < nodes.getLength(); i++) {
				    	  jsonlegalinfo vo = new jsonlegalinfo();
					      Element element = (Element) nodes.item(i);
					      NodeList title = element.getElementsByTagName("joCts");
					      Element line = (Element)title.item(0);
					      vo.setJoCts(getCharacterDataFromElement(line));
					      vo.setLsNmEng(lsNm);
					      ss.add(vo);
			      }
		return new ResponseEntity<ArrayList<jsonlegalinfo>>(ss,HttpStatus.OK);
	}
	//법률정보 가져온 데이터 가공하기
	public static String getCharacterDataFromElement(Element e) {

	    NodeList list = e.getChildNodes();
	    String data;

	    for(int index = 0; index < list.getLength(); index++){
	        if(list.item(index) instanceof CharacterData){
	            CharacterData child = (CharacterData) list.item(index);
	            data = child.getData();

	            if(data != null && data.trim().length() > 0)
	                return child.getData();
	        }
	    }
	    return "";
	}
	
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
	// 동욱이 메소드 종료
	
	// 재영 시작 ///////////////////////////////////////////////////////////
	
	// 부동산 댓글 출력 호출
	@RequestMapping(value="realestateCommentsJson", method = RequestMethod.GET)
	public ResponseEntity<List<RealestateCommentsVO>> realestateCommentsJson(HttpServletRequest req, Model model) throws Exception{
		logger.info("realestateCommentsJson - GET 호출");
		List<RealestateCommentsVO> list = service.realestateGetCommentsList(req,model); //댓글 리스트 가져오기
		return new ResponseEntity<>(list,HttpStatus.OK);
		
	}
	
	// 부동산 댓글 등록 호출
	@Secured({"ROLE_USER","ROLE_ADMIN"}) 
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
	@Secured({"ROLE_USER","ROLE_ADMIN"}) 
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
	
	// ------------- 민석 --------------------------
	//헤더 알람 갯수 카운트
	@RequestMapping(value="alarmCnt", method = RequestMethod.GET)
	ResponseEntity<Integer> alarmCnt(HttpServletRequest req ){
		logger.info("alarmCnt 호출");
		Integer alarmServiceCnt = service.alarmServiceCnt(req); 
		return new ResponseEntity<Integer>(alarmServiceCnt,HttpStatus.OK);
	}

	//채팅글뿌리기
	@RequestMapping(value="chatting", method = RequestMethod.GET)
	ResponseEntity<List<ChattingVO>> chatting(HttpServletRequest req, Model model){
		logger.info("chatting 호출");
		List<ChattingVO> chatting = service.chatting(req, model);
		return new ResponseEntity<List<ChattingVO>>(chatting,HttpStatus.OK);
	}

	// 채팅 글쓰기
	@RequestMapping(value="chattingContent", method = RequestMethod.POST)
	ResponseEntity<Integer> chattingContent(@RequestBody ChattingVO cVO, HttpServletRequest req ) throws Exception{
		logger.info("chattingContent 호출" + cVO.getChattingContent());
		Integer chattingWrite = service.chattingWrite(cVO, req);
		return new ResponseEntity<Integer>(chattingWrite,HttpStatus.OK);
	}
	
	// 세계 채팅글뿌리기
	@RequestMapping(value="chattingAll", method = RequestMethod.GET)
	ResponseEntity<List<ChattingAllVO>> chattingAll(HttpServletRequest req, Model model){
		logger.info("chattingAll 호출...");
		List<ChattingAllVO> chattingAll = service.chattingAll(req, model);
		return new ResponseEntity<List<ChattingAllVO>>(chattingAll,HttpStatus.OK);
	}

	// 세계 채팅 글쓰기
	@RequestMapping(value="chattingAllContent", method = RequestMethod.POST)
	ResponseEntity<Integer> chattingAllContent(@RequestBody ChattingAllVO caVO, HttpServletRequest req ) throws Exception{
		logger.info("chattingAllContent 호출" + caVO.getChattingAllContent());
		Integer chattingWriteAll = service.chattingWriteAll(caVO, req);
		return new ResponseEntity<Integer>(chattingWriteAll,HttpStatus.OK);
	}
	//--------------- 민석 종료 ---------------------------------


	
	//----------------진호 시작-----------------------------------------------------------
	
	// 댓글 추가
	@RequestMapping(value="oCommentInsert", method = RequestMethod.POST)
	public void oCommentInsert(@RequestBody oCommentVO dto, HttpServletRequest req, Model model) throws Exception{
		logger.info("댓글 추가 호출중");
		
		System.out.println("ajax stress" + dto.toString());
		service.oCommentCreate(dto);
	}
	
	// 댓글리스트 출력
	@RequestMapping(value="list_json", method = RequestMethod.GET)
	public ResponseEntity<List<oCommentVO>> list_json(HttpServletRequest req, Model model) throws Exception{
		logger.info("댓글리스트 호출중");
		
		List<oCommentVO> list = service.getoCommentList(req,model); //댓글 리스트 가져오기
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	// 수정할 댓글 조회
	@RequestMapping(value="readOneComment", method = RequestMethod.GET)
	public ModelAndView readOneComment(HttpServletRequest req) throws Exception {
		logger.info("수정할 댓글 조회");
	 
		oCommentVO vo = service.readOneComment(req); 
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/onedayclass/oCommentModifyForm"); // 뷰의 이름
	    mv.addObject("vo", vo); // 뷰로 보낼 데이터 값

		return mv;
	}
	
	//댓글 수정처리
	@RequestMapping(value="updateComment", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateComment(@RequestBody oCommentVO vo) throws Exception {
		logger.info("댓글 수정중");
		logger.info("dddddd" + vo.toString());
		
		int result = service.updateComment(vo);
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	// 댓글 삭제
/*	@RequestMapping(value="deleteComment", method = RequestMethod.POST)
	public String deleteComment(oCommentVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("댓글 삭제중");
	 
		service.deleteComment(vo);
		rttr.addAttribute("oCommentNumber", vo.getoCommentNumber());
		return "redirect:/board/onedayclass/onedayclassDetailForm";
	}*/

	// 댓글 삭제
/*	@RequestMapping(value="deleteComment", method = RequestMethod.POST)
	public String deleteComment(oCommentVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("댓글 삭제중");
	 
		service.deleteComment(vo);
		rttr.addAttribute("oCommentNumber", vo.getoCommentNumber());
		return "redirect:/board/onedayclass/onedayclassDetailForm";
	}*/

	//----------------진호 끝----------------------------------------------------------
	
}
