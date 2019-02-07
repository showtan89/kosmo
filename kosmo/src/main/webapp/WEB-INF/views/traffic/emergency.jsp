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
			<h2>Emergency  facility</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<br>
	<br>
	<br>
	
	
	<div id="map" style="width:500px;height:400px; margin-left: auto; margin-right: auto;">
	
	</div>

<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c2e71a114ce757eb2a4b922679624c&libraries=services"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);
	
	var i = 0;
	
	${hlist}.forEach(function(uvo) {
		
	});
	
	/* for (i=0; i<3657; i++) {
		
		var String = ${hlist[i].get('HOSADDRESS')};
		
		alert("체크 : " + String);
		
		var geocoder = new daum.maps.services.Geocoder(), 
		
	    wtmX = ${hlist[i].get('HOSLOCX')}, // 변환할 WTM X 좌표 입니다
	    wtmY = ${hlist[i].get('HOSLOCY')}; // 변환할 WTM Y 좌표 입니다
	    
		geocoder.transCoord(wtmX, wtmY, transCoordCB, {
		    input_coord: daum.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
		    output_coord: daum.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
		}); */
	}
	
	
	// 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
	function transCoordCB(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	    if (status === daum.maps.services.Status.OK) {
	
	        // 마커를 변환된 위치에 표시합니다
	        var marker = new daum.maps.Marker({
	            position: new daum.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치입니다
	            map: map // 마커를 표시할 지도객체입니다
	        })
	    }
	    
	}
	
</script>
		 -->
		<br>
		<br>
		<br>

	<%@ include file="../setting/footer01.jsp"%>
</body>
</html>