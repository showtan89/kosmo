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
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>CONTENT</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">About</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" style="margin-bottom: 50px;" >
	<div id="exchangeratejson2">
	
	</div>
</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->


<script type="text/javascript">
$(function(){
	var obj = new Object();
	var str = '';
	
	$.ajax({
		url : 'exchangeratejson', 
		type : 'GET',
		dataType : 'json',
		success : function(obj) {
			str += '<br><table >';
			str += '<thead class="table-success"><tr align="center">';
			str += '<th>국가/통화명</th>';
			str += '<th>통화코드</th>';
			str += '<th>전신환(송금)받으실때</th>';
			str += '<th>전신환(송금)보내실때</th>';
			str += '<th>매매 기준율</th>';
			str += '<th>장부가격</th>';
			str += '</tr> </thead>';
			alert(obj.length);
			for(var i=0;i<obj.length;i++){
				str += '<tr><td>'+obj[i].cur_nm+'</td>'; 
				str += '<td>'+obj[i].cur_unit+'</td>';
				str += '<td>'+obj[i].ttb+'</td>';
				str += '<td>'+obj[i].tts+'</td>';
				str += '<td>'+obj[i].deal_bas_r+'</td>';
				str += '<td>'+obj[i].bkpr+'</td></tr>';
			}
			str += '</table>';
			alert(str);
			$('#exchangeratejson2').html(str);
		},
		error : function(){
			alert('오류');
		}
	});
	
});
</script>
</body>
</html>