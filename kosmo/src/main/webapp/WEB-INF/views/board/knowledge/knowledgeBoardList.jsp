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
<div class="container" style="margin-bottom: 50px;">

	<!-- 동욱 시작 -->
	<!-- 동욱 css -->
	<link rel="stylesheet" href="resources/ehddnr.css">
	<%
		String btn_select = (String) request.getAttribute("btn_select");
	%>
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
function ehddnr_select1(){
	$('#ehddnr_1').css('border-bottom','2px solid black');
	$('#ehddnr_1').css('font-weight','bold');
	$('#ehddnr_2').css('border','none');
	$('#ehddnr_2').css('font-weight','none');
}
function ehddnr_select2(){
	$('#ehddnr_2').css('border-bottom','2px solid black');
	$('#ehddnr_2').css('font-weight','bold');
	$('#ehddnr_1').css('border','none');
	$('#ehddnr_1').css('font-weight','none');
}	
$(function (){ 
	$('#btn_select').change(function(){
		location.href='knowledgeBoardList?btn_select='+$('#btn_select').val();		
	});
	$("#btn_select").val(<%=btn_select%>).attr("selected", true);
});
function knowledgeWriteForm(knowledgeNumber){
	window.location='knowledgeWriteForm';
}	
function knowledgeDetailForm(knowledgeNumber){
	window.location='knowledgeDetailForm?knowledgeNumber='+knowledgeNumber;
}
</script>
	<div id="knowledge_div" align="center">
		<div class="knowledge_div2" id="ehddnr_1"
			style="padding: 0; margint: 0; border-bottom: 2px solid black;">
			<button
				style="padding: 0; margint: 0; font-size: 25px; background: none; border: none; width: 100%; height: 100%;"
				onclick="ehddnr_select1()">답변을 기다리는 질문</button>
		</div>
		<div class="knowledge_div2" id="ehddnr_2">
			<button
				style="padding: 0; margint: 0; font-size: 25px; background: none; border: none; width: 100%; height: 100%;"
				onclick="ehddnr_select2()">답변이 완료된 질문</button>
		</div>
		<form action="ehddnr" method="post" name="ehddnrform">
			<div id="knowledge_div3">
				<h4 class="knowledge_h4">
					카테고리 <select class="knowledgeCategory" name="knowledgeCategory"
						id="knowledgeCategory">
						<option value="전체">전체</option>
						<option value="교육, 학문">교육, 학문</option>
						<option value="컴퓨터통신">컴퓨터통신</option>
						<option value="게임">게임</option>
						<option value="엔터테이먼트, 예술">엔터테이먼트, 예술</option>
						<option value="생활">생활</option>
						<option value="건강">건강</option>
						<option value="사회, 정치">사회, 정치</option>
						<option value=경제>경제</option>
						<option value="여행">여행</option>
						<option value="스포츠,레저">스포츠,레저</option>
						<option value="쇼핑">쇼핑</option>
						<option value="고민Q&A">고민Q&A</option>
					</select>
				</h4>
				<div class="knowledge_select">
					<input class=knowledge_select2 type="text" maxlength="30"
						name="search" placeholder=""> <input
						class="knowledge_select3" type="submit" value="찾기">
				</div>
			</div>
			<div style="margin: 15px 0;">
				<span style="float: left"><select class="btn_select"
					name="btn_select" id="btn_select">
						<option value="10">10개 보기</option>
						<option value="20">20개 보기</option>
						<option value="30">30개 보기</option>
						<option value="40">40개 보기</option>
						<option value="50">50개 보기</option>
				</select></span>
				<ul class="knowledge_ul" style="float: right; display: inline;">
					<li><input id="knowledge_button" type="button" value="질문하기"
						onclick="knowledgeWriteForm();"></li>
				</ul>
			</div>
			<%
			Map<Integer, Integer> arr = (Map<Integer, Integer>)request.getAttribute("kcommentCnt");
			int i=0;
			%>
			<table class="tbl-ex" style="width: 100%; margin-top: 50px;">
				<c:forEach var="dto" items="${dtos}">
					<tr id="${dto.knowledgeNumber}">
						<td style="max-width: 100%; word-break: break-all;">
							<p style="margin: 0 0 2px 0" onclick="knowledgeDetailForm(${dto.knowledgeNumber});">
								<span> ${dto.knowledgeReward}</span> &nbsp; &nbsp; 
								<span><a style="font-size: 16px; "href="#">${dto.knowledgeSubject}</a></span>
								<c:if test="${userVO.memberId==dto.memberId}">
								<span style="float: right; margin-right: 10px;"><a href="knowledgeDeleteForm?knowledgeNumber=${dto.knowledgeNumber}&pageNum=${pageNum}&btn_select=${btn_select}">삭제</a></span>
								<span style="float: right; margin-right: 20px;"><a href="knowledgeModifyForm?knowledgeNumber=${dto.knowledgeNumber}&pageNum=${pageNum}&btn_select=${btn_select}">수정</a></span>
								</c:if>
							</p>

							<p style="margin: 8px 0; line-height: 18px;"
								onclick="knowledgeDetailForm(${dto.knowledgeNumber});">
								<span>${dto.knowledgeContent} </span>
							</p>

							<p style="margin: 2px 0 0 0">
								<span>답변</span>
								<span><%= arr.get(i)%> </span>
									  <% i++; %>
								<span style="margin-left:20px;">${dto.knowledgeCategory}</span>&nbsp;&nbsp;
								<span style="margin-left:20px;">${dto.knowledgeRegdate}</span>
								<span style="float: right; margin-right: 10px;">추천수&nbsp;1&nbsp;</span>
								<span style="float: right; margin-right: 20px;">조회수&nbsp;1&nbsp;</span>
							</p>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>

		<div style="margin-top: 30px;">
			<c:if test="${cnt==0}">
				<p align="center">장바구니에 상품을 추가해 주세요.</p>
			</c:if>


			<p align="center">
				<c:if test="${cnt>0}">
					<!-- 게시글이 있으면 -->
					<!-- 처음 ◀◀  / 이전블록◀ -->
					<c:if test="${startPage > pageBlock }">
						<a href="knowledgeBoardList?btn_select=${btn_select}">[◀◀ ]</a>
						<a
							href="knowledgeBoardList?pageNum=${startPage-pageBlock}&btn_select=${btn_select}">[◀
							]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[&nbsp;${i}&nbsp;]</b></span>
						</c:if>
						<c:if test="${i!=currentPage}">
							<a href="knowledgeBoardList?pageNum=${i}&btn_select=${btn_select}">[${i}]</a>
						</c:if>
					</c:forEach>
					<!-- 끝 ▶▶  / 다음블록▶ -->
					<c:if test="${pageCount > endPage }">
						<a
							href="knowledgeBoardList?pageNum=${startPage + pageBlock}&btn_select=${btn_select}">[▶
							]</a>
						<a href="knowledgeBoardList?pageNum=${pageCount}&btn_select=${btn_select}">[▶▶
							]</a>
					</c:if>
				</c:if>
			</p>
		</div>
	</div>
	<!-- 동욱 끝 -->


</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>