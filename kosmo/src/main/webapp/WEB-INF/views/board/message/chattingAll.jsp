<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="resources/js/request.js"></script>
<script src="resources/js/request2.js"></script>

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

<!-- 채팅 ajax -->
<script>

function emptychattingAllContent(){
	$('#chattingAllContent').val('');
}

function chattingAll() {
		//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
		if(${sessionScope.userVO != null}){
			$.getJSON("chattingAll", function(data){
				var come="";
				var str="";
				$(data).each(
					function () {
						var chattingAllRegdate = new Date(chattingAllRegdate);
						this.chattingAllMemberId
						str += '<p>'+ this.chattingAllMemberId+' ( ' +this.chattingAllContry+' ) '+ this.chattingAllContent +'</p>'
					}		
				);
				
				$('#chattingAllList').html(str); 
				
			}); }
	}
chattingAll();

setInterval("chattingAll();", 6000);//원래 2000, 개발중  60000, 시연때 2000



</script>
<meta charset="UTF-8">
<title>ChattingAll</title>
</head>
<body onload="chattingAll();">
	<div>
		<div id="chattingAllList"></div>
	</div>
</body>


	<div align="center">
		<!-- <form action="chattingWrite" method="POST" onsubmit="chttingWrite();"> -->
		<input type="text" id="chattingAllContent" maxlength="300"
			style="width: 50%; height: 10%; padding: 5px 5px;"
			name="chattingAllContent"> <br> <br> <input
			type="button" id="chattingAllWrite" class="btn btn-success mr-30"
			value="Enter" style="padding: 1px;">
		<!-- </form> -->
	</div>
	<!-- <script>
		onclick="chattingWrite();"
			function chattingWrite(){
				var chattingContent = $("#chattingContent").val();
				window.location = 'chatting?chattingContent=' + chattingContent;
			}
		</script> -->


<script type="text/javascript">
$("#chattingAllWrite").on("click", function(){
	var chattingAllContent = $('#chattingAllContent').val();
	/* alert(chattingContent); */
	$.ajax({
		type:'POST',
		url:'chattingAllContent',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		dataType:"JSON",
		data:JSON.stringify({chattingAllContent:chattingAllContent}), 
		success:function(result){
				chattingAll();	//자료 등록 성공하였으니 새롭게 자료를 요청 부분 실행하여 리스트 갱신
				emptychattingAllContent();//댓글 입력창 초기화
			},
		error:function(result){
			chattingAll();	//자료 등록 성공하였으니 새롭게 자료를 요청 부분 실행하여 리스트 갱신
			alert('error!');	
			emptychattingAllContent();//댓글 입력창 초기화
		}
		
	});
});
</script>
</html>