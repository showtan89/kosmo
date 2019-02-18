<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="resources/js/request.js"></script>
<script src="resources/js/request2.js"></script>

<html>
<title>Helper - Interaction &amp; Help HTML Template</title>

<head lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/component.css" />
<meta charset="UTF-8">
<meta name="description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<link rel="stylesheet" href="resources/style.css">
<!--[if IE]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]--!>


<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->

<style type="text/css">

/* The Modal (background) */
.w3-modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 9999999999; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: #70c745; /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.w3-modal-content {
	border: solid 5px;
	border-color: #70c745;
	background-color: #dcf1d1;
	margin: 15% auto; /* 15% from the top and centered */
	margin-top: 10%;
	padding: 20px;
	border: 2px solid #888;
	width: 50%;
	max-width: 1080px;
	max-height: 600px;
	overflow-y: auto;
}

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

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
		<!-- id="container" -->
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
				<ul class="tab">
					<li><a href="#section-1"><span>Comment</span></a></li>
					<li><a href="#section-2"><span>RecMsg</span></a></li>
					<li><a href="#section-3"><span>Message</span></a></li>
					<li><a href="#section-4"><span>SendMsg</span></a></li>
					<li><a href="#section-5"><span>Chatting</span></a></li>
				</ul>
			</nav>
			<div class="content">
				<!-- id="content" -->
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
								<c:if test="${sessionScope.userVO.memberEmail.equals(cos.memberemail)}">
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
										
										<c:choose>
											<c:when test="${code==69}">
												<td><a
													href="weather?type=earthquake">${cos.commentsubject}</a></td>
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
								<th>Reply message</th>
								<th>Delete</th>
							</tr>
							<c:forEach var="mos" items="${mos}">
								<%-- <c:if test="${!sessionScope.userVO.memberId.equals(mos.messageSendId)}"> --%>
								<tr>
									<td id="messageFromIdR">${mos.messageFromId}</td>
									<!-- align="center" -->

									<td><a id="messageContentR"
										onclick="recieveMessage('${mos.messageFromId}','${mos.messageContent}','${mos.messageRegdate}');">
											${mos.messageContent}</a></td>

									<td id="messageRegdateR">${mos.messageRegdate}</td>

									<td><input type="button" id="reply"
										class="btn btn-success mr-30" value="reply"
										onclick="reply('${mos.messageFromId}');"> <!-- <a href="#section-3" class="btn btn-success mr-30"><span>reply</span></a> -->
									</td>
									<td><input type="button" class="btn btn-success mr-30"
										value="delete"
										onclick="window.location='messageDelete?messageNumber=${mos.messageNumber}&pageNum=${pageNum}';"></td>
								</tr>
<!-- <div id="id01" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">

				sender :
				<p id="msgfromId"></p>
				<hr>
				content :
				<p id="msgContent"></p>
				<hr>
				sent date :
				<p id="msgRegdate"></p>
				<input type="hidden" id="hiddenId">
				<p>
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="btn btn-success mr-30" value="close">close</span>
					&nbsp; &nbsp;
					
					<input type="button" id="reply"
										class="btn btn-success mr-30" value="reply"
										onclick="reply('');">
				</p>
			</div>
		</div>
	</div>
	-->							
<div id="id02" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<form action="messageSend" method="post">
				
				<p>Message receiving ID :&nbsp;<input type="text" id="messageSendId" name="messageSendId" value="${mos.messageFromId}"></p> 
				 
				
				 <!-- 
				<input type="text" name="messageSendId" id="messageSendId"
						style="padding: 1px; border: 1px solid #333;"> -->
				<hr>
				<b>CONTENT</b> <br> <br>
					<textarea class="content" name="messageContent2" id="messageContent2"
					maxlength="600" style="width: 80%; height: 20%; padding: 5px 5px;"></textarea>
				<hr>
				<p>
					<span
						onclick="document.getElementById('id02').style.display='none'"
						class="btn btn-success mr-30" value="close">close</span>
					&nbsp; &nbsp;
					<input type="submit" class="btn btn-success mr-30" value="reply" name="sendMessage">
				</p>
				</form>
		</div>
	</div>
</div> 

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
						name="messageSendId" id="messageSendId"
						style="padding: 1px; border: 1px solid #333;"> <br> <br>
					<b>CONTENT</b> <br> <br>
					<textarea class="content" name="messageContent1" id="messageContent1"
						maxlength="600" style="width: 80%; height: 20%; padding: 5px 5px;"></textarea>
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
								<th>Delete</th>
							</tr>
							<c:forEach var="sml" items="${sml}">
								
								<c:if test="${sessionScope.userVO.memberId eq sml.fMessageFromid}">
									<tr>
										<td>${sml.fMessageSendid}</td>

										<td><a>${sml.fMessageContent}</a></td>
										<td>${sml.fMessageRegdate}</td>
										<td><input type="button" class="btn btn-success mr-30"
											value="delete"
											onclick="window.location='fMessageDelete?fMessageNumber=${sml.fMessageNumber}&pageNum=${pageNum}';"></td>
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
						In this chat room, there are people of the same nationality as you.<br>
						If you are lonely or have difficulty with perfume, <br>
						try to strengthen friendship and comfort here.<br><br>
						<input type="button"
						class="btn alazea-btn mr-30" value="ChattingRoomEnter"
						style="padding: 1px;" onclick="chatting();">
						<br><br><hr><br>
					
					In this chat room, there are all foreigners who use this site.<br>
					It's a pleasant room that's spoken in each other's language. <br><br>
					<input type="button"
						class="btn alazea-btn mr-30" value="ChattingRoomEnter"
						style="padding: 1px;" onclick="chattingAll();">
				</section>
			</div>
			<!-- /content -->
		</div>
		<!-- /tabs -->

	</div>
	<!-- /container -->

	<div id="id01" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">

				sender :
				<p id="msgfromId"></p>
				<hr>
				content :
				<p id="msgContent"></p>
				<hr>
				sent date :
				<p id="msgRegdate"></p>
				<input type="hidden" id="hiddenId">
				<p>
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="btn btn-success mr-30" value="close">close</span>
					&nbsp; &nbsp;
					
					<input type="button" id="reply"
										class="btn btn-success mr-30" value="reply"
										onclick="reply('');">
				</p>
			</div>
		</div>
	</div>

<!-- <div id="id02" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<form action="messageSend" method="post">
				<b>
				Message receiving ID :
				</b> 
				
				<input type="text" name="messageSendId" id="messageSendId"
						value="" style="padding: 1px; border: 1px solid #333;">
				<hr>
				<b>CONTENT</b> <br> <br>
					<textarea class="content" name="messageContent" id="messageContent"
					maxlength="600" style="width: 80%; height: 20%; padding: 5px 5px;"></textarea>
				<hr>
				<p>
					<span
						onclick="document.getElementById('id02').style.display='none'"
						class="btn btn-success mr-30" value="close">close</span>
					&nbsp; &nbsp;
					<input type="" class="btn btn-success mr-30" value="reply" name="sendMessage">
				</p>
				</form>
		</div>
	</div>
</div> 
 -->
	
	
</body>
<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/cbpFWTabs.js"></script>
<script>
		new CBPFWTabs(document.getElementById('tabs'));

		// 메세지 보내기 값
		function sendMessage() {
			var messageSendId = $("#messageSendId").val();
			var messageContent1 = $("#messageContent1").val();
			var messageContent2 = $("#messageContent2").val();
			window.location = 'messageSend?messageSendId=' + messageSendId
					+ '&messageContent1=' + messageContent1+ '&messageContent2=' + messageContent2;
		}
		
		//메세지 상세보기 팝업창
		function recieveMessage(id,content,regdate) {
			
			$('#msgfromId').html(id)
			document.getElementById('id01').style.display='block';
			
			$('#msgContent').html(content)
			document.getElementById('id01').style.display='block';
			
			$('#msgRegdate').html(regdate)
			document.getElementById('id01').style.display='block';
			
	
			
			
		}
		
		 //메세지 답장하기
		function reply(id) {
			$('#hiddenId').val(id);
			
			$('#messageSendId').html(id)
			document.getElementById('id02').style.display='block';
			
			$('#messageContent').html()
			document.getElementById('id02').style.display='block';
			
			$('#msgfromId').html(id)
			document.getElementById('id01').style.display='none';
			
			$('#msgContent').html(content)
			document.getElementById('id01').style.display='none';
			
			$('#msgRegdate').html(regdate)
			document.getElementById('id01').style.display='none';
		}
			
			/* $('#section-2').one(function(){
				$('#section-2').hide();
			})
			$('#section-3').one(function(){
				$('#section-3').show("",function(){
					$('.messageSendId').val(id);
			}); */

		//국가 채팅 창 open
		function chatting() {
			var url = "chattingstart";
			window.open(url, "chatting", "menubar=yes, width=800, height=500");
		}
			
		// 세계 채팅 창 open
		function chattingAll(){
			var url = "chattingWorld";
			window.open(url, "chattingAll", "menubar=yes, width=800, height=500");
		}
		
	</script>

</html>