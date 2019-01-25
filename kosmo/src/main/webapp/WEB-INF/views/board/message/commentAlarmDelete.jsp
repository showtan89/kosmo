<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
	<c:if test="${deleteCnt==0}">
		<script type="text/javascript">
			alert("Failed to delete alarm.1");
			window.location = "alarmBoard";
		</script>
	</c:if>

	<c:if test="${deleteCnt!=0}">
		<script type="text/javascript">
			alert("The alarm deletion is complete.");
			window.location = "alarmBoard";
		</script>
	</c:if>
</body>
</html>