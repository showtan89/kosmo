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
	<c:if test="${userVO.memberId != null}">
	<input type="hidden" id="loginId" value="${userVO.memberId}">
	</c:if>
	<c:if test="${userVO.memberId == null}">
	<input type="hidden" id="loginId" value="1">
	</c:if>
	<%
		String btn_select = (String) request.getAttribute("btn_select");
		if(btn_select == null){
			btn_select="10";
		}
		String knowledgeCategory = (String) request.getAttribute("knowledgeCategory");
	%>
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">


function knowledgeWriteForm(knowledgeNumber){
	window.location='knowledgeWriteForm';
}	
function knowledgeDetailForm(knowledgeNumber){
	window.location='knowledgeDetailForm?knowledgeNumber='+knowledgeNumber;
}

</script>
	<input type="hidden" name="selectchk" value="left" id="selectchk">
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
							onclick="getknowledgelist('All');">All</a>
					</h6>
					<h6 class="widget-title">
						<a id="Education" class="knowledgeCategoryAteg"
							onclick="getknowledgelist('Education');">Education</a>
					</h6>
					<h6 class="widget-title">
						<a id="Computer"class="knowledgeCategoryAteg"
							onclick="getknowledgelist('Computer');">Computer</a>
					</h6>
					<h6 class="widget-title">
						<a id="Game" class="knowledgeCategoryAteg" 
						onclick="getknowledgelist('Game');">Game</a>
					</h6>
					<h6 class="widget-title">
						<a id="entertainment"class="knowledgeCategoryAteg"
							onclick="getknowledgelist('Entertainment');">Entertainment</a>
					</h6>
					<h6 class="widget-title">
						<a id="life" class="knowledgeCategoryAteg"
						onclick="getknowledgelist('life');">Life</a>
					</h6>
					<h6 class="widget-title">
						<a id="Health" class="knowledgeCategoryAteg"
						onclick="getknowledgelist('Health');">Health</a>
					</h6>
					<h6 class="widget-title">
						<a id="society"class="knowledgeCategoryAteg"
							onclick="getknowledgelist('Society');">Society</a>
					</h6>
					<h6 class="widget-title">
						<a id="travel" class="knowledgeCategoryAteg"
						onclick="getknowledgelist('Travel');">Travel</a>
					</h6>
					<h6 class="widget-title">
						<a id="sports" class="knowledgeCategoryAteg"
						onclick="getknowledgelist('Sports');">Sports</a>
					</h6>
					<h6 class="widget-title">
						<a id="Shopping"class="knowledgeCategoryAteg"
							onclick="getknowledgelist('Shopping');">Shopping</a>
					</h6>
					<h6 class="widget-title">
						<a id="Question"class="knowledgeCategoryAteg"
							onclick="getknowledgelist('Worry');">Worry</a>
					</h6>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-9 col-lg-10">
			<div class="shop-products-area">
				<div class="row">
					<div name="ehddnrform"
						style="width: 100%; margin: 0 0 15px 0; padding: 0 5px;">
						<div id="knowledge_div3">
							<h4 style="float: left;"id="titlecatagory" class="knowledgeup">All</h4>
							<div class="knowledge_select ">
								<input class=knowledge_select2 type="text" maxlength="30" name="search" id="search" placeholder=""> 
								<input class="knowledge_select3" id="SearchButton" type="button" onclick="knowledgeBoardListsearch();" value="SEARCH">
							</div>
						</div>
						<div style="margin: 15px 0;"class="search_by_terms">
							<span style="float: left"><select class="btn_select"
								name="btn_select" id="btn_select">
									<option value="10" selected>10개 보기</option>
									<option value="20">20개 보기</option>
									<option value="30">30개 보기</option>
									<option value="40">40개 보기</option>
									<option value="50">50개 보기</option>
							</select></span>
								<div class='search_by_terms' style="float:right;">
								<button type="button" class='btn alazea-btn' onclick="knowledgeWriteForm();">QUESTION WRITE</button>
								</div>
						</div>
					</div>
					
					<div class="col-12" style="margin: 0; padding: 0;" id="KnowledgeAjaxStart">
						
					</div>
				</div>
			</div>

			<!-- 페이지 -->
			
			<nav aria-label="Page navigation" style="margin-top: 30px;" align="center" id="pagestr">
				
			</nav>
		</div>
	</div>
	
</div>
	<!-- 동욱 끝 -->
<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->
<script src="resources/js/knowledgestate.js"></script>
<script>
$(function(){
	getknowledgelistJsonData();
});
function getknowledgelist(catagory){
	var text1 = catagory;
	$('#titlecatagory').text(text1);
	$(function(){
		getknowledgelistJsonData();
	});
}
$(function (){ 
	$('#btn_select').change(function(){
		$(function(){
			getknowledgelistJsonData();
		});
	});
	
});
function knowledgeBoardListsearch(){
	getknowledgelistJsonData();
	$('#search').val(null);
}
function ehddnr_select1(){
	$('#ehddnr_1').css('font-weight','bold');
	var test1 = document.getElementById("ehddnr_2");
	test1.style.removeProperty("font-weight");
	
	$('#selectchk').val('left');
	getknowledgelistJsonData();
}
function ehddnr_select2(){
	$('#ehddnr_2').css('font-weight','bold');
	var test1 = document.getElementById("ehddnr_1");
	test1.style.removeProperty("font-weight");
	 
	$('#selectchk').val('right');
	getknowledgelistJsonData();
	
}	
</script>
</body>

</html>