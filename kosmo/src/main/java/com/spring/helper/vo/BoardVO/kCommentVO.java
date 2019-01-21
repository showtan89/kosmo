package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class kCommentVO {
	 private int kCommentNumber ; // 댓글번호(PK)
	 private int knowledgeNumber ; // 지식번호(FK)
	 private String boardCode ; // 게시판별코드
	 private String memberEmail ; // 이메일
	 private String memberId ; // 아이디
	 private String kCommentContent ; // 댓글내용
	 private String kCommentSelection ; // 댓글채택
	 private Timestamp kCommentRegdate ; // 댓글발생일
	 private String kCommentTemp1 ; //  댓글작성자 공개여부
	 private String kCommentTemp2 ; // 댓글컬럼2
	 private int kCommentTemp3 ; // 댓글컬럼3
	 
	 
	 
	public int getkCommentNumber() {
		return kCommentNumber;
	}
	public void setkCommentNumber(int kCommentNumber) {
		this.kCommentNumber = kCommentNumber;
	}
	public int getKnowledgeNumber() {
		return knowledgeNumber;
	}
	public void setKnowledgeNumber(int knowledgeNumber) {
		this.knowledgeNumber = knowledgeNumber;
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
	public String getkCommentContent() {
		return kCommentContent;
	}
	public void setkCommentContent(String kCommentContent) {
		this.kCommentContent = kCommentContent;
	}
	public String getkCommentSelection() {
		return kCommentSelection;
	}
	public void setkCommentSelection(String kCommentSelection) {
		this.kCommentSelection = kCommentSelection;
	}
	public Timestamp getkCommentRegdate() {
		return kCommentRegdate;
	}
	public void setkCommentRegdate(Timestamp kCommentRegdate) {
		this.kCommentRegdate = kCommentRegdate;
	}
	public String getkCommentTemp1() {
		return kCommentTemp1;
	}
	public void setkCommentTemp1(String kCommentTemp1) {
		this.kCommentTemp1 = kCommentTemp1;
	}
	public String getkCommentTemp2() {
		return kCommentTemp2;
	}
	public void setkCommentTemp2(String kCommentTemp2) {
		this.kCommentTemp2 = kCommentTemp2;
	}
	public int getkCommentTemp3() {
		return kCommentTemp3;
	}
	public void setkCommentTemp3(int kCommentTemp3) {
		this.kCommentTemp3 = kCommentTemp3;
	}
	 
}
