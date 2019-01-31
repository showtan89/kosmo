<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Helper - employment</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
<style>
.realImage {
	max-width: 200px;
	min-height: 150px;
}


/* 야후후후후후후후후후후후후후후훟 */


/* 야후후후후후후후후후후후후후후후후 */


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

<c:set var="realimage" value="resources/img/board/realestate/" />

<!-- 메뉴바 아래 이미지 -->
<div class="breadcrumb-area">
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/min/foreignworker.jpg);">
		<h2>Employment Status</h2>
	</div>
	<br> <br>
</div>

<div class="container" style="margin-bottom: 50px;">
	<div class="row">
		<div class="col-12">
			<div
				class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
				<div class="shop-page-count">
					<c:if test="${pVO.totalCount>0}">
						<p>Showing ${pVO.startNumber}–${pVO.endNumber} of
							${pVO.totalCount} results</p>
					</c:if>
					<c:if test="${pVO.totalCount==0}">
						<p>0 results</p>
					</c:if>
				</div>
				<!-- Search by Terms -->
				<div class="search_by_terms"></div>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- 사이드바 -->
		<div class="col-12 col-md-3 col-lg-2">
			<div class="shop-sidebar-area">
				<div class="shop-widget catagory mb-50" align="left">
					<h4 class="widget-title">Categories</h4>
					<h6 class="widget-title"><a id="knowledgeCategoryAll" href="employment">Employment</a></h6>
						<h6 class="widget-title"><a id="Education" href="newsBoard">News</a></h6>
						<h6 class="widget-title"><a id="employeInfo" href="employeInfo">employeInfo</a></h6>
						<h6 class="widget-title"><a id="Game" href="knowledgeBoardList?knowledgeCategory=Game">Game</a></h6>
				</div>
			</div>
		</div>
	<div class="col-12 col-md-9 col-lg-10">
		<!-- 목록 부분 -->
		111${line}<br><br><br>
		2222${pb}<br><br><br>
		33333${p}<br><br><br>
		4444${sb}<br><br><br>
		
		</div>
	</div>
</div>


<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/realestate.js"></script>
</body>
</html>