<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="images" value="/kosmo/resources/img/board/onedayclass/" />
	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<table>
	<tr>
		<td>${vo.oCommentNumber}</td>
		<td>${vo.memberId}</td>
		<td>${vo.oCommentRegdate}</td>
		<td><input class="input" type="text" id="oCommentContent" maxlength="50" value="${vo.oCommentContent}"></td>
		<td>
			<c:if test="${userVO.memberId == vo.memberId}">
				<input type="button" value="confirm" onclick="oCommentFunction()">
			</c:if>
		</td>
	</tr>	
</table>

<script type="text/javascript">
function oCommentFunction() {
	var oCommentNumber = "${vo.oCommentNumber}";
	var oCommentContent = $('#oCommentContent').val();

	$.ajax({
		type : "PUT",
		url: "updateComment",
		data: JSON.stringify({
			oCommentNumber: oCommentNumber,
			oCommentContent: oCommentContent
		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		success: function(result) {
			if(result == 1) {
				alert('전송에 성공했습니다.');
				window.opener.getoCommentList();
				window.self.close();
			} else if(result == 0) {
				alert('내용을 정확히 입력하세요');
			} else {
				alert('데이터베이스 오류가 발생했습니다.');
			}
		}
	});
}
</script>
<%-- <input type="hidden" name="onedayclassNumber" value="${dto.onedayclassNumber}"> --%>
</body>
</html>