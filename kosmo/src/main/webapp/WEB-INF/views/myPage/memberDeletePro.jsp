<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<body>
<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<c:if test="${updateCnt == 1}">
	<script type="text/javascript">
		<% session.invalidate(); %>
		window.location.href="goodBye";
	</script>
</c:if>

<c:if test="${selectCnt == 0 || selectCnt == null}">
	<script type="text/javascript">
		alert("Password is incorrect.");
		window.history.back();
	</script>
</c:if>

</body>
</html>