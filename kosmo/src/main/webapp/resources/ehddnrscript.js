
$(function() {
	$('textarea.content').keyup(function() {
		bytesHandler(this);
	});
});

function getTextLength(str) {
	var len = 0;

	for (var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length == 6) {
			len++;
		}
		len++;
	}
	return len;
}

function bytesHandler(obj) {
	var text = $(obj).val();
	$('p.bytes').text(getTextLength(text));
}

function knowledge() {
	window.location = "knowledge";
}
function thbackground(Reward_th) {
	var Reward_th2 = $(Reward_th).text();
	$('.knowledgeWriteForm_Reward_th').css('background-color', '#fff');
	$(Reward_th).css('background-color', 'green');
	$('#addReward').val(Reward_th2);
}
function knowledgeWriteForm_Reward_block() {
	$('.knowledgeWriteForm_Reward').css('display', 'block')
}
function knowledgeWriteForm_Reward_none() {
	$('.knowledgeWriteForm_Reward').css('display', 'none')
	$('#addReward').val('0');
}
function knowledgeWriteForm_addReward(){
	var addReward = $('#addReward').val();
	$('p.class_addReward').text('포인트 '+addReward+'을 채택자에게 드립니다.');
	$('.knowledgeWriteForm_Reward').css('display', 'none')
}
function ehddnr_select1(){
	$('#ehddnr_1').css('border','2px solid black');
	$('#ehddnr_2').css('border','none');
}
function ehddnr_select2(){
	$('#ehddnr_2').css('border','2px solid black');
	$('#ehddnr_1').css('border','none');
}	
function knowledgeWriteForm(knowledgeNumber){
	window.location='knowledgeWriteForm';
}	
function knowledgeDetailForm(knowledgeNumber){
	window.location='knowledgeDetailForm?knowledgeNumber='+knowledgeNumber;
}
