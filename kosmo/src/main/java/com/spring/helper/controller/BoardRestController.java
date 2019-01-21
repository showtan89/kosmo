package com.spring.helper.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.helper.vo.BoardVO.RealestateVO;

@RestController
public class BoardRestController {

	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	 
	//pom.xml에 json 변환기(jackson-databind(*필수), jackson-mapper-asl) 추가.
	//주소값(JSP)이 아닌 값을 넘길때 @ResponseBody를 추가한다.  -------< RestController를 사용하면 생략(스프링4이상 지원)
	/*@RequestMapping("/realestateList")
	public RealestateVO realestateList() throws Exception{
		logger.info("realestateList 로딩 중....");
		return new RealestateVO(); 
	}*/
	
	
}
