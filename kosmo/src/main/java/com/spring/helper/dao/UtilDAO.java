package com.spring.helper.dao;

import java.util.List;
import java.util.Map;

import com.spring.helper.vo.jsonVO.weather.EarthQuakeVO;

public interface UtilDAO {

	public void imageSearchPro();
	
	public int earthQuakeDupCheck(int eqNum);
	
	public int insertEarthQuake(EarthQuakeVO eVO);
	
	public EarthQuakeVO selectEarthQuake(int tmSeq);
	
	public EarthQuakeVO selectEarthQuake();
	
	public List<Map<String,String>> getUserList();
	
	public void msgSequenceChange(int sqlString);
	
	public void earthQuakeAlarmSend(List<Map<String,String>> list);
}
