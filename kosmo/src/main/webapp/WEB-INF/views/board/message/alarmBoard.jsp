<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<!-- Core Stylesheet -->
</head>

<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<jsp:include page="../../setting/header01.jsp" flush="false" />

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/min/JumBomessage.jpg);">
		<h2>Interaction</h2>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<!-- <li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">About</li> -->
				</ol>
			</nav>
		</div>
	</div>

	<div id="tabs" class="tabs">
		<nav>
			<ul>
				<li><a href="#section-1"><span>Comment</span></a></li>
				<li><a href="#section-2"><span>Receive Message</span></a></li>
				<li><a href="#section-3"><span>Message</span></a></li>
				<li><a href="#section-4"><span>Send Message</span></a></li>
				<li><a href="#section-5"><span>Chatting</span></a></li>
			</ul>
		</nav>
		<div class="content">
			<section id="section-1">
				<div class="mediabox">

					<table class="table table-hover" style="width: 335%;">
						<!-- style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" -->
						<tr>
							<th>Sender</th>
							<th>Contents</th>
							<th>Sending time</th>
							<th>Checked message</th>
							<th>Delete</th>
						</tr>
						<c:forEach var="cos" items="${cos}">
							<c:if
								test="${!sessionScope.userVO.memberId.equals(cos.memberid)}">
								<tr>
									<td>${cos.memberid}</td>
									<!-- align="center" -->

									<c:set var="code" value="${cos.boardcode}" />
									<c:choose>
										<c:when test="${code==10}">
											<%-- <c:set var="url" value="${}"/> --%>
											<td><a
												href="knowledgeDetailForm?knowledgeNumber=${cos.commentoriginalnumber}#${cos.commentcommentnumber}"><nobr>${cos.memberid}님이
														댓글을 다셨습니다.</nobr> </a></td>
										</c:when>
									</c:choose>

									<c:choose>
										<c:when test="${code==20}">
											<td><a
												href="realestateDetailForm?realestateNumber=${cos.commentoriginalnumber}#${cos.commentcommentnumber}">${cos.commentsubject}</a></td>
										</c:when>
									</c:choose>

									<c:choose>
										<c:when test="${code==31}">
											<td><a
												href="onedayclassDetailForm?onedayclassNumber=${cos.commentoriginalnumber}#${cos.commentcommentnumber}">${cos.commentsubject}</a></td>
										</c:when>
									</c:choose>

									<td>${cos.commentregdate}</td>
									<td>checked</td>
									<td><input type="button" class="btn btn-success mr-10"
										width="100" height="50" value="delete"
										onclick="window.location='commentAlarmDelete?commentnumber=${cos.commentnumber}&pageNum=${pageNum}';"></td>
								</tr>
							</c:if>
						</c:forEach>
						<tr>
							<td colspan="5">
								<div id="page" align="center">
									<table align="center">
										<tr>
											<th align="center">
												<!-- 게시글이 있으면 --> <c:if test="${cnt > 0}">
													<!-- 처음[◀◀]/ 이전블록 --[◀ ]-->
													<c:if test="${startPage > pageBlock}">
														<a href="alarmBoard">[ ◀◀ ]</a>
														<a href="alarmBoard?pageNum=${startPage - pageBlock}">[
															◀ ]</a>
													</c:if>

													<!-- 블록내의 페이지 번호 -->
													<c:forEach var="i" begin="${startPage}" end="${endPage}">
														<c:if test="${i == currentPage}">
															<span><b>[${i}]</b></span>
														</c:if>
														<c:if test="${i != currentPage}">
															<a href="alarmBoard?pageNum=${i}">[${i}]</a>
														</c:if>

													</c:forEach>

													<!--  다음[▶]/첫페이지[▶▶] -->
													<c:if test="${pageCount > endPage}">
														<a href="alarmBoard?pageNum=${startPage + pageBlock}">[
															▶ ]</a>
														<a href="alarmBoard?pageNum=${pageCount}">[▶ ▶ ]</a>
													</c:if>
												</c:if>
											</th>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>

				</div>
			</section>
			<section id="section-2">
				<div class="mediabox">
					<table class="table table-hover" style="width: 335%;">
						<!-- style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" -->
						<tr>
							<th>Sender</th>
							<th>Contents</th>
							<th>Sending time</th>
							<th>Checked message</th>
							<th>Delete</th>
						</tr>
						<c:forEach var="mos" items="${mos}">
							<%-- <c:if test="${!sessionScope.userVO.memberId.equals(mos.messageSendId)}"> --%>
							<tr>
								<td>${mos.messageFromId}</td>
								<!-- align="center" -->

								<td><a onclick="messageContent();">${mos.messageContent}</a></td>
								<td>${mos.messageRegdate}</td>
								<td>checked</td>
								<td><input type="button" class="btn btn-success mr-30"
									value="delete"
									onclick="window.location='messageDelete?messageNumber=${mos.messageNumber}&pageNum=${pageNum}';"></td>
							</tr>

						</c:forEach>
						<tr>
							<td colspan="5">
								<div id="page" align="center">
									<table align="center">
										<tr>
											<th align="center">
												<!-- 게시글이 있으면 --> <c:if test="${cnt > 0}">
													<!-- 처음[◀◀]/ 이전블록 --[◀ ]-->
													<c:if test="${startPage > pageBlock}">
														<a href="alarmBoard">[ ◀◀ ]</a>
														<a href="alarmBoard?pageNum=${startPage - pageBlock}">[
															◀ ]</a>
													</c:if>

													<!-- 블록내의 페이지 번호 -->
													<c:forEach var="i" begin="${startPage}" end="${endPage}">
														<c:if test="${i == currentPage}">
															<span><b>[${i}]</b></span>
														</c:if>
														<c:if test="${i != currentPage}">
															<a href="alarmBoard?pageNum=${i}">[${i}]</a>
														</c:if>

													</c:forEach>

													<!--  다음[▶]/첫페이지[▶▶] -->
													<c:if test="${pageCount > endPage}">
														<a href="alarmBoard?pageNum=${startPage + pageBlock}">[
															▶ ]</a>
														<a href="alarmBoard?pageNum=${pageCount}">[▶ ▶ ]</a>
													</c:if>
												</c:if>
											</th>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</section>
			<section id="section-3" align="center">
				<b>Message receiving ID</b> &nbsp; <input type="text"
					name="messageSendId" id="messageSendId" value=""
					style="padding: 1px; border: 1px solid #333;"> <br> <br>
				<b>CONTENT</b> <br> <br>
				<textarea class="content" id="messageContent" maxlength="600"
					style="width: 80%; height: 20%; padding: 5px 5px;"
					name="messageContent"></textarea>
				<br> <br> <input type="button"
					class="btn btn-success mr-30" value="send message"
					style="padding: 1px;" onclick="sendMessage();">

			</section>
			<section id="section-4">
				<div class="mediabox">
					<table class="table table-hover" style="width: 335%;">
						<!-- style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" -->
						<tr>
							<th>Receiver</th>
							<th>Contents</th>
							<th>Sending time</th>
							<th>Checked message</th>
							<th>Delete</th>
						</tr>
						<c:forEach var="mos" items="${mos}">
							<c:if
								test="${sessionScope.userVO.memberId.equals(mos.messageFromId)}">
								<tr>
									<!-- ${!sessionScope.userVO.memberId.equals(cos.memberid)} -->
									<td>${mos.messageSendId}</td>
									<!-- align="center" -->

									<td><a onclick="messageContent();">${mos.messageContent}</a></td>
									<td>${mos.messageRegdate}</td>
									<td>checked</td>
									<td><input type="button" class="btn btn-success mr-30"
										value="delete"
										onclick="window.location='messageDelete?messageNumber=${mos.messageNumber}&pageNum=${pageNum}';"></td>
								</tr>
							</c:if>
						</c:forEach>
						<tr>
							<td colspan="5">
								<div id="page" align="center">
									<table align="center">
										<tr>
											<th align="center">
												<!-- 게시글이 있으면 --> <c:if test="${cnt > 0}">
													<!-- 처음[◀◀]/ 이전블록 --[◀ ]-->
													<c:if test="${startPage > pageBlock}">
														<a href="alarmBoard">[ ◀◀ ]</a>
														<a href="alarmBoard?pageNum=${startPage - pageBlock}">[
															◀ ]</a>
													</c:if>

													<!-- 블록내의 페이지 번호 -->
													<c:forEach var="i" begin="${startPage}" end="${endPage}">
														<c:if test="${i == currentPage}">
															<span><b>[${i}]</b></span>
														</c:if>
														<c:if test="${i != currentPage}">
															<a href="alarmBoard?pageNum=${i}">[${i}]</a>
														</c:if>

													</c:forEach>

													<!--  다음[▶]/첫페이지[▶▶] -->
													<c:if test="${pageCount > endPage}">
														<a href="alarmBoard?pageNum=${startPage + pageBlock}">[
															▶ ]</a>
														<a href="alarmBoard?pageNum=${pageCount}">[▶ ▶ ]</a>
													</c:if>
												</c:if>
											</th>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</section>
			<section id="section-5" align="center">

				Talk to everyone.<br> Share your travel information.<br>
				You may ask questions! <br> <br> <input type="button"
					class="btn btn-success mr-30" value="ChattingRoomEnter"
					style="padding: 1px;" onclick="chatting();">
			</section>
		</div>
		<!-- /content -->
	</div>
	<!-- /tabs -->
</div>


<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/cbpFWTabs.js"></script>
<script>
		new CBPFWTabs(document.getElementById('tabs'));

		function sendMessage() {
			var messageSendId = $("#messageSendId").val();
			var messageContent = $("#messageContent").val();
			window.location = 'messageSend?messageSendId=' + messageSendId
					+ '&messageContent=' + messageContent;
		}

		// 채팅 창 open
		function chatting() {
			var url = "chattingstart";
			window.open(url, "chatting", "menubar=yes, width=800, height=500");
		}
	</script>

</html>