<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/style.css">

<script type="text/javascript">
	function EmailOK(email) {
		opener.document.memberInputForm.confirmChk.value = "1";
		opener.document.memberInputForm.memberEmail.value = email;
		self.close();
	}
	
	function reSearch() {
		var email = document.eamailCheckFail.memberEmail.value;
		email = email.replace("%40", "@");
		opener.document.memberInputForm.confirmChk.value = "0";
		window.location.href = "memberConfirmidForm?email=" + email;
	}
</script> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<body style="background-color:#70c745;">

	<c:if test="${selectCnt == 0}">
		<div class="container">
			<div class="toggle"></div>
			<div class="card">
				<center>
					<font size="10">
						<b>${email} <br> is available</b>
					</font>
				</center>
				<div class="button-container">
					<button onclick="EmailOK('${email}');">
						<span> OK </span>
					</button>
				</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${selectCnt > 0}">
		<form name="eamailCheckFail" onsubmit="reSearch();">
			<div class="container">
				<input type="text" name="email" required="required"
					placeholder="input your Email" style="width:430px; height:65px;">
				<div class="toggle"></div>
				<div class="card">
				<center>
					<font size="10">
						<b>${email} <br> is not available</b>
					</font>
				</center>
					<div class="button-container">
						<button type="submit">
								<span> SEARCH </span>
						</button>
					</div>
				</div>
			</div>
		</form>
	</c:if>
	
</body>
</html>