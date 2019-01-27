package com.spring.helper.method.method;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.spring.helper.vo.BoardVO.PageVO;
import com.spring.helper.vo.BoardVO.RealestateVO;
import com.spring.helper.vo.BoardVO.UserVO;

@Component
public class BoardMethod {

//재영 메소드 시작	
	//재영 - 글 갯수로 페이지 VO 만드는 메소드 
	public PageVO getRealestatePageVO(int pageNum, int cnt) {
		PageVO pVO = new PageVO();
		int totalCnt = cnt;
		pVO.setTotalCount(totalCnt);
		pVO.setCurrentPage(pageNum);
		pVO.setPageCount((totalCnt / pVO.getPageSize()) + (totalCnt%pVO.getPageSize()>0 ?1:0));
		pVO.setStartNumber((pVO.getCurrentPage()-1) * pVO.getPageSize()+1);
		pVO.setEndNumber(pVO.getStartNumber() + pVO.getPageSize() - 1);
		if(pVO.getEndNumber() > totalCnt) pVO.setEndNumber(totalCnt);
		pVO.setStartPage((pVO.getCurrentPage() / pVO.getPageBlock()) * pVO.getPageBlock() + 1);
		if(pVO.getCurrentPage() % pVO.getPageBlock() == 0) pVO.setStartPage(pVO.getStartPage()-pVO.getPageBlock());
		pVO.setEndPage(pVO.getStartPage() + pVO.getPageBlock() - 1);
		if(pVO.getEndPage() > pVO.getPageCount()) pVO.setEndPage(pVO.getPageCount());
		return pVO;
	}
	
	public String makeURLbyParameter(HttpServletRequest req) {
		String temp = "";
		if(req.getParameter("realestatePrice")!=null && req.getParameter("realestatePrice").length()!=0) {
			temp += "&realestatePrice="+req.getParameter("realestatePrice");
		}
		if(req.getParameter("realestatePriceEnd")!=null && req.getParameter("realestatePriceEnd").length()!=0) {
			temp += "&realestatePriceEnd="+req.getParameter("realestatePriceEnd");
		}
		if(req.getParameter("realestateOptionCheck")!=null) {
			temp += "&realestateOptionCheck="+req.getParameter("realestateOptionCheck");
		}
		if(req.getParameter("realestateTobaccoCheck")!=null) {
			temp += "&realestateTobaccoCheck="+req.getParameter("realestateTobaccoCheck");
		}
		if(req.getParameter("realestatePetCheck")!=null) {
			temp += "&realestatePetCheck="+req.getParameter("realestatePetCheck");
		}
		if(req.getParameter("realestateBalcony")!=null) {
			temp += "&realestateBalcony="+req.getParameter("realestateBalcony");
		}
		if(req.getParameter("realestateCar")!=null) {
			temp += "&realestateCar="+req.getParameter("realestateCar");
		}
		if(req.getParameter("realestateTemp1")!=null) {
			temp += "&realestateTemp1="+req.getParameter("realestateTemp1");
		}
		if(req.getParameter("realestateCategory1")!=null) {
			temp += "&realestateCategory1="+req.getParameter("realestateCategory1");
		}
		if(req.getParameter("realestateGender")!=null) {
			temp += "&realestateGender="+req.getParameter("realestateGender");
		}
		if(req.getParameter("realestateType")!=null) {
			temp += "&realestateType="+req.getParameter("realestateType");
		}
		if(req.getParameter("realestateTerm")!=null) {
			temp += "&realestateTerm="+req.getParameter("realestateTerm");
		}
		if(req.getParameter("realestateHeatingtype")!=null) {
			temp += "&realestateHeatingtype="+req.getParameter("realestateHeatingtype");
		}
		if(req.getParameter("realestateSize")!=null) {
			temp += "&realestateSize="+req.getParameter("realestateSize");
		}
		//맨 앞 & 잘라내기
		//if(temp.substring(0).equals("&")) temp = temp.substring(1,temp.length());
		//URL 조립
		//url=url+temp;
		//맨 뒤 ? 잘라내기
		//if(url.substring(url.length()-1).equals("?")) url = url.substring(0, url.length()-1);
		//System.out.println(url);
		return temp;
	}
	

	// 재영 부동산 VO 가져오기 메소드 - 글쓰기
	public RealestateVO getFullRealestateVO(HttpServletRequest req) {
		RealestateVO rVO = new RealestateVO();
		UserVO uVO = (UserVO)req.getSession().getAttribute("userVO");
		//	NUMBER(12,0)	No 		부동산번호
		if(req.getParameter("realestateNumber") != null) rVO.setRealestateNumber(Integer.parseInt(req.getParameter("realestateNumber").toString())); 			
		//	NUMBER(12,0)	No		회원번호
		rVO.setMemberNumber(uVO.getMemberNumber());
		//  VARCHAR2(120 BYTE)	No	이메일
		rVO.setMemberEmail(uVO.getMemberEmail());
		//  VARCHAR2(120 BYTE)	No	아이디
		rVO.setMemberId(uVO.getMemberId());
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
		/*if(req.getParameter("realestateRecommend") != null) rVO.setRealestateRecommend(Integer.parseInt(req.getParameter("realestateRecommend").toString()));*/
		//	NUMBER(12,0)	Yes		조회수
		/*if(req.getParameter("realestateLookup") != null) rVO.setRealestateLookup(Integer.parseInt(req.getParameter("realestateLookup").toString()));*/
		//	DATE	No				작성일
		/*if(req.getParameter("realestateRegdate") != null) rVO.setRealestateRegdate(req.getParameter("realestateRegdate").toString());*/
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

	// 재영 부동산 VO 가져오기 메소드 - 검색
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
		if(req.getParameter("realestatePrice") != null)
		{
			if(req.getParameter("realestatePrice").length()!=0) {
				rVO.setRealestatePrice(Integer.parseInt(req.getParameter("realestatePrice").toString()));
			}
		}
		//	NUMBER(12,0)	No		부동산금액
		if(req.getParameter("realestatePriceEnd") != null)
		{
			if(req.getParameter("realestatePriceEnd").length()!=0) {
				rVO.setRealestatePriceEnd(Integer.parseInt(req.getParameter("realestatePriceEnd").toString()));
			}
		}
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

	// 부동산 데이터 필터링 테스트 할 데이터 생성기
	public RealestateVO realestateDummyDataMaker() {

		Random random = new Random();
		RealestateVO rVO= new RealestateVO();

		int[] memberNumberList = {10006,10007,10008,10009,10010,10011,10012};
		int memberNumber = memberNumberList[random.nextInt(memberNumberList.length)];
		rVO.setMemberNumber(memberNumber);

		String[] memberEmailList = {"min@gmail.com","chae@gmail.com","song@gmail.com","so@gmail.com","park@gmail.com","korea@naver.com","usa@naver.com"};
		int temp = random.nextInt(memberEmailList.length);
		String memberEmail = memberEmailList[temp];
		rVO.setMemberEmail(memberEmail);

		String[] memberIdList = {"min","chae","song","so","park","korea","usa"};
		String memberId = memberIdList[temp];
		rVO.setMemberId(memberId);

		String[] realestateSubjectList = {"좋은 집입니다.","전망 좋은 집","교통이 좋아요.","교통 편리합니다.",
				"볕이 잘들어요.","역세권 주거지","어디든 갈 수 있어요.","강남까지 30분",
				"조용한 곳 찾으시는분.","살기 좋은 동네","편의시설 가까워요","출퇴근 하기 편한곳"};
		String realestateSubject = realestateSubjectList[random.nextInt(realestateSubjectList.length)];
		rVO.setRealestateSubject(realestateSubject);
		rVO.setRealestateContent(realestateSubject);

		int realestatePrice = (random.nextInt(100)+1)*20000 ;
		rVO.setRealestatePrice(realestatePrice);

		String[] realestateCategory1List = {"seoul","busan","incheon","gwangju","daejeon","sejong","daegu","ulsan","gyeonggi",
				"gangwon","chungcheongbuk","chungcheongnam","gyeongsangbuk","gyeongsangnam","jeollabuk","jeollanam","jeju"};
		String realestateCategory1 = realestateCategory1List[random.nextInt(realestateCategory1List.length)];
		rVO.setRealestateCategory1(realestateCategory1);

		String[] realestateLocationList1 = {"서울","부산","인천","광주","대전","세종","대구","울산","경기",
				"강원","충북","충남","경북","경남","전북","전남","제주"};
		String[] realestateLocationList2 = {"종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구",
				"도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구","동작구","관악구",
				"서초구","강남구","송파구","강동구"	};
		String local1 = realestateLocationList1[random.nextInt(realestateLocationList1.length)];
		String local2 = realestateLocationList2[random.nextInt(realestateLocationList2.length)];
		rVO.setRealestateLocation(local1+" "+local2);

		String[] check = {"on","off"};
		String realestateDepositCheck = check[random.nextInt(2)];
		rVO.setRealestateDepositCheck(realestateDepositCheck);

		int realestateDeposit = 0;
		if(realestateDepositCheck.equals("on")) {
			realestateDeposit = (random.nextInt(100)+1)*10000 ;
		}
		rVO.setRealestateDeposit(realestateDeposit);

		int realestateManagement = (random.nextInt(100)+1)*10000 ;
		rVO.setRealestateManagement(realestateManagement);

		String realestateBalcony = check[random.nextInt(2)];
		rVO.setRealestateBalcony(realestateBalcony);

		String realestatePetCheck = check[random.nextInt(2)];
		rVO.setRealestatePetCheck(realestatePetCheck);

		String realestateCar = check[random.nextInt(2)];
		rVO.setRealestateCar(realestateCar);

		String realestateTemp1 = check[random.nextInt(2)];
		rVO.setRealestateTemp1(realestateTemp1);

		String realestateOptionCheck = check[random.nextInt(2)];
		rVO.setRealestateOptionCheck(realestateOptionCheck);

		String realestateTobaccoCheck = check[random.nextInt(2)];
		rVO.setRealestateTobaccoCheck(realestateTobaccoCheck);

		String[] realestateStateList = {"1","2","3","4","5","6to10","11to15","16to20","over20","under"};
		String realestateState = realestateStateList[random.nextInt(10)];
		rVO.setRealestateState(realestateState);

		String[] realestateHeatingtypeList = {"individual","central","district"};
		String realestateHeatingtype = realestateHeatingtypeList[random.nextInt(3)];
		rVO.setRealestateHeatingtype(realestateHeatingtype);

		String[] realestateTermList = {"none","2w","1m","3m","6m","12m","over12m","undetemined"};
		String realestateTerm = realestateTermList[random.nextInt(8)];
		rVO.setRealestateTerm(realestateTerm);

		String date1 = "19";
		String date2 = String.valueOf(random.nextInt(9)+4); 
		String date3 = String.valueOf(random.nextInt(28)+1);

		String realestateMoveindate = date1+"/"+date2+"/"+date3;
		rVO.setRealestateMoveindate(realestateMoveindate);

		String[] realestateGenderList = {"both","male","female"};
		String realestateGender = realestateGenderList[random.nextInt(3)];
		rVO.setRealestateGender(realestateGender);

		String[] realestateRoomList = {"1","2","3","over3"};
		String realestateRoom = realestateRoomList[random.nextInt(4)];
		rVO.setRealestateRoom(realestateRoom);

		String[] realestateToiletList = {"0","1","2","3","over3"};
		String realestateToilet = realestateToiletList[random.nextInt(5)];
		rVO.setRealestateToilet(realestateToilet);

		String[] realestateSizeList = {"under33","33to66","66to99","99to132","132to165","165to198","198to231","more231"};
		String realestateSize = realestateSizeList[random.nextInt(8)];	
		rVO.setRealestateSize(realestateSize);

		String[] realestateTypeList = {"apart","villa","house","studio","office"};
		String realestateType = realestateTypeList[random.nextInt(5)];
		rVO.setRealestateType(realestateType);

		String imgTemp = String.valueOf(random.nextInt(30)+1);
		String realestateImg1 = "demo"+imgTemp+".jpg";
		rVO.setRealestateImg1(realestateImg1);
		rVO.setRealestateImg2("empty");
		rVO.setRealestateImg3("empty");

		return rVO;
	}
//재영 메소드 끝
}