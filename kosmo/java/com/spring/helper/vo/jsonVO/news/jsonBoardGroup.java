package com.spring.helper.vo.jsonVO.news;

public class jsonBoardGroup {

	private String MENUCODE;
	private String MENUNAME;
	
	public jsonBoardGroup() {}
	
	public String getMENUCODE() {
		return MENUCODE;
	}
	
	public void setMENUCODE(String mENUCODE) {
		MENUCODE = mENUCODE;
	}
	
	public String getMENUNAME() {
		return MENUNAME;
	}
	
	public void setMENUNAME(String mENUNAME) {
		MENUNAME = mENUNAME;
	}
	
	public jsonBoardGroup(String mENUCODE, String mENUNAME) {
		super();
		MENUCODE = mENUCODE;
		MENUNAME = mENUNAME;
	}
	
	@Override
	public String toString() {
		return "JsonBoardGroup [MENUCODE=" + MENUCODE + ", MENUNAME=" + MENUNAME + "]";
	}
}
