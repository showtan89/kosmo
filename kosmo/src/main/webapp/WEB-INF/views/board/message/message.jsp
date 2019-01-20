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
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Helper - Foriener &amp; Help HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

</head>
<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<jsp:include page="../../setting/header01.jsp" flush="false" />

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>CHATTING</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">About</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" style="margin-bottom: 50px;">

<!-- 동욱 시작 -->
<style type="text/css">
.tab-box {
	margin: 50px auto 0 auto;
	width: 520px;
}

.tab-box ul {
	height: 30px;
}

.tab-box li {
	float: left;
	width: 100px;
	height: 30px;
	line-height: 30px; /* 중앙정렬 */
	margin-right: 2px;
	text-align: center;
	background-color: #ccc;
	border-radius: 3px 3px 0 0;
	cursor: pointer;
}

.tab-box li.selected {
	background-color: orange;
}

.tab-view {
	width: 506px;
	height: 100px;
	line-height: 100px;
	border: 1px solid gray;
	text-align: center;
	margin-top: -1px;
}

.tbl-ex {
	margin: 10px auto 0px auto;
	border:2px solid black;
}

.tbl-ex, .tbl-ex th, .tbl-ex td {
	border: 2px solid black;
	border-collapse: collapse;
	padding: 8px;
}

.tbl-ex th {
	background-color: #999;
	font-size: 1.1em;
	color: #fff;
	border-width: 2px 0;
	border:2px solid black;
	text-align:center;
}

.tbl-ex td {
border:2px solid black;
}

.tbl-ex tr:hover td {
	background-color: tomato;
	cursor: pointer;
}

.even {
	background-color: highlight;
}
</style>

<table class="tbl-ex" style="width:1000px;">
		<tr>
			<th style="width:150px;">보낸사람</th>
			<th style="width:400px;">쪽지내용</th>
			<th style="width:150px;">보낸시간</th>
			<th style="width:150px;">수신확인</th>
			<th style="width:150px;">쪽지삭제</th>
		</tr>
		<tr>
			<td>a</td>
			<td>HTML</td>
			<td>모든 HTML에 적용</td>
			<td>IE4, FF1,Safari 1, 크롬 1,오페라 3.5, CSS1</td>
			<td><input type="button" value="쪽지삭제"></td>
		</tr>
		<tr>
			<td>a</td>
			<td>HTML</td>
			<td>모든 HTML에 적용</td>
			<td>IE4, FF1,Safari 1, 크롬 1,오페라 3.5, CSS1</td>
			<td><input type="button" value="쪽지삭제"></td>
		</tr>
		<tr>
			<td>a</td>
			<td>HTML</td>
			<td>모든 HTML에 적용</td>
			<td>IE4, FF1,Safari 1, 크롬 1,오페라 3.5, CSS1</td>
			<td><input type="button" value="쪽지삭제"></td>
		</tr>
	</table>
	<!-- 동욱 끝 -->
	
	
</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>