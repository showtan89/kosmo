<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.spring.helper.vo.BoardVO.KnowledgeVO"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Helper - Foriener &amp; Help HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

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
		style="background-image: url(resources/img/ehddnr2.jpg);">
		<h2>KNOWLEDGE</h2>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" align="center" style="margin-bottom: 50px;">

	<!-- 동욱 시작 -->
	<!-- 동욱 css -->
	<link rel="stylesheet" href="resources/ehddnr.css">
	<%
		String btn_select = (String) request.getAttribute("btn_select");
		if(btn_select == null){
			btn_select="10";
		}
		String knowledgeCategory = (String) request.getAttribute("knowledgeCategory");
	%>
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
function ehddnr_select1(){
	$('#ehddnr_1').css('font-weight','bold');
	var test1 = document.getElementById("ehddnr_2");
	test1.style.removeProperty("font-weight");
}
function ehddnr_select2(){
	$('#ehddnr_2').css('font-weight','bold');
	var test1 = document.getElementById("ehddnr_1");
	test1.style.removeProperty("font-weight");
}	
$(function (){ 
	$('#btn_select').change(function(){
		location.href='knowledgeBoardList?btn_select='+$('#btn_select').val()+"&knowledgeCategory=<%=knowledgeCategory%>";		
	});
	$("#btn_select").val(<%=btn_select%>).attr("selected", true);
});
function knowledgeWriteForm(knowledgeNumber){
	window.location='knowledgeWriteForm';
}	
function knowledgeDetailForm(knowledgeNumber){
	window.location='knowledgeDetailForm?knowledgeNumber='+knowledgeNumber;
}

$(document).ready(function() {
	$(function() {
		$("#<%=knowledgeCategory%>").css("font-weight", "bold");
	});
});

function knowledgeBoardListsearch(){
	var search2 = document.ehddnrform.search.value;
	var search = "knowledgeBoardList?knowledgeCategory="+"<%=knowledgeCategory%>"+"&search="+search2;
	window.location=search+search2;
}
</script>
	
	<!-- 동욱 시작 -->
	<div class="row">
		<div class="col-12">
			<div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between" 
			style="margin:20px 0 0 0;padding-bottom:10px;">
					<!-- 이부분 바꿔야함  -->
					<div align="center"style="font-size:25px;font-weight:bold;"id="ehddnr_1" class="knowledge_div2" onclick="ehddnr_select1()">
					답변을 원하는 질문
					</div>
					<div style="font-size:25px;"id="ehddnr_2"class="knowledge_div2" align="center" onclick="ehddnr_select2()">
						답변이 완료된 질문
					</div>
			</div>
		</div>
	</div>

	<div class="row" style="margin-top: 20px;">
		<!-- 사이드바 -->
		<div class="col-12 col-md-3 col-lg-2">
			<div class="shop-sidebar-area">
				<div class="shop-widget catagory mb-50" align="left">
					<h4 class="widget-title">Categories</h4>
					<h6 class="widget-title" >
						<a id="All" class="knowledgeCategoryAteg"
							href="knowledgeBoardList?knowledgeCategory=All">All</a>
					</h6>
					<h6 class="widget-title">
						<a id="Education"class="knowledgeCategoryAteg"
							href="knowledgeBoardList?knowledgeCategory=Education">Education</a>
					</h6>
					<h6 class="widget-title">
						<a id="Computer"class="knowledgeCategoryAteg"
							href="knowledgeBoardList?knowledgeCategory=Computer">Computer</a>
					</h6>
					<h6 class="widget-title">
						<a id="Game" class="knowledgeCategoryAteg" href="knowledgeBoardList?knowledgeCategory=Game">Game</a>
					</h6>
					<h6 class="widget-title">
						<a id="entertainment"class="knowledgeCategoryAteg"
							href="knowledgeBoardList?knowledgeCategory=entertainment">Entertainment</a>
					</h6>
					<h6 class="widget-title">
						<a id="life" class="knowledgeCategoryAteg"href="knowledgeBoardList?knowledgeCategory=life">Life</a>
					</h6>
					<h6 class="widget-title">
						<a id="Health" class="knowledgeCategoryAteg"href="knowledgeBoardList?knowledgeCategory=Health">Health</a>
					</h6>
					<h6 class="widget-title">
						<a id="society"class="knowledgeCategoryAteg"
							href="knowledgeBoardList?knowledgeCategory=society">Society</a>
					</h6>
					<h6 class="widget-title">
						<a id="travel" class="knowledgeCategoryAteg"href="knowledgeBoardList?knowledgeCategory=travel">Travel</a>
					</h6>
					<h6 class="widget-title">
						<a id="sports" class="knowledgeCategoryAteg"href="knowledgeBoardList?knowledgeCategory=sports">Sports</a>
					</h6>
					<h6 class="widget-title">
						<a id="Shopping"class="knowledgeCategoryAteg"
							href="knowledgeBoardList?knowledgeCategory=Shopping">Shopping</a>
					</h6>
					<h6 class="widget-title">
						<a id="Question"class="knowledgeCategoryAteg"
							href="knowledgeBoardList?knowledgeCategory=Worry">Worry</a>
					</h6>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-9 col-lg-10">
			<div class="shop-products-area">
				<div class="row">
					<form action="knowledgeBoardList" method="post" name="ehddnrform"
						style="width: 100%; margin: 0 0 15px 0; padding: 0 5px;">
						<div id="knowledge_div3">
							<h4 style="float: left;">${knowledgeCategory}</h4>
							<div class="knowledge_select ">
								<input class=knowledge_select2 type="text" maxlength="30" name="search" id="search" placeholder=""> 
								<input class="knowledge_select3" id="SearchButton" type="button" onclick="knowledgeBoardListsearch();" value="SEARCH">
							</div>
						</div>
						<div style="margin: 15px 0;"class="search_by_terms">
							<span style="float: left"><select class="btn_select"
								name="btn_select" id="btn_select">
									<option value="10">10개 보기</option>
									<option value="20">20개 보기</option>
									<option value="30">30개 보기</option>
									<option value="40">40개 보기</option>
									<option value="50">50개 보기</option>
							</select></span>
								<div class='search_by_terms' style="float:right;">
								<button type="button" class='btn alazea-btn' onclick="knowledgeWriteForm();">QUESTION WRITE</button>
								</div>
						</div>
						<%
							Map<Integer, Integer> arr = (Map<Integer, Integer>) request.getAttribute("kcommentCnt");
							int i = 0;
						%>
					</form>
					<div class="col-12" style="margin: 0; padding: 0;" id="KnowledgeAjaxStart">
						<c:forEach var="dto" items="${dtos}">
							<div class="card flex-md-row mb-4 shadow-sm h-md-250"
								style="margin: 0; padding: 0;">
								<div class="card-body d-flex flex-column align-items-start"
									style="margin: 0; padding: 3px 3px;">
									<table class="tbl-ex" style="width: 100%;">
										<tr id="${dto.knowledgeNumber}">
											<td style="max-width: 100%; word-break: break-all;">
												<p style="margin: 0;"
													onclick="knowledgeDetailForm(${dto.knowledgeNumber});">
													<span
														style="background-color: #ffff00 !important; color: black !important">
														${dto.knowledgeReward}</span> &nbsp; &nbsp; <span><a
														href="#"><strong
															class="d-inline-block mb-2 text-success"
															style="font-size: 23px; margin: 0;">${dto.knowledgeSubject}</strong></a></span>
													<c:if test="${userVO.memberId==dto.memberId}">
														<span style="float: right; margin-right: 3px;"><a
															href="knowledgeDeleteForm?knowledgeNumber=${dto.knowledgeNumber}&pageNum=${pageNum}&btn_select=${btn_select}">삭제</a></span>
														<span style="float: right; margin-right: 20px;"><a
															href="knowledgeModifyForm?knowledgeNumber=${dto.knowledgeNumber}&pageNum=${pageNum}&btn_select=${btn_select}">수정</a></span>
													</c:if>

												</p>

												<p style="margin: 0 0 8px 0; line-height: 18px;"
													onclick="knowledgeDetailForm(${dto.knowledgeNumber});">
													<span>${dto.knowledgeContent} </span>
												</p>

												<p style="margin: 2px 0 0 0">
													<span>답변</span> <span><%=arr.get(i)%> </span>
													<%
														i++;
													%>
													<span style="margin-left: 20px;">${dto.knowledgeCategory}</span>&nbsp;&nbsp;
													<span style="margin-left: 20px;">${dto.knowledgeRegdate}</span>
													<span style="float: right; margin-right: 3px;">조회수&nbsp;${dto.knowledgeLookup}</span>
												</p>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- 페이지 -->
			<c:if test="${cnt==0}">
				<p align="center">질문을 등록해 주세요.</p>
			</c:if>
			<nav aria-label="Page navigation" style="margin-top: 30px;"
				align="center">
				<ul class="pagination" align="center" style="margin: auto auto;">
					<c:if test="${cnt>0}">
						<!-- 게시글이 있으면 -->
						<!-- 처음 ◀◀  / 이전블록◀ -->
						<c:if test="${startPage > pageBlock }">
							<li class="page-item"><a class="page-link"
								href="knowledgeBoardList?btn_select=${btn_select}&knowledgeCategory=${knowledgeCategory}"><i
									class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
							<li class="page-item"><a class="page-link"
								href="knowledgeBoardList?pageNum=${startPage-pageBlock}&btn_select=${btn_select}&knowledgeCategory=${knowledgeCategory}"><i
									class="fa fa-angle-left"></i></a></li>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li class="page-item"><a class="page-link"
									style="background-color: #28a745 !important; color: white !important">${i}</a></li>
							</c:if>
							<c:if test="${i!=currentPage}">
								<li class="page-item"><a class="page-link"
									href="knowledgeBoardList?pageNum=${i}&btn_select=${btn_select}&knowledgeCategory=${knowledgeCategory}">${i}</a></li>
							</c:if>
						</c:forEach>

						<!-- 끝 ▶▶  / 다음블록▶ -->
						<c:if test="${pageCount > endPage }">
							<li class="page-item"><a class="page-link"
								href="knowledgeBoardList?pageNum=${startPage + pageBlock}&btn_select=${btn_select}&knowledgeCategory=${knowledgeCategory}"><i
									class="fa fa-angle-right"></i></a></li>
							<li class="page-item"><a class="page-link"
								href="knowledgeBoardList?pageNum=${pageCount}&btn_select=${btn_select}&knowledgeCategory=${knowledgeCategory}"><i
									class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>
						</c:if>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	
</div>
	<!-- 동욱 끝 -->
<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>