var items;
var count;

function getWeatherData() {
	var searchType = $("#searchType").val();
	if(searchType == 'Select Type'){
		return false;
	}else{
		var preloader = '<div class="preloader trans-preloader d-flex align-items-center justify-content-center"><div class="preloader-circle"></div><div class="preloader-img"><img src="resources/img/core-img/leaf.png" alt=""></div></div>';
		$('#imageResult').html(preloader); 
		
		if(searchType == "radar"){
			var url = "weatherRadarSearch";
			$.getJSON(url, function(data) {
				console.log(data);
				var resultMsg = data.response.header.resultMsg;
				if(resultMsg == 'OK'){
					$(".centerBtn").css("display","block");
					$("#imageResult").css("display","block");
					$("#textResult").css("display","block");
					items = data.response.body.items.item["rdr-img-file"];
					count = data.response.body.totalCount;
					console.log(items);
					var last = (items.length)-1;
					var lastImage = items[last];
					var str = '<img src="'+lastImage+'" id="sourceImage" style="width:100%; max-width:675px; height:100%"><button type="button" class="btn alazea-btn centerBtn" onclick="playImage(count)"><i class="fa fa-play"></i></button>';
					//var buttonStr = '<button type="button" class="btn alazea-btn centerBtn" onclick="playImage(count)">Play</button>';
					console.log(count)
					console.log(lastImage)
					
					$.getJSON("forecastSearch", function(data) {
						var resultMsg = data.response.header.resultMsg;
						if(resultMsg == 'OK'){
							var item = data.response.body.items.item;
							var date = item.tmFc;
							var content = item.wfSv1;
							var notice = item.wn;
							var foreStr = "<pre style='white-space:pre-wrap;overflow:auto;width:100%';>"+date+"<br>"+content+"<hr>"+notice+"</pre>"; 
							$("#textResult").html(foreStr);
							$("#imageResult").html(str);
							//$("#buttonArea").html(buttonStr);
						}
					});
				}
			});
		}else if(searchType == "earth"){
			var url = "earthQuakeView";
			$.getJSON(url, function(data) {
				console.log(data);
				$("#imageResult").css("display","block");
				$("#textResult").css("display","none");
				var fcTp;
				switch(data.fcTp){
					case 2 : fcTp = 'Overseas Earthquake Info';
						break;
					case 3 : fcTp = "Domestic Earthquake Info";
						break;
					case 5 : fcTp = "Domestic EQ Info Update";
						break;
					case 11 : fcTp = "Domestic EQ Early-warning";
						break;
					case 12 : fcTp = "Overseas EQ Early-warning";
						break;
					case 13 : fcTp = "EQ Precision Analysis";
						break;
					case 14 : fcTp= "Earthquake Newsflash";
						break;	
				}
				var str = '<table class="table"><tr><td colspan="4"><img src="'+data.img+'"></td></tr><tr><td>Notification type</td><td>'+fcTp+'</td><td>Intensity</td><td>'+data.mt+'</td></tr><tr><td>Location</td><td colspan="3">'+data.loc+'</td></tr><tr><td>Cause</td><td colspan="3">'+data.rem+'</td></tr><tr><td>Date of occurrence</td><td>'+data.tmEqk+'</td><td>Notification date</td><td>'+data.tmFc+'</td></tr></table>'
				$("#imageResult").html(str);
				$("#buttonArea").html("");
				$("#textResult").html("");
			});
		}
	}
}

//이미지 순차 재생용
Array.prototype.delayedForEach = function(callback, timeout, thisArg){
	  var i = 0,
	    l = this.length,
	    self = this,
	    caller = function(){
	      callback.call(thisArg || self, self[i], i, self);
	      (++i < l) && setTimeout(caller, timeout);
	    };
	  caller();
	};
	
//이미지 재생
function playImage() {
	$(".centerBtn").css("display","none");
	var last = (items.length)-1;
	var lastImage = items[last];
	items.delayedForEach(function(img){
		if(lastImage==img){
			$(".centerBtn").css("display","block");
		}
		$("#sourceImage").attr("src",img);
		}, 50);
}