package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class ChattingAlarmVO {

	private int chattingnumber;
	private int membernumber;
	private String boardcode;
	private String memberemail;
	private String memberid;
	private String membercountry;
	private String chattingsubject;
	private String chattingcontent;
	private int chattingalarm;
	private Timestamp chattingregdate;
	private String chattingtemp1;
	private String chattingtemp2;
	private int chattingtemp3;
	public int getChattingnumber() {
		return chattingnumber;
	}
	public void setChattingnumber(int chattingnumber) {
		this.chattingnumber = chattingnumber;
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
	public String getChattingsubject() {
		return chattingsubject;
	}
	public void setChattingsubject(String chattingsubject) {
		this.chattingsubject = chattingsubject;
	}
	public String getChattingcontent() {
		return chattingcontent;
	}
	public void setChattingcontent(String chattingcontent) {
		this.chattingcontent = chattingcontent;
	}
	public int getChattingalarm() {
		return chattingalarm;
	}
	public void setChattingalarm(int chattingalarm) {
		this.chattingalarm = chattingalarm;
	}
	public Timestamp getChattingregdate() {
		return chattingregdate;
	}
	public void setChattingregdate(Timestamp chattingregdate) {
		this.chattingregdate = chattingregdate;
	}
	public String getChattingtemp1() {
		return chattingtemp1;
	}
	public void setChattingtemp1(String chattingtemp1) {
		this.chattingtemp1 = chattingtemp1;
	}
	public String getChattingtemp2() {
		return chattingtemp2;
	}
	public void setChattingtemp2(String chattingtemp2) {
		this.chattingtemp2 = chattingtemp2;
	}
	public int getChattingtemp3() {
		return chattingtemp3;
	}
	public void setChattingtemp3(int chattingtemp3) {
		this.chattingtemp3 = chattingtemp3;
	}
	
}
