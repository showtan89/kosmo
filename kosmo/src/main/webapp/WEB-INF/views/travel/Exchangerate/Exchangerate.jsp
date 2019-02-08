<%@ page language="java" contentType="text/html"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
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
		<h2>Exchange Rate</h2>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" align="center" style="margin-bottom: 50px;">

	<!-- 동욱 시작 -->
	<!-- 동욱 css -->
	<link rel="stylesheet" href="resources/ehddnr.css">
	<!-- 동욱 시작 -->

		<!-- 사이드바 -->
			<!-- 페이지 -->
			<div style="margin-top: 30px;" align="center" id="pagestr">
				
			</div>
	
</div>
	<!-- 동욱 끝 -->
<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->
</body>
<script type="text/javascript" >
$(function(){
	var obj = new Object();
	var str = '';
	
	$.ajax({
		url : 'exchangeratejson', 
		type : 'GET',
		dataType : 'json',
		success : function(obj) {
			str += '<br><table class="table">';
			str += '<thead class="table-success"><tr align="center" >';
			str += '<th style="vertical-align:middle;width:25%;">Country / Currency people</th>';
			str += '<th style="vertical-align:middle;width:10%;">Currency Codes</th>';
			str += '<th style="vertical-align:middle;width:20%;">When telegraphic transfer (remittance) receive</th>';
			str += '<th style="vertical-align:middle;width:20%;">When telegraphic transfer (transfer) and send</th>';
			str += '<th style="vertical-align:middle;width:15%;">Marketing reference rate</th>';
			str += '<th style="vertical-align:middle;width:10%;">Book Value</th>';
			str += '</tr> </thead>';
			for(var i=0;i<obj.length;i++){
				var ss = obj[i].cur_nm;
				var ss2 = ss.split(" ");
				str += '<tr align="center"><td>'+ss2[0];
				if(ss2[1] != null){
				str += ' / '+ss2[1]+'</td>';
				}
				str += '<td>'+obj[i].cur_unit+'</td>';
				str += '<td>'+obj[i].ttb+'</td>';
				str += '<td>'+obj[i].tts+'</td>';
				str += '<td>'+obj[i].deal_bas_r+'</td>';
				str += '<td>'+obj[i].bkpr+'</td></tr>';
			}
			str += '</table>';
			$('#pagestr').html(str);
		},
		error : function(){
			alert('오류');
		}
	});
	
});
</script>
</html>