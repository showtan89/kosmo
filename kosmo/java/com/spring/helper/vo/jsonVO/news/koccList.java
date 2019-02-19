package com.spring.helper.vo.jsonVO.news;

public class koccList {

	private String NAT_CD;
	private int IDX; 
	private String ESTYEAR;
	private String TEL;
	private String CATECODE;
	private String ADDRESS;
	private String CTRNAME;
	private String CATENAME;
	private String CTRCODE;
	private String URL;
	private String FAX;
	private String NAT_NM;
	
	public koccList() {}
	
	public String getNAT_CD() {
		return NAT_CD;
	}
	public void setNAT_CD(String nAT_CD) {
		NAT_CD = nAT_CD;
	}
	public int getIDX() {
		return IDX;
	}
	public void setIDX(int iDX) {
		IDX = iDX;
	}
	public String getESTYEAR() {
		return ESTYEAR;
	}
	public void setESTYEAR(String eSTYEAR) {
		ESTYEAR = eSTYEAR;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public String getCATECODE() {
		return CATECODE;
	}
	public void setCATECODE(String cATECODE) {
		CATECODE = cATECODE;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getCTRNAME() {
		return CTRNAME;
	}
	public void setCTRNAME(String cTRNAME) {
		CTRNAME = cTRNAME;
	}
	public String getCATENAME() {
		return CATENAME;
	}
	public void setCATENAME(String cATENAME) {
		CATENAME = cATENAME;
	}
	public String getCTRCODE() {
		return CTRCODE;
	}
	public void setCTRCODE(String cTRCODE) {
		CTRCODE = cTRCODE;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	public String getFAX() {
		return FAX;
	}
	public void setFAX(String fAX) {
		FAX = fAX;
	}
	public String getNAT_NM() {
		return NAT_NM;
	}
	public void setNAT_NM(String nAT_NM) {
		NAT_NM = nAT_NM;
	}
	public koccList(String nAT_CD, int iDX, String eSTYEAR, String tEL, String cATECODE, String aDDRESS, String cTRNAME,
			String cATENAME, String cTRCODE, String uRL, String fAX, String nAT_NM) {
		super();
		NAT_CD = nAT_CD;
		IDX = iDX;
		ESTYEAR = eSTYEAR;
		TEL = tEL;
		CATECODE = cATECODE;
		ADDRESS = aDDRESS;
		CTRNAME = cTRNAME;
		CATENAME = cATENAME;
		CTRCODE = cTRCODE;
		URL = uRL;
		FAX = fAX;
		NAT_NM = nAT_NM;
	}
	@Override
	public String toString() {
		return "KoccList [NAT_CD=" + NAT_CD + ", IDX=" + IDX + ", ESTYEAR=" + ESTYEAR + ", TEL=" + TEL + ", CATECODE="
				+ CATECODE + ", ADDRESS=" + ADDRESS + ", CTRNAME=" + CTRNAME + ", CATENAME=" + CATENAME + ", CTRCODE="
				+ CTRCODE + ", URL=" + URL + ", FAX=" + FAX + ", NAT_NM=" + NAT_NM + "]";
	}
	
	
	
}
