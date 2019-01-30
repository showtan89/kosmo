<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Authority</title>
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
			<h2>Add  Authority LIST</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<br>
	<br>

	<div class="container col-12 col-md-9 col-lg-10">
		<table class="table">

			<thead class="table-success">
				<tr>
					<th scope="col" style="text-align:center;">Email</th>
					<th scope="col" style="text-align:center;">ID</th>
					<th scope="col" style="text-align:center;">Controll</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="uvo" items="${uvos}">
					<tr id="lists" style="text-align: center; ">
						<td scope="row">${uvo.memberEmail}</td>
						<td scope="row">${uvo.memberId}</td>
						<td scope="row">
							<div class="search_by_terms" align="center">
								<button type="button" class="btn alazea-btn" onclick="apply('${uvo.memberEmail}');">APPLY</button>
							</div>
							<div class="search_by_terms" align="center">
								<button type="button" class="btn alazea-btn" onclick="decline('${uvo.memberEmail}');">DECLINE</button>
							</div>
						</td>
						<td scope="row">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${uvo.memberRegdate}"/>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<nav aria-label="Page navigation" style="margin-top: 30px;"
			align="center">
			<ul class="pagination" align="center" style="margin: auto auto;">
				<c:if test="${cnt>0}">
					<!-- 게시글이 있으면 -->
					<!-- 처음 ◀◀  / 이전블록◀ -->
					<c:if test="${startPage > pageBlock }">
						<li class="page-item"><a class="page-link"
							href="hostMemberList"><i
								class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
						<li class="page-item"><a class="page-link"
							href="hostMemberList?pageNum=${startPage-pageBlock}"><i
								class="fa fa-angle-left"></i></a></li>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<li class="page-item"><a class="page-link"
								style="background-color: #28a745 !important; color: white !important">${i}</a></li>
						</c:if>
						<c:if test="${i!=currentPage}">
							<li class="page-item"><a class="page-link"
								href="hostMemberList?pageNum=${i}">${i}</a></li>
						</c:if>
					</c:forEach>

					<!-- 끝 ▶▶  / 다음블록▶ -->
					<c:if test="${pageCount > endPage }">
						<li class="page-item"><a class="page-link"
							href="khostMemberList?pageNum=${startPage + pageBlock}"><i
								class="fa fa-angle-right"></i></a></li>
						<li class="page-item"><a class="page-link"
							href="hostMemberList?pageNum=${pageCount}"><i
								class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>
					</c:if>
				</c:if>
			</ul>
		</nav>
	<hr>
	
	<br>

	<div class="search_by_terms" align="center">
		<button type="button" class="btn alazea-btn" onclick="window.history.back();">BACK</button>
	</div>

	<br>
	<br>
	<br>
	</div>
	<%@ include file="../setting/footer01.jsp"%>
</body>
</html>