<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Quit protocol is over. good bye.</title>

<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/css/login.css">

<script type="text/javascript">
	function goMain() {
		setTimeout('done()', 4500);
	}
	
	function done() {
		window.location.href="index";
	}
</script>
</head>
<body onload="goMain();">
	<div style="width:100%;height:500px; margin-top: 18%" align="center">
	<img src="resources/img/member/goodBye.png" style="z-index: 5;">
	</div>
</body>
</html>