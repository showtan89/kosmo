package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class CommentAlarmVO {
	
	private int commentnumber;
	private int membernumber;
	private String boardcode;
	private String memberemail;
	private String memberid;
	private int commentoriginalnumber;
	private int commentcommentnumber;
	private String commentsubject;
	private String messagecountry;
	private int commentalarm;
	private Timestamp commentregdate;
	private String messagetemp1;
	private String messagetemp2;
	private int messagetemp3;
	public int getCommentnumber() {
		return commentnumber;
	}
	public void setCommentnumber(int commentnumber) {
		this.commentnumber = commentnumber;
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
	public int getCommentoriginalnumber() {
		return commentoriginalnumber;
	}
	public void setCommentoriginalnumber(int commentoriginalnumber) {
		this.commentoriginalnumber = commentoriginalnumber;
	}
	public int getCommentcommentnumber() {
		return commentcommentnumber;
	}
	public void setCommentcommentnumber(int commentcommentnumber) {
		this.commentcommentnumber = commentcommentnumber;
	}
	public String getCommentsubject() {
		return commentsubject;
	}
	public void setCommentsubject(String commentsubject) {
		this.commentsubject = commentsubject;
	}
	public String getMessagecountry() {
		return messagecountry;
	}
	public void setMessagecountry(String messagecountry) {
		this.messagecountry = messagecountry;
	}
	public int getCommentalarm() {
		return commentalarm;
	}
	public void setCommentalarm(int commentalarm) {
		this.commentalarm = commentalarm;
	}
	public Timestamp getCommentregdate() {
		return commentregdate;
	}
	public void setCommentregdate(Timestamp commentregdate) {
		this.commentregdate = commentregdate;
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
