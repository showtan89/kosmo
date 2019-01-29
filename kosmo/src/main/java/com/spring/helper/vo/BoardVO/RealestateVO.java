package com.spring.helper.vo.BoardVO;

//재영 부동산 VO
public class RealestateVO {

	private int realestateNumber; 			//	NUMBER(12,0)	No 		부동산번호
	private int memberNumber; 				//	NUMBER(12,0)	No		회원번호
	private String boardCode;				//	VARCHAR2(120 BYTE)	No	게시판별코드
	private String memberEmail;				//  VARCHAR2(120 BYTE)	No	이메일
	private String memberId;				//  VARCHAR2(120 BYTE)	No	아이디
	private String realestateSubject;		//	VARCHAR2(120 BYTE)	No	부동산제목
	private String realestateContent;		//	VARCHAR2(4000 BYTE)	No	부동산내용
	private int realestatePrice;			//	NUMBER(12,0)	No		부동산금액
	private String realestateCategory1;		//	VARCHAR2(120 BYTE)	No	부동산카테고리1 - 지역권으로 사용
	private String realestateCategory2;		//	VARCHAR2(120 BYTE)	No	부동산카테고리2 - 미사용
	private int realestateDeposit;			//	NUMBER(12,0)	No		부동산보증금
	private String realestateDepositCheck;	//	VARCHAR2(120 BYTE)	No	부동산보증금여부
	private int realestateManagement;		//	NUMBER(12,0)	No		관리비
	private String realestateOptionCheck;	//	VARCHAR2(120 BYTE)	No	풀옵션여부
	private String realestateTobaccoCheck;	//	VARCHAR2(120 BYTE)	No	흡연가능여부
	private String realestateState;			//	VARCHAR2(120 BYTE)	No	해당층건물층
	private String realestateHeatingtype;	//	VARCHAR2(120 BYTE)	No	난방종류
	private String realestateBalcony;		//	VARCHAR2(120 BYTE)	No	베란다발코니유무
	private String realestatePetCheck;		//	VARCHAR2(120 BYTE)	No	애완동물가능여부
	private String realestateTerm;				//	NUMBER(12,0)	No		최소계약기간
	private String realestateMoveindate;	//	DATE	No				입주가능일
	private String realestateGender;		//	VARCHAR2(120 BYTE)	No	성별
	private String realestateRoom;			//	VARCHAR2(120 BYTE)	No	방갯수
	private String realestateToilet;		//	VARCHAR2(120 BYTE)	No	화장실갯수
	private String realestateCar;			//	VARCHAR2(120 BYTE)	No	주차가능여부
	private String realestateSize;				//	NUMBER(12,0)	No		부동산크기
	private String realestateType;			//	VARCHAR2(120 BYTE)	No	부동산형태
	private String realestateLocation;		//	VARCHAR2(120 BYTE)	No	부동산지도위치
	private String realestateFavorite;		//	VARCHAR2(120 BYTE)	Yes	찜
	private int realestateRecommend;		//	VARCHAR2(120 BYTE)	Yes	추천
	private int realestateLookup;			//	NUMBER(12,0)	Yes		조회수
	private String realestateRegdate;		//	DATE	No				작성일
	private String realestateCheckday;		//	DATE	No				확인매물날짜
	private String realestateImg1;			//	VARCHAR2(120 BYTE)	No	부동산사진1
	private String realestateImg2;			//	VARCHAR2(120 BYTE)	No	부동산사진2
	private String realestateImg3;			//	VARCHAR2(120 BYTE)	No	부동산사진3
	private String realestateTemp1;			//	VARCHAR2(120 BYTE)	Yes	부동산임시컬럼1 - 엘리베이터 여부로 사용
	private String realestateTemp2;			//	VARCHAR2(120 BYTE)	Yes	부동산임시컬럼2
	private int realestateTemp3;			//	NUMBER(12,0)	Yes		부동산임시컬럼3
	
	//DB에는 없지만 검색 용으로 사용
	private int realestatePriceEnd;  //검색 조건의 가격 끝
	private int realestateStart;	//게시글 시작 번호 
	private int realestateEnd;		//게시글 끝번호 
	
	public RealestateVO() {
		
	}
	
	public RealestateVO(int realestateNumber, int memberNumber, String boardCode, String memberEmail, String memberId,
			String realestateSubject, String realestateContent, int realestatePrice, String realestateCategory1,
			String realestateCategory2, int realestateDeposit, String realestateDepositCheck, int realestateManagement,
			String realestateOptionCheck, String realestateTobaccoCheck, String realestateState,
			String realestateHeatingtype, String realestateBalcony, String realestatePetCheck, String realestateTerm,
			String realestateMoveindate, String realestateGender, String realestateRoom, String realestateToilet,
			String realestateCar, String realestateSize, String realestateType, String realestateLocation,
			String realestateFavorite, int realestateRecommend, int realestateLookup, String realestateRegdate,
			String realestateCheckday, String realestateImg1, String realestateImg2, String realestateImg3,
			String realestateTemp1, String realestateTemp2, int realestateTemp3, int realestatePriceEnd,
			int realestateStart, int realestateEnd) {
		super();
		this.realestateNumber = realestateNumber;
		this.memberNumber = memberNumber;
		this.boardCode = boardCode;
		this.memberEmail = memberEmail;
		this.memberId = memberId;
		this.realestateSubject = realestateSubject;
		this.realestateContent = realestateContent;
		this.realestatePrice = realestatePrice;
		this.realestateCategory1 = realestateCategory1;
		this.realestateCategory2 = realestateCategory2;
		this.realestateDeposit = realestateDeposit;
		this.realestateDepositCheck = realestateDepositCheck;
		this.realestateManagement = realestateManagement;
		this.realestateOptionCheck = realestateOptionCheck;
		this.realestateTobaccoCheck = realestateTobaccoCheck;
		this.realestateState = realestateState;
		this.realestateHeatingtype = realestateHeatingtype;
		this.realestateBalcony = realestateBalcony;
		this.realestatePetCheck = realestatePetCheck;
		this.realestateTerm = realestateTerm;
		this.realestateMoveindate = realestateMoveindate;
		this.realestateGender = realestateGender;
		this.realestateRoom = realestateRoom;
		this.realestateToilet = realestateToilet;
		this.realestateCar = realestateCar;
		this.realestateSize = realestateSize;
		this.realestateType = realestateType;
		this.realestateLocation = realestateLocation;
		this.realestateFavorite = realestateFavorite;
		this.realestateRecommend = realestateRecommend;
		this.realestateLookup = realestateLookup;
		this.realestateRegdate = realestateRegdate;
		this.realestateCheckday = realestateCheckday;
		this.realestateImg1 = realestateImg1;
		this.realestateImg2 = realestateImg2;
		this.realestateImg3 = realestateImg3;
		this.realestateTemp1 = realestateTemp1;
		this.realestateTemp2 = realestateTemp2;
		this.realestateTemp3 = realestateTemp3;
		this.realestatePriceEnd = realestatePriceEnd;
		this.realestateStart = realestateStart;
		this.realestateEnd = realestateEnd;
	}

	public int getRealestateNumber() {
		return realestateNumber;
	}

	public void setRealestateNumber(int realestateNumber) {
		this.realestateNumber = realestateNumber;
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

	public String getRealestateSubject() {
		return realestateSubject;
	}

	public void setRealestateSubject(String realestateSubject) {
		this.realestateSubject = realestateSubject;
	}

	public String getRealestateContent() {
		return realestateContent;
	}

	public void setRealestateContent(String realestateContent) {
		this.realestateContent = realestateContent;
	}

	public int getRealestatePrice() {
		return realestatePrice;
	}

	public void setRealestatePrice(int realestatePrice) {
		this.realestatePrice = realestatePrice;
	}

	public String getRealestateCategory1() {
		return realestateCategory1;
	}

	public void setRealestateCategory1(String realestateCategory1) {
		this.realestateCategory1 = realestateCategory1;
	}

	public String getRealestateCategory2() {
		return realestateCategory2;
	}

	public void setRealestateCategory2(String realestateCategory2) {
		this.realestateCategory2 = realestateCategory2;
	}

	public int getRealestateDeposit() {
		return realestateDeposit;
	}

	public void setRealestateDeposit(int realestateDeposit) {
		this.realestateDeposit = realestateDeposit;
	}

	public String getRealestateDepositCheck() {
		return realestateDepositCheck;
	}

	public void setRealestateDepositCheck(String realestateDepositCheck) {
		this.realestateDepositCheck = realestateDepositCheck;
	}

	public int getRealestateManagement() {
		return realestateManagement;
	}

	public void setRealestateManagement(int realestateManagement) {
		this.realestateManagement = realestateManagement;
	}

	public String getRealestateOptionCheck() {
		return realestateOptionCheck;
	}

	public void setRealestateOptionCheck(String realestateOptionCheck) {
		this.realestateOptionCheck = realestateOptionCheck;
	}

	public String getRealestateTobaccoCheck() {
		return realestateTobaccoCheck;
	}

	public void setRealestateTobaccoCheck(String realestateTobaccoCheck) {
		this.realestateTobaccoCheck = realestateTobaccoCheck;
	}

	public String getRealestateState() {
		return realestateState;
	}

	public void setRealestateState(String realestateState) {
		this.realestateState = realestateState;
	}

	public String getRealestateHeatingtype() {
		return realestateHeatingtype;
	}

	public void setRealestateHeatingtype(String realestateHeatingtype) {
		this.realestateHeatingtype = realestateHeatingtype;
	}

	public String getRealestateBalcony() {
		return realestateBalcony;
	}

	public void setRealestateBalcony(String realestateBalcony) {
		this.realestateBalcony = realestateBalcony;
	}

	public String getRealestatePetCheck() {
		return realestatePetCheck;
	}

	public void setRealestatePetCheck(String realestatePetCheck) {
		this.realestatePetCheck = realestatePetCheck;
	}

	public String getRealestateTerm() {
		return realestateTerm;
	}

	public void setRealestateTerm(String realestateTerm) {
		this.realestateTerm = realestateTerm;
	}

	public String getRealestateMoveindate() {
		return realestateMoveindate;
	}

	public void setRealestateMoveindate(String realestateMoveindate) {
		this.realestateMoveindate = realestateMoveindate.substring(0, 10);
	}

	public String getRealestateGender() {
		return realestateGender;
	}

	public void setRealestateGender(String realestateGender) {
		this.realestateGender = realestateGender;
	}

	public String getRealestateRoom() {
		return realestateRoom;
	}

	public void setRealestateRoom(String realestateRoom) {
		this.realestateRoom = realestateRoom;
	}

	public String getRealestateToilet() {
		return realestateToilet;
	}

	public void setRealestateToilet(String realestateToilet) {
		this.realestateToilet = realestateToilet;
	}

	public String getRealestateCar() {
		return realestateCar;
	}

	public void setRealestateCar(String realestateCar) {
		this.realestateCar = realestateCar;
	}

	public String getRealestateSize() {
		return realestateSize;
	}

	public void setRealestateSize(String realestateSize) {
		this.realestateSize = realestateSize;
	}

	public String getRealestateType() {
		return realestateType;
	}

	public void setRealestateType(String realestateType) {
		this.realestateType = realestateType;
	}

	public String getRealestateLocation() {
		return realestateLocation;
	}

	public void setRealestateLocation(String realestateLocation) {
		this.realestateLocation = realestateLocation;
	}

	public String getRealestateFavorite() {
		return realestateFavorite;
	}

	public void setRealestateFavorite(String realestateFavorite) {
		this.realestateFavorite = realestateFavorite;
	}

	public int getRealestateRecommend() {
		return realestateRecommend;
	}

	public void setRealestateRecommend(int realestateRecommend) {
		this.realestateRecommend = realestateRecommend;
	}

	public int getRealestateLookup() {
		return realestateLookup;
	}

	public void setRealestateLookup(int realestateLookup) {
		this.realestateLookup = realestateLookup;
	}

	public String getRealestateRegdate() {
		return realestateRegdate;
	}

	public void setRealestateRegdate(String realestateRegdate) {
		this.realestateRegdate = realestateRegdate;
	}

	public String getRealestateCheckday() {
		return realestateCheckday;
	}

	public void setRealestateCheckday(String realestateCheckday) {
		this.realestateCheckday = realestateCheckday;
	}

	public String getRealestateImg1() {
		return realestateImg1;
	}

	public void setRealestateImg1(String realestateImg1) {
		this.realestateImg1 = realestateImg1;
	}

	public String getRealestateImg2() {
		return realestateImg2;
	}

	public void setRealestateImg2(String realestateImg2) {
		this.realestateImg2 = realestateImg2;
	}

	public String getRealestateImg3() {
		return realestateImg3;
	}

	public void setRealestateImg3(String realestateImg3) {
		this.realestateImg3 = realestateImg3;
	}

	public String getRealestateTemp1() {
		return realestateTemp1;
	}

	public void setRealestateTemp1(String realestateTemp1) {
		this.realestateTemp1 = realestateTemp1;
	}

	public String getRealestateTemp2() {
		return realestateTemp2;
	}

	public void setRealestateTemp2(String realestateTemp2) {
		this.realestateTemp2 = realestateTemp2;
	}

	public int getRealestateTemp3() {
		return realestateTemp3;
	}

	public void setRealestateTemp3(int realestateTemp3) {
		this.realestateTemp3 = realestateTemp3;
	}

	public int getRealestatePriceEnd() {
		return realestatePriceEnd;
	}

	public void setRealestatePriceEnd(int realestatePriceEnd) {
		this.realestatePriceEnd = realestatePriceEnd;
	}

	public int getRealestateStart() {
		return realestateStart;
	}

	public void setRealestateStart(int realestateStart) {
		this.realestateStart = realestateStart;
	}

	public int getRealestateEnd() {
		return realestateEnd;
	}

	public void setRealestateEnd(int realestateEnd) {
		this.realestateEnd = realestateEnd;
	}

	@Override
	public String toString() {
		return "RealestateVO [realestateNumber=" + realestateNumber + ", memberNumber=" + memberNumber + ", boardCode="
				+ boardCode + ", memberEmail=" + memberEmail + ", memberId=" + memberId + ", realestateSubject="
				+ realestateSubject + ", realestateContent=" + realestateContent + ", realestatePrice="
				+ realestatePrice + ", realestateCategory1=" + realestateCategory1 + ", realestateCategory2="
				+ realestateCategory2 + ", realestateDeposit=" + realestateDeposit + ", realestateDepositCheck="
				+ realestateDepositCheck + ", realestateManagement=" + realestateManagement + ", realestateOptionCheck="
				+ realestateOptionCheck + ", realestateTobaccoCheck=" + realestateTobaccoCheck + ", realestateState="
				+ realestateState + ", realestateHeatingtype=" + realestateHeatingtype + ", realestateBalcony="
				+ realestateBalcony + ", realestatePetCheck=" + realestatePetCheck + ", realestateTerm="
				+ realestateTerm + ", realestateMoveindate=" + realestateMoveindate + ", realestateGender="
				+ realestateGender + ", realestateRoom=" + realestateRoom + ", realestateToilet=" + realestateToilet
				+ ", realestateCar=" + realestateCar + ", realestateSize=" + realestateSize + ", realestateType="
				+ realestateType + ", realestateLocation=" + realestateLocation + ", realestateFavorite="
				+ realestateFavorite + ", realestateRecommend=" + realestateRecommend + ", realestateLookup="
				+ realestateLookup + ", realestateRegdate=" + realestateRegdate + ", realestateCheckday="
				+ realestateCheckday + ", realestateImg1=" + realestateImg1 + ", realestateImg2=" + realestateImg2
				+ ", realestateImg3=" + realestateImg3 + ", realestateTemp1=" + realestateTemp1 + ", realestateTemp2="
				+ realestateTemp2 + ", realestateTemp3=" + realestateTemp3 + ", realestatePriceEnd="
				+ realestatePriceEnd + ", realestateStart=" + realestateStart + ", realestateEnd=" + realestateEnd
				+ "]";
	}
	
	
}
