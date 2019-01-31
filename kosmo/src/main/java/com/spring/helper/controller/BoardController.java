package com.spring.helper.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.spring.helper.service.BoardService;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService service;
	
	@RequestMapping("test")
	public String test() throws Exception {
		logger.info("test 로딩 중....");
		return "test";
	}
	
	@RequestMapping("imagesupload")
	public String imagesupload(MultipartHttpServletRequest req, Model model) throws Exception {
		service.test(req,model);
		logger.info("test 로딩 중....");
		return "test";
	}
	
	// 동욱이 메소드 시작
	@RequestMapping("qjqfbfxptmxm")
	public String knowledgeBoaradList(HttpServletRequest req, Model model) throws Exception{
		
		BufferedReader br = null;
        //DocumentBuilderFactory 생성
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        DocumentBuilder builder;
        Document doc = null;
		
		        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1270000/lawedu/lawqna"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=GdoR86lqZXehbYz0fIJrJjrCLQq9UHQg9pk2RA8UgEhtJI8vJ45t8O%2B8p6N3QaDDUUkB1kUa1Ra%2BwQnLK%2FcHuQ%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("GdoR86lqZXehbYz0fIJrJjrCLQq9UHQg9pk2RA8UgEhtJI8vJ45t8O%2B8p6N3QaDDUUkB1kUa1Ra%2BwQnLK%2FcHuQ%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String result ="";
		        String line;
		        while ((line = rd.readLine()) != null) {
		            result = result + line.trim();

		        }
		        
		        InputSource is = new InputSource(new StringReader(result));
	            builder = factory.newDocumentBuilder();
	            doc = builder.parse(is);
	            XPathFactory xpathFactory = XPathFactory.newInstance();
	            XPath xpath = xpathFactory.newXPath();
	            // XPathExpression expr = xpath.compile("/response/body/items/item");
	            XPathExpression expr = xpath.compile("//items/item");
	            NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
	            for (int i = 0; i < nodeList.getLength(); i++) {
	                NodeList child = nodeList.item(i).getChildNodes();
	                for (int j = 0; j < child.getLength(); j++) {
	                    Node node = child.item(j);
	                    System.out.println("현재 노드 이름 : " + node.getNodeName());
	                    System.out.println("현재 노드 타입 : " + node.getNodeType());
	                    System.out.println("현재 노드 값 : " + node.getTextContent());
	                    System.out.println("현재 노드 네임스페이스 : " + node.getPrefix());
	                    System.out.println("현재 노드의 다음 노드 : " + node.getNextSibling());
	                    System.out.println("");
	                }
	            }
		        
		return "";
	}
	// 지식인 게시판 지식인게시판 리스트 출력
	@RequestMapping("knowledgeBoardList")
	public String knowledgeBoardList(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeBoardList 로딩 중....");
		return "board/knowledge/knowledgeBoardList";
	}
	// 지식인 게시판 질문등록 폼 이동
	@Secured({"ROLE_USER","ROLE_ADMIN"}) 
	@RequestMapping("knowledgeWriteForm")
	public String knowledgeWriteForm() throws Exception {
		logger.info("knowledgeWriteForm 로딩 중....");
		return "board/knowledge/knowledgeWriteForm";
	}
	// 지식인 게시판 질문등록 처리
	@RequestMapping("knowledgeWritePro")
	public String knowledgeWritePro(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeWritePro 로딩 중....");
		service.knowledgeInsertArticle(req, model);
		return "board/knowledge/knowledgePro";
	}
	// 지식인 게시판 질문수정 폼 이동
	@RequestMapping("knowledgeModifyForm")
	public String knowledgeModifyForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeModifyForm 로딩 중....");
		service.knowledgeModifyForm(req, model);
		return "board/knowledge/knowledgeModifyForm";
	}
	// 지식인 게시판 질문수정 처리
	@RequestMapping("knowledgeModifyPro")
	public String knowledgeModifyPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeModifyPro 로딩 중....");
		service.knowledgeModifyPro(req, model);
		return "board/knowledge/knowledgePro";
	}
	// 지식인 게시판 질문삭제 처리
	@RequestMapping("knowledgeDeleteForm")
	public String knowledgeDeleteForm(HttpServletRequest req, Model model) throws Exception{
		logger.info("knowledgeDeleteForm 로딩 중....");
		service.knowledgeDeleteForm(req, model);
		System.out.println("실행");
		return "board/knowledge/knowledgePro";
	}
	// 지식인 게시판 게시글 클릭시 글 상세페이지 출력
	@RequestMapping("knowledgeDetailForm")
	public String knowledgeDetailForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeDetailForm 로딩 중....");
		service.knowledgeDetailForm(req, model);
		service.knowledgeCommentList(req,model);
		service.knowledgeAddReadCnt(req,model);
		return "board/knowledge/knowledgeDetailForm";
	}
	@Secured({"ROLE_USER","ROLE_ADMIN"}) 
	// 지식인 게시판 답변등록 처리
	@RequestMapping("knowledgeCommentPro")
	public String knowledgeCommentPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeCommentPro 로딩 중....");
		service.knowledgeCommentPro(req, model);
		return "board/knowledge/knowledgePro";
	}
	// 지식인 게시판 답변수정 처리
	@RequestMapping("kCommentModifyUpdate")
	public String kCommentModifyUpdate(HttpServletRequest req, Model model) throws Exception {
		logger.info("kCommentModifyUpdate 로딩 중....");
		service.kCommentModifyUpdate(req, model);
		return "board/knowledge/knowledgePro";
	}
	// 지식인 게시판 답변삭제 처리
	@RequestMapping("kCommentdelete")
	public String kCommentdelete(HttpServletRequest req, Model model) throws Exception {
		logger.info("kCommentdelete 로딩 중....");
		service.kCommentdelete(req, model);
		return "board/knowledge/knowledgePro";
	}
	// 지식인 게시판 채택 처리
	@RequestMapping("knowledgeSelectComent")
	public String knowledgeSelectComent(HttpServletRequest req, Model model) throws Exception {
		logger.info("knowledgeSelectComent 로딩 중....");
		service.knowledgeSelectComent(req, model);
		return "board/knowledge/knowledgePro";
	}
	// 동욱이 메소드 종료


	//재영 BoardController 시작 ====================================================================================

	//부동산 게시판 글 목록 페이지로 이동
	@RequestMapping("realestateBoardList")
	public String realestateBoardList(HttpServletRequest req, Model model) throws Exception {
		logger.info("realestateBoardList 로딩 중....");
		service.realestateGetArticleList(req, model);
		return "board/realestate/realestateBoardList";
	}

	//부동산 게시판 글 상세 페이지로 이동
	@RequestMapping("realestateDetailForm")
	public String realestateDetailForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("realestateDetailForm 로딩 중....");
		service.realestateGetArticle(req, model);
		return "board/realestate/realestateDetailForm";
	}

	//부동산 게시판 글쓰기 페이지로 이동
	@Secured({"ROLE_ADMIN","ROLE_USER"})
	@RequestMapping("realestateWriteForm")
	public String realestateWriteForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("realestateWriteForm 로딩 중....");
		if(req.getParameter("loginPage")!=null) {
			model.addAttribute("loginPage",req.getParameter("loginPage"));
		}
		return "board/realestate/realestateWriteForm";
	}
	
	//부동산 게시판 글쓰기 실행
	@RequestMapping("realestateDeletePro")
	public void realestateDeletePro(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		logger.info("realestateDeletePro 로딩 중....");
		Integer deleteResult = service.realestateDeleteArticle(req);
		res.sendRedirect("realestateBoardList?deleteResult="+deleteResult);
	}
	
	//부동산 게시판 글쓰기 실행
	@RequestMapping("realestateWritePro")
	public void realestateWritePro(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		logger.info("realestateWritePro 로딩 중....");
		Integer realestateInsertArticle = service.realestateInsertArticle(req, model);
		res.sendRedirect("realestateBoardList?insertResult="+realestateInsertArticle);
	}
	
	//부동산 게시판 글 수정 페이지로 이동
	@RequestMapping("realestateModifyForm")
	public String realestateModifyForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("realestateModifyForm 로딩 중....");
		service.realestateGetArticle(req, model);
		return "board/realestate/realestateModifyForm";
	}
	
	//부동산 게시판 글 수정 실행
	@RequestMapping("realestateModifyPro")
	public void realestateModifyPro(HttpServletRequest req, Model model,HttpServletResponse res) throws Exception {
		logger.info("realestateModifyPro 로딩 중....");
		Integer modifyResult = service.realestateModifyUpdate(req, model);
		String realestateNumber = req.getParameter("realestateNumber");
		res.sendRedirect("realestateDetailForm?modifyResult="+modifyResult+"&realestateNumber="+realestateNumber);
	}
	
	//부동산 게시판 게시글 생성기
	@RequestMapping("realestateDummyMaker")
	public String realestateDummyMaker(HttpServletRequest req, Model model) throws Exception {
		logger.info("realestateDummyMaker 로딩 중....");
		service.realestateDummyMaker(req, model);
		return "board/realestate/realestate";
	}
	
	//재영 BoardController 끝 ====================================================================================

	//진호 BoardController 시작----------------------------------------------------
	// 원데이 리스트 출력
	@RequestMapping("onedayclassBoardList")
	public String onedayclassBoardList(HttpServletRequest req, Model model) throws Exception {
		logger.info("원데이 클래스 게시판 리스트 호출중....");
		
		service.onedayclassBoardList(req, model);
		return "board/onedayclass/onedayclassBoardList";
	}
	
	// 원데이 상세페이지
	@RequestMapping("onedayclassDetailForm")
	public String onedayclassDetailForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("원데이 클래스 게시판 상세페이지 호출중 ....");
		
		service.onedayclassDetailForm(req, model);
		return "board/onedayclass/onedayclassDetailForm";
	}
	
	
	// 수정 상세 페이지
	@RequestMapping("onedayclassModifyForm")
	public String onedayclassModifyForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("원데이 클래스 수정 상세페이지 호출중 ....");
		
		service.onedayclassModifyForm(req, model);
		return "board/onedayclass/onedayclassModifyForm";
	}
	
	// 수정 처리
	@RequestMapping("onedayclassModifyPro")
	public String onedayclassModifyPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("원데이 클래스 수정 처리 호출중 ....");
	
		service.onedayclassModifyPro(req, model);
		return "board/onedayclass/onedayclassModifyPro";
	}
	
	// 글쓰기 페이지
	@RequestMapping("onedayclassWriteForm")
	public String onedayclassWriteForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("원데이 클래스 글쓰기 호출중 ....");
		
		service.onedayclassWriteForm(req, model);
		return "board/onedayclass/onedayclassWriteForm";
	}
	
	// 글쓰기 처리페이지
	@RequestMapping("onedayclassWritePro")
	public String onedayclassWritePro(HttpServletRequest req, Model model) throws Exception {
		logger.info("원데이 클래스 글처리 호출중 ....");
		
		service.onedayclassWritePro(req, model);
		return "board/onedayclass/onedayclassWritePro";
	}
	
	// 글 삭제 처리
	@RequestMapping("onedayclassDeletePro")
	public String onedayclassDeletePro(HttpServletRequest req, Model model) throws Exception {
		logger.info("원데이 클래스 삭제처리 호출중 ....");
		
		service.onedayclassDeletePro(req, model);
		return "board/onedayclass/onedayclassDeletePro";
	}
	
	// 클래스개설 권한 신청 폼
	@RequestMapping("onedayclassAuthorityForm")
	public String onedayclassAuthorityForm(HttpServletRequest req, Model model) throws Exception {
		logger.info("원데이 클래스 권한신청폼 호출중 ....");
		
		return "board/onedayclass/onedayclassAuthorityForm";
		
	}
	
	// 클래스개설 권한 신청 처리페이지
/*	@RequestMapping("onedayclassAuthorityPro")
	public String onedayclassAuthorityPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("원데이 클래스 권한신청처리페이지 호출중 ....");
		
		service.onedayclassAuthorityPro(req, model);
		return "board/onedayclass/onedayclassAuthorityPro";
	}*/
	
	
	// 진호  BoardController 끝----------------------------------------------------
	
	

}
