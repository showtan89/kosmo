package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.spring.helper.service.InfoService;

@Controller
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	//재영 InfoController 시작 ====================================================================================
	
	//날씨 정보
	@RequestMapping("weather")
	public String weather() throws Exception {
		logger.info("weather 로딩 중....");
		return "info/weather/weather";
	}
	
	//관광 정보
	@RequestMapping("travelBoard")
	public String travelBoard(HttpServletRequest req, Model model) throws Exception {
		logger.info("travelBoard 로딩 중....");
		return "info/travel/travelBoardList";
	}
	
	//병원 정보
	@RequestMapping("emergency")
	public String emergency(HttpServletRequest req,Model model) throws Exception {
		logger.info("emergency 로딩 중..");
		//service.emergency(req, model); json 형식 제공으로 변경 - 재영
		return "info/emergency/emergency";
	}
	//소식 게시판 입장 -- 안해....  corsFilter.class  /////   web.xml의 cors 필터 //// pom.xml의 json simple  //// jsonVO.class
	/*@RequestMapping("newsBoard")
	public String newsBoard(HttpServletRequest req, Model model) throws Exception {
		logger.info("newsBoard 로딩 중....");
		return "info/news/newsBoardList";
	}*/

	//소식 게시판 결과 얻기

	//재영 InfoController 끝 ====================================================================================


	// 민석이시작++++++++++++++++++++++++++++++
	
	// 외국인 취업정보 게시판

	// 다문화 외국인 취업정보 게시판
	/*@RequestMapping("employment")
	public String employment(HttpServletRequest req, Model model) throws Exception {
		logger.info("다문화 고용 페이지....");

		return "info/multicultural/employment";
	}
	// 외국인 고용현황
	@RequestMapping("employeInfo")
	public String employeInfo(HttpServletRequest req, Model model) throws Exception {
		// 죽은 페이지
		
		logger.info("다문화 고용 정보 페이지....");
		
		ProcessBuilder pb = new ProcessBuilder("python", "C:/DEV_43/employe.py", "ppppp");
		Process p = pb.start(); // 프로세스 호출

		// 프로세스의 실행결과를 스트림으로 리턴함
		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));

		String line ="";

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
		
		
		return "info/multicultural/employeInfo";
	}
	// 민석이 끝++++++++++++++++++++++++++++++++
	
	@RequestMapping("multicultural")
	public String multicultural() throws Exception {
		logger.info("multicultural....");

		return "info/multicultural/multicultural";
	}*/
}
