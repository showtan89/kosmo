<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<body>
		<form action="test" method="post" name="testform" enctype="multipart/form-data">
			<input type="file" id="test" name="test">
			<input type="submit" value="전송">
		</form>
	</body>
</html>