<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>

	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("Email Confirm Fail");
		</script>
	</c:if>
	
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			alert("Email Confirm Success");
			window.location.href="loginPage";
		</script>
	</c:if>

</body>
</html>