
var myKey = "aqFFW%2BjkswtDEjWJIAHjx2ZzFzSYEt7ZUFbIHAU%2FCqKFF5dnRDJZe0997nu2JwgGu98B2zapQryJ1WOmzMQveQ%3D%3D";

//지역 대분류 바뀌면 지역 소분류 카테고리 갱신
function areaChange() {
	if($('#areaCode').val() != undefined){	var areaCode = "&areaCode="+$('#areaCode').val();
	}else{	var areaCode = "";}
	var url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/areaCode?serviceKey="+myKey+"&numOfRows=100" +
	"&pageNo=1&MobileOS=ETC&MobileApp=Welkome&_type=json"+areaCode;
	$.getJSON(url, function(data) {
		var str = '<label for="sigunguCode">Area Selection #2</label><select class="custom-select d-block w-100" id="sigunguCode" name="sigunguCode"><option style="display: none;" value="">Select Area #1</option>';
		items = data.response.body.items.item;
		$(items).each(
				function(){
					str +='<option value='+this.code+'>'+this.name+'</option>';
				}		
		)
		str+= '</select>';
		$('#sigunguArea').html(str);
	})
}

//관광 대분류 바뀌면 관광 중분류 카테고리 갱신
function cat1Change() {
	if($('#cat1').val() != undefined){	var cat1 = "&contentTypeId="+$('#cat1').val();
	}else{	var cat1 = "";}
	var url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/categoryCode?serviceKey="+myKey+"&numOfRows=30" +
	"&pageNo=1&MobileOS=ETC&MobileApp=Welkome&_type=json"+cat1;
	$.getJSON(url, function(data) {
		var str = '<label for="cat2">Category #2</label><select class="custom-select d-block w-100" id="cat2" name="cat2" onclick="cat2Change();"><option style="display: none;" value="">Select Category #1</option>';
		items = data.response.body.items.item;
		$(items).each(
				function(){
					str +='<option value='+this.code+'>'+this.name+'</option>';
				}		
		)
		str+= '</select>';
		$('#cat2Area').html(str);
	})
}

//관광 중분류 바뀌면 관광 소분류 카테고리 갱신
function cat2Change(){
	if($('#cat1').val() != undefined){	var cat1 = "&contentTypeId="+$('#cat1').val();
	}else{	var cat1 = "";}
	if($('#cat2').val() != undefined){	var cat2 = "&cat2="+$('#cat2').val();
	}else{	var cat2 = "";}
	var url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/categoryCode?serviceKey="+myKey+"&numOfRows=30" +
	"&pageNo=1&MobileOS=ETC&MobileApp=Welkome&_type=json"+cat1+cat2;
	$.getJSON(url, function(data) {
		var str = '<label for="cat3">Category #3</label><select class="custom-select d-block w-100" id="cat3" name="cat3"><option style="display: none;" value="">Select Category #2</option>';
		items = data.response.body.items.item;
		$(items).each(
				function(){
					str +='<option value='+this.code+'>'+this.name+'</option>';
				}		
		)
		str+= '</select>';
		$('#cat3Area').html(str);
	})
}

//검색 결과로 검색
function getJsonData() {
	if($('#startCode').val() == undefined){ var arrange = "&arrange=Q";
	}else{	var arrange = "&arrange=P";}
	if($('#areaCode').val() != undefined){	var areaCode = "&areaCode="+$('#areaCode').val();
	}else{	var areaCode = "";}
	if($('#sigunguCode').val() != undefined){ var sigunguCode = "&sigunguCode="+$('#sigunguCode').val();
	}else{	var sigunguCode ="";}
	if($('#cat1').val() != undefined){	var cat1 = "&contentTypeId="+$('#cat1').val();
	}else{	var cat1 = "";}
	if($('#cat2').val() != undefined){	var cat2 = "&cat2="+$('#cat2').val();
	}else{	var cat2 = "";}
	if($('#cat3').val() != undefined){	var cat3 = "&cat3="+$('#cat3').val();
	}else{	var cat3 ="";}

	var url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/areaBasedList?_type=json&serviceKey="+myKey+
	"&numOfRows=20&MobileOS=ETC&MobileApp=Welkome&listYN=Y"+arrange+cat1+cat2+cat3+areaCode+sigunguCode+"&pageNo="+1;
	console.log("요청주소:"+url);
	$.getJSON(url, function(data) {
		var str ='<div class="col-12"><div class="row" style="margin-top:20px">';
		items = data.response.body.items.item;
		pageNo = data.response.body.pageNo;
		totalCount = data.response.body.totalCount;
		console.log("page:"+pageNo+" / total:"+totalCount);
		if(items == undefined){
			str+='<div class="col-12 col-lg-4"><div class="single-blog-post mb-50"><div class="post-thumbnail mb-30"><br><h1>0 Result Found.</h1></div></div></div>'
		}else{
			$(items).each(
					function(){
						//날짜 변경
						var tempTime = this.modifiedtime.toString();
						var dispTime = [tempTime.slice(0, 4), "-", tempTime.slice(4, 6), "-", tempTime.slice(6, 8)].join('');
						//조회수 변경
						var tempCount = this.readcount
						var dispCount = parseInt(tempCount).toLocaleString();
						//이미지가 없을 때 기본값
						if(this.firstimage != undefined){
							var image = this.firstimage;
						}else{
							var image ="resources/img/travel/travel/noimage.png";
						}
						str+='<div class="col-12 col-lg-4"><div class="single-blog-post mb-50"><div class="post-thumbnail mb-30"><img src="'+image+'" alt="'+this.contentid+'" style="height:240px;max-height:auto;width:100%;" onclick="imageModal('+this.contenttypeid+","+this.contentid+');" class="cursorCustom"></div><div class="post-content"><div class="post-meta"><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;'+dispTime+'&nbsp;&nbsp;<i class="fa fa-eye" aria-hidden="true">&nbsp;</i>'+dispCount+'</div><p class="post-excerpt">'+this.title+'</p></div></div></div>';
					}		
			)
		}
		str+= '</div></div>';
		$('#jsonResult').html(str);
	})
}

//모달 토글
$('#myModal').click(function () {
	$('#detailModal').show();
})
$('#closeModal').click(function () {
	$('#detailModal').css('display','none');
})

function closeModal() {
	$('#detailModal').css('display','none');
}

	//이미지 모달
function imageModal(contenttypeid,itemNumber) {
	/*var url = 'http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailIntro?serviceKey='+myKey+
		'&numOfRows=100&pageNo=1&MobileOS=ETC&_type=json&MobileApp=Welkome&contentId='+itemNumber+'&contentTypeId='+contenttypeid;*/
	
	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailCommon?serviceKey='+myKey+
	'&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y'+
	'&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&contentId='+itemNumber;
	console.log(url);
	var str = "";
	$.getJSON(url, function(data) {
		items = data.response.body.items.item;
		console.log(items.firstimage);
		str+= "<h5 style='color:#70c745'>"+items.title+"</h5>";
		if(items.homepage!=undefined){
			str+= "<span style='color:#70c745'>Homepage : "+items.homepage+"</span><hr>";
		}else{str+= "<hr>";}
		str+= "<img src='"+items.firstimage+"' style='width:100%'></img><hr>";
		str+= "<span>"+items.overview+"</span><hr>"
		str+= "<h5>"+items.addr1+"</h5>";
		if(items.directions!=undefined){
			str+= "<span>"+items.directions.replace(/<b>/gi,"").replace(/<\/b>/gi,"")+"</span>";
		}
		console.log(items.directions);
		str+= "<hr>";
			$('#modal-content').html(str);
		$('#detailModal').show();
	});
};