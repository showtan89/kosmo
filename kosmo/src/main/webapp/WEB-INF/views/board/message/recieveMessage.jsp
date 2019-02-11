<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<table>
	<c:forEach var="recive" items="${recive}">
	<tr style="border-bottom:1;">
		<td> 보낸 사람 : ${recive.messageFromId} </td>
	</tr>
	
	
	<tr style="border-bottom:1;">
		<td> 내용 : ${recive.messageContent}</td>
	</tr>
	
	<tr style="border-bottom:1;">
		<td> 보낸시간 : ${recive.messageRegdate}</td>
	</tr>
	
	</c:forEach>
</table>

</body>
</html>