<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="resources/js/request.js"></script>
<script src="resources/js/request2.js"></script>

<html>
<title>Helper - Interaction &amp; Help HTML Template</title>

<head lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/component.css" />
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--[if IE]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<link rel="stylesheet" href="resources/style.css">
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- ajax 알람  -->
<script>

function chatting() {
		//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
		if(${sessionScope.userVO != null}){
			$.getJSON("chatting", function(cnt){
				$('chatting').html(cnt); 
				
			}); }
	}
chatting();

setInterval("chatting();", 2000);//원래 2000, 개발중  60000, 시연때 2000

</script>
<meta charset="UTF-8">
<title>Chatting</title>
</head>
<body onload="chatting();">

	<table>
		<c:forEach var="chat" items="${chat}">
			<tr>
				<td id="chatting">${chat.chattingMemberId}님의 말 : <br>
					${chat.chattingContent}<a style="font-size: 7;">${chat.chattingRegdate}</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<textarea class="chattingContent" id="chattingContent" maxlength="600"
		style="width: 50%; height: 10%; padding: 5px 5px;"
		name="chattingContent"></textarea>

	<br>
	<input type="submit" class="btn btn-success mr-30" value="send message"
		style="padding: 1px;">
	
</body>
</html>