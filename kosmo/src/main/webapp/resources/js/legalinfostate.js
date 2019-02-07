
//지식인게시판 리스트 가져오기
function getlegalinfoJsonData(){
	//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
	$.getJSON("legalinfoJson", function(data){
		var str2 = "";	//인위적으로 만들어낼 HTMl 태그를 담기위해 선언
		//ex 테이블의 경우 테이블 태그와 같이 1개만 존재해야 되는 부분 each 전에 작성
				//반복 작업될 부분 작성 ex) <tr><td> 등
					str2 += '<br><br><br><ul align="left">';
					$(data).each(
							function(){	
								str2 += '<li>'+this.a+'</li>';
								if(this.b!=null){
									for(var i=0;i<this.b.length;i++){
										str2 += '<li>'+this.b[i]+'</li>';
									}
								if(this.c!=null){
									for(var i=0;i<this.c.length;i++){
										str2 += '<li>'+this.c[i]+'</li>';
									}
								}
							}
						});
					str2 += '</ul>';
		$('#KnowledgeAjaxStart2').html(str2); // str 에 완성 된 태그가 들어가게 될 위치 지정(15번 행)
	});
}

/*// 지식인게시판 페이징 처리 
function getknowledgepageJsonData(){

	//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
	$.getJSON("KnowledgeListJson", function(data){
		
		
		//$('#KnowledgeAjaxStart').html(str); // str 에 완성 된 태그가 들어가게 될 위치 지정(15번 행)
	});
}*/
