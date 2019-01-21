/**
 * 부동산 페이지 글 등록시 사용
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