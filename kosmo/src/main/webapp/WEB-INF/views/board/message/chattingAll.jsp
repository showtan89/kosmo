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

<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="resources/min/chat.css">

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!--세계 채팅 ajax -->
<script>
// 글쓴후 빈칸
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
						var chattingAllRegdate = new Date(this.chattingAllRegdate);
						this.chattingAllMemberId
						str += '<p>'+ this.chattingAllMemberId+' ( ' +this.chattingAllContry+' ) : '+ this.chattingAllContent +' ('+chattingAllRegdate+') '+'</p>'+ '<br>'
						
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
		<br><br><br>
	</div>
</body>

	<div align="center" id="write">
		<!-- <form action="chattingWrite" method="POST" onsubmit="chttingWrite();"> -->
		<input type="text" id="chattingAllContent" maxlength="300"
			style="width: 50%; height: 10%; padding: 5px 5px;"
			name="chattingAllContent"> &nbsp;&nbsp; 
			<input type="button" id="chattingWriteAll" class="btn btn-success mr-30"
			value="Enter" style="padding: 1px;">
		<!-- </form> -->
	</div>


<script type="text/javascript">
$("#chattingWriteAll").on("click", function(){
	var chattingAllContent = $('#chattingAllContent').val();
	
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