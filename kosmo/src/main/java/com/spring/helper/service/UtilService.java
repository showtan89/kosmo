package com.spring.helper.service;

import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface UtilService {

	//재영 서비스 시작
	
	public Map<String,Object> imageSearchPro(MultipartHttpServletRequest req, Model model) throws Exception ;
	
	//재영 서비스 끝
	
}
