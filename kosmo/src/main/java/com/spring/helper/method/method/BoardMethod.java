package com.spring.helper.method.method;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.helper.vo.BoardVO.PageVO;
import com.spring.helper.vo.BoardVO.RealestateVO;
import com.spring.helper.vo.BoardVO.UserVO;

@Component
public class BoardMethod {

	@Resource(name="songUploadPath")
	String realDir;

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

	//페이지 변경시 사용 할 URL 주소 만들기
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

	// 재영 부동산 VO 가져오기 메소드 - 글쓰기 & 수정용
	public RealestateVO getFullRealestateVO(MultipartHttpServletRequest req) throws Exception {
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
				rVO.setRealestateDepositCheck("off");
			}else {
				rVO.setRealestateDepositCheck("on");
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
		// 한글 주소
		if(req.getParameter("realestateTemp2") != null) rVO.setRealestateTemp2(req.getParameter("realestateTemp2").toString());
		
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

		//	VARCHAR2(120 BYTE)	Yes	부동산임시컬럼1 - 엘리베이터 여부로 사용
		if(req.getParameter("realestateTemp1") != null) {
			rVO.setRealestateTemp1(req.getParameter("realestateTemp1").toString());
		}else {
			rVO.setRealestateTemp1("off");
		}

		//파일 입출력
		//업로드 할 디렉토리를 만들고
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/img/board/realestate/");
		/*본인 디렉토리 경로에 따라 바뀜. 이클립스 워크스페이스가 아닌 git work tree 경로 찾는 법이 있어야 하는데....
		서블릿컨텍스트에 등록 해두었고, 상단에서 Resource 어노테이션으로 선언 후 사용
		String realDir = "C:\\Users\\panga\\git\\kosmo1\\kosmo\\src\\main\\webapp\\resources\\img\\board\\realestate\\upload\\";*/
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyyMMdd_HHmmss_", Locale.KOREA );
		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format ( currentTime );
		String image1 = "";
		String image2 = "";
		String image3 = "";
		System.out.println("realDir:"+realDir);
		String newDir = realDir +"board\\realestate\\";
		System.out.println("newDir:"+newDir);
		if(req.getParameter("realestateImg1") == null) {
			if(req.getFile("realestateImg1").getOriginalFilename().length() != 0) {
				MultipartFile file = req.getFile("realestateImg1");
				file.transferTo(new File(saveDir+file.getOriginalFilename()));
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(newDir +mTime+ file.getOriginalFilename());
				int data = 0;
				while((data = fis.read()) != -1) {
					fos.write(data);  
				}
				fis.close();
				fos.close();
				image1 = mTime+file.getOriginalFilename();
				rVO.setRealestateImg1(image1);
			}else {
				rVO.setRealestateImg1("empty");
			}
		}else {
			rVO.setRealestateImg1(req.getParameter("realestateImg1"));
		}
		if(req.getParameter("realestateImg2") == null) {
			if(req.getFile("realestateImg2").getOriginalFilename().length() != 0) {
				MultipartFile file = req.getFile("realestateImg2");
				file.transferTo(new File(saveDir+file.getOriginalFilename()));
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(newDir +mTime+ file.getOriginalFilename());
				int data = 0;
				while((data = fis.read()) != -1) {
					fos.write(data);  
				}
				fis.close();
				fos.close();
				image2 = mTime+file.getOriginalFilename();
				rVO.setRealestateImg2(image2);
			}else {
				rVO.setRealestateImg2("empty");
			}
		}else {
			rVO.setRealestateImg2(req.getParameter("realestateImg2"));
		}
		if(req.getParameter("realestateImg3") == null) {
			if(req.getFile("realestateImg3").getOriginalFilename().length() != 0) {
				MultipartFile file = req.getFile("realestateImg3");
				file.transferTo(new File(saveDir+file.getOriginalFilename()));
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(newDir +mTime+ file.getOriginalFilename());
				int data = 0;
				while((data = fis.read()) != -1) {
					fos.write(data);  
				}
				fis.close();
				fos.close();

				image3 = mTime+file.getOriginalFilename();
				rVO.setRealestateImg3(image3);
			}else {
				rVO.setRealestateImg3("empty");
			}
		}else {
			rVO.setRealestateImg3(req.getParameter("realestateImg3"));
		}
		/*//	VARCHAR2(120 BYTE)	No	부동산사진1
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
		}*/

		//	VARCHAR2(120 BYTE)	Yes	부동산임시컬럼2
		//if(req.getParameter("realestateTemp2") != null) rVO.setRealestateTemp2(req.getParameter("realestateTemp2").toString());
		//	NUMBER(12,0)	Yes		부동산임시컬럼3	
		//if(req.getParameter("realestateTemp3") != null)	rVO.setRealestateTemp3(Integer.parseInt(req.getParameter("realestateTemp3").toString()));
		return rVO;
	}

	// 재영 부동산 VO 가져오기 메소드 - 검색용
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

		String[] realestateSubjectList = {"It's a nice house.","a house with a fine view","The transportation is really good.","The transfer station is very close.",
				"The sun is shining well.","The subway station and bus stop are very close, so it's good to live.","It's really close to the airport.","You can go anywhere from here.","10 minutes to the station, and very good.",
				"This is a really quiet town. Good place to study.","Line 2 is five minutes away.", "It's the place right behind the park, Good to take a walk.","The university and the library are close.","The convenience store and the police station are nearby. safe at night.",
				"If you are looking for a quiet place, come!","It's a great neighborhood to live in.","It's a place where amenities are nearby.","a convenient place to commute to and from work"};
		String realestateSubject = realestateSubjectList[random.nextInt(realestateSubjectList.length)];
		rVO.setRealestateSubject(realestateSubject);
		rVO.setRealestateContent(realestateSubject);

		int realestatePrice = (random.nextInt(25)+15)*10000 ;
		rVO.setRealestatePrice(realestatePrice);
		
		String[] realestateCategory1List = {"seoul","busan","incheon","gwangju","daejeon","sejong","daegu","ulsan","gyeonggi",
				"gangwon","chungcheongbuk","chungcheongnam","gyeongsangbuk","gyeongsangnam","jeollabuk","jeollanam","jeju"};
		int locationRandom = random.nextInt(realestateCategory1List.length);
		rVO.setRealestateCategory1(realestateCategory1List[locationRandom]);

		String[] seoulJuso = {"서울특별시 종로구 난계로25길 5","5, Nangye-ro 25-gil, Jongno-gu, Seoul"};
		String[] busanJuso = {"부산광역시 중구 광복로6번길 10-2","10-2, Gwangbok-ro 6beon-gil, Jung-gu, Busan"};
		String[] incheonJuso = {"인천광역시 중구 도원로26번길 33-8","33-8, Dowon-ro 26beon-gil, Jung-gu, Incheon"};
		String[] gwangjuJuso = {"광주광역시 동구 남문로 555","555, Nammun-ro, Dong-gu, Gwangju"};
		String[] daejeonJuso = {"대전광역시 동구 계족로443번길 24","24, Gyejok-ro 443beon-gil, Dong-gu, Daejeon"};
		String[] sejongJuso = {"세종특별자치시 조치원읍 도원로 16","16, Dowon-ro, Jochiwon-eup, Sejong-si"};
		String[] daeguJuso = {"대구광역시 중구 공평로10길 30-10","30-10, Gongpyeong-ro 10-gil, Jung-gu, Daegu"};
		String[] ulsanJuso = {"울산광역시 중구 곽남2길 20-2","20-2, Gwangnam 2-gil, Jung-gu, Ulsan"};
		String[] gyeonggiJuso = {"경기도 수원시 장안구 천천로22번길 34","34, Cheoncheon-ro 22beon-gil, Jangan-gu, Suwon-si, Gyeonggi-do"};
		String[] gangwonJuso = {"강원도 춘천시 동내면 거두택지길 88","88, Geodutaekji-gil, Dongnae-myeon, Chuncheon-si, Gangwon-do"};
		String[] chungcheongbukJuso = {"충청북도 제천시 고암로 22","22, Goam-ro, Jecheon-si, Chungcheongbuk-do"};
		String[] chungcheongnamJuso = {"충청남도 천안시 동남구 구성8길 26","26, Guseong 8-gil, Dongnam-gu, Cheonan-si, Chungcheongnam-do"};
		String[] gyeongsangbukJuso = {"경상북도 안동시 감나무5길 15","15, Gamnamu 5-gil, Andong-si, Gyeongsangbuk-do"};
		String[] gyeongsangnamJuso = {"경상남도 창원시 마산합포구 가포로 154-11","154-11, Gapo-ro, Masanhappo-gu, Changwon-si, Gyeongsangnam-do"};
		String[] jeollabukJuso = {"전라북도 전주시 완산구 감나무로 25","25, Gamnamu-ro, Wansan-gu, Jeonju-si, Jeollabuk-do"};
		String[] jeollanamJuso = {"전라남도 여수시 돌산읍 강남8길 20","20, Gangnam 8-gil, Dolsan-eup, Yeosu-si, Jeollanam-do"};
		String[] jejuJuso = {"제주특별자치도 제주시 가령로4길 14","14, Garyeong-ro 4-gil, Jeju-si, Jeju-do"};										
		
		String locaEng = "";
		String locaKor = "";
		
		switch(locationRandom) {
			case 0: locaKor = seoulJuso[0];
					locaEng = seoulJuso[1];
					break;
			case 1: locaKor = busanJuso[0];
					locaEng = busanJuso[1];
					break;
			case 2: locaKor = incheonJuso[0];
					locaEng = incheonJuso[1];
					break;
			case 3: locaKor = gwangjuJuso[0];
					locaEng = gwangjuJuso[1];
					break;
			case 4: locaKor = daejeonJuso[0];
					locaEng = daejeonJuso[1];
					break;
			case 5: locaKor = sejongJuso[0];
					locaEng = sejongJuso[1];
					break;
			case 6: locaKor = daeguJuso[0];
					locaEng = daeguJuso[1];
					break;
			case 7: locaKor = ulsanJuso[0];
					locaEng = ulsanJuso[1];
					break;
			case 8: locaKor = gyeonggiJuso[0];
					locaEng = gyeonggiJuso[1];
					break;
			case 9: locaKor = gangwonJuso[0];
					locaEng = gangwonJuso[1];
					break;
			case 10: locaKor = chungcheongbukJuso[0];
					locaEng = chungcheongbukJuso[1];
					break;
			case 11: locaKor = chungcheongnamJuso[0];
					locaEng = chungcheongnamJuso[1];
					break;
			case 12: locaKor = gyeongsangbukJuso[0];
					locaEng = gyeongsangbukJuso[1];
					break;
			case 13: locaKor = gyeongsangnamJuso[0];
					locaEng = gyeongsangnamJuso[1];
					break;
			case 14: locaKor = jeollabukJuso[0];
					locaEng = jeollabukJuso[1];
					break;
			case 15: locaKor = jeollanamJuso[0];
					locaEng = jeollanamJuso[1];
					break;
			case 16: locaKor = jejuJuso[0];
					locaEng = jejuJuso[1];
					break;
		}
		
		rVO.setRealestateLocation(locaEng);
		rVO.setRealestateTemp2(locaKor);

		String[] check = {"on","off"};
		String realestateDepositCheck = check[random.nextInt(2)];
		rVO.setRealestateDepositCheck(realestateDepositCheck);

		int realestateDeposit = 0;
		if(realestateDepositCheck.equals("on")) {
			realestateDeposit = (random.nextInt(100)+1)*10000 ;
		}
		rVO.setRealestateDeposit(realestateDeposit);

		int realestateManagement = (random.nextInt(15)+5)*10000 ;
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