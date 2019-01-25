/**
 * 부동산 페이지 글 등록시 사용
 */

function getJsonData(){
	var realestateNumber = $('#realestateNumber').val();
	var memberId = $('#memberId').val();
	var loginId = $('#loginId').val();
	$.getJSON("realestateCommentsJson?realestateNumber="+realestateNumber, function(data){
		var str = "";
		var cnt = data.length;
		str = '<div class="comment_area clearfix"><h4 class="headline">'+cnt+' Comments</h4>';
		$(data).each(
				function(){
					if(memberId==this.memberId){ //글 작성자 == 댓글 작성자
						str +='<hr><ol><li><div class="d-flex"><div class="comment-content" style="width: 100% !important"><div class="d-flex align-items-center justify-content-between"><span><span class="writerTag">WRITER</span><b>&nbsp;'+this.memberId+'</b></span><span class="comment-date">'+this.rcommentRegdate+'&nbsp&nbsp&nbsp&nbsp'; 
						if(loginId==this.memberId){
							str +='<div class="btn-group"><button type="button" class="btn btn-default btn-sm dropdown-toggle id="toggle'+this.rCommentNumber+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Delete<span class="caret"></span></button><ul class="dropdown-menu"><li onclick=deleteAccept('+this.rCommentNumber+')>&nbsp;Accept</li><li>&nbsp;Cancel</li></ul></div></span></div>'+this.rCommentContent+'</div></div></li></ol>';
						}else{
							str +='<div class="btn-group"><button type="button" class="btn btn-default btn-sm dropdown-toggle disabled id="toggle'+this.rCommentNumber+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Delete<span class="caret"></span></button><ul class="dropdown-menu"><li onclick=deleteAccept('+this.rCommentNumber+')>&nbsp;Accept</li><li>&nbsp;Cancel</li></ul></div></span></div>'+this.rCommentContent+'</div></div></li></ol>';
						}
					}else{//글 작성자 != 댓글 작성자
						str +='<hr><ol><li><div class="d-flex"><div class="comment-content" style="width: 100% !important"><div class="d-flex align-items-center justify-content-between"><span><b>'+this.memberId+'</b></span><span class="comment-date">'+this.rcommentRegdate+'&nbsp&nbsp&nbsp&nbsp'; 
						if(loginId==this.memberId){
							str +='<div class="btn-group"><button type="button" class="btn btn-default btn-sm dropdown-toggle id="toggle'+this.rCommentNumber+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Delete<span class="caret"></span></button><ul class="dropdown-menu"><li onclick=deleteAccept('+this.rCommentNumber+')>&nbsp;Accept</li><li>&nbsp;Cancel</li></ul></div></span></div>'+this.rCommentContent+'</div></div></li></ol>';
						}else{
							str +='<div class="btn-group"><button type="button" class="btn btn-default btn-sm dropdown-toggle disabled id="toggle'+this.rCommentNumber+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Delete<span class="caret"></span></button><ul class="dropdown-menu"><li onclick=deleteAccept('+this.rCommentNumber+')>&nbsp;Accept</li><li>&nbsp;Cancel</li></ul></div></span></div>'+this.rCommentContent+'</div></div></li></ol>';
						}
					}
				});
		str+= '</div>';
		$('#realestateCommentJson').html(str);
	})
}

function emptyComment() {
	$('#rCommentContent').val('');
}

$('#toggle634').prop('disabled', true);

$("#submitComment").on("click", function(){
	var realestateNumber = $('#realestateNumber').val();
	var rCommentContent = $('#rCommentContent').val();
	$.ajax({
		type:'post',
		url:'realestateCommentsJson',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		dataType:"text",
		data: JSON.stringify({realestateNumber:realestateNumber,rCommentContent:rCommentContent}),
		success:function(result){
			if(result == 'SUCCESS'){
				getJsonData();
			}else{
				getJsonData();
				alert('error !');
			}
			emptyComment();
		}
	});
})

function deleteAccept(cNumber) {
	$.ajax({
		type: 'delete',
		url:'realestateCommentsJson',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"
		},
		dataType:'text',
		data:JSON.stringify({cNumber:cNumber}),
		success:function(result){
			if(result == 'SUCCESS'){
				getJsonData();
			}else{
				getJsonData();
				alert('error !');
			}
		}
	})
};


/*
$(".deleteButton").click(function(){
	window.alert("ddd");
	window.alert($(this).val());
	
	var rCommentContent = $('#rCommentContent').val();
	$.ajax({
		type:'post',
		url:'realestateCommentsJson',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		dataType:"text",
		data: JSON.stringify({realestateNumber:realestateNumber,rCommentContent:rCommentContent,realestateNumber:realestateNumber}),
		success:function(result){
			if(result == 'SUCCESS'){
				getJsonData();
			}
		}
	});
})	
*/	

function realestatePostCheck() {

		if(!$('#realestateSubject').val()){
			$("#realestateSubject").focus();
			$("#realestateSubject").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if(!$('#realestatePrice').val()){
			$("#realestatePrice").focus();
			$("#realestatePrice").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}else if(!$.isNumeric($('#realestatePrice').val())){
			$('#realestatePrice').focus();
			$('#realestatePrice').attr('placeholder', "Please input numbers only.");
			$("#realestatePrice").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).val(null);
			return false;
		}

		if(!$('#realestateManagement').val()){
			$("#realestateManagement").focus();
			$("#realestateManagement").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}else if(!$.isNumeric($('#realestateManagement').val())){
			$("#realestateManagement").focus();
			$('#realestateManagement').attr('placeholder', "Please input numbers only.");
			$("#realestateManagement").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).val(null);
			return false;
		}

		if(!$('#realestateDeposit').val()){
			$("#realestateDeposit").focus()
			$("#realestateDeposit").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}else if(!$.isNumeric($('#realestateDeposit').val())){
			$("#realestateDeposit").focus()
			$('#realestateDeposit').attr('placeholder', "Please input numbers only.");
			$("#realestateDeposit").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).val(null);
			return false;
		}

		if($('#realestateRoom').val()=='Select'){
			$("#realestateRoom").focus()
			$("#realestateRoom").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if($('#realestateToilet').val()=='Select'){
			$("#realestateToilet").focus()
			$("#realestateToilet").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if($('#realestateState').val()=='Select'){
			$("#realestateState").focus()
			$("#realestateState").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if($('#realestateCategory1').val()=='Select'){
			$("#realestateCategory1").focus()
			$("#realestateCategory1").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if(!$('#realestateLocation').val()){
			$("#realestateLocation").focus()
			$("#realestateLocation").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if($('#realestateType').val()=='Select'){
			$("#realestateType").focus()
			$("#realestateType").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if($('#realestateTerm').val()=='Select'){
			$("#realestateTerm").focus()
			$("#realestateTerm").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if($('#realestateMoveindate').val()==""){
			$("#realestateMoveindate").focus()
			$("#realestateMoveindate").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}else if($("#realestateMoveindate").val().length != 10){
			$("#realestateMoveindate").focus()
			$("#realestateMoveindate").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).val(null);
			return false;
		}

		if($('#realestateGender').val()=='Select'){
			$("#realestateGender").focus();
			$("#realestateGender").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if($('#realestateHeatingtype').val()=='Select'){
			$("#realestateHeatingtype").focus();
			$("#realestateHeatingtype").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if($('#realestateSize').val()=='Select'){
			$("#realestateSize").focus();
			$("#realestateSize").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}

		if(!$('#realestateContent').val()){
			$("#realestateContent").focus()
			$("#realestateContent").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}
	}