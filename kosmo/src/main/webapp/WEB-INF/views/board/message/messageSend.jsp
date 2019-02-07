<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
	<c:if test="${sendCnt==0}">
		<script type="text/javascript">
			alert("Failed to send message.");
			window.location = "alarmBoard";
		</script>
	</c:if>

	<c:if test="${sendCnt!=0}">
		<script type="text/javascript">
			alert("Have successfully sent a message.");
			window.location = "alarmBoard";
		</script>
	</c:if>
</body>
</html>