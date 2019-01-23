<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="images" value="/kosmo/resources/img/board/onedayclass/" />
	
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
		<h2>ONEDAYCLASS</h2>
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

<style>

.odf_table {
	/* border-radius: 150px 300px; */   /* 위오른쪽 아래왼쪽을 곡선으로 만들기 */
	box-sizing: border-box;
	width: 1300px;
	height: 3000px;
	margin: 20px auto;
	border: 3px solid orange;
	/* overflow-x: auto; */			  /* 표에서만 가로스크롤 생성 */
	text-align: center;
	font-size: x-large;
}
th {
	padding-top: 3%;
	font-weight: bold;
	width: 1000px;
	verical-align: middle;
	border-bottom: 1px solid #ccc;
}
td {
	border: 3px solid orange;
	height: 200px;
}

</style>

<form action="onedayclassModifyPro" method="post" name="onedayclassModifyPro" onsubmit="return modifyCheck()">
<input type="hidden" name="onedayclassNumber" value="${dto.onedayclassNumber}">
<%-- <input type="hidden" name="pageNum" value="${pageNum}"> --%>

<div class = "odf_table">
<table>
  <tr>
    <%--<td colspan="6" style="width : 400px">
    		<input class="input" type="file" name="onedayclassImg1" id="onedayclassImg1" maxlength="50"
						value="${images}${dto.onedayclassImg1}" style="width:270px">
    	</td> --%>
    <td colspan="6" style="width : 400px"><img src="resources/img/board/onedayclass/odc9.jpg" style="width:100%"></td>
  </tr>
  <tr>
    <th colspan="2" rowspan="4">${dto.memberId}</th>
    <th colspan="4">
    	<input class="input" type="text" name="onedayclassSubject" maxlength="50" value="${dto.onedayclassSubject}" style="width:100%">
    </th>
  </tr>
  <tr>
    <th colspan="4">${dto.onedayclassGrade}</th>
  </tr>
  <tr>
    <th>
    	<input class="input" type="text" name="onedayclassLocation" maxlength="50" value="${dto.onedayclassLocation}">
    </th>
    <th>
    	${dto.onedayclassOpendate}
    </th>
    <th>
    	<input class="input" type="text" name="onedayclassRecruitment" maxlength="50" value="${dto.onedayclassRecruitment}">
    </th>   
    <th>
    	<input class="input" type="text" name="onedayclassPrice" maxlength="50" value="${dto.onedayclassPrice}">
    </th>
  </tr>
  <tr>
    <th>${dto.onedayclassLookup}</th>
    <th>${dto.onedayclassTotalpeople}</th>
    <th>
    	<input class="input" type="text" name="onedayclassCategory" maxlength="50" value="${dto.onedayclassCategory}" style="width:100%">
    </th>
    <th>${dto.onedayclassRegdate}</th>
  </tr>
  <tr>
    <td colspan="6">
    	<textarea class="input" rows="10" cols="80" name="onedayclassContent" word-break:break-all>${dto.onedayclassContent}</textarea>
    </td>
  </tr>
<%--   <tr>
    <td colspan="6">
    	<input class="input" type="file" name="onedayclassImg2" id="onedayclassImg2" maxlength="50"
						value="${images}${dto.onedayclassImg2}" style="width:100%">
    </td>
  </tr>
  <tr>
    <td colspan="6">
    	<input class="input" type="file" name="onedayclassImg3" id="onedayclassImg3" maxlength="50"
						value="${images}${dto.onedayclassImg3}" style="width:100%">
    </td>
  </tr> --%>
  <tr>
    <td>${dto.onedayclassEndCheck}</td>
    <td>
    	<input class="input" type="text" name="onedayclassDeadlineCheck" maxlength="50" value="${dto.onedayclassDeadlineCheck}">
    </td>
    <td colspan="2">${dto.onedayclassReservation}</td>
    <td colspan="2">${dto.onedayclassPay}</td>
  </tr>
</table>
</div>

<%-- <c:if test="${userVO.memberId} == ${dto.memberId}"> --%>
	<table style="margin-left: auto; margin-right: auto;">
		<th colspan="2">
			<input class="inputButton" type="submit" value="수정완료">
			<input class="inputButton" type="reset" value="수정취소" onclick="window.history.back()">
		</th>
	</table>
<%-- </c:if> --%>



<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>