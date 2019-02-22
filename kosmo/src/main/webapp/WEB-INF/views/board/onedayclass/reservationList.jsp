<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
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


	<table class="table" style="width:100%" align="center">
		<tr>
			<th colspan="11" align="center" style="height:25px">
				글목록(글갯수 : ${cnt}) &nbsp;&nbsp;&nbsp;&nbsp;	
			</th>	
		</tr>
		<tr>
			<th style="width:10%"> 클래스제목 </th>
			<th style="width:5%"> 클래스카테고리 </th>
			<th style="width:10%"> 클래스오픈일 </th>
			<th style="width:10%"> 클래스위치 </th>
			<th style="width:5%"> 클래스가격 </th>
			<th style="width:5%"> 클래스종료 </th>
			<th style="width:5%"> 클래스마감 </th>
			<th style="width:10%"> 예약인원 </th>
			<th style="width:10%"> 예약자 회원번호 </th>
			<th style="width:15%"> 예약자 이메일 </th>
			<th style="width:10%"> 예약자 아이디 </th>
		</tr>
		<!-- 게시글이 없으면 -->
		<c:if test="${cnt > 0}">
			<!-- items="${dtos}" : ArrayList<BoardVO> : 게시글 목록
				 var="dto" : 작은 바구니 - 게시글 1건 
				 ==> 게시글 목록에 5건이 있다면 5회(ArrayList에서 꺼내서 dto에 담은 다음 출력)
				 -->
			<c:set var = "tempNumber" value="" />	 
			<c:forEach var="dto" items="${dtos3}">
				<tr>
				<c:if test="${dto.ONEDAYCLASSNUMBER ne tempNumber}">
					<td>
						${dto.ONEDAYCLASSSUBJECT}
					</td>					
					<td>
						${dto.ONEDAYCLASSCATEGORY}
					</td>
					<td>
						${dto.ONEDAYCLASSOPENDATE}
					</td>
					<td>
						${dto.ONEDAYCLASSLOCATION}
					</td>
					<td>
						${dto.ONEDAYCLASSPRICE}
					</td>
					<td>
						${dto.ONEDAYCLASSENDCHECK}
					</td>
					<td>
						${dto.ONEDAYCLASSDEADLINECHECK}
					</td>
					<td>
						${dto.ONEDAYCLASSTOTALPEOPLE}
					</td>
				</c:if>	
				
				<c:if test="${dto.ONEDAYCLASSNUMBER eq tempNumber}">
					<td style="border-top: 0px">
					</td>					
					<td style="border-top: 0px">
					</td>
					<td style="border-top: 0px">
					</td>
					<td style="border-top: 0px">
					</td>
					<td style="border-top: 0px">
					</td>
					<td style="border-top: 0px">
					</td>
					<td style="border-top: 0px">
					</td>
					<td style="border-top: 0px">
					</td>
				</c:if>
					<c:set var = "tempNumber" value="${dto.ONEDAYCLASSNUMBER}" />	
					<td>
						${dto.RESERVATEDPERSONNUMBER}
					</td>
					<td>
						${dto.RESERVATIONEMAIL}
					</td>
					<td>
						${dto.RESERVATIONID}
					</td>
				</tr>
			</c:forEach>
							
		</c:if>
		<!-- 게시글이 없으면 -->
		<c:if test="${cnt == 0}">
			<tr>
				<td colspan="11" align="center">
					개설한 클래스가 없습니다. 클래스를 작성해 주세요!!
				</td>
			</tr>
		</c:if>			


<%-- 	<!-- 페이지 컨트롤 -->
	<table style="width:1000px" align="center">
		<tr>
			<th align="center">
				<!-- 게시글이 있으면 -->
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀]/ 이전블록[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="reservationList">[◀◀]</a>
						<a href="reservationList?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<!--  블록내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="reservationList?pageNum=${i}">[${i}]</a>
						</c:if>
						
						
					</c:forEach>
					
					<!-- 다음블록[▶]/ 끝[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="reservationList?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="reservationList?pageNum=${pageCount}">[▶▶]</a>
					</c:if>								
				</c:if>
			</th>
		</tr>
	</table> --%>















</table>
	
</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->


</body>
</html>