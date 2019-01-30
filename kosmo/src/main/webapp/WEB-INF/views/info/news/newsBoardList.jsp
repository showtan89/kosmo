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
<title>Helper - News</title>
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
<c:set var="newsimage" value="resources/img/info/news/" />
<!-- 메뉴바 아래 이미지 -->
<div class="breadcrumb-area">
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${newsimage}newsmenu.jpg);">
		<h2>NEWS</h2>
	</div>
	<br>
	<br>
</div>

<!-- 뉴스 게시판 본문  -->
<div class="container" style="margin-bottom: 50px;">
	<div class="row">
		<div class="col-12">
			<div
				class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
				<div class="shop-page-count">
				</div>
				<!-- Search by Terms -->
				<div class="search_by_terms">
					<!-- 필터 기능 일단 주석 -->
					<form action="#" method="post" class="form-inline">
                        <select class="custom-select widget-title">
		             		<option value="CTR0014">나이지리아 </option>
							<option value="CTR0027">남아프리카공화국 </option>
							<option value="CTR0009">독일</option>
							<option value="CTR0001">러시아</option>
							<option value="CTR0029">멕시코</option>
							<option value="CTR0004">미국</option>
							<option value="CTR0005">베트남</option>
							<option value="CTR0041">벨기에</option>
							<option value="CTR0040">브라질</option>
							<option value="CTR0028">스웨덴</option>
							<option value="CTR0024">스페인</option>
							<option value="CTR0032">싱가포르</option>
							<option value="CTR0049">아랍에미리트</option>
							<option value="CTR0008">아르헨티나</option>
							<option value="CTR0010">영국</option>
							<option value="CTR0030">이란</option>
							<option value="CTR0020">이집트</option>
							<option value="CTR0033">이탈리아</option>
							<option value="CTR0038">인도</option>
							<option value="CTR0034">인도네시아</option>
							<option value="CTR0003">일본</option>
							<option value="CTR0013">중국</option>
							<option value="CTR0011">카자흐스탄</option>
							<option value="CTR0018">캐나다</option>
							<option value="CTR0019">태국</option>
							<option value="CTR0023">터키</option>
							<option value="CTR0016">폴란드</option>
							<option value="CTR0002">프랑스</option>
							<option value="CTR0035">필리핀</option>
							<option value="CTR0017">헝가리</option>
							<option value="CTR0021">호주</option>
                        </select>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<button type="submit" class='btn alazea-btn'>Search</button>
                    </form>
				</div>
			</div>
		</div>
	</div>

	<div class="shop-products-area">
		<div class="row">
			<div class="col-12">
				<div class="card flex-md-row mb-4 shadow-sm h-md-250">
				뉴스가 위치할 공간
				d
				
				
				
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../../setting/footer01.jsp" flush="false" />
</body>
</html>