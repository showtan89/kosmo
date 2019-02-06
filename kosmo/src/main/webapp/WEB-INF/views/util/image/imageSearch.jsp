<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="X-Content-Type-Options" content="nosniff" />
<title>Helper - Image</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
<style>

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
  margin-top:10%;
  padding: 20px;
  border: 1px solid #888;
  width: 70%;
  max-width:1080px;
  max-height:600px;
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

<!-- 메뉴바 아래 이미지 -->
<div class="breadcrumb-area">
	<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/bg-img/image5.jpg);">
		<h2>Image Search</h2>
	</div>
	<br> <br>
</div>

<!-- 이미지 서치 본문  -->
<div class="container" style="margin-bottom: 50px;">
	<h5>Image Search</h5>
	<hr>
	<div class="row ">
		<!-- 소분류 -->
		<div class="col-md-4 mb-4" id="sigunguArea">
			<label for="sigunguCode">Area Selection #2</label> <select
				class="custom-select d-block w-100" id="sigunguCodeBefore"
				name="sigunguCode">
				<option style="display: none;" selected>Select Area #1</option>
			</select>
		</div>
		<!-- 서치 버튼 -->
		<div class="col-md-4 mb-4">
			<label for="searchButton">&nbsp;</label>
			<button type="button" class="btn alazea-btn form-control btn-custom"
				id="searchButton" onclick="getJsonData();">Search</button>
		</div>
	</div>
	<hr>
	<!-- 데이터가 뿌려지는 공간 -->
	<div class="shop-products-area">
		<div class="card flex-md-row mb-4 shadow-sm h-md-250" id="jsonResult"></div>
	</div>
	
	<!-- <div class="section-heading text-center">
		<p>The information used on this page is "공공누리 제 1유형" and used the data provided <a href="http://api.visitkorea.or.kr/">VisitKorea</a></p>
    </div> -->
</div>

 <!-- The Modal -->
<!--<div id="detailModal" class="modal">
	Modal content
	<div class="modal-content">
		<div id="modal-content">
		</div>
	<button type='button' id='closeModal' class='btn alazea-btn' onclick='closeModal()' style='padding:30px !important; line-height:0px !important;'>CLOSE</button>
	</div>
</div> -->
<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- <script src="resources/js/travel.js"></script> -->
<!-- <script>
 $(function () {
	getJsonData();
})
</script> -->

</body>
</html>