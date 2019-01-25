<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	
//dataType이 param인 경우
$(function(){
	$('#btn').click(function(){
			var param = {};
			/* param.name="송운선";
			param.tel = "010-5110-7181"; */
			param.commentalarm=${list.commentalarm};
			
			$.ajax({
				url : '${pageContext.request.contextPath}/basic2_sub', //controller로 이동
				type : 'POST',
				data : param, // 전송할 데이터
				success : function(msg){ //콜백함수
					$('#result').html(msg);
					alert('댓글이 달렸습니다.');
				},
				error : function(){
					alert('오류');
				}
		});
	});
});
	
</script>
</head>
<body>

</body>
</html>