<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emergency facility</title>
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}
.wrap * {
	padding: 0;
	margin: 0;
}
.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}
.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}
.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}
.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}
.info .close:hover {
	cursor: pointer;
}
.info .body {
	position: relative;
	overflow: hidden;
}
.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}
.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}
.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}
.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}
.info .link {
	color: #5085BB;
}
</style>

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
			style="background-image: url(resources/img/traffic/eme/amb.png);">
			<h2>Emergency facility</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<br>
	<br>
	<br>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c2e71a114ce757eb2a4b922679624c&libraries=services"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=u91vrld6gw"></script>
	<script type="text/javascript"
		src="resources/js/plugins/MarkerClustering.js"></script>
	<c:set var="mapImg" value="resources/img/traffic/map/" />

	<div class="container">

		<div id="map" style="width: 100%; height: 400px;"></div>

		<!-- 재영 시작 -->

		<script type="text/javascript"
			src="resources/js/plugins/hospitalData.js"></script>
		<script>
		
		
		if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	
				var map = new naver.maps.Map("map", {
					zoom : 11,
					center : new naver.maps.LatLng(position.coords.latitude, position.coords.longitude),
					zoomControl : true,
					zoomControlOptions : {
						position : naver.maps.Position.TOP_LEFT,
						style : naver.maps.ZoomControlStyle.SMALL
					}
				});
				
				var markers = [];
				/* 
				{ JSON 형태
				   "num": 5696,
				   "tel": "233-6000",
				   "add": "충청북도 청주시 서원구 남이면 남석로 316-26",
				   "name": "서원요양병원",
				   "type": "요양병원(일반요양병원)",
				   "hosx": 238379.9797,
				   "hosy": 342411.8897,
				   "content": "신경과, 재활의학과, 가정의학과"
					 }, */
				var data = hospitalData.searchResult.hospital;
				for (var i = 0, ii = data.length; i < ii; i++) {
					var hosdata = data[i]
					
					var geocoder = new daum.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
					wtmX = hosdata.hosx, // 변환할 WTM X 좌표 입니다
					wtmY = hosdata.hosy; // 변환할 WTM Y 좌표 입니다
					var coords = new daum.maps.Coords(wtmX * 2.5, wtmY * 2.5); // wtm * 2.5 필요
					var coordChange = coords.toLatLng(); // 변환
					var spot = data[i]
					var latlng = new naver.maps.LatLng(coordChange.getLat(), coordChange.getLng())
					var marker = new naver.maps.Marker({
								position : latlng,
								draggable : false
							});
					markers.push(marker);
				}
				var htmlMarker1 = {
					content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(${mapImg}cluster-marker-1.png);background-size:contain;"></div>',
					size : N.Size(40, 40),
					anchor : N.Point(20, 20)
				}, htmlMarker2 = {
					content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(${mapImg}cluster-marker-2.png);background-size:contain;"></div>',
					size : N.Size(40, 40),
					anchor : N.Point(20, 20)
				}, htmlMarker3 = {
					content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(${mapImg}cluster-marker-3.png);background-size:contain;"></div>',
					size : N.Size(40, 40),
					anchor : N.Point(20, 20)
				}, htmlMarker4 = {
					content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(${mapImg}cluster-marker-4.png);background-size:contain;"></div>',
					size : N.Size(40, 40),
					anchor : N.Point(20, 20)
				}, htmlMarker5 = {
					content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(${mapImg}cluster-marker-5.png);background-size:contain;"></div>',
					size : N.Size(40, 40),
					anchor : N.Point(20, 20)
				};
				var markerClustering = new MarkerClustering({
					minClusterSize : 2,
					maxZoom : 8,
					map : map,
					markers : markers,
					disableClickZoom : false,
					gridSize : 120,
					icons : [ htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4,
							htmlMarker5 ],
					indexGenerator : [ 10, 100, 200, 500, 1000 ],
					stylingFunction : function(clusterMarker, count) {
						$(clusterMarker.getElement()).find('div:first-child').text(
								count);
					}
				});
				console.log(map);
				console.log(markerClustering);
				console.log(markerClustering.markers);
				naver.maps.Event.addListener(markerClustering, 'click', function(e) {
				    console.log(e);
				});
				
		    });
		    
		} else {
				
			alert("에러");
	
		}
			
			/* var infowindow = new naver.maps.InfoWindow();
			
			function onSuccessGeolocation(position) {
			    var location = new naver.maps.LatLng(position.coords.latitude,
			                                         position.coords.longitude);
			    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
			    map.setZoom(5); // 지도의 줌 레벨을 변경합니다.
			    infowindow.setContent('<div style="padding:20px;">' + 'Geolocation' + '</div>');
			    infowindow.open(map, location);
			    console.log('Coordinates: ' + location.toString());
			}
			function onErrorGeolocation() {
			    var center = map.getCenter();
			    infowindow.setContent('<div style="padding:20px;">' +
			        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
			    infowindow.open(map, center);
			}
			 */
			
			
		
		</script>
		<!-- 재영 끝-->


		

		<br> <br> <br>
	</div>
	<%@ include file="../setting/footer01.jsp"%>
	<script>
	
	</script>
</body>
</html>