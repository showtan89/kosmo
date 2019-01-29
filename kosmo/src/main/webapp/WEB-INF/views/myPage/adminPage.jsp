<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
<link rel="stylesheet" href="resources/css/SDHcss/sdhStyle.css">
</head>
<body>
<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<%@ include file = "../setting/header01.jsp" %>


<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/ehddnr2.jpg);">
		<h2>ADMIN  PAGE</h2>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->

<table style="margin-top: 50px; margin-left:auto; margin-right:auto; margin-bottom: 50px;">
	<tr>
		<th>
			<a href="hostMemberList">
				<img src="resources/img/member/list_retex.png">
			</a>
		</th>
		<th>
			<a href="#">
				<img src="resources/img/member/unlock_retex.png">
			</a>
		</th>
	</tr>
</table>



<%@ include file = "../setting/footer01.jsp" %>	

</body>
</html>