
//부동산 댓글 가져오기
function getJsonData(){

	//자료 요청에 필요한 데이터 획득(글번호,ID 등)
	var realestateNumber = $('#realestateNumber').val();
	var memberId = $('#memberId').val();
	var loginId = $('#loginId').val();

	//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
	$.getJSON("realestateCommentsJson?realestateNumber="+realestateNumber, function(data){
		var str = "";	//인위적으로 만들어낼 HTMl 태그를 담기위해 선언
		var cnt = data.length;

		//ex 테이블의 경우 테이블 태그와 같이 1개만 존재해야 되는 부분 each 전에 작성
		str = '<div class="comment_area clearfix"><h4 class="headline">'+cnt+' Comments</h4>';
		$(data).each(
				//반복 작업될 부분 작성 ex) <tr><td> 등
				function(){			
					if(memberId==this.memberId){ //글 작성자 == 댓글 작성자 - 글쓴이 태그
						str +='<hr><ol><li><div class="d-flex"><div class="comment-content" id="'+this.rCommentNumber+'" style="width: 100% !important"><div class="d-flex align-items-center justify-content-between"><span><span class="writerTag">WRITER</span><b>&nbsp;'+this.memberId+'</b></span><span class="comment-date">'+this.rcommentRegdate+'&nbsp&nbsp&nbsp&nbsp'; 
						if(loginId==this.memberId){ // 댓글 작성자 == 로그인ID - 삭제 기능
							str +='<div class="btn-group"><button type="button" class="btn btn-default btn-sm dropdown-toggle id="toggle'+this.rCommentNumber+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Delete<span class="caret"></span></button><ul class="dropdown-menu"><li onclick=deleteAccept('+this.rCommentNumber+')>&nbsp;Accept</li><li>&nbsp;Cancel</li></ul></div></span></div>'+this.rCommentContent+'</div></div></li></ol>';
						}else{
							str +='<div class="btn-group"><button type="button" class="btn btn-default btn-sm dropdown-toggle disabled id="toggle'+this.rCommentNumber+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Delete<span class="caret"></span></button><ul class="dropdown-menu"><li onclick=deleteAccept('+this.rCommentNumber+')>&nbsp;Accept</li><li>&nbsp;Cancel</li></ul></div></span></div>'+this.rCommentContent+'</div></div></li></ol>';
						}
					}else{//글 작성자 != 댓글 작성자 
						str +='<hr><ol><li><div class="d-flex"><div class="comment-content" id="'+this.rCommentNumber+'" style="width: 100% !important"><div class="d-flex align-items-center justify-content-between"><span><b>'+this.memberId+'</b></span><span class="comment-date">'+this.rcommentRegdate+'&nbsp&nbsp&nbsp&nbsp'; 
						if(loginId==this.memberId){ // 댓글 작성자 == 로그인ID - 삭제 기능
							str +='<div class="btn-group"><button type="button" class="btn btn-default btn-sm dropdown-toggle id="toggle'+this.rCommentNumber+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Delete<span class="caret"></span></button><ul class="dropdown-menu"><li onclick=deleteAccept('+this.rCommentNumber+')>&nbsp;Accept</li><li>&nbsp;Cancel</li></ul></div></span></div>'+this.rCommentContent+'</div></div></li></ol>';
						}else{
							str +='<div class="btn-group"><button type="button" class="btn btn-default btn-sm dropdown-toggle disabled id="toggle'+this.rCommentNumber+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Delete<span class="caret"></span></button><ul class="dropdown-menu"><li onclick=deleteAccept('+this.rCommentNumber+')>&nbsp;Accept</li><li>&nbsp;Cancel</li></ul></div></span></div>'+this.rCommentContent+'</div></div></li></ol>';
						}
					}
				});
		str+= '</div>'; // 태그 마감 하여 최종적으로 HTML태그를 완성 시킴
		$('#realestateCommentJson').html(str); // str 에 완성 된 태그가 들어가게 될 위치 지정(15번 행)
	})
}

//댓글 등록 후 댓글창 비우기
function emptyComment() {
	$('#rCommentContent').val('');
}

//부동산 댓글 등록  ---------------------------------------------data:JSON.stringify 부분의 VO의 변수명과 동일하게 작성하여 전송하면 
//restController의 RequestBody 부분에 VO를 선언해 놓으면 자동으로 매핑 됨 !!!!!!!
$("#submitComment").on("click", function(){
	var realestateNumber = $('#realestateNumber').val();
	var rCommentContent = $('#rCommentContent').val();
	var memberEmail = $('#memberEmail').val();
	$.ajax({
		type:'post',
		url:'realestateCommentsJson',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		dataType:"text",
		data:JSON.stringify({realestateNumber:realestateNumber,rCommentContent:rCommentContent,rCommentTemp1:memberEmail}), 
		success:function(result){
			if(result == 'SUCCESS'){
				getJsonData();	//자료 등록 성공하였으니 새롭게 자료를 요청 부분 실행하여 리스트 갱신
			}else{
				getJsonData();
				alert('error !');
			}
			emptyComment();	//댓글 입력창 초기화
		}
	});
})

//부동산 댓글 삭제
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

//-----------------------------------------------------------ajax 부분 끝-----------------------------------------------------------------------------

//부동산 페이지 리스트 검색시 사용

function realestateListSearch() {

	if($('#realestatePrice').val().length==0){
		$('#realestatePrice').val(null);
	}else{
		if(!$.isNumeric($('#realestatePrice').val())){
			$('#realestatePrice').focus();
			$('#realestatePrice').val(null);
			$("#realestatePrice").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}
	}
	if($('#realestatePriceEnd').val().length ==0){
		$('#realestatePriceEnd').val(null);
	}else{
		if(!$.isNumeric($('#realestatePriceEnd').val())){
			$('#realestatePriceEnd').focus();
			$('#realestatePriceEnd').val(null);
			$("#realestatePriceEnd").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		}
	}
	if($('#realestateCategory1').val()=='Province'){
		$('#realestateCategory1').val(null);
	}
	if($('#realestateType').val()=='Type of Place'){
		$('#realestateType').val(null);
	}
	if($('#realestateTerm').val()=='Minimum Rental Period'){
		$('#realestateTerm').val(null);
	}
	if($('#realestateGender').val()=='Gender'){
		$('#realestateGender').val(null);
	}
	if($('#realestateSize').val()=='Size of Place'){
		$('#realestateSize').val(null);
	}
	if($('#realestateHeatingtype').val()=='Heating Type'){
		$('#realestateHeatingtype').val(null);
	}
	/*alert("price : "+$('#realestatePrice').val());
	alert("priceMax : "+$('#realestatePriceEnd').val());*/
	/*alert("================");*/
	/*alert("option : "+$('#realestateOptionCheck').val());
	alert("smoking : "+$('#realestateTobaccoCheck').val());
	alert("pet : "+$('#realestatePetCheck').val());
	alert("balcony : "+$('#realestateBalcony').val());
	alert("parking : "+$('#realestateCar').val());
	alert("elevator : "+$('#realestateTemp1').val());*/
	/*alert("================");*/
	/*alert("province : "+$('#realestateCategory1').val());
	alert("gender : "+$('#realestateGender').val());
	alert("type : "+$('#realestateType').val());
	alert("period : "+$('#realestateTerm').val());
	alert("heating : "+$('#realestateHeatingtype').val());
	alert("size : "+$('#realestateSize').val());*/
}

//부동산 페이지 글 등록시 사용
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
