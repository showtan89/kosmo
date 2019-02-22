package com.spring.helper.vo.BoardVO;

public class reservationVO {

	private int	reservationNumber;			// 원데이클래스 댓글 번호(PK)
	private String boardCode;				// 게시판별코드
	private int reservatedPersonNumber;		// 예약자 회원번호
	private String reservationEmail;		// 이메일
	private String reservationId;			// 예약자 아이디
	private String memberId;				// 아이디
	private String oCommentTemp1;			// 댓글컬럼1
	private int	onedayclassNumber;			// 원데이클래스 번호(FK)
	
	public reservationVO() {}

	@Override
	public String toString() {
		return "reservationVO [reservationNumber=" + reservationNumber + ", boardCode=" + boardCode
				+ ", reservatedPersonNumber=" + reservatedPersonNumber + ", reservationEmail=" + reservationEmail
				+ ", reservationId=" + reservationId + ", memberId=" + memberId + ", oCommentTemp1=" + oCommentTemp1
				+ ", onedayclassNumber=" + onedayclassNumber + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

	public int getReservationNumber() {
		return reservationNumber;
	}

	public void setReservationNumber(int reservationNumber) {
		this.reservationNumber = reservationNumber;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public int getReservatedPersonNumber() {
		return reservatedPersonNumber;
	}

	public void setReservatedPersonNumber(int reservatedPersonNumber) {
		this.reservatedPersonNumber = reservatedPersonNumber;
	}

	public String getReservationEmail() {
		return reservationEmail;
	}

	public void setReservationEmail(String reservationEmail) {
		this.reservationEmail = reservationEmail;
	}

	public String getReservationId() {
		return reservationId;
	}

	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getoCommentTemp1() {
		return oCommentTemp1;
	}

	public void setoCommentTemp1(String oCommentTemp1) {
		this.oCommentTemp1 = oCommentTemp1;
	}

	public int getOnedayclassNumber() {
		return onedayclassNumber;
	}

	public void setOnedayclassNumber(int onedayclassNumber) {
		this.onedayclassNumber = onedayclassNumber;
	}


	
	
}
