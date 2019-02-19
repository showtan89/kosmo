<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="resources/js/request.js"></script>
<script src="resources/js/request2.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/component.css" />
<link rel="stylesheet" href="resources/style.css">
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

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- 채팅 ajax -->
<script>


if (!("autofocus" in document.createElement("input"))) {
    document.getElementById("chattingContent").focus();
  }

function emptychattingContent(){
	$('#chattingContent').val('');
}


function chatting() {
		//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
		if(${sessionScope.userVO != null}){
			$.getJSON("chatting", function(data){
				
				var come="";
				var str="";
				
				$(data).each(
					function () {
						var loginId = "${sessionScope.userVO.memberId}";
						this.chattingMemberId
						this.chattingRegdate
							
							if(loginId == this.chattingMemberId){
								str += '<div style="float:right; margin-right:10px;">'+
								'<table widht="600" border="1" style="font-size:15px;">'+
									'<tr>'+
										'<td align="left">'+ this.chattingContent + 
										'</td>'+ 
										'<td align="right">'+
											' : ' + this.chattingMemberId+
										'</td>'+
									'</tr>'+
									'<tr>'+
										'<td>'+
										'</td>'+
										'<td rowspan="2" align="right">'+
											'<span>'+'<a font-size="9">'+'('+changeDate(this.chattingRegdate)+')' +'</a>'+'</span>'+
										'</td>'+
									'</tr>'+
								'</table>'+
								'</div>'+'<br>'+'<br>';
							} else {
								str += '<div style="margin-left:10px;">'+
								'<table widht="600" border="1">'+
									'<tr>'+
										'<td align="left">'+ this.chattingMemberId+
										'</td>'+
										'<td align="left">'+' : '+ this.chattingContent +
										'</td>'+
									'</tr>'+
									'<tr>'+
										'<td align="left" rowspan="2">'+
										'<span>'+'<a font-size="9">'+
										'('+changeDate(this.chattingRegdate)+')'+'</a>'+'</span>'+
										'</td>'+
										'<td>'+'<br>'+
										'</td>'+
									'</tr>'+
								'</table>'+
								'</div>'+'<br>';
							}
							
						}
				);
				$('#chattingList').html(str);
				chattingScroll();
			}); }
	}
	
function enterKey(){
    if (window.event.keyCode == 13) {
   	 // 엔터키가 눌렸을 때 실행할 내용
   	 chattingScroll();
   	 document.getElementById('chattingWrite').click();
   }
}

function changeDate(date){
    date = new Date(parseInt(date));
    year = date.getFullYear();
    month = date.getMonth();
    day = date.getDate(); 
    hour = date.getHours();
    minute = date.getMinutes();
    second = date.getSeconds();
    strDate =year+"-"+month+"-"+day+"&nbsp;&nbsp;&nbsp;"+hour+":"+minute+":"+second;
    return strDate;
}

chatting();

setInterval("chatting();", 6000);//원래 2000, 개발중  60000, 시연때 2000

function chattingScroll(){
	$('#chattingView')[0].scrollIntoView(false);
	
}

$("#chattingView").load(function(){ chattingScroll(); });

</script>
<style>

</style>
<meta charset="UTF-8">
<title>Chatting</title>
</head>

<body onload="chatting();" style="background-image:">
<div id="chattingView" class="chattingView">
		
		<div id="chattingList" class="chattingList">
			strDate
		<br>
		</div>

<hr><br>

	<div align="center" id="write">
		
		<input type="text" id="chattingContent" maxlength="300"
			style="width: 50%; height: 10%; padding: 5px 5px; margin-bottom:20px;" onkeyup="enterKey();"
			name="chattingContent" autofocus="autofocus"> &nbsp;&nbsp;
			
		<input type="button" id="chattingWrite" class="btn btn-success mr-30"
			value="Enter" style="padding: 1px;">
	</div>
</div>
</body>
<script>

$("#chattingWrite").on("click", function(){
	var chattingContent = $('#chattingContent').val();
	
	$.ajax({
		type:'POST',
		url:'chattingContent',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		dataType:"JSON",
		data:JSON.stringify({chattingContent:chattingContent}), 
		success:function(result){
				chatting();	//자료 등록 성공하였으니 새롭게 자료를 요청 부분 실행하여 리스트 갱신
				emptychattingContent();//댓글 입력창 초기화
			},
		error:function(result){
			chatting();	//자료 등록 성공하였으니 새롭게 자료를 요청 부분 실행하여 리스트 갱신
			alert('error!');	
			emptychattingContent();//댓글 입력창 초기화
		}
		
	});
});


</script>
</html>