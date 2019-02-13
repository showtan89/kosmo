package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class oCommentVO {

	private int	oCommentNumber;				// 원데이클래스 댓글 번호(PK)
	private int	onedayclassNumber;			// 원데이클래스 번호(FK)
	private String boardCode;				// 게시판별코드
	private String memberEmail;				// 이메일
	private String memberId;				// 아이디
	private String oCommentContent;			// 댓글내용
	private Timestamp oCommentRegdate;   // 댓글발생일
	private String oCommentTemp1;			// 댓글컬럼1
	private String oCommentTemp2;			// 댓글컬럼2
	private int oCommentTemp3;				// 댓글컬럼3
	
	public oCommentVO() {}
	
	@Override
	public String toString() {
		return "oCommentVO [oCommentNumber=" + oCommentNumber + ", onedayclassNumber=" + onedayclassNumber
				+ ", boardCode=" + boardCode + ", memberEmail=" + memberEmail + ", memberId=" + memberId
				+ ", oCommentContent=" + oCommentContent + ", onedayclassRegdate=" + oCommentRegdate
				+ ", oCommentTemp1=" + oCommentTemp1 + ", oCommentTemp2=" + oCommentTemp2 + ", oCommentTemp3="
				+ oCommentTemp3 + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	public int getoCommentNumber() {
		return oCommentNumber;
	}

	public void setoCommentNumber(int oCommentNumber) {
		this.oCommentNumber = oCommentNumber;
	}

	public int getOnedayclassNumber() {
		return onedayclassNumber;
	}

	public void setOnedayclassNumber(int onedayclassNumber) {
		this.onedayclassNumber = onedayclassNumber;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getoCommentContent() {
		return oCommentContent;
	}

	public void setoCommentContent(String oCommentContent) {
		this.oCommentContent = oCommentContent;
	}

	public Timestamp getoCommentRegdate() {
		return oCommentRegdate;
	}

	public void setoCommentRegdate(Timestamp oCommentRegdate) {
		this.oCommentRegdate = oCommentRegdate;
	}

	public String getoCommentTemp1() {
		return oCommentTemp1;
	}

	public void setoCommentTemp1(String oCommentTemp1) {
		this.oCommentTemp1 = oCommentTemp1;
	}

	public String getoCommentTemp2() {
		return oCommentTemp2;
	}

	public void setoCommentTemp2(String oCommentTemp2) {
		this.oCommentTemp2 = oCommentTemp2;
	}

	public int getoCommentTemp3() {
		return oCommentTemp3;
	}

	public void setoCommentTemp3(int oCommentTemp3) {
		this.oCommentTemp3 = oCommentTemp3;
	}
	
	
	
}
