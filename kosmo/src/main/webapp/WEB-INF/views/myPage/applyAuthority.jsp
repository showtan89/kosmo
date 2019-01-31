<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<body>

	<c:if test="${updateCnt == 0 || updateCnt == null}">
		<script type="text/javascript">
			alert("failed!");
			window.history.back();
		</script>
	</c:if>

	<c:if test="${updateCnt > 0}">
		<script type="text/javascript">
			alert("Apply complete");
			window.location.href = "addAuthority";
		</script>
	</c:if>
</body>
</html>