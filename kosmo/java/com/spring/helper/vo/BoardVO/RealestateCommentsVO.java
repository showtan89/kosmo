package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class RealestateCommentsVO {

	private int realestateNumber;	//	NUMBER(12,0)
	private String boardCode;		//	VARCHAR2(120 BYTE)
	private String memberId;		//	VARCHAR2(120 BYTE)
	private String memberEmail;		//	VARCHAR2(120 BYTE)
	private int memberNumber;
	private int rCommentNumber;		//	NUMBER(12,0)
	private String memberCountry;
	private String  rCommentContent; //	VARCHAR2(120 BYTE)
	private String rcommentRegdate;	//DATE
	private String rCommentTemp1;	 //	VARCHAR2(120 BYTE)
	private String rCommentTemp2;	 //	VARCHAR2(120 BYTE)
	private int rCommentTemp3;	 //	NUMBER(12,0)
	
	public RealestateCommentsVO() {
		
	}
	
	public String getMemberCountry() {
		return memberCountry;
	}

	public void setMemberCountry(String memberCountry) {
		this.memberCountry = memberCountry;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public void setRcommentRegdate(String rcommentRegdate) {
		this.rcommentRegdate = rcommentRegdate;
	}

	public int getRealestateNumber() {
		return realestateNumber;
	}
	public void setRealestateNumber(int realestateNumber) {
		this.realestateNumber = realestateNumber;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getrCommentNumber() {
		return rCommentNumber;
	}
	public void setrCommentNumber(int rCommentNumber) {
		this.rCommentNumber = rCommentNumber;
	}
	public String getrCommentContent() {
		return rCommentContent;
	}
	public void setrCommentContent(String rCommentContent) {
		this.rCommentContent = rCommentContent;
	}
	public String getRcommentRegdate() {
		return rcommentRegdate;
	}
	public void setRcommentRegdate(Timestamp rcommentRegdate) {
		this.rcommentRegdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rcommentRegdate);
	}
	public String getrCommentTemp1() {
		return rCommentTemp1;
	}
	public void setrCommentTemp1(String rCommentTemp1) {
		this.rCommentTemp1 = rCommentTemp1;
	}
	public String getrCommentTemp2() {
		return rCommentTemp2;
	}
	public void setrCommentTemp2(String rCommentTemp2) {
		this.rCommentTemp2 = rCommentTemp2;
	}
	public int getrCommentTemp3() {
		return rCommentTemp3;
	}
	public void setrCommentTemp3(int rCommentTemp3) {
		this.rCommentTemp3 = rCommentTemp3;
	}

	@Override
	public String toString() {
		return "RealestateCommentsVO [realestateNumber=" + realestateNumber + ", boardCode=" + boardCode + ", memberId="
				+ memberId + ", memberEmail=" + memberEmail + ", memberNumber=" + memberNumber + ", rCommentNumber="
				+ rCommentNumber + ", memberCountry=" + memberCountry + ", rCommentContent=" + rCommentContent
				+ ", rcommentRegdate=" + rcommentRegdate + ", rCommentTemp1=" + rCommentTemp1 + ", rCommentTemp2="
				+ rCommentTemp2 + ", rCommentTemp3=" + rCommentTemp3 + "]";
	}

}
