package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class MessageAlarmVO {

	private int messagenumber;
	private int membernumber;
	private String boardcode;
	private String memberemail;
	private String memberid;
	private String membercountry;
	private String messagesubject;
	private String messagecontent;
	private int messagealarm;
	private Timestamp messageregdate;
	private String messagetemp1;
	private String messagetemp2;
	private int messagetemp3;
	public int getMessagenumber() {
		return messagenumber;
	}
	public void setMessagenumber(int messagenumber) {
		this.messagenumber = messagenumber;
	}
	public int getMembernumber() {
		return membernumber;
	}
	public void setMembernumber(int membernumber) {
		this.membernumber = membernumber;
	}
	public String getBoardcode() {
		return boardcode;
	}
	public void setBoardcode(String boardcode) {
		this.boardcode = boardcode;
	}
	public String getMemberemail() {
		return memberemail;
	}
	public void setMemberemail(String memberemail) {
		this.memberemail = memberemail;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMembercountry() {
		return membercountry;
	}
	public void setMembercountry(String membercountry) {
		this.membercountry = membercountry;
	}
	public String getMessagesubject() {
		return messagesubject;
	}
	public void setMessagesubject(String messagesubject) {
		this.messagesubject = messagesubject;
	}
	public String getMessagecontent() {
		return messagecontent;
	}
	public void setMessagecontent(String messagecontent) {
		this.messagecontent = messagecontent;
	}
	public int getMessagealarm() {
		return messagealarm;
	}
	public void setMessagealarm(int messagealarm) {
		this.messagealarm = messagealarm;
	}
	public Timestamp getMessageregdate() {
		return messageregdate;
	}
	public void setMessageregdate(Timestamp messageregdate) {
		this.messageregdate = messageregdate;
	}
	public String getMessagetemp1() {
		return messagetemp1;
	}
	public void setMessagetemp1(String messagetemp1) {
		this.messagetemp1 = messagetemp1;
	}
	public String getMessagetemp2() {
		return messagetemp2;
	}
	public void setMessagetemp2(String messagetemp2) {
		this.messagetemp2 = messagetemp2;
	}
	public int getMessagetemp3() {
		return messagetemp3;
	}
	public void setMessagetemp3(int messagetemp3) {
		this.messagetemp3 = messagetemp3;
	}
	
	
	
}
