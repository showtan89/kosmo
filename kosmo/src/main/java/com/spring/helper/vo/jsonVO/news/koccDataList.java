package com.spring.helper.vo.jsonVO.news;

public class koccDataList {
	private String LANGCODE;
	private int IDX;
	private String LINK;
	private String SYNC_IDX;
	private String IMAGEURL;
	private String SNS_NAME;
	private String IMAGENAME_convertED;
	private String CTRCODE;
	
	public koccDataList() {}
	
	public String getLANGCODE() {
		return LANGCODE;
	}
	public void setLANGCODE(String lANGCODE) {
		LANGCODE = lANGCODE;
	}
	public int getIDX() {
		return IDX;
	}
	public void setIDX(int iDX) {
		IDX = iDX;
	}
	public String getLINK() {
		return LINK;
	}
	public void setLINK(String lINK) {
		LINK = lINK;
	}
	public String getSYNC_IDX() {
		return SYNC_IDX;
	}
	public void setSYNC_IDX(String sYNC_IDX) {
		SYNC_IDX = sYNC_IDX;
	}
	public String getIMAGEURL() {
		return IMAGEURL;
	}
	public void setIMAGEURL(String iMAGEURL) {
		IMAGEURL = iMAGEURL;
	}
	public String getSNS_NAME() {
		return SNS_NAME;
	}
	public void setSNS_NAME(String sNS_NAME) {
		SNS_NAME = sNS_NAME;
	}
	public String getIMAGENAME_convertED() {
		return IMAGENAME_convertED;
	}
	public void setIMAGENAME_convertED(String iMAGENAME_convertED) {
		IMAGENAME_convertED = iMAGENAME_convertED;
	}
	public String getCTRCODE() {
		return CTRCODE;
	}
	public void setCTRCODE(String cTRCODE) {
		CTRCODE = cTRCODE;
	}
	@Override
	public String toString() {
		return "koccDataList [LANGCODE=" + LANGCODE + ", IDX=" + IDX + ", LINK=" + LINK + ", SYNC_IDX=" + SYNC_IDX
				+ ", IMAGEURL=" + IMAGEURL + ", SNS_NAME=" + SNS_NAME + ", IMAGENAME_convertED=" + IMAGENAME_convertED
				+ ", CTRCODE=" + CTRCODE + "]";
	}
	public koccDataList(String lANGCODE, int iDX, String lINK, String sYNC_IDX, String iMAGEURL, String sNS_NAME,
			String iMAGENAME_convertED, String cTRCODE) {
		super();
		LANGCODE = lANGCODE;
		IDX = iDX;
		LINK = lINK;
		SYNC_IDX = sYNC_IDX;
		IMAGEURL = iMAGEURL;
		SNS_NAME = sNS_NAME;
		IMAGENAME_convertED = iMAGENAME_convertED;
		CTRCODE = cTRCODE;
	}
	
	
	
}
