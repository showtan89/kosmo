<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="X-Content-Type-Options" content="nosniff" />
<title>Helper - Weather / Area Info</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
<style>
.imageDiv{
	max-width:675px;
}

.imageDiv .centerBtn{
	vertical-align: middle !important;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	font-size: 16px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}
.imageDiv .centerBtn:hover{
	vertical-align: middle !important;
	background-color:#bbb;
	color:#70c745;
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

<div class="breadcrumb-area">
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/travel/weather/weather.png);">
		<h2>Weather / Area Info</h2>
	</div>
	<br><br>
</div>

<div class="container" style="margin-bottom: 50px;">
	<h5>Weather / Area Info</h5>
	<hr>
	<div class="row ">
		<!-- 카테1 -->
		<div class="col-md-6 mb-6">
			<label for="search">Information Type</label> 
			<select class="custom-select d-block w-100" id="searchType" name="searchType">
				<option style="display: none;" value="">Select Type</option>
				<option value="radar">Weather Information</option>
				<option value="earth">Earthquake Notification</option>
			</select>
		</div>
		<div class="col-md-6 mb-6">
		<label for="searchButton">&nbsp;</label>
			<button type="button" class="btn alazea-btn form-control btn-custom" id="searchButton" onclick="return getWeatherData();">Search</button>
		</div>
	</div>
	<hr>
	<div class="shop-products-area">
		<div class="row">
			<div class="col-12">
				<div class="card flex-md-row mb-4 shadow-sm h-md-250 imageDiv" id="imageResult" style="display:none"></div>
				<div class="card flex-md-row mb-4 shadow-sm h-md-250" id="textResult" style="padding-left:20px;padding-top:20px;display:none"></div>
			</div>
	</div>
</div>

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/weather.js"></script>
<script>
$(function() {
	<c:if test="${param.type eq 'earthquake'}">
		$("#searchType").val("earth");
		getWeatherData();
	</c:if>
	<c:if test="${param.type eq null}">
	$("#searchType").val("radar");
		getWeatherData();
</c:if>
})
</script>
</body>
</html>