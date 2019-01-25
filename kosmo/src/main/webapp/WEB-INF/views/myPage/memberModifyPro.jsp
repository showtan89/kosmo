<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>
	
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("memberUpdate Fail");
			window.location.href="index";
		</script>
	</c:if>
	
	<c:if test="${updateCnt > 0}">
		<script type="text/javascript">
			alert("Your infomation is changed");
			window.location.href="myPage";
		</script>
	</c:if>
</body>
</html>