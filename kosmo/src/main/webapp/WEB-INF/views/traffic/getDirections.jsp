<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emergency facility</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
</head>
<body>
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>
	<%@ include file="../setting/header01.jsp"%>

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/ehddnr2.jpg);">
			<h2>Emergency facility</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<div align="center">
	<input type="text" placeholder="주소를 입력하세요." id="ehddnr" >
	
	<input type="button" onclick="initGeocoder();" value="출발지주소검색">
	
	<input type="text" placeholder="주소를 입력하세요." id="ehddnr2" >
	
	<input type="button" onclick="initGeocoder2();" value="도착지주소검색">
	<input type="button" onclick="searchjido();" value="길찾기">
	
	<input type="hidden" value="" id="x1">
	<input type="hidden" value="" id="y1">
	<input type="hidden" value="" id="x2">
	<input type="hidden" value="" id="y2">
	
		<div id="map2" style="margin:30px 0;width:90%;height:400px;" align="center">
		</div>
	</div>
	
<%@ include file="../setting/footer01.jsp"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=u91vrld6gw&submodules=geocoder"></script>
<script type="text/javascript">
var startx,starty,endx2,endy2;

// 지도생성

	// result by latlng coordinate
	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	        var item = response.result.items[0],
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
	            point = new naver.maps.Point(item.point.x, item.point.y);
	           
	            startx = item.point.x;
	            starty = item.point.y;
	        	document.getElementById("x1").value = startx;
	        	document.getElementById("y1").value = starty;
	       var start = new naver.maps.Point(startx, starty);
	       map.setCenter(start);
	       
/* 	        marker.setMap(null);
 */	        var marker = new naver.maps.Marker({
	    	    position: new naver.maps.Point(startx, starty),
	    	    map: map
	    	});
	        
	    });
	}
	function initGeocoder() {
		var address2 = document.getElementById("ehddnr").value;
	    searchAddressToCoordinate(address2);
	}
	naver.maps.onJSContentLoaded = initGeocoder;
	
	
	function searchAddressToCoordinate2(address) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	        var item = response.result.items[0],
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
	            point = new naver.maps.Point(item.point.x, item.point.y);
	            endx2 = item.point.x;
	            endy2 = item.point.y;
	            document.getElementById("x2").value = endx2;
	        	document.getElementById("y2").value = endy2;
	        var end = new naver.maps.Point(endx2, endy2);
		       map.setCenter(end);
	        
	        var marker = new naver.maps.Marker({
	    	    position: new naver.maps.Point(endx2, endy2),
	    	    map: map
	    	});
	    });
	}

	function initGeocoder2() {
		var address3 = document.getElementById("ehddnr2").value;
	    searchAddressToCoordinate2(address3);
	}
	naver.maps.onJSContentLoaded = initGeocoder2;
	

</script> 




<!-- // 길찾기기능-======================================================================= -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5YhdM97rzIO5e2jM_nEK"></script>
<script>
	var mapOptions = {
		center: new naver.maps.LatLng(37.3595704, 127.105399),
		zoom: 10
	};
	var map = new naver.maps.Map('map2', mapOptions);
	

		
		function searchPubTransPathAJAX() {
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var sx = document.getElementById("x1").value;
	var sy = document.getElementById("y1").value;
	var ex = document.getElementById("x2").value;
	var ey = document.getElementById("y2").value;
			var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&apiKey=hnsqv%2Bnl81sOEEMyauqSk2DiKsoH%2BY2VTPN4c2%2FhmB0";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
				console.log( JSON.parse(xhr.responseText) ); // <- xhr.responseText 로 결과를 가져올 수 있음
				//노선그래픽 데이터 호출
				callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
				}
			}
		}
		
		//길찾기 API 호출
		function searchjido(){
			$(function(){
				var obj = new Object();
				var x1 = document.getElementById("x1").value;
				var y1 = document.getElementById("y1").value;
				var x2 = document.getElementById("x2").value;
				var y2 = document.getElementById("y2").value;
				var url2 = 'AddressJson?x1='+x1+'&y1='+y1+'&x2='+x2+'&y2='+y2;
				$.ajax({
					url : url2, 
					type : 'GET',
					dataType : 'json',
					success : function(obj) {
						var result = obj.result;
						var path = result.path;
						var subpath = path[0].subPath;
						var pathType = path[0].pathType;
						for(var i=0;i<subpath.length;i++){
							if(subpath[i].startExitX!=null){
								document.getElementById("x1").value = subpath[i].startExitX;
								document.getElementById("y1").value = subpath[i].startExitY;
							}
							if(subpath[i].endExitX!=null){
								document.getElementById("x2").value = subpath[i].endExitX;
								document.getElementById("y2").value = subpath[i].endExitY;
							}
						}
							
					},
					error : function(){
						alert('잠시 후 다시 시도해주세요.');
					}
				});
			}); 
			
			searchPubTransPathAJAX();
			
		}
		
		function callMapObjApiAJAX(mabObj){
			var sx = document.getElementById("x1").value;
			var sy = document.getElementById("y1").value;
			var ex = document.getElementById("x2").value;
			var ey = document.getElementById("y2").value;
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"+mabObj+"&apiKey=hnsqv%2Bnl81sOEEMyauqSk2DiKsoH%2BY2VTPN4c2%2FhmB0";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var resultJsonData = JSON.parse(xhr.responseText);
					drawNaverMarker(sx,sy);					// 출발지 마커 표시
					drawNaverMarker(ex,ey);					// 도착지 마커 표시
					drawNaverPolyLine(resultJsonData);		// 노선그래픽데이터 지도위 표시
					// boundary 데이터가 있을경우, 해당 boundary로 지도이동
					if(resultJsonData.result.boundary){
							var boundary = new naver.maps.LatLngBounds(
					                new naver.maps.LatLng(resultJsonData.result.boundary.top, resultJsonData.result.boundary.left),
					                new naver.maps.LatLng(resultJsonData.result.boundary.bottom, resultJsonData.result.boundary.right)
					                );
							map.panToBounds(boundary);
					}
				}
			}
		}
		
		// 지도위 마커 표시해주는 함수
		function drawNaverMarker(x,y){
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(y, x),
			    map: map
			});
		}
		
		// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
		function drawNaverPolyLine(data){
			var lineArray;
			
			for(var i = 0 ; i < data.result.lane.length; i++){
				for(var j=0 ; j <data.result.lane[i].section.length; j++){
					lineArray = null;
					lineArray = new Array();
					for(var k=0 ; k < data.result.lane[i].section[j].graphPos.length; k++){
						lineArray.push(new naver.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
					}
					
				//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
					if(data.result.lane[i].type == 1){
						var polyline = new naver.maps.Polyline({
						    map: map,
						    path: lineArray,
						    strokeWeight: 3,
						    strokeColor: '#003499'
						});
					}else if(data.result.lane[i].type == 2){
						var polyline = new naver.maps.Polyline({
						    map: map,
						    path: lineArray,
						    strokeWeight: 3,
						    strokeColor: '#37b42d'
						});
					}else{
						var polyline = new naver.maps.Polyline({
						    map: map,
						    path: lineArray,
						    strokeWeight: 3
						});
					}
				}
			}
		}
 
</script>
</body>
</html>