<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<title>Helper - Foriener &amp; Help HTML Template</title>

<head lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
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

<jsp:include page="../setting/header01.jsp" flush="false" />

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/min/JumBomessage.jpg);">
		<h2>Interaction</h2>
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
	</div>
</div>
<body>
	<div class="container">
		<div id="tabs" class="tabs">
			<nav>
				<ul>
					<li><a href="#section-1"><span>Comment</span></a></li>
					<li><a href="#section-2"><span>Message</span></a></li>
					<li><a href="#section-3"><span>Send Message</span></a></li>
					<li><a href="#section-4"><span>Chatting</span></a></li>
					<li><a href="#section-5"><span>Order</span></a></li>
				</ul>
			</nav>
			<div class="content" >
				<section id="section-1">
<div class="mediabox">

<table class="table table-hover" style="width: 335%;" ><!-- style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" -->
				<tr>
					<th>Sender</th>
					<th>Contents</th>
					<th>Sending time</th>
					<th>Checked message</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="cos" items="${cos}">
					<c:if test="${!sessionScope.userVO.memberId.equals(cos.memberid)}">
						<tr>
							<td>${cos.memberid}</td><!-- align="center" -->

							<c:set var="code" value="${cos.boardcode}" />
							<c:choose>
								<c:when test="${code==10}">
									<%-- <c:set var="url" value="${}"/> --%>
									<td>
									<a href="knowledgeDetailForm?knowledgeNumber=${cos.commentoriginalnumber}#${cos.commentcommentnumber}"><nobr>${cos.memberid}님이 댓글을 다셨습니다.</nobr>
									</a></td>
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
							<td><input type="button" class="btn btn-success mr-10" width="100" height="50" value="delete"
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
						<a href="section-1">[ ◀◀ ]</a>
						<a href="section-1?pageNum=${startPage - pageBlock}">[ ◀ ]</a>
					</c:if>

					<!-- 블록내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="section-1?pageNum=${i}">[${i}]</a>
						</c:if>

					</c:forEach>

					<!--  다음[▶]/첫페이지[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="section-1?pageNum=${startPage + pageBlock}">[ ▶ ]</a>
						<a href="section-1?pageNum=${pageCount}">[▶ ▶ ]</a>
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
					<table class="table table-hover" style="width: 335%;" ><!-- style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" -->
				<tr>
					<th>Sender</th>
					<th>Contents</th>
					<th>Sending time</th>
					<th>Checked message</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="mos" items="${mos}">
					<c:if test="${!sessionScope.userVO.memberId.equals(mos.memberid)}">
						<tr>
							<td>${mos.memberid}</td><!-- align="center" -->

							<td>${mos.commentregdate}</td>
							<td>checked</td>
							<td><input type="button" class="btn btn-success mr-30" value="delete"
								onclick="window.location='commentAlarmDelete?commentnumber=${mos.commentnumber}&pageNum=${pageNum}';"></td>
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
						<a href="section-2">[ ◀◀ ]</a>
						<a href="section-2?pageNum=${startPage - pageBlock}">[ ◀ ]</a>
					</c:if>

					<!-- 블록내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="section-2?pageNum=${i}">[${i}]</a>
						</c:if>

					</c:forEach>

					<!--  다음[▶]/첫페이지[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="section-2?pageNum=${startPage + pageBlock}">[ ▶ ]</a>
						<a href="section-2?pageNum=${pageCount}">[▶ ▶ ]</a>
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
					<b>Message receiving ID</b>
					&nbsp;
					<input type="text" name="recipientId" value="" style="padding:1px;border:1px solid #333;">
					<br>
					<b>CONTENT</b>
					<br>
					
					<textarea class="content" maxlength="600" style="width: 80%; height: 20%;padding:5px 5px;" name="messageContent"></textarea>
			
					<br>
					<input type="button" class="btn btn-success mr-30" value="send Message" style="padding:1px;" onclick="window.location='messageSend?pageNum=${pageNum}&recipientId=${recipientId}&messageContent=${messageContent}'">
					
				</section>
				<section id="section-4">
					<div class="mediabox">
						<img src="resources/img/03.png" alt="img03" />
						<h3>Tomato Cucumber Curd</h3>
						<p>Chickweed okra pea winter purslane coriander yarrow sweet pepper radish garlic brussels sprout groundnut summer purslane earthnut pea tomato spring onion azuki bean gourd. </p>
					</div>
					<div class="mediabox">
						<img src="resources/img/01.png" alt="img01" />
						<h3>Mushroom Green</h3>
						<p>Salsify taro catsear garlic gram celery bitterleaf wattle seed collard greens nori. Grape wattle seed kombu beetroot horseradish carrot squash brussels sprout chard.</p>
					</div>
					<div class="mediabox">
						<img src="resources/img/04.png" alt="img04" />
						<h3>Swiss Celery Chard</h3>
						<p>Celery quandong swiss chard chicory earthnut pea potato. Salsify taro catsear garlic gram celery bitterleaf wattle seed collard greens nori. </p>
					</div>
				</section>
				<section id="section-5">
					<div class="mediabox">
						<img src="resources/img/02.png" alt="img02" />
						<h3>Radish Tomato</h3>
						<p>Catsear cauliflower garbanzo yarrow salsify chicory garlic bell pepper napa cabbage lettuce tomato kale arugula melon sierra leone bologi rutabaga tigernut.</p>
					</div>
					<div class="mediabox">
						<img src="resources/img/06.png" alt="img06" />
						<h3>Fennel Wasabi</h3>
						<p>Sea lettuce gumbo grape kale kombu cauliflower salsify kohlrabi okra sea lettuce broccoli celery lotus root carrot winter purslane turnip greens garlic.</p>
					</div>
					<div class="mediabox">
						<img src="resources/img/01.png" alt="img01" />
						<h3>Red Tofu Wrap</h3>
						<p>Green horseradish azuki bean lettuce avocado asparagus okra. Kohlrabi radish okra azuki bean corn fava bean mustard tigernut wasabi tofu broccoli mixture soup.</p>
					</div>
				</section>
			</div><!-- /content -->
		</div><!-- /tabs -->
		
		
		
	</div>

<jsp:include page="../setting/footer01.jsp" flush="false" />
	<script src="resources/js/cbpFWTabs.js"></script>
	<script>
		new CBPFWTabs( document.getElementById( 'tabs' ) );
	</script
	>
</body>
</html>