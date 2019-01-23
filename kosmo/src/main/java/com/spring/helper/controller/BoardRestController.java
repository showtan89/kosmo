package com.spring.helper.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.helper.service.BoardService;
import com.spring.helper.vo.BoardVO.RealestateVO;

@RestController
public class BoardRestController {

	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	
	@Autowired
	BoardService service;
	
	//@RequestMapping("realestateListJson")
	/*public List<RealestateVO> realestateListJson(HttpServletRequest req, Model model) throws Exception{
		logger.info("realestateListJson 호출");
		List<RealestateVO> list = service.realestateListJson(req, model);
		return list;
	}*/
	
}
