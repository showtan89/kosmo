<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="X-Content-Type-Options" content="nosniff" />
<title>Helper - Travel</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
<style>
.cursorCustom{
	cursor: pointer;
	border: solid 3px transparent;
}.cursorCustom:hover{
	opacity: 0.8;
	border-color: #70c745;
}
 @media only screen and (max-width: 800px) {
	.page-link{
		width:22px !important;
		margin-left:3px !important;
		margin-right:3px !important;
		font-size:small !important;
	}
}
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  border: solid 5px;
  border-color: #70c745;
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  margin-top:5%;
  padding: 20px;
  border: 1px solid #888;
  width: 100%;
  max-width:1080px;
  max-height:800px;
  overflow-y: auto;
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.modal-footer {
    border-top: 0 none !important;
}
</style>
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
<c:set var="travelImage" value="resources/img/travel/travel/" />
<!-- 메뉴바 아래 이미지 -->
<div class="breadcrumb-area">
	<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${travelImage}travelmenu.jpg);">
		<h2>Travel</h2>
	</div>
	<br> <br>
</div>

<!-- 여행 게시판 본문  -->
<div class="container" style="margin-bottom: 50px;">
	<h5>Travel Search <span id="countResult"></span></h5>
	<hr>
	<div class="row ">
		<!-- 카테1 -->
		<div class="col-md-4 mb-4">
			<label for="cat1">Category #1</label> <select
				class="custom-select d-block w-100" id="cat1" name="cat1"
				onchange="cat1Change();">
				<option style="display: none;" value="">Select</option>
				<option value="76&cat1=A01">Nature</option>
				<option value="76&cat1=A02">Culture/Art/History</option>
				<option value="75&cat1=A03">Leisure/Sports</option>
				<option value="79&cat1=A04">Shopping</option>
				<option value="82&cat1=A05">Cuisine</option>
				<option value="77&cat1=B01">Transportation</option>
				<option value="80&cat1=B02">Accommodation</option>
			</select>
		</div>
		<!-- 카테2 -->
		<div class="col-md-4 mb-4" id="cat2Area">
			<label for="cat2">Category #2</label> <select
				class="custom-select d-block w-100" id="cat2Before" name="cat2">
				<option style="display: none;" selected>Select Category #1</option>
			</select>
		</div>
		<!-- 카테3 -->
		<div class="col-md-4 mb-4" id="cat3Area">
			<label for="cat3">Category #1</label> <select
				class="custom-select d-block w-100" id="cat3Before" name="cat3">
				<option style="display: none;" selected>Select Category #2</option>
			</select>
		</div>
		<!-- 주소 대분류 -->
		<div class="col-md-4 mb-4">
			<label for="areaCode">Area Selection #1</label> <select
				class="custom-select d-block w-100" id="areaCode" name='areaCode'
				onchange="areaChange();">
				<option style="display: none;" value="">Select</option>
				<option value="1">Seoul</option>
				<option value="2">Incheon</option>
				<option value="3">Daejeon</option>
				<option value="4">Daegu</option>
				<option value="5">Gwangju</option>
				<option value="6">Busan</option>
				<option value="7">Ulsan</option>
				<option value="8">Sejong</option>
				<option value="31">Gyeonggi-do</option>
				<option value="32">Gangwon-do</option>
				<option value="33">Chungcheongbuk-do</option>
				<option value="34">Chungcheongnam-do</option>
				<option value="35">Gyeongsangbuk-do</option>
				<option value="36">Gyeongsangnam-do</option>
				<option value="37">Jeollabuk-do</option>
				<option value="38">Jeollanam-do</option>
				<option value="39">Jeju-do</option>
			</select>
		</div>
		<!-- 주소 소분류 -->
		<div class="col-md-4 mb-4" id="sigunguArea">
			<label for="sigunguCode">Area Selection #2</label> <select
				class="custom-select d-block w-100" id="sigunguCodeBefore"
				name="sigunguCode">
				<option style="display: none;" selected>Select Area #1</option>
			</select>
		</div>
		
		<!-- 검색 기능 -->
		<div class="col-md-4 mb-4">
			<label for="searchText">Search Word</label>
			<input type="text" class="form-control"	id="searchText">
		</div>
		
		<!-- 서치 버튼 -->
		<div class="col-md-6 mb-6">
			<button type="button" class="btn alazea-btn form-control btn-custom"
				id="searchButton" onclick="clearField();">Clear</button>
		</div>
		<div class="col-md-6 mb-6">
			<button type="button" class="btn alazea-btn form-control btn-custom"
				id="searchButton" onclick="getJsonData();">Search</button>
		</div>
		
	</div>
	<hr>
	<!-- 데이터가 뿌려지는 공간 -->
	<div class="shop-products-area">
	
		<div class="card flex-md-row mb-4 shadow-sm h-md-250" id="jsonResult"></div>
		<!-- 페이지가 뿌려지는 곳 -->
		<div id="pageResult"></div>
		<br>
	</div>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=u91vrld6gw"></script>
	<div class="section-heading text-center">
		<p>The information used on this page is "공공누리 제 1유형" and used the data provided <a href="http://api.visitkorea.or.kr/">VisitKorea</a></p>
     </div>
</div>

<!-- The Modal -->
<div id="detailModal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<div id="modal-content">
		</div>
		<div class="modal-footer" style="margin-bottom:20px">
			<p>&nbsp;</p>
	        <button type='button' id='closeModal' class='btn alazea-btn' onclick='closeModal()' style='line-height:0px !important;'>CLOSE</button>
	        <form action="findDirectionTour" method="post">
		        <input type="hidden" name="name" id="name">
				<input type="hidden" name="endLat" id="endLat">
				<input type="hidden" name="endLng" id="endLng">
				<button type="submit" class="btn alazea-btn">Find Direction</button>
			</form>
	    </div>
	</div>
</div>
<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/travel.js"></script>
<script>
 $(function () {
	<c:if test="${fn:length(param.word) == 0}">
		console.log("no param");
		getJsonData();
	</c:if>
	<c:if test="${fn:length(param.word) > 0}">
		console.log('param : ${param.word}');
		getParamAndGetJsonData('${param.word}');
	</c:if>
})

</script>
</body>
</html>