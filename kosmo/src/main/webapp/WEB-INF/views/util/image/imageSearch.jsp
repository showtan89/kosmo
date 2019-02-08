<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/bg-img/image5.jpg);">
		<h2>Image Search</h2>
	</div>
	<br> <br>
</div>

<!-- 이미지 서치 본문  -->
<div class="container" style="margin-bottom: 50px;">
	<h5>Image Search</h5>
	<hr>
	<!-- <form action="imageSearchPro" method="POST" enctype="multipart/form-data" onsubmit="return getImageInfo();"> -->
	<div class="row ">
		<!-- 소분류 -->
		<div class="col-md-4 mb-4" id="sigunguArea">
			<label for="searchType">Image Search Type</label> <select
				class="custom-select d-block w-100" id="searchType"
				name="searchType" onchange="infoUpdate();">
				<option style="display: none;" selected>Select Type</option>
				<option value="label">Label Search</option>
				<option value="text">Text Search</option>
				<option value="landmark">Landmark Search</option>
			</select>
		</div>
		<div class="col-md-4 mb-4">
			<label for="inputFile" style="color: white" id='inputFileLabel'>Image
				Search Type</label> <input type="file" id="inputFile" name="inputImageFile">
		</div>
		<!-- 서치 버튼 -->
		<div class="col-md-4 mb-4">
			<label for="searchButton">&nbsp;</label>
			<button type="button" class="btn alazea-btn form-control btn-custom"
				id="searchButton" onclick="return getImageInfo();">Search</button>
		</div>
	</div>
	<!-- </form> -->
	<hr>
	<!-- 데이터가 뿌려지는 공간 -->
	<div class="shop-products-area">
		<div class="card flex-md-row mb-4 shadow-sm h-md-250" id="jsonResult" style="padding:15px;">
		<span><b>Image Search how to use</b><br>
		Please select a type, attach the picture or image you took, then press the search button and wait.<br><br>
		<br>
		<b>Type</b><br>
		Label - Analyze the overall information about the picture.<br>
		Landmark -  Specialized searching for landmarks. <b>***under development***</b><br>
		Text Reader - Extracts text from the image. If you don't know what it means, use it with the search feature at the top of the page. <b>***under development***</b><br>
		<br>
		<b>Image File</b><br>
		Photographs or high-definition images may take some time to analyze.
		</span></div>
	</div>
</div>
<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/plugins/jQWCloudv3.1.js"></script>
<script src="resources/js/imageSearch.js"></script>
<!-- <script>
 $(function () {
	getJsonData();
})
</script> -->

</body>
</html>