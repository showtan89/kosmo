var items;
var count;

function getWeatherData() {
	var searchType = $("#searchType").val();
	var url = "weatherRadarSearch";
	if(searchType == 'Select Type'){
		return false;
	}else{
		if(searchType == "radar"){
			$.getJSON(url, function(data) {
				console.log(data);
				var resultMsg = data.response.header.resultMsg;
				if(resultMsg == 'OK'){
					items = data.response.body.items.item["rdr-img-file"];
					count = data.response.body.totalCount;
					console.log(items);
					var last = (items.length)-1;
					var lastImage = items[last];
					var str = '<img src="'+lastImage+'" id="sourceImage" style="min-width:675px; min-height:660px">';
					var buttonStr = "<button type='button' class='btn alazea-btn' onclick='playImage(count)'>Play</button>";
					console.log(count)
					console.log(lastImage)
					$("#imageResult").html(str);
					$("#buttonArea").html(buttonStr);
				}
			});
		}
	}
}

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
	items.delayedForEach(function(img){
		$("#sourceImage").attr("src",img);
		console.log(""+img);
		}, 50);
}