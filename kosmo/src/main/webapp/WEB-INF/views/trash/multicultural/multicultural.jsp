<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="X-Content-Type-Options" content="nosniff" />
<title>Helper - blank</title>
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

<div class="breadcrumb-area">
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url();">
		<h2>BLANK</h2>
	</div>
	<br><br>
</div>

<div class="container" style="margin-bottom: 50px;">
	<div class="row">
		<div class="col-12">
			<div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
				<div class="shop-page-count"></div>
				<div class="search_by_terms">
					<button type="button" class='btn alazea-btn' onclick="getNewsJson()">Search</button>
				</div>
			</div>
		</div>
	</div>

	<div class="shop-products-area">
		<div class="row">
			<div class="col-12">
				<div class="card flex-md-row mb-4 shadow-sm h-md-250"
					id="jsonResult">여기는 빈페이지입니다. 나가주시죠.</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../../setting/footer01.jsp" flush="false" />

</body>
</html>