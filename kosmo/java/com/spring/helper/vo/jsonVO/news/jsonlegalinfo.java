package com.spring.helper.vo.jsonVO.news;

import java.util.Arrays;

public class jsonlegalinfo {
	private String LawListHangul; // 법 목록 리스트 한글이름
	private String LawListEnglish;// 법 목록 리스트 영문 이름
	private String Lawlistlink;  // 법 목록 영문 링크
	private String Department;
	private String Classification;
	private String TypeofAct;
	private String Fearnumber;
	private String Feardate;
	private String EffectiveDate;

	
	private String Legalname;
	private String lsNmEng; // 법 상세제목 이름
	private String joCts; // 법 조
	
	
	
	@Override
	public String toString() {
		return "jsonlegalinfo [LawListHangul=" + LawListHangul + ", LawListEnglish=" + LawListEnglish + ", Lawlistlink="
				+ Lawlistlink + ", Legalname=" + Legalname + ", Department=" + Department + ", Classification="
				+ Classification + ", TypeofAct=" + TypeofAct + ", Fearnumber=" + Fearnumber + ", Feardate=" + Feardate
				+ ", EffectiveDate=" + EffectiveDate + ", lsNmEng=" + lsNmEng + ", joCts=" + joCts + "]";
	}
	public String getLegalname() {
		return Legalname;
	}
	public void setLegalname(String legalname) {
		Legalname = legalname;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public String getClassification() {
		return Classification;
	}
	public void setClassification(String classification) {
		Classification = classification;
	}
	public String getTypeofAct() {
		return TypeofAct;
	}
	public void setTypeofAct(String typeofAct) {
		TypeofAct = typeofAct;
	}
	public String getFearnumber() {
		return Fearnumber;
	}
	public void setFearnumber(String fearnumber) {
		Fearnumber = fearnumber;
	}
	public String getFeardate() {
		return Feardate;
	}
	public void setFeardate(String feardate) {
		Feardate = feardate;
	}
	public String getEffectiveDate() {
		return EffectiveDate;
	}
	public void setEffectiveDate(String effectiveDate) {
		EffectiveDate = effectiveDate;
	}
	public String getLawListHangul() {
		return LawListHangul;
	}
	public void setLawListHangul(String lawListHangul) {
		LawListHangul = lawListHangul;
	}
	public String getLawListEnglish() {
		return LawListEnglish;
	}
	public void setLawListEnglish(String lawListEnglish) {
		LawListEnglish = lawListEnglish;
	}
	public String getLawlistlink() {
		return Lawlistlink;
	}
	public void setLawlistlink(String lawlistlink) {
		Lawlistlink = lawlistlink;
	}
	public String getLsNmEng() {
		return lsNmEng;
	}
	public void setLsNmEng(String lsNmEng) {
		this.lsNmEng = lsNmEng;
	}
	public String getJoCts() {
		return joCts;
	}
	public void setJoCts(String joCts) {
		this.joCts = joCts;
	}
	
	
	
	
	
	

}
