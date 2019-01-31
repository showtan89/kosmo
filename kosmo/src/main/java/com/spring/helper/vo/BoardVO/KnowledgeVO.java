package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class KnowledgeVO {
	private int knowledgeNumber; 		// PK지식인게시판번호 NOT NULL
	private String  memberNumber;   		// FK회원번호 NOT NULL
	private String boardCode;       		// 지식인 게시판 판별코드 NOT NULL
	private String memberEmail;     		// 이메일 NOT NULL   
	private String memberId;        		// 아이디 NOT NULL
	private String knowledgeSubject;		// 게시판 제목  NOT NULL   
	private String knowledgeContent;  		// 게시판 내용 NOT NULL
	private String knowledgeOpenCheck;      // 게시판 공개여부 NOT NULL
	private int knowledgeReward;            // 게시판 보상포인트 NULL
	private String knowledgeCategory;       // 지식인 게시판 카테고리 NOT NULL
	private int knowledgeLookup;            // 조회수  NULL
	private String knowledgeRegdate;     // 작성일 NOT NULL
	private String knowledgeReply;          // 답글  NULL
	private String knowledgeTemp1;          // 예비컬럼 1 NULL
	private String knowledgeTemp2;          // 예비컬럼 2 NULL
	private int knowledgeTemp3;             // 예비컬럼 3 NULL
	public int getKnowledgeNumber() {
		return knowledgeNumber;
	}
	public void setKnowledgeNumber(int knowledgeNumber) {
		this.knowledgeNumber = knowledgeNumber;
	}
	public String getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(String memberNumber) {
		this.memberNumber = memberNumber;
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
	public String getKnowledgeSubject() {
		return knowledgeSubject;
	}
	public void setKnowledgeSubject(String knowledgeSubject) {
		this.knowledgeSubject = knowledgeSubject;
	}
	public String getKnowledgeContent() {
		return knowledgeContent;
	}
	public void setKnowledgeContent(String knowledgeContent) {
		this.knowledgeContent = knowledgeContent;
	}
	public String getKnowledgeOpenCheck() {
		return knowledgeOpenCheck;
	}
	public void setKnowledgeOpenCheck(String knowledgeOpenCheck) {
		this.knowledgeOpenCheck = knowledgeOpenCheck;
	}
	public int getKnowledgeReward() {
		return knowledgeReward;
	}
	public void setKnowledgeReward(int knowledgeReward) {
		this.knowledgeReward = knowledgeReward;
	}
	public String getKnowledgeCategory() {
		return knowledgeCategory;
	}
	public void setKnowledgeCategory(String knowledgeCategory) {
		this.knowledgeCategory = knowledgeCategory;
	}
	public int getKnowledgeLookup() {
		return knowledgeLookup;
	}
	public void setKnowledgeLookup(int knowledgeLookup) {
		this.knowledgeLookup = knowledgeLookup;
	}
	public String getKnowledgeRegdate() {
		return knowledgeRegdate;
	}
	public void setKnowledgeRegdate(Timestamp knowledgeRegdate) {
		   Date today = new Date();
		 String date = new SimpleDateFormat("yyyy-MM-dd").format(today);
		 String time = new SimpleDateFormat("HH:mm:ss").format(today);
		 String test = new SimpleDateFormat("yyyy-MM-dd").format(knowledgeRegdate);
		 String test2 = new SimpleDateFormat("HH:mm:ss").format(knowledgeRegdate);
			String to1 = time.substring(0,2);
			String to2 = time.substring(3,5);
			String to3 = time.substring(6);
			
			String te1 = test2.substring(0,2);
			String te2 = test2.substring(3,5);
			String te3 = test2.substring(6); 
			System.out.println(to1+" "+to2+" "+to3);
			System.out.println(te1+" "+te2+" "+te3);
		if(test.equals(date)) {
			if(to1.equals(te1)) {
				System.out.println("2");
				if(to2.equals(te2)) {
					int c = Integer.parseInt(to3);
					int d = Integer.parseInt(te3);
					int sub = c-d;
					test = "방금";
				} else {
					int c = Integer.parseInt(to2);
					int d = Integer.parseInt(te2);
					int sub = c-d;
					test = String.valueOf(sub)+" 분 전";
				}
			} else {
				int c = Integer.parseInt(to1);
				int d = Integer.parseInt(te1);
				int sub = c-d;
				test = String.valueOf(sub)+" 시간 전";
			}
		} else {
			test = new SimpleDateFormat("yyyy-MM-dd").format(knowledgeRegdate);
		}
		 
		this.knowledgeRegdate = test;
	}
	public String getKnowledgeReply() {
		return knowledgeReply;
	}
	public void setKnowledgeReply(String knowledgeReply) {
		this.knowledgeReply = knowledgeReply;
	}
	public String getKnowledgeTemp1() {
		return knowledgeTemp1;
	}
	public void setKnowledgeTemp1(String knowledgeTemp1) {
		this.knowledgeTemp1 = knowledgeTemp1;
	}
	public String getKnowledgeTemp2() {
		return knowledgeTemp2;
	}
	public void setKnowledgeTemp2(String knowledgeTemp2) {
		this.knowledgeTemp2 = knowledgeTemp2;
	}
	public int getKnowledgeTemp3() {
		return knowledgeTemp3;
	}
	public void setKnowledgeTemp3(int knowledgeTemp3) {
		this.knowledgeTemp3 = knowledgeTemp3;
	}
	
}
