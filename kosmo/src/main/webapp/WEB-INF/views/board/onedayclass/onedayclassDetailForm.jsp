<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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
	border-radius: 150px 300px;   /* 위오른쪽 아래왼쪽을 곡선으로 만들기 */
	box-sizing: border-box;
	width: 1000px;
	height: 1000px;
	margin: 20px auto;
	border: 3px solid orange;
	overflow-x: auto;			  /* 표에서만 가로스크롤 생성 */
}
th {
	padding-top: 30%;
}

</style>



<div class = "odf_table">
<table>
  <tr>
    <td colspan="6" style="width : 400px">${dto.onedayclassImg1}</td>
  </tr>
  <tr>
    <th colspan="2" rowspan="4">${dto.memberId}</th>
    <th colspan="4">${dto.onedayclassSubject}</th>
  </tr>
  <tr>
    <td colspan="4">${dto.onedayclassGrade}</td>
  </tr>
  <tr>
    <td>${dto.onedayclassLocation}</td>
    <td>${dto.onedayclassOpendate}</td>
    <td>${dto.onedayclassRecruitment}</td>
    <td>${dto.onedayclassPrice}</td>
  </tr>
  <tr>
    <td>${dto.onedayclassLookup}</td>
    <td>${dto.onedayclassTotalpeople}</td>
    <td>${dto.onedayclassCategory}</td>
    <td>${dto.onedayclassRegdate}</td>
  </tr>
  <tr>
    <td colspan="6">${dto.onedayclassContent}</td>
  </tr>
  <tr>
    <td colspan="6">${dto.onedayclassImg2}</td>
  </tr>
  <tr>
    <td colspan="6">${dto.onedayclassImg3}</td>
  </tr>
  <tr>
    <td>${dto.onedayclassEndCheck}</td>
    <td>${dto.onedayclassDeadlineCheck}</td>
    <td colspan="2">${dto.onedayclassReservation}</td>
    <td colspan="2">${dto.onedayclassPay}</td>
  </tr>
</table>
</div>





<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>