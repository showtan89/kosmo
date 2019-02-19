package com.spring.helper.vo.BoardVO;

public class HospitalVO {
	
	private String hosName;
	private String hosAddress;
	private String hosKind;
	private String hosPhone;
	private double hosLocX;
	private double hosLocY;
	private int hosNum;
	public String getHosName() {
		return hosName;
	}
	public void setHosName(String hosName) {
		this.hosName = hosName;
	}
	public String getHosAddress() {
		return hosAddress;
	}
	public void setHosAddress(String hosAddress) {
		this.hosAddress = hosAddress;
	}
	public String getHosKind() {
		return hosKind;
	}
	public void setHosKind(String hosKind) {
		this.hosKind = hosKind;
	}
	public String getHosPhone() {
		return hosPhone;
	}
	public void setHosPhone(String hosPhone) {
		this.hosPhone = hosPhone;
	}
	public double getHosLocX() {
		return hosLocX;
	}
	public void setHosLocX(double hosLocX) {
		this.hosLocX = hosLocX;
	}
	public double getHosLocY() {
		return hosLocY;
	}
	public void setHosLocY(double hosLocY) {
		this.hosLocY = hosLocY;
	}
	public int getHosNum() {
		return hosNum;
	}
	public void setHosNum(int hosNum) {
		this.hosNum = hosNum;
	}
	
	@Override
	public String toString() {
		return "HospitalVO [hosName=" + hosName + ", hosAddress=" + hosAddress + ", hosKind=" + hosKind + ", hosPhone="
				+ hosPhone + ", hosLocX=" + hosLocX + ", hosLocY=" + hosLocY + ", hosNum=" + hosNum + "]";
	}
	
	

}
