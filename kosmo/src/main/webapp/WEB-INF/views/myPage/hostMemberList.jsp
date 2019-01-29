<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER LIST</title>
<link rel="stylesheet" href="resources/style.css">
</head>
<body>
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>

	<%@ include file="../setting/header01.jsp"%>


	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/ehddnr2.jpg);">
			<h2>MEMBER LIST</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<div class="container col-12 col-md-9 col-lg-10">
		<table class="table">

			<thead class="table-success">
				<tr>
					<th scope="col">MemberNo.</th>
					<th scope="col">Email</th>
					<th scope="col">ID</th>
					<th scope="col">Country</th>
					<th scope="col">Points</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="uvo" items="${uvos}">
					<c:if test="${uvo.authority eq 'ROLE_ADMIN'}">
						<tr style="text-align: center;">
							<td scope="row" style="background-color: #70c745; color: white;">${uvo.memberNumber}</td>
							<td scope="row">${uvo.memberEmail}</td>
							<td scope="row">${uvo.memberId}</td>
							<td scope="row">${uvo.memberCountry}</td>
							<td scope="row">${uvo.memberPoint}</td>
						</tr>
					</c:if>
				</c:forEach>

				<c:forEach var="uvo" items="${uvos}">
					<c:if test="${uvo.authority ne 'ROLE_ADMIN'}">
						<tr style="text-align: center;">
							<td scope="row">${uvo.memberNumber}</td>
							<td scope="row">${uvo.memberEmail}</td>
							<td scope="row">${uvo.memberId}</td>
							<td scope="row">${uvo.memberCountry}</td>
							<td scope="row">${uvo.memberPoint}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>


		<!-- Pagination -->
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#"><i
						class="fa fa-angle-right"></i></a></li>
			</ul>
		</nav>

		<hr>
		<hr>
		<hr>


	<div class="search_by_terms" align="center">
		<a href="#">
			<button type="button" class="btn alazea-btn">BACK</button>
		</a>
	</div>

	<br>
	<br>
	<br>
	</div>
	<%@ include file="../setting/footer01.jsp"%>
</body>
</html>