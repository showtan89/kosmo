package com.spring.helper.vo.BoardVO;

import java.sql.Date;
import java.sql.Timestamp;

public class onedayclassVO {

	private int	onedayclassNumber;				// 원데이클래스 번호(PK)
	private int	memberNumber;					// 회원번호(FK)
	private String boardCode;					// 게시판별코드
	private String memberEmail;					// 이메일
	private String memberId;					// 아이디
	private String onedayclassSubject;			// 원데이클래스 제목
	private String onedayclassContent;			// 원데이클래스 내용
	private int	onedayclassLookup;				// 조회수
	private Timestamp onedayclassRegdate;		// 작성일
	private String onedayclassAccountNumber;    // 원데이클래스 계좌번호
	private String onedayclassCategory;			// 원데이클래스 종류
	private Timestamp onedayclassOpendate;		// 원데이클래스 행사일
	private String onedayclassLocation;			// 원데이클래스 위치
	private int onedayclassRecruitment;		// 원데이클래스 모집인원
	private int	onedayclassPrice;				// 원데이클래스 금액
	private String onedayclassReservation;		// 원데이클래스 예약
	private String onedayclassPay;				// 원데이클래스 결제
	private int onedayclassEndCheck;			// 원데이클래스 종료여부
	private String onedayclassDeadlineCheck;	// 원데이클래스 마감여부
	private int	onedayclassGrade;				// 원데이클래스 평점
	private int	onedayclassTotalpeople;			// 원데이클래스 누적인원
	private String onedayclassImg1;				// 원데이클래스 사진1
	private String onedayclassImg2;				// 원데이클래스 사진2
	private String onedayclassImg3;				// 원데이클래스 사진3
	private String onedayclassTemp1;			// 원데이클래스 컬럼1
	private String onedayclassTemp2;			// 원데이클래스 컬럼2
	private int onedayclassTemp3;				// 원데이클래스 컬럼3
	
	@Override
	public String toString() {
		return "onedayclassVO [onedayclassNumber=" + onedayclassNumber + ", memberNumber=" + memberNumber
				+ ", boardCode=" + boardCode + ", memberEmail=" + memberEmail + ", memberId=" + memberId
				+ ", onedayclassSubject=" + onedayclassSubject + ", onedayclassContent=" + onedayclassContent
				+ ", onedayclassLookup=" + onedayclassLookup + ", onedayclassRegdate=" + onedayclassRegdate
				+ ", onedayclassAccountNumber=" + onedayclassAccountNumber + ", onedayclassCategory="
				+ onedayclassCategory + ", onedayclassOpendate=" + onedayclassOpendate + ", onedayclassLocation="
				+ onedayclassLocation + ", onedayclassRecruitment=" + onedayclassRecruitment + ", onedayclassPrice="
				+ onedayclassPrice + ", onedayclassReservation=" + onedayclassReservation + ", onedayclassPay="
				+ onedayclassPay + ", onedayclassEndCheck=" + onedayclassEndCheck + ", onedayclassDeadlineCheck="
				+ onedayclassDeadlineCheck + ", onedayclassGrade=" + onedayclassGrade + ", onedayclassTotalpeople="
				+ onedayclassTotalpeople + ", onedayclassImg1=" + onedayclassImg1 + ", onedayclassImg2="
				+ onedayclassImg2 + ", onedayclassImg3=" + onedayclassImg3 + ", onedayclassTemp1=" + onedayclassTemp1
				+ ", onedayclassTemp2=" + onedayclassTemp2 + ", onedayclassTemp3=" + onedayclassTemp3 + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public int getOnedayclassNumber() {
		return onedayclassNumber;
	}

	public void setOnedayclassNumber(int onedayclassNumber) {
		this.onedayclassNumber = onedayclassNumber;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
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

	public String getOnedayclassSubject() {
		return onedayclassSubject;
	}

	public void setOnedayclassSubject(String onedayclassSubject) {
		this.onedayclassSubject = onedayclassSubject;
	}

	public String getOnedayclassContent() {
		return onedayclassContent;
	}

	public void setOnedayclassContent(String onedayclassContent) {
		this.onedayclassContent = onedayclassContent;
	}

	public int getOnedayclassLookup() {
		return onedayclassLookup;
	}

	public void setOnedayclassLookup(int onedayclassLookup) {
		this.onedayclassLookup = onedayclassLookup;
	}

	public Timestamp getOnedayclassRegdate() {
		return onedayclassRegdate;
	}

	public void setOnedayclassRegdate(Timestamp onedayclassRegdate) {
		this.onedayclassRegdate = onedayclassRegdate;
	}

	public String getOnedayclassAccountNumber() {
		return onedayclassAccountNumber;
	}

	public void setOnedayclassAccountNumber(String onedayclassAccountNumber) {
		this.onedayclassAccountNumber = onedayclassAccountNumber;
	}

	public String getOnedayclassCategory() {
		return onedayclassCategory;
	}

	public void setOnedayclassCategory(String onedayclassCategory) {
		this.onedayclassCategory = onedayclassCategory;
	}

	public Timestamp getOnedayclassOpendate() {
		return onedayclassOpendate;
	}

	public void setOnedayclassOpendate(Timestamp onedayclassOpendate) {
		this.onedayclassOpendate = onedayclassOpendate;
	}

	public String getOnedayclassLocation() {
		return onedayclassLocation;
	}

	public void setOnedayclassLocation(String onedayclassLocation) {
		this.onedayclassLocation = onedayclassLocation;
	}

	public int getOnedayclassRecruitment() {
		return onedayclassRecruitment;
	}

	public void setOnedayclassRecruitment(int onedayclassRecruitment) {
		this.onedayclassRecruitment = onedayclassRecruitment;
	}

	public int getOnedayclassPrice() {
		return onedayclassPrice;
	}

	public void setOnedayclassPrice(int onedayclassPrice) {
		this.onedayclassPrice = onedayclassPrice;
	}

	public String getOnedayclassReservation() {
		return onedayclassReservation;
	}

	public void setOnedayclassReservation(String onedayclassReservation) {
		this.onedayclassReservation = onedayclassReservation;
	}

	public String getOnedayclassPay() {
		return onedayclassPay;
	}

	public void setOnedayclassPay(String onedayclassPay) {
		this.onedayclassPay = onedayclassPay;
	}

	public int getOnedayclassEndCheck() {
		return onedayclassEndCheck;
	}

	public void setOnedayclassEndCheck(int onedayclassEndCheck) {
		this.onedayclassEndCheck = onedayclassEndCheck;
	}

	public String getOnedayclassDeadlineCheck() {
		return onedayclassDeadlineCheck;
	}

	public void setOnedayclassDeadlineCheck(String onedayclassDeadlineCheck) {
		this.onedayclassDeadlineCheck = onedayclassDeadlineCheck;
	}

	public int getOnedayclassGrade() {
		return onedayclassGrade;
	}

	public void setOnedayclassGrade(int onedayclassGrade) {
		this.onedayclassGrade = onedayclassGrade;
	}

	public int getOnedayclassTotalpeople() {
		return onedayclassTotalpeople;
	}

	public void setOnedayclassTotalpeople(int onedayclassTotalpeople) {
		this.onedayclassTotalpeople = onedayclassTotalpeople;
	}

	public String getOnedayclassImg1() {
		return onedayclassImg1;
	}

	public void setOnedayclassImg1(String onedayclassImg1) {
		this.onedayclassImg1 = onedayclassImg1;
	}

	public String getOnedayclassImg2() {
		return onedayclassImg2;
	}

	public void setOnedayclassImg2(String onedayclassImg2) {
		this.onedayclassImg2 = onedayclassImg2;
	}

	public String getOnedayclassImg3() {
		return onedayclassImg3;
	}

	public void setOnedayclassImg3(String onedayclassImg3) {
		this.onedayclassImg3 = onedayclassImg3;
	}

	public String getOnedayclassTemp1() {
		return onedayclassTemp1;
	}

	public void setOnedayclassTemp1(String onedayclassTemp1) {
		this.onedayclassTemp1 = onedayclassTemp1;
	}

	public String getOnedayclassTemp2() {
		return onedayclassTemp2;
	}

	public void setOnedayclassTemp2(String onedayclassTemp2) {
		this.onedayclassTemp2 = onedayclassTemp2;
	}

	public int getOnedayclassTemp3() {
		return onedayclassTemp3;
	}

	public void setOnedayclassTemp3(int onedayclassTemp3) {
		this.onedayclassTemp3 = onedayclassTemp3;
	}

	
	

	
	
}
