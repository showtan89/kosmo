/**
 * 이미지 검색용
 */

function getImageInfo() {
	if($("#searchType").val() == 'Select Type'){
		alert("Select search type.");
		return false;
	}
	if($('#inputFile').get(0).files.length === 0){
		alert("Attach the image.");
		return false;
	}
	
	//프리로더 다시 띄우기
	var preloader = '<div class="preloader trans-preloader d-flex align-items-center justify-content-center"><div class="preloader-circle"></div><div class="preloader-img"><img src="resources/img/core-img/leaf.png" alt=""></div></div>';
	$('#jsonResult').html(preloader); 
	
	var file = $('#inputFile').get(0).files[0];
	var type = $("#searchType").val();
	var formData = new FormData();
	formData.append("inputImageFile",file);
	formData.append("searchType",type);
	var str = "";
	$.ajax({
		url:"imageSearchPro",
		data:formData,
		dataType:'json',
		processData:false,
		contentType:false,
		type:'POST',
		success:function(result){
			//프리로더 다시 지우기
			$('.preloader').fadeOut("slow",function () {
	            $(this).remove();
	        });
			
			console.log(result);
			//타입이 label or web일 경우
			if(result.type == "label" || result.type == "web"){
				var desc = result.desc;
				var score = result.score;
				var resultArray;
				if(result.error==null){
					for(var i=0; i< desc.length; i++){
						resultArray = desc.map( function(x, i){ 
							return {"desc": x, "score": score[i]} }, this);
					}
					console.log(resultArray);
					str += '<div class="col-md-6 mb-6"><h4>Image</h4><img src="resources/img/search/'+result.imgName+
					'" style="width:100%"></div><div class="col-md-6 mb-6"><h4>Search Result</h4><ul>';
					for(var i=0; i< resultArray.length; i++){
						str += '<li><b>'+resultArray[i].desc+'</b><div class="progress"><div class="progress-bar" role="progressbar" aria-valuenow="'+resultArray[i].score+'" aria-valuemin="0" aria-valuemax="1" style="width:'+resultArray[i].score*100+'%;background-color:#70c745">'+resultArray[i].score+'</div></div></li>'
					}
					str += '</ul></div>';
				}else{
					str += result.error
				}
			}else if(result.type =='text' || result.type =='hand'){
				var text = result.result;
				if(result.error==null){
					str += '<div class="col-md-6 mb-6"><h4>Image</h4><img src="resources/img/search/'+result.imgName+'" style="width:100%"></div><div class="col-md-6 mb-6"><h4>Text Result</h4> ';
					/*for(var i=0; i< text.length; i++){
						str += text[i]+'<hr>'
					}*/
					str += text[0];
					str += '</div>';
				}
			}else if(result.type == "landmark"){
				str += '<div class="col-md-6 mb-6"><h4>Image</h4><img src="resources/img/search/'+result.imgName+'" style="width:100%"></div><div class="col-md-6 mb-6"><h4>Text Result</h4> ';
				if(result.search == 'yes'){
					var name = result.name;
					var lat = result.lat;
					var lng = result.lng;
					str += "<span>The search results are judged to be "+name+". lat : "+lat+" lng : "+lng+" .</span>"
				}else{
					str += "<span>Sorry, there are no recognizable landmark search results.</span>";
				}
				str += '</div>';
			}
			
			$('#jsonResult').html(str);
		}
	});
}

//메뉴 변경시 설명서 나오게
function infoUpdate() {
	var type = $("#searchType").val();
	$('#inputFileLabel').attr('style', "color:#707070;");
	$('#inputFileLabel').html("Image Required");
	$('#inputFile').fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
}