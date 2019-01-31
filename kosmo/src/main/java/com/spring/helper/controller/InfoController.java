package com.spring.helper.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

//import com.spring.helper.service.InfoService;

@Controller
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	//재영 InfoController 시작 ====================================================================================

	//부동산 게시판 글쓰기 실행
	@RequestMapping("newsBoard")
	public String newsBoard(HttpServletRequest req, Model model) throws Exception {
		logger.info("newsBoard 로딩 중....");
		//Integer realestateInsertArticle = service.realestateInsertArticle(req, model);
		return "info/news/newsBoardList";
	}

	//재영 InfoController 끝 ====================================================================================


	// 민석이시작++++++++++++++++++++++++++++++
	
	// 외국인 취업정보 게시판
	@RequestMapping("employment")
	public String employment(HttpServletRequest req, Model model) throws Exception {
		logger.info("다문화 고용 페이지....");

		return "info/multicultural/employment";
	}
	// 외국인 고용현황
	@RequestMapping("employeInfo")
	public String employeInfo(HttpServletRequest req, Model model) throws Exception {
		logger.info("다문화 고용 정보 페이지....");
		
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
		
		
		return "info/multicultural/employeInfo";
	}
	// 민석이 끝++++++++++++++++++++++++++++++++
}
