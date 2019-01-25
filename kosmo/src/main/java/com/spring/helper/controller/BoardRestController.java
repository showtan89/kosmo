package com.spring.helper.controller;

import java.util.List;

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

import com.spring.helper.service.BoardService;
import com.spring.helper.vo.BoardVO.RealestateCommentsVO;

@RestController
public class BoardRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	
	@Autowired
	BoardService service;
	
	// 부동산 댓글 출력 호출
	@RequestMapping(value="realestateCommentsJson", method = RequestMethod.GET)
	public ResponseEntity<List<RealestateCommentsVO>> realestateCommentsJson(HttpServletRequest req, Model model) throws Exception{
		logger.info("realestateCommentsJson - GET 호출");
		List<RealestateCommentsVO> list = service.realestateGetCommentsList(req,model);
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	// 부동산 댓글 등록 호출
	@RequestMapping(value="realestateCommentsJson", method = RequestMethod.POST)
	public ResponseEntity<String> realestateCommentsWrite(@RequestBody RealestateCommentsVO cVO, HttpServletRequest req, Model model) throws Exception{
		logger.info("realestateCommentsJson - POST 호출");
		Integer realestateInsertArticle = service.realestateCommentPro(cVO, req);
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
		Integer realestateDeleteArticle = service.realestateCommentsDelete(commentNumber);
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
}
