<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Helper - Realestate</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
</head>

<!-- 프리로더 이미지 -->
<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<jsp:include page="../../setting/header01.jsp" flush="false" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="realimage" value="resources/img/board/realestate/" />

<!-- 메뉴바 아래 이미지 -->
<div class="breadcrumb-area">
	<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${realimage}realestatemenu.jpg);">
		<h2>REALESTATE</h2>
	</div><br> <br>
</div>

<!-- 부동산 게시판 본문  -->
<div class="container" style="margin-bottom: 50px;">
	<h5>Modify Post</h5>
	<hr>
	<form action="realestateModifyPro?realestateNumber=${param.realestateNumber}" method="post" >
		<div class="row ">
			<!-- 글제목 -->
			<div class="col-12 mb-4">
				<label for="realestateSubject">Title</label> 
				<input type="text" class="form-control" id="realestateSubject" name="realestateSubject" value="${rVO.realestateSubject}">
			</div>
			<!-- 가격 -->
			<div class="col-md-4 mb-4">
				<label for="realestatePrice">Price per Week</label> 
				<input type="text" class="form-control" id="realestatePrice" name="realestatePrice" value="${rVO.realestatePrice}">
			</div>
			<!-- 관리비 -->
			<div class="col-md-4 mb-4">
				<label for="realestateManagement">Management fees per Week</label>
				<input type="text" class="form-control" id="realestateManagement" name="realestateManagement" value="${rVO.realestateManagement}">
			</div>
			<!-- 보증금 -->
			<div class="col-md-4 mb-4">
				<label for="realestateDeposit">Security Deposit</label> 
				<input type="text" class="form-control" id="realestateDeposit" name="realestateDeposit" value="${rVO.realestateDeposit}">
			</div>
			<!-- 방 갯수 -->
			<div class="col-md-4 mb-4">
				<label for="realestateRoom">Number of Rooms</label> 
				<select	class="custom-select d-block w-100" id="realestateRoom" name='realestateRoom'>
					<option style="display:none;" selected>Select</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="over3">more than 3</option>
				</select>
			</div>
			
			<!-- 화장실 갯수 -->
			<div class="col-md-4 mb-4">
				<label for="realestateToilet">Number of Bathrooms</label> 
				<select	class="custom-select d-block w-100" id="realestateToilet" name='realestateToilet'>
					<option style="display:none;" selected>Select</option>
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="over3">more than 3</option>
				</select>
			</div>
			<!-- 층수 -->
			<div class="col-md-4 mb-4">
				<label for="realestateState">Floor / Level</label> 
				<select	class="custom-select d-block w-100" id="realestateState" name='realestateState'>
					<option style="display:none;" selected>Select</option>
					<option value="1">1 (Ground Floor / Level)</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6to10">Between 6 and 10</option>
					<option value="11to15">Between 11 and 15</option>
					<option value="16to20">Between 16 and 20</option>
					<option value="over20">Higher than 20</option>
					<option value="under">Underground</option>
				</select>
			</div>
			<!-- 지역권 -->
			<div class="col-md-4 mb-4">
				<label for="realestateCategory1">Province</label> 
				<select	class="custom-select d-block w-100" id="realestateCategory1" name='realestateCategory1'>
					<option style="display:none;" selected>Select</option>
					<option value="seoul">Seoul (서울)</option>
					<option value="busan">Busan (부산)</option>
					<option value="incheon">Incheon (인천)</option>
					<option value="gwangju">Gwangju (광주)</option>
					<option value="daejeon">Daejeon (대전)</option>
					<option value="sejong">Sejong (세종)</option>
					<option value="daegu">Daegu (대구)</option>
					<option value="ulsan">Ulsan (울산)</option>
					<option value="gyeonggi">Gyeonggi-do (경기도)</option>
					<option value="gangwon">Gangwon-do (강원도)</option>
					<option value="chungcheongbuk">Chungcheongbuk-do (충청북도)</option>
					<option value="chungcheongnam">Chungcheongnam-do (충청남도)</option>
					<option value="gyeongsangbuk">Gyeongsangbuk-do (경상북도)</option>
					<option value="gyeongsangnam">Gyeongsangnam-do (경상남도)</option>
					<option value="jeollabuk">Jeollabuk-do (전라북도)</option>
					<option value="jeollanam">Jeollanam-do (전라남도)</option>
					<option value="jeju">Jeju-do (제주도)</option>
				</select>
			</div>
			<!-- 상세 주소 -->
			<div class="col-md-8 mb-8">
				<label for="realestateLocation">카테고리(상세 주소)</label> 
				<input type="text" class="form-control" id="realestateLocation" name="realestateLocation" placeholder="상세주소 보류">
			</div>
			<!-- 부동산 형태 -->
			<div class="col-md-4 mb-4">
				<label for="realestateType">Type of Place</label> 
				<select	class="custom-select d-block w-100" id="realestateType" name='realestateType'>
					<option style="display:none;" selected>Select</option>
					<option value="apart">Apartment</option>
					<option value="villa">Villa</option>
					<option value="house">House</option>
					<option value="studio">Studio</option>
					<option value="office">Office</option>
				</select>
			</div>
			<!-- 최소 계약 기간 -->
			<div class="col-md-4 mb-4">
				<label for="realestateTerm">Minimum Rental Period</label> 
				<select	class="custom-select d-block w-100" id="realestateTerm" name='realestateTerm'>
					<option style="display:none;" selected>Select</option>
					<option value="none">None</option>
					<option value="2w">2 weeks</option>
					<option value="1m">1 month</option>
					<option value="3m">3 months</option>
					<option value="6m">6 months</option>
					<option value="12m">1 year</option>
					<option value="over12m">More than 1 year</option>
					<option value="undetemined">Undetermined</option>
				</select>
			</div>
			<!-- 입주가능일 -->
			<div class="col-md-4 mb-4">
				<label for="realestateMoveindate">Date of Availability</label> 
				<input type="date" class="form-control" id="realestateMoveindate" name="realestateMoveindate" value="${rVO.realestateMoveindate}">
			</div>
			<!-- 성별 -->
			<div class="col-md-4 mb-4"><!-- Female Only -->
				<label for="realestateGender">Gender Select</label> 
				<select	class="custom-select d-block w-100" id="realestateGender" name='realestateGender'>
					<option style="display:none;" selected>Select</option>
					<option value="both">Both Gender</option>
					<option value="male">Male Only</option>
					<option value="female">Female Only</option>
				</select>
			</div>
			<!-- 난방 형태 -->
			<div class="col-md-4 mb-4">
				<label for="realestateHeatingtype">Heating Type</label> 
				<select	class="custom-select d-block w-100" id="realestateHeatingtype" name='realestateHeatingtype'>
					<option style="display:none;" selected>Select</option>
					<option value="individual">Individual heating</option>
					<option value="central">Central heating</option>
					<option value="district">District heating</option>
				</select>
			</div>
			<!-- 부동산 크기 -->
			<div class="col-md-4 mb-4">
				<label for="realestateSize">Size of Place</label> 
				<select	class="custom-select d-block w-100" id="realestateSize" name='realestateSize'>
					<option style="display:none;" selected>Select</option>
					<option value="under33">~33㎡</option>
					<option value="33to66">33~66㎡</option>
					<option value="66to99">66~99㎡</option>
					<option value="99to132">99~132㎡</option>
					<option value="132to165">132~165㎡</option>
					<option value="165to198">165~198㎡</option>
					<option value="198to231">198~231㎡</option>
					<option value="more231">231㎡~</option>
				</select>
			</div>
			<!-- 내용 -->
			<div class="col-md-12 mb-4">
				<label for="realestateContent">Contents</label>
				<textarea class="form-control" id="realestateContent" name="realestateContent" cols="30" rows="10">${rVO.realestateContent}</textarea>
			</div>
			<div class="col-md-6 mb-6">
				<div class="d-flex align-items-center">
					<!-- 풀옵션 여부 -->
					<div class="custom-control custom-checkbox d-flex align-items-center mr-30">
						<input type="checkbox" class="custom-control-input" id="realestateOptionCheck" name="realestateOptionCheck">
						<label class="custom-control-label" for="realestateOptionCheck">Fully Furnished</label>
					</div>
					<!-- 흡연가능 여부 -->
					<div class="custom-control custom-checkbox d-flex align-items-center mr-30">
						<input type="checkbox" class="custom-control-input" id="realestateTobaccoCheck" name="realestateTobaccoCheck">
						<label class="custom-control-label" for="realestateTobaccoCheck">Smoking Allowed</label>
					</div>
					<!-- 애완동물 여부 -->
					<div class="custom-control custom-checkbox d-flex align-items-center mr-30">
						<input type="checkbox" class="custom-control-input"	id="realestatePetCheck" name="realestatePetCheck"> 
						<label class="custom-control-label" for="realestatePetCheck">Pets Allowed</label>
					</div>
				</div>
			</div>
			<hr>
			<div class="col-md-6 mb-6">
				<div class="d-flex align-items-center">
					<!-- 발코니 여부 -->
					<div class="custom-control custom-checkbox d-flex align-items-center mr-30">
						<input type="checkbox" class="custom-control-input"	id="realestateBalcony" name="realestateBalcony"> 
						<label class="custom-control-label" for="realestateBalcony">Has Balcony</label>
					</div>
					<!-- 주차장 여부 -->
					<div class="custom-control custom-checkbox d-flex align-items-center mr-30">
						<input type="checkbox" class="custom-control-input" id="realestateCar" name="realestateCar"> 
						<label class="custom-control-label" for="realestateCar">Has Parking lot</label>
					</div>
					<!-- 엘리베이터 여부 -->
					<div class="custom-control custom-checkbox d-flex align-items-center mr-30">
						<input type="checkbox" class="custom-control-input" id="realestateTemp1" name="realestateTemp1"> 
						<label class="custom-control-label" for="realestateTemp1">Has Elevator</label>
					</div>
				</div>
			</div>
			<c:if test="${rVO.realestateRoom!=null}">
				<script>$("#realestateRoom").val('${rVO.realestateRoom}').prop("selected", true);</script>
			</c:if>
			<c:if test="${rVO.realestateToilet!=null}">
				<script>$("#realestateToilet").val('${rVO.realestateToilet}').prop("selected", true);</script>
			</c:if>
			<c:if test="${rVO.realestateState!=null}">
				<script>$("#realestateState").val('${rVO.realestateState}').prop("selected", true);</script>
			</c:if>
			<c:if test="${rVO.realestateCategory1!=null}">
				<script>$("#realestateCategory1").val('${rVO.realestateCategory1}').prop("selected", true);</script>
			</c:if>
			<c:if test="${rVO.realestateType!=null}">
				<script>$("#realestateType").val('${rVO.realestateType}').prop("selected", true);</script>
			</c:if>
			<c:if test="${rVO.realestateTerm!=null}">
				<script>$("#realestateTerm").val('${rVO.realestateTerm}').prop("selected", true);</script>
			</c:if>
			<c:if test="${rVO.realestateGender!=null}">
				<script>$("#realestateGender").val('${rVO.realestateGender}').prop("selected", true);</script>
			</c:if>
			<c:if test="${rVO.realestateHeatingtype!=null}">
				<script>$("#realestateHeatingtype").val('${rVO.realestateHeatingtype}').prop("selected", true);</script>
			</c:if>
			<c:if test="${rVO.realestateSize!=null}">
				<script>$("#realestateSize").val('${rVO.realestateSize}').prop("selected", true);</script>
			</c:if>
			<c:if test="${rVO.realestateOptionCheck.equals('on')}">
				<script>$("#realestateOptionCheck").val('${rVO.realestateOptionCheck}').prop("checked", true);</script>
			</c:if>
			<c:if test="${rVO.realestateTobaccoCheck.equals('on')}">
				<script>$("#realestateTobaccoCheck").val('${rVO.realestateTobaccoCheck}').prop("checked", true);</script>
			</c:if>
			<c:if test="${rVO.realestatePetCheck.equals('on')}">
				<script>$("#realestatePetCheck").val('${rVO.realestatePetCheck}').prop("checked", true);</script>
			</c:if>
			<c:if test="${rVO.realestateBalcony.equals('on')}">
				<script>$("#realestateBalcony").val('${rVO.realestateBalcony}').prop("checked", true);</script>
			</c:if>
			<c:if test="${rVO.realestateCar.equals('on')}">
				<script>$("#realestateCar").val('${rVO.realestateCar}').prop("checked", true);</script>
			</c:if>
			<c:if test="${rVO.realestateTemp1.equals('on')}">
				<script>$("#realestateTemp1").val('${rVO.realestateTemp1}').prop("checked", true);</script>
			</c:if>
			<hr>
			<!-- 첨부파일 -->
			<h1>첨부이미지 보류</h1>
			<!-- <div class="col-md-4 mb-4">
				<label for="realestateImg1">Image of Place #1</label> 
				<input type="file" class="form-control" id="realestateImg1" name="realestateImg1" required>
			</div>
			<div class="col-md-4 mb-4">
				<label for="realestateImg2">Image of Place #2 (optional)</label> 
				<input type="file" class="form-control" id="realestateImg2" name="realestateImg2">
			</div>
			<div class="col-md-4 mb-4">
				<label for="realestateImg3">Image of Place #3 (optional)</label> 
				<input type="file" class="form-control" id="realestateImg3" name="realestateImg3">
			</div> -->
		</div>
		<hr>
		<c:if test="${sessionScope.userVO!=null }">
			<c:set var="loginId" value="${sessionScope.userVO.memberId}" />
		</c:if>
		<c:if test="${sessionScope.userVO==null }">
			<c:set var="loginId" value="null" />
		</c:if>
		<c:if test="${rVO.memberId.equals(loginId)}">
			<button type="button" class='btn alazea-btn' onclick='window.history.back();'>Back</button>
			<button type="submit" class='btn alazea-btn'>Modify</button>
		</c:if>
	</form>
</div>

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/realestate.js"></script><!-- 입력폼 확인 -->
</body>
</html>