<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emergency facility</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/css/SDHcss/sdhStyle.css">
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
			<h2>Emergencty  facility</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<br>
	<br>
	<br>
	
	${originData}
	<div id="map" style="width:500px;height:400px; margin-left: auto; margin-right: auto;"></div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c2e71a114ce757eb2a4b922679624c&libraries=clusterer"></script>
		<script>
			
			function getLocation() {
				  if (navigator.geolocation) { // GPS를 지원하면
				    navigator.geolocation.getCurrentPosition(function(position) {
				    	
				    var container = document.getElementById('map');
				      
					var options = { center: new daum.maps.LatLng(position.coords.latitude, position.coords.longitude), level: 3 };
				
					var map = new daum.maps.Map(container, options);
						
					var clusterer = new daum.maps.MarkerClusterer({
						    map: map,
						    markers: marker,
						    gridSize: 35,
						    averageCenter: true,
						    minLevel: 6,
						    disableClickZoom: true,
						    styles: [{
						        width : '53px', height : '52px',
						        background: 'url(cluster.png) no-repeat',
						        color: '#fff',
						        textAlign: 'center',
						        lineHeight: '54px'
						    }]
						});
						
						var markers = [] 
						
				    }, function(error) {
				      console.error(error);
				    }, {
				      enableHighAccuracy: false,
				      maximumAge: 0,
				      timeout: Infinity
				    });
				  } else {
				    alert('GPS를 지원하지 않습니다');
				  }
				}
			
				getLocation();	
			
			
		</script>
		
		<!-- 
			addMarkers(markers[, nodraw])
			여러개의 마커를 추가한다.
			
			var markers = [ marker1, marker2, marker3, ... ];
			
			clusterer.addMarker( markers );
			Parameters
			markers Array.< Marker > : 추가할 마커 객체 배열
			nodraw Boolean : 클러스터 redraw 여부. true인 경우 클러스터를 다시 그리지 않는다.
		 -->
		<br>
		<br>
		<br>

	<%@ include file="../setting/footer01.jsp"%>
</body>
</html>