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
	width: 1800px;
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

<form action="onedayclassWritePro" method="post" name="onedayclassWritePro" onsubmit="return writeCheck()">
<%-- <input type="hidden" name="onedayclassNumber" value="${dto.onedayclassNumber}"> --%>
<%-- <input type="hidden" name="pageNum" value="${pageNum}"> --%>

<div class = "odf_table">
<table>
  <tr>
    <td colspan="6" style="width : 400px"> 메인사진 <pre>
<%--     		<input class="input" type="file" name="onedayclassImg1" id="onedayclassImg1" maxlength="50"
						value="${images}${dto.onedayclassImg1}" style="width:270px"> --%>			
    </td>
  </tr>
  <tr>
    <th colspan="4"> 개설클래스 제목 <pre>
    	<input class="input" type="text" name="onedayclassSubject" maxlength="50" placeholder="클래스 제목을 입력하세요">
    </th>
  </tr>
  <tr>
    <th colspan="4">평점</th>
  </tr>
  <tr>
    <th> 위치 <pre>
    	<input class="input" type="text" name="onedayclassLocation" maxlength="50" placeholder="위치를 입력하세요">
    </th>
    <th> 오픈일 <pre>
    </th>
    <th> 모집인원 <pre>
    	<input class="input" type="text" name="onedayclassRecruitment" maxlength="50" placeholder="모집인원을 입력하세요">
    </th>   
    <th> 가격 <pre>
    	<input class="input" type="number" name="onedayclassPrice" maxlength="50" placeholder="가격을 입력하세요">
    </th>
  </tr>
  <tr>
    <th> 조회수 <pre></th>
    <th> 누적인원 <pre></th>
    <th> 카테고리 <pre>
    	<input class="input" type="text" name="onedayclassCategory" maxlength="50" placeholder="카테고리를 입력하세요">
    </th>
    <th>작성일 <pre> </th>
  </tr>
  <tr>
    <td colspan="6">글 내용 <pre>
    	<textarea class="input" rows="10" cols="80" name="onedayclassContent" placeholder="글내용을 입력하세요" word-break:break-all></textarea>
    </td>
  </tr>
  <tr>
    <td colspan="6">사진2 <pre>
<%--     	<input class="input" type="file" name="onedayclassImg2" id="onedayclassImg2" maxlength="50"
						value="${images}${dto.onedayclassImg2}" style="width:80%"> --%>						
    </td>
  </tr>
  <tr>
    <td colspan="6">사진3 <pre>
<%--     	<input class="input" type="file" name="onedayclassImg3" id="onedayclassImg3" maxlength="50"
						value="${images}${dto.onedayclassImg3}" style="width:80%"> --%>

    </td>
  </tr>
  <tr>
    <td>종료여부 <pre></td>
    <td>마감여부 <pre>
    	<input class="input" type="text" name="onedayclassDeadlineCheck" maxlength="50" placeholder="마감여부를 입력하세요">
    </td>
    <td colspan="2">예약 <pre></td>
    <td colspan="2">결제 <pre></td>
  </tr>
</table>
</div>

<%-- <c:if test="${userVO.memberId} == ${dto.memberId}"> --%>
	<table style="margin-left: auto; margin-right: auto;">
		<th colspan="2">
			<input class="inputButton" type="submit" value="작성">
			<input class="inputButton" type="reset" value="취소">
			<input class="inputButton" type="button" value="목록"
					onclick="window.location='onedayclassBoardList'">
		</th>
	</table>
<%-- </c:if> --%>



<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>