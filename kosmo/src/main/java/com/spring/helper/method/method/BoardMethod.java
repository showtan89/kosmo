package com.spring.helper.method.method;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.spring.helper.vo.BoardVO.PageVO;
import com.spring.helper.vo.BoardVO.RealestateVO;

@Component
public class BoardMethod {
	
	/*int totalCnt = 0;
	if(dao.gsGetBoardCount(aptNumber) != null)totalCnt = dao.gsGetBoardCount(aptNumber);
	pVO.setTotalCount(totalCnt);
	pVO.setCurrentPage(Integer.parseInt(pageNum));
	pVO.setPageCount((totalCnt / pVO.getPageSize()) + (totalCnt%pVO.getPageSize()>0 ?1:0));
	pVO.setStartNumber((pVO.getCurrentPage()-1) * pVO.getPageSize()+1);
	pVO.setEndNumber(pVO.getStartNumber() + pVO.getPageSize() - 1);
	if(pVO.getEndNumber() > totalCnt) pVO.setEndNumber(totalCnt);
	pVO.setStartPage((pVO.getCurrentPage() / pVO.getPageBlock()) * pVO.getPageBlock() + 1);
	if(pVO.getCurrentPage() % pVO.getPageBlock() == 0) pVO.setStartPage(pVO.getStartPage()-pVO.getPageBlock());
	pVO.setEndPage(pVO.getStartPage() + pVO.getPageBlock() - 1);
	if(pVO.getEndPage() > pVO.getPageCount()) pVO.setEndPage(pVO.getPageCount());*/
	
	public PageVO getRealestatePageVO(int cnt) {
		PageVO pVO = new PageVO();
		return pVO;
	}
	
	// 재영 부동산 VO 가져오기 메소드
	public RealestateVO getFullRealestateVO(HttpServletRequest req) {

		RealestateVO rVO = new RealestateVO();

		//	NUMBER(12,0)	No 		부동산번호
		if(req.getParameter("realestateNumber") != null) rVO.setRealestateNumber(Integer.parseInt(req.getParameter("realestateNumber").toString())); 			
		
		//	NUMBER(12,0)	No		회원번호
/*if(req.getParameter("memberNumber") != null) rVO.setMemberNumber(Integer.parseInt(req.getParameter("memberNumber").toString()));*/
rVO.setMemberNumber(10008);
		//	VARCHAR2(120 BYTE)	No	게시판별코드
		/*if(req.getParameter("boardCode") != null) rVO.setBoardCode(req.getParameter("boardCode").toString());*/

		//  VARCHAR2(120 BYTE)	No	이메일
/*if(req.getParameter("memberEmail") != null) rVO.setMemberEmail(req.getParameter("memberEmail").toString());*/
rVO.setMemberEmail("member@email.com");
		
		//  VARCHAR2(120 BYTE)	No	아이디
/*if(req.getParameter("memberId") != null) rVO.setMemberId(req.getParameter("memberId").toString());*/
rVO.setMemberId("member");
			
		//	VARCHAR2(120 BYTE)	No	부동산제목
		if(req.getParameter("realestateSubject") != null) rVO.setRealestateSubject(req.getParameter("realestateSubject").toString());

		//	VARCHAR2(4000 BYTE)	No	부동산내용
		if(req.getParameter("realestateContent") != null) rVO.setRealestateContent(req.getParameter("realestateContent").toString());

		//	NUMBER(12,0)	No		부동산금액
		if(req.getParameter("realestatePrice") != null) rVO.setRealestatePrice(Integer.parseInt(req.getParameter("realestatePrice").toString()));

		//	VARCHAR2(120 BYTE)	No	부동산카테고리1 - 지역권으로 사용
		if(req.getParameter("realestateCategory1") != null) rVO.setRealestateCategory1(req.getParameter("realestateCategory1").toString());

		//	VARCHAR2(120 BYTE)	No	부동산카테고리2 - 미사용
/*if(req.getParameter("realestateCategory2") != null) rVO.setRealestateCategory2(req.getParameter("realestateCategory1").toString());*/

		//	NUMBER(12,0)	No		부동산보증금
		if(req.getParameter("realestateDeposit") != null) rVO.setRealestateDeposit(Integer.parseInt(req.getParameter("realestateDeposit").toString()));

		//	VARCHAR2(120 BYTE)	No	부동산보증금여부 ================================= 파라미터 없음
		if(req.getParameter("realestateDeposit") != null) {
			int deposit = Integer.parseInt(req.getParameter("realestateDeposit").toString()); 
			if(deposit == 0) {
				rVO.setRealestateDepositCheck("No");
			}else {
				rVO.setRealestateDepositCheck("Yes");
			}
		}
		//	NUMBER(12,0)	No		관리비
		if(req.getParameter("realestateManagement") != null) rVO.setRealestateManagement(Integer.parseInt(req.getParameter("realestateManagement").toString()));

		//	VARCHAR2(120 BYTE)	No	풀옵션여부
		if(req.getParameter("realestateOptionCheck") !=null) {
			rVO.setRealestateOptionCheck(req.getParameter("realestateOptionCheck").toString());
		}else {
			rVO.setRealestateOptionCheck("off");
		}

		//	VARCHAR2(120 BYTE)	No	흡연가능여부
		if(req.getParameter("realestateTobaccoCheck") != null) {
			rVO.setRealestateTobaccoCheck(req.getParameter("realestateTobaccoCheck").toString());
		}else {
			rVO.setRealestateTobaccoCheck("off");
		}

		//	VARCHAR2(120 BYTE)	No	해당층건물층
		if(req.getParameter("realestateState") != null) rVO.setRealestateState(req.getParameter("realestateState").toString());

		//	VARCHAR2(120 BYTE)	No	난방종류
		if(req.getParameter("realestateHeatingtype") != null) rVO.setRealestateHeatingtype(req.getParameter("realestateHeatingtype").toString());

		//	VARCHAR2(120 BYTE)	No	베란다발코니유무
		if(req.getParameter("realestateBalcony") != null) {
			rVO.setRealestateBalcony(req.getParameter("realestateBalcony").toString());
		}else {
			rVO.setRealestateBalcony("off");
		}
		//	VARCHAR2(120 BYTE)	No	애완동물가능여부
		if(req.getParameter("realestatePetCheck") != null) {
			rVO.setRealestatePetCheck(req.getParameter("realestatePetCheck").toString());
		}else {
			rVO.setRealestatePetCheck("off");
		}
		//	NUMBER(12,0)	No		최소계약기간	
		if(req.getParameter("realestateTerm") != null) rVO.setRealestateTerm(req.getParameter("realestateTerm").toString());

		//	DATE	No				입주가능일
		if(req.getParameter("realestateMoveindate") != null) rVO.setRealestateMoveindate(req.getParameter("realestateMoveindate").toString());

		//	VARCHAR2(120 BYTE)	No	성별
		if(req.getParameter("realestateGender") != null) rVO.setRealestateGender(req.getParameter("realestateGender").toString());

		//	VARCHAR2(120 BYTE)	No	방갯수
		if(req.getParameter("realestateRoom") != null) rVO.setRealestateRoom(req.getParameter("realestateRoom").toString());

		//	VARCHAR2(120 BYTE)	No	화장실갯수
		if(req.getParameter("realestateToilet") != null) rVO.setRealestateToilet(req.getParameter("realestateToilet").toString());

		//	VARCHAR2(120 BYTE)	No	주차가능여부
		if(req.getParameter("realestateCar") != null) {
			rVO.setRealestateCar(req.getParameter("realestateCar").toString());
		}else {
			rVO.setRealestateCar("off");
		}

		//	NUMBER(12,0)	No		부동산크기
		if(req.getParameter("realestateSize") != null) rVO.setRealestateSize(req.getParameter("realestateSize"));

		//	VARCHAR2(120 BYTE)	No	부동산형태
		if(req.getParameter("realestateType") != null) rVO.setRealestateType(req.getParameter("realestateType").toString());

		//	VARCHAR2(120 BYTE)	No	부동산지도위치
		if(req.getParameter("realestateLocation") != null) rVO.setRealestateLocation(req.getParameter("realestateLocation").toString());

		//	VARCHAR2(120 BYTE)	Yes	찜
		/*if(req.getParameter("realestateFavorite") != null) rVO.setRealestateFavorite(req.getParameter("realestateFavorite").toString());*/

		//	VARCHAR2(120 BYTE)	Yes	추천
		if(req.getParameter("realestateRecommend") != null) rVO.setRealestateRecommend(Integer.parseInt(req.getParameter("realestateRecommend").toString()));

		//	NUMBER(12,0)	Yes		조회수
		if(req.getParameter("realestateLookup") != null) rVO.setRealestateLookup(Integer.parseInt(req.getParameter("realestateLookup").toString()));

		//	DATE	No				작성일
		if(req.getParameter("realestateRegdate") != null) rVO.setRealestateRegdate(req.getParameter("realestateRegdate").toString());

		//	DATE	No				확인매물날짜
//if(req.getParameter("realestateCheckday") != null) rVO.setRealestateCheckday(req.getParameter("realestateCheckday").toString());

		//	VARCHAR2(120 BYTE)	No	부동산사진1
		if(req.getParameter("realestateImg1") != null) {
			rVO.setRealestateImg1(req.getParameter("realestateImg1").toString());
		}else {
			Integer rand = (int)(Math.random() * ((30 - 1) + 1))+1;
			rVO.setRealestateImg1("demo"+rand.toString()+".jpg");
		}

		//	VARCHAR2(120 BYTE)	No	부동산사진2
		if(req.getParameter("realestateImg2") != null) {
			rVO.setRealestateImg2(req.getParameter("realestateImg2").toString());
		}else {
			rVO.setRealestateImg2("empty");
		}

		//	VARCHAR2(120 BYTE)	No	부동산사진3
		if(req.getParameter("realestateImg3") != null) {
			rVO.setRealestateImg3(req.getParameter("realestateImg3").toString());
		}else {
			rVO.setRealestateImg3("empty");
		}

		//	VARCHAR2(120 BYTE)	Yes	부동산임시컬럼1 - 엘리베이터 여부로 사용
		if(req.getParameter("realestateTemp1") != null) {
			rVO.setRealestateTemp1(req.getParameter("realestateTemp1").toString());
		}else {
			rVO.setRealestateTemp1("off");
		}

		//	VARCHAR2(120 BYTE)	Yes	부동산임시컬럼2
//if(req.getParameter("realestateTemp2") != null) rVO.setRealestateTemp2(req.getParameter("realestateTemp2").toString());

		//	NUMBER(12,0)	Yes		부동산임시컬럼3	
//if(req.getParameter("realestateTemp3") != null)	rVO.setRealestateTemp3(Integer.parseInt(req.getParameter("realestateTemp3").toString()));

		return rVO;
	}
	
	// 재영 부동산 VO 가져오기 메소드
		public RealestateVO getParameterRealestateVO(HttpServletRequest req) {

			RealestateVO rVO = new RealestateVO();

			//	NUMBER(12,0)	No 		부동산번호
			if(req.getParameter("realestateNumber") != null) rVO.setRealestateNumber(Integer.parseInt(req.getParameter("realestateNumber").toString())); 			
			
			//	NUMBER(12,0)	No		회원번호
			if(req.getParameter("memberNumber") != null) rVO.setMemberNumber(Integer.parseInt(req.getParameter("memberNumber").toString()));

			//  VARCHAR2(120 BYTE)	No	아이디
			if(req.getParameter("memberId") != null) rVO.setMemberId(req.getParameter("memberId").toString());
				
			//	VARCHAR2(120 BYTE)	No	부동산제목
			if(req.getParameter("realestateSubject") != null) rVO.setRealestateSubject(req.getParameter("realestateSubject").toString());

			//	VARCHAR2(4000 BYTE)	No	부동산내용
			if(req.getParameter("realestateContent") != null) rVO.setRealestateContent(req.getParameter("realestateContent").toString());

			//	NUMBER(12,0)	No		부동산금액
			if(req.getParameter("realestatePrice") != null) rVO.setRealestatePrice(Integer.parseInt(req.getParameter("realestatePrice").toString()));

			//	NUMBER(12,0)	No		부동산금액
			if(req.getParameter("realestatePriceEnd") != null) rVO.setRealestatePriceEnd(Integer.parseInt(req.getParameter("realestatePriceEnd").toString()));
			
			//	VARCHAR2(120 BYTE)	No	부동산카테고리1 - 지역권으로 사용
			if(req.getParameter("realestateCategory1") != null) rVO.setRealestateCategory1(req.getParameter("realestateCategory1").toString());

			//	NUMBER(12,0)	No		부동산보증금
			if(req.getParameter("realestateDeposit") != null) rVO.setRealestateDeposit(Integer.parseInt(req.getParameter("realestateDeposit").toString()));

			//	VARCHAR2(120 BYTE)	No	부동산보증금여부
			if(req.getParameter("realestateDeposit") != null) rVO.setRealestateDepositCheck(req.getParameter("realestateDeposit").toString());

			//	NUMBER(12,0)	No		관리비
			if(req.getParameter("realestateManagement") != null) rVO.setRealestateManagement(Integer.parseInt(req.getParameter("realestateManagement").toString()));

			//	VARCHAR2(120 BYTE)	No	풀옵션여부
			if(req.getParameter("realestateOptionCheck") != null) rVO.setRealestateOptionCheck(req.getParameter("realestateOptionCheck").toString());

			//	VARCHAR2(120 BYTE)	No	흡연가능여부
			if(req.getParameter("realestateTobaccoCheck") != null) rVO.setRealestateTobaccoCheck(req.getParameter("realestateTobaccoCheck").toString());

			//	VARCHAR2(120 BYTE)	No	해당층건물층
			if(req.getParameter("realestateState") != null) rVO.setRealestateState(req.getParameter("realestateState").toString());

			//	VARCHAR2(120 BYTE)	No	난방종류
			if(req.getParameter("realestateHeatingtype") != null) rVO.setRealestateHeatingtype(req.getParameter("realestateHeatingtype").toString());

			//	VARCHAR2(120 BYTE)	No	베란다발코니유무
			if(req.getParameter("realestateBalcony") != null) rVO.setRealestateBalcony(req.getParameter("realestateBalcony").toString());
			
			//	VARCHAR2(120 BYTE)	No	애완동물가능여부
			if(req.getParameter("realestatePetCheck") != null) rVO.setRealestatePetCheck(req.getParameter("realestatePetCheck").toString());
			
			//	NUMBER(12,0)	No		최소계약기간	
			if(req.getParameter("realestateTerm") != null) rVO.setRealestateTerm(req.getParameter("realestateTerm").toString());

			//	DATE	No				입주가능일
			if(req.getParameter("realestateMoveindate") != null) rVO.setRealestateMoveindate(req.getParameter("realestateMoveindate").toString());

			//	VARCHAR2(120 BYTE)	No	성별
			if(req.getParameter("realestateGender") != null) rVO.setRealestateGender(req.getParameter("realestateGender").toString());

			//	VARCHAR2(120 BYTE)	No	방갯수
			if(req.getParameter("realestateRoom") != null) rVO.setRealestateRoom(req.getParameter("realestateRoom").toString());

			//	VARCHAR2(120 BYTE)	No	화장실갯수
			if(req.getParameter("realestateToilet") != null) rVO.setRealestateToilet(req.getParameter("realestateToilet").toString());

			//	VARCHAR2(120 BYTE)	No	주차가능여부
			if(req.getParameter("realestateCar") != null) rVO.setRealestateCar(req.getParameter("realestateCar").toString());

			//	NUMBER(12,0)	No		부동산크기
			if(req.getParameter("realestateSize") != null) rVO.setRealestateSize(req.getParameter("realestateSize"));

			//	VARCHAR2(120 BYTE)	No	부동산형태
			if(req.getParameter("realestateType") != null) rVO.setRealestateType(req.getParameter("realestateType").toString());

			//	VARCHAR2(120 BYTE)	No	부동산지도위치
			if(req.getParameter("realestateLocation") != null) rVO.setRealestateLocation(req.getParameter("realestateLocation").toString());

			//	VARCHAR2(120 BYTE)	Yes	부동산임시컬럼1 - 엘리베이터 여부로 사용
			if(req.getParameter("realestateTemp1") != null) rVO.setRealestateTemp1(req.getParameter("realestateTemp1").toString());

			return rVO;
		}
	
	
	
}