package com.spring.helper.dao;

import com.spring.helper.vo.jsonVO.weather.EarthQuakeVO;

public interface UtilDAO {

	public void imageSearchPro();
	
	public int earthQuakeDupCheck(int eqNum);
	
	public int insertEarthQuake(EarthQuakeVO eVO);
	
	public EarthQuakeVO selectEarthQuake(int tmSeq);
	
	public EarthQuakeVO selectEarthQuake();
}
