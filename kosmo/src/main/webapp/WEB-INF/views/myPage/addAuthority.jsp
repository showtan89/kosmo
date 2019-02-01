<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Authority</title>
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/ehddnr.css">

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">
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
			<h2>Add  Authority  LIST</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<br>
	<br>
	
	<script type="text/javascript">
		function really() {
			var check = confirm("Really apply this user?");
			
			if (check == false) {
				return false;
			}
		}
	</script>

	
	<div class="container col-12 col-md-9 col-lg-10">
	<form action="applyAuthority" method="post">
		<table class="table">

			<thead class="table-success">
				<tr>
					<th scope="col" style="text-align:center;">Email</th>
					<th scope="col" style="text-align:center;">ID</th>
					<th scope="col" style="text-align:center;">AccounNo.</th>
					<th scope="col" style="text-align:center;">Controll</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="uvo" items="${uvos}">
					<tr id="lists" style="text-align: center;">
						<td scope="row" style="vertical-align: middle;">${uvo.memberEmail}</td>
						<td scope="row" style="vertical-align: middle;">${uvo.memberId}</td>
						<td scope="row" style="vertical-align: middle;">${uvo.accountNumber}</td>
						<td scope="row" style="vertical-align: middle;">
							<div class="search_by_terms" align="center">
								<c:if test="${uvo.memberTemp1 ne '2'}">
								<input type="hidden" name=memberEmail value="${uvo.memberEmail}">
								<button type="submit" class="btn alazea-btn">APPLY</button>
								</c:if>
								<c:if test="${uvo.memberTemp1 eq '2'}">
									<img src="resources/img/member/confirmed.png">
								</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</form>

		<nav aria-label="Page navigation" style="margin-top: 30px;"
			align="center">
			<ul class="pagination" align="center" style="margin: auto auto;">
				<c:if test="${cnt>0}">
					<!-- 게시글이 있으면 -->
					<!-- 처음 ◀◀  / 이전블록◀ -->
					<c:if test="${startPage > pageBlock }">
						<li class="page-item"><a class="page-link"
							href="addAuthority"><i
								class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
						<li class="page-item"><a class="page-link"
							href="addAuthority?pageNum=${startPage-pageBlock}"><i
								class="fa fa-angle-left"></i></a></li>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<li class="page-item"><a class="page-link"
								style="background-color: #28a745 !important; color: white !important">${i}</a></li>
						</c:if>
						<c:if test="${i!=currentPage}">
							<li class="page-item"><a class="page-link"
								href="addAuthority?pageNum=${i}">${i}</a></li>
						</c:if>
					</c:forEach>

					<!-- 끝 ▶▶  / 다음블록▶ -->
					<c:if test="${pageCount > endPage }">
						<li class="page-item"><a class="page-link"
							href="addAuthority?pageNum=${startPage + pageBlock}"><i
								class="fa fa-angle-right"></i></a></li>
						<li class="page-item"><a class="page-link"
							href="addAuthority?pageNum=${pageCount}"><i
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