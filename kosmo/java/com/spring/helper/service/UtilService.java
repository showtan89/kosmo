package com.spring.helper.service;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.helper.vo.jsonVO.weather.EarthQuakeVO;

public interface UtilService {

	//재영 서비스 시작

	public Map<String,Object> imageSearchLocalPro(MultipartHttpServletRequest req) throws Exception;
	
	public Map<String,Object> imageSearchURLPro(MultipartHttpServletRequest req) throws Exception;
	
	public EarthQuakeVO earthQuakeView(HttpServletRequest req) throws Exception;
	//재영 서비스 끝

}