package com.spring.helper.vo.BoardVO;

import java.sql.Timestamp;

public class UserVO {
	 private int memberNumber ; 	// 회원번호(PK)
	 private String memberEmail ; 	// 이메일
	 private String memberId ; 		// 아이디
	 private String password ; 		// 패스워드
	 private String memberCountry ; // 출신국
	 private Timestamp memberRegdate ; // 가입일
	 private int memberPoint ; 	// 포인트
	 private String memberRecommend ; // 추천
	 private String authority ;		 // 시큐리티권한
	 private char enabled ; 		// 사용여부
	 private String memberTemp1 ;	 // 회원컬럼1
	 private String memberTemp2 ;	 // 회원컬럼2
	 private int memberTemp3 ; 		// 회원컬럼3
	 
	 @Override
	public String toString() {
		return "UserVO [memberNumber=" + memberNumber + ", memberEmail=" + memberEmail + ", memberId=" + memberId
				+ ", password=" + password + ", memberCountry=" + memberCountry + ", memberRegdate=" + memberRegdate
				+ ", memberPoint=" + memberPoint + ", memberRecommend=" + memberRecommend + ", authority=" + authority
				+ ", enabled=" + enabled + ", memberTemp1=" + memberTemp1 + ", memberTemp2=" + memberTemp2
				+ ", memberTemp3=" + memberTemp3 + "]";
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMemberCountry() {
		return memberCountry;
	}
	public void setMemberCountry(String memberCountry) {
		this.memberCountry = memberCountry;
	}
	public Timestamp getMemberRegdate() {
		return memberRegdate;
	}
	public void setMemberRegdate(Timestamp memberRegdate) {
		this.memberRegdate = memberRegdate;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public String getMemberRecommend() {
		return memberRecommend;
	}
	public void setMemberRecommend(String memberRecommend) {
		this.memberRecommend = memberRecommend;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public char getEnabled() {
		return enabled;
	}
	public void setEnabled(char enabled) {
		this.enabled = enabled;
	}
	public String getMemberTemp1() {
		return memberTemp1;
	}
	public void setMemberTemp1(String memberTemp1) {
		this.memberTemp1 = memberTemp1;
	}
	public String getMemberTemp2() {
		return memberTemp2;
	}
	public void setMemberTemp2(String memberTemp2) {
		this.memberTemp2 = memberTemp2;
	}
	public int getMemberTemp3() {
		return memberTemp3;
	}
	public void setMemberTemp3(int memberTemp3) {
		this.memberTemp3 = memberTemp3;
	}
	 
}

