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
	function idOK(memberId) {
		opener.document.memberInputForm.nameConfirmChk.value = "1";
		opener.document.memberInputForm.memberId.value = memberId;
		self.close();
	}
	
	function reSearch() {
		var memberId = document.nameCheckFail.memberId.value;
		opener.document.memberInputForm.nameConfirmChk.value = "0";
		window.location.href = "memberIdConfirm?memberId=" + memberId;
	}
</script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<body style="background-color:#70c745;">

	<c:if test="${selectCnt == 0}">
		<div class="container">
			<font size="40"> <b>Your name is can use</b>
			</font>
			<div class="toggle"></div>
			<div class="card">
				<div class="button-container">
					<button onclick="idOK('${memberId}');">
						<span> OK </span>
					</button>
				</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${selectCnt > 0}">
		<form name="nameCheckFail" onsubmit="reSearch();">
			<div class="container">
				<font size="40"> <b>Your name is cannot use</b>
				</font>
				<input type="text" name="memberId" required="required"
					placeholder="input your name again" style="width:430px; height:65px;">
				<div class="toggle"></div>
				<div class="card">
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