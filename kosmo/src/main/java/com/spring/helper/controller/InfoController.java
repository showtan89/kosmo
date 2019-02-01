package com.spring.helper.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//import com.spring.helper.service.InfoService;

@Controller
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	//재영 InfoController 시작 ====================================================================================

	//소식 게시판 입장 -- 안해....  corsFilter.class  /////   web.xml의 cors 필터 //// pom.xml의 json simple  //// jsonVO.class
	@RequestMapping("newsBoard")
	public String newsBoard(HttpServletRequest req, Model model) throws Exception {
		logger.info("newsBoard 로딩 중....");
		//방법1
		/*System.setProperty("http.maxRedirects", "1");
		BufferedReader br = null;
        try{            
            String urlstr = "http://www.kocis.go.kr/json/kocc.do?langCode=lang001&&searchType=&page=1&pageSize=20&ctrcode=CTR0013";
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
        }catch(Exception e){
        	logger.info(e.getMessage());
        }*/
		//////////////////////////////////////////////////////////////////////////////////////////////
		
		//방법2
		/*String tempUrl = "http://www.kocis.go.kr/json/kocc.do?langCode=lang001&&searchType=&page=1&pageSize=20&ctrcode=CTR0013";
		
		URI jsonUrl = new URI(tempUrl);
        ObjectMapper mapper = new ObjectMapper();
        newsJson newsJson = mapper.readValue(jsonUrl, newsJson.class);
		
		System.setProperty("http.maxRedirects", "1");
		StringBuilder urlBuilder = new StringBuilder("http://www.kocis.go.kr/json/kocc.do?langCode=lang001&&searchType=&page=1&pageSize=20&ctrcode=CTR0013");
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setDoOutput(true); 
		conn.setReadTimeout(6000); 
		conn.setConnectTimeout(5000); 
		res.setHeader("Access-Control-Allow-Origin", req.getHeader("Origin"));
	    res.setHeader("Access-Control-Allow-Credentials", "true");
	    res.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
	    res.setHeader("Access-Control-Max-Age", "3600");
	    res.setHeader("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With, remember-me");
		
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());*/
		return "info/news/newsBoardList";
	}

	//소식 게시판 결과 얻기

	//재영 InfoController 끝 ====================================================================================


	// 민석이시작++++++++++++++++++++++++++++++
	
	// 외국인 취업정보 게시판

	// 다문화 외국인 취업정보 게시판
	@RequestMapping("employment")
	public String employment(HttpServletRequest req, Model model) throws Exception {
		logger.info("다문화 고용 페이지....");

		return "info/multicultural/employment";
	}
	// 외국인 고용현황
	@RequestMapping("employeInfo")
	public String employeInfo(HttpServletRequest req, Model model) throws Exception {
		logger.info("다문화 고용 정보 페이지....");
		/*
		ProcessBuilder pb = new ProcessBuilder("python", "C:/DEV_43/employe.py", "gg");
		Process p = pb.start(); // 프로세스 호출

		// 프로세스의 실행결과를 스트림으로 리턴함
		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));

		String line ="";
		while((line = br.readLine()) != null) {
					System.out.println(line);//출력
					req.setAttribute("line", line);
				}

		// 방법2.
		StringBuilder sb = new StringBuilder();
		while((line = br.readLine()) != null) {
			sb.append(line + "\n"); //출력
			System.out.println(sb.toString());
			req.setAttribute("pb", pb);
			req.setAttribute("sb", sb);
			req.setAttribute("line", line);
			
			req.setAttribute("p", p);
		}
		System.out.println(sb.toString());
		br.close();
		*/
		
		return "info/multicultural/employeInfo";
	}
	// 민석이 끝++++++++++++++++++++++++++++++++
}
