<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		style="background-image: url(resources/img/min/JumBomessage.jpg);">
		<h2>ALARM</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<!-- <li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">About</li> -->
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" style="margin-bottom: 50px;">

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
	border: 2px solid black;
}

.tbl-ex, .tbl-ex th, .tbl-ex td {
	border: 2px solid white;
	border-collapse: collapse;
	padding: 8px;
}

.tbl-ex th {
	background-color: #70c745;
	font-size: 1.1em;
	color: #fff;
	border-width: 2px 0;
	border: 2px solid white;
	text-align: center;
}

.tbl-ex td {
	border: 2px dashed white;
}

.tbl-ex tr {
	background-color: #C8FE2E;
	cursor: pointer;
}

.tbl-ex tr:hover td {
	background-color: tomato;
	cursor: pointer;
}

.even {
	background-color: highlight;
}

</style>
	<form action="">
		<table class="tbl-ex"
			style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 100px;">
			<tr>
				<th>Sender</th>
				<th>Contents</th>
				<th>Sending time</th>
				<th>Checked message</th>
				<th>Delete</th>
			</tr>
			<c:forEach var="cos" items="${cos}">
			<c:if test="${!sessionScope.userVO.memberId.equals(cos.memberid)}">
				<tr>
					<td align="center">${cos.memberid}</td>
					
					<c:set var="code" value="${cos.boardcode}"/>
					<c:choose>
						<c:when test="${code==10}">
						<%-- <c:set var="url" value="${}"/> --%>
						<!-- http://localhost/project/knowledgeDetailForm?knowledgeNumber=109 -->
						<td><a href="knowledgeDetailForm?knowledgeNumber=${cos.commentoriginalnumber}#${cos.commentnumber}">${cos.commentsubject}</a></td>
						</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${code==31}">
						<td><a href="onedayclassDetailForm?onedayclassNumber=${cos.commentoriginalnumber}#${cos.commentnumber}">${cos.commentsubject}</a></td>
						</c:when>
					</c:choose>
					
				    <c:choose>
						<c:when test="${code==20}">
						<td><a href="realestateDetailForm?realestateNumber=${cos.commentoriginalnumber}#${cos.commentnumber}">${cos.commentsubject}</a></td>
						</c:when>
					</c:choose> 
					
					<td align="center">${cos.commentregdate}</td>
					<td align="center">checked</td>
					<td align="center"><input type="button" value="쪽지삭제" onclick="window.location='commentAlarmDelete?commentnumber=${cos.commentnumber}&pageNum=${pageNum}';"></td>
				</tr>
				</c:if>
			</c:forEach>

			<c:forEach var="mos" items="${mos}">
			<c:if test="${!sessionScope.userVO.memberId.equals(mos.memberid)}">
				<tr>
					<td align="center">chatting alarm</td>
					<td>${mos.chattingsubject}</td>
					<td align="center">${mos.chattingregdate}</td>
					<td align="center">checked</td>
					<td align="center"><input type="button" value="쪽지삭제" onclick="window.location='chattingAlarmDelete?chattingnumber=${mos.chattingnumber}&pageNum=${pageNum}';"></td>
				</tr>
				</c:if>
			</c:forEach>
		</table>

	</form>
</div>

<div id="page" align="center">
	<table align="center">
		<tr>
			<th align="center">
				<!-- 게시글이 있으면 --> <c:if test="${cnt > 0}">
					<!-- 처음[◀◀]/ 이전블록 --[◀ ]-->
					<c:if test="${startPage > pageBlock}">
						<a href="alarmBoard">[ ◀◀ ]</a>
						<a href="alarmBoard?pageNum=${startPage - pageBlock}">[ ◀ ]</a>
					</c:if>

					<!-- 블록내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="alarmBoard?pageNum=${i}">[${i}]</a>
						</c:if>

					</c:forEach>

					<!--  다음[▶]/첫페이지[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="alarmBoard?pageNum=${startPage + pageBlock}">[ ▶ ]</a>
						<a href="alarmBoard?pageNum=${pageCount}">[▶ ▶ ]</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>