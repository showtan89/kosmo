<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<body>

	<c:if test="${insertCnt < 1}">
		<script type="text/javascript">
			alert("회원가입에 실패했습니다.");
		</script>
	</c:if>
	
	<c:if test="${insertCnt > 0}">
		<script type="text/javascript">
			alert("Join protocol is almost over, Check your Email box and click link to end protocol");
			window.location.href = "index";
		</script>
	</c:if>
</body>
</html>