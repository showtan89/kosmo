package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class ChattingVO {

    private int chattingNumber;
    private String chattingMemberId;
    private String chattingContent;
    private Timestamp chattingRegdate;
    private String chattingContry;
    private int chattingTemp1;
    private String chattingTemp2;
    private String chattingTemp3;
	
    
	public String getChattingMemberId() {
		return chattingMemberId;
	}
	public void setChattingMemberId(String chattingMemberId) {
		this.chattingMemberId = chattingMemberId;
	}
	public String getChattingContent() {
		return chattingContent;
	}
	public void setChattingContent(String chattingContent) {
		this.chattingContent = chattingContent;
	}
	public Timestamp getChattingRegdate() {
		return chattingRegdate;
	}
	public void setChattingRegdate(Timestamp chattingRegdate) {
		this.chattingRegdate = chattingRegdate;
	}
	
	public int getChattingNumber() {
		return chattingNumber;
	}
	public void setChattingNumber(int chattingNumber) {
		this.chattingNumber = chattingNumber;
	}
	public String getChattingContry() {
		return chattingContry;
	}
	public void setChattingContry(String chattingContry) {
		this.chattingContry = chattingContry;
	}
	public int getChattingTemp1() {
		return chattingTemp1;
	}
	public void setChattingTemp1(int chattingTemp1) {
		this.chattingTemp1 = chattingTemp1;
	}
	public String getChattingTemp2() {
		return chattingTemp2;
	}
	public void setChattingTemp2(String chattingTemp2) {
		this.chattingTemp2 = chattingTemp2;
	}
	public String getChattingTemp3() {
		return chattingTemp3;
	}
	public void setChattingTemp3(String chattingTemp3) {
		this.chattingTemp3 = chattingTemp3;
	}
	@Override
	public String toString() {
		return "ChattingVO [chattingNumber=" + chattingNumber + ", chattingMemberId=" + chattingMemberId
				+ ", chattingContent=" + chattingContent + ", chattingRegdate=" + chattingRegdate + ", chattingCountry="
				+ chattingContry + ", chattingTemp1=" + chattingTemp1 + ", chattingTemp2=" + chattingTemp2
				+ ", chattingTemp3=" + chattingTemp3 + "]";
	}
	
	
}