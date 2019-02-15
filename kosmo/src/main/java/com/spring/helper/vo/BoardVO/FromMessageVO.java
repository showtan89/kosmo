package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class FromMessageVO {
	private String fMemberEmail;
	private String fMessageFromid;
	private String fMessageSendid;
	private int fMessageNumber;
	private String fMessageContent;
	private Timestamp fMessageRegdate;
	private int fMessageAlarm;
	private int fMessageTemp1;
	private String fMessageTemp2;
	private String fMessageTemp3;
	
	public String getfMemberEmail() {
		return fMemberEmail;
	}
	public void setfMemberEmail(String fMemberEmail) {
		this.fMemberEmail = fMemberEmail;
	}
	public String getfMessageFromid() {
		return fMessageFromid;
	}
	public void setfMessageFromid(String fMessageFromid) {
		this.fMessageFromid = fMessageFromid;
	}
	public String getfMessageSendid() {
		return fMessageSendid;
	}
	public void setfMessageSendid(String fMessageSendid) {
		this.fMessageSendid = fMessageSendid;
	}
	public int getfMessageNumber() {
		return fMessageNumber;
	}
	public void setfMessageNumber(int fMessageNumber) {
		this.fMessageNumber = fMessageNumber;
	}
	public String getfMessageContent() {
		return fMessageContent;
	}
	public void setfMessageContent(String fMessageContent) {
		this.fMessageContent = fMessageContent;
	}
	public Timestamp getfMessageRegdate() {
		return fMessageRegdate;
	}
	public void setfMessageRegdate(Timestamp fMessageRegdate) {
		this.fMessageRegdate = fMessageRegdate;
	}
	public int getfMessageAlarm() {
		return fMessageAlarm;
	}
	public void setfMessageAlarm(int fMessageAlarm) {
		this.fMessageAlarm = fMessageAlarm;
	}
	public int getfMessageTemp1() {
		return fMessageTemp1;
	}
	public void setfMessageTemp1(int fMessageTemp1) {
		this.fMessageTemp1 = fMessageTemp1;
	}
	public String getfMessageTemp2() {
		return fMessageTemp2;
	}
	public void setfMessageTemp2(String fMessageTemp2) {
		this.fMessageTemp2 = fMessageTemp2;
	}
	public String getfMessageTemp3() {
		return fMessageTemp3;
	}
	public void setfMessageTemp3(String fMessageTemp3) {
		this.fMessageTemp3 = fMessageTemp3;
	}
	@Override
	public String toString() {
		return "FmessageVO [fMemberEmail=" + fMemberEmail + ", fMessageFromid=" + fMessageFromid + ", fMessageSendid="
				+ fMessageSendid + ", fMessageNumber=" + fMessageNumber + ", fMessageContent=" + fMessageContent
				+ ", fMessageRegdate=" + fMessageRegdate + ", fMessageAlarm=" + fMessageAlarm + ", fMessageTemp1="
				+ fMessageTemp1 + ", fMessageTemp2=" + fMessageTemp2 + ", fMessageTemp3=" + fMessageTemp3 + "]";
	}

}
