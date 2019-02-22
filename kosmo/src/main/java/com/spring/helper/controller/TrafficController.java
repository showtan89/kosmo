package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.helper.service.BoardService;
import com.spring.helper.vo.BoardVO.oCommentVO;

//import com.spring.helper.service.InfoService;

@Controller
public class TrafficController {

	@Autowired
	BoardService service;

	private static final Logger logger = LoggerFactory.getLogger(TrafficController.class);
	
	// 동욱 시작
	@RequestMapping("getDirections")
	public String getDirections(HttpServletRequest req,Model model) {
		logger.info("getDirections 로딩 중.....");
		return "traffic/getDirections";
	}

	@RequestMapping("popStartAddress")
	public String test2(HttpServletRequest req,Model model) {
		logger.info("test 로딩 중.....");
		return "traffic/popStartAddress";
	}
	@RequestMapping("popEndAddress")
	public String test3(HttpServletRequest req,Model model) {
		logger.info("test 로딩 중.....");
		return "traffic/popEndAddress";
	}
	
	// 동욱 종료
	
	// 재영 시작
	@RequestMapping(value="findDirectionHospital", method = RequestMethod.POST)
	public ModelAndView findDirectionHospital(HttpServletRequest req) throws Exception {
		logger.info("findDirectionHospital 로딩 중.....");
		ModelAndView mv = new ModelAndView();
		String startPoint = "";
		startPoint = req.getParameter("startPoint");
		String endPoint = "";
		endPoint = req.getParameter("endPoint");
		mv.setViewName("traffic/getDirections"); 
	    mv.addObject("startPoint", startPoint); 
	    mv.addObject("endPoint", endPoint); 
	    System.out.println(startPoint+"/"+endPoint);
		return mv;
	}
	
	@RequestMapping(value="findDirectionTour", method = RequestMethod.POST)
	public ModelAndView findDirectionTour(HttpServletRequest req) throws Exception {
		logger.info("findDirectionTour 로딩 중.....");
		ModelAndView mv = new ModelAndView();
		String endLat = "";
		endLat = req.getParameter("endLat");
		String endLng = "";
		endLng = req.getParameter("endLng");
		String name = "";
		name = req.getParameter("name");
		mv.setViewName("traffic/getDirections"); 
	    mv.addObject("endLat", endLat); 
	    mv.addObject("endLng", endLng); 
	    mv.addObject("name", name); 
	    System.out.println(name+"/"+endLat+"/"+endLng);
		return mv;
	}
	
	// 재영 끝
	
	// 다문화 외국인 취업정보 게시판
	@RequestMapping("getAddresspop")
	public String ehfhaudwnth(HttpServletRequest req, Model model) throws Exception {
		logger.info("getAddresspop 로딩 중///");

		return "traffic/getAddresspop";
	}
	@RequestMapping("getAddresspop2")
	public String getAddresspop2(HttpServletRequest req, Model model) throws Exception {
		logger.info("getAddresspop2 로딩 중///");

		return "traffic/getDirections";
	}
	
	
	// 대호 시작 ==================================================================
		
		
		
		
		@RequestMapping("restaurantlocation")
		public String restaurantlocation() {
			return "traffic/restaurantlocation";
		}
		
		// 대호 종료 ==================================================================
}
