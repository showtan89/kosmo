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
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>

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
			<h2>Emergency facility</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<br>
	<br>
	<br>


	<div id="map"
		style="width: 500px; height: 400px; margin-left: auto; margin-right: auto;">

	</div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c2e71a114ce757eb2a4b922679624c&libraries=services"></script>
<script>

function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	    
	      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	      mapOption = {
	          center: new daum.maps.LatLng(position.coords.latitude, position.coords.longitude), // 지도의 중심좌표
	          level: 3 // 지도의 확대 레벨
	      };

		  // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		  var map = new daum.maps.Map(mapContainer, mapOption);
	
		  <c:forEach var="hvo" items="${hlist}">
			  
			  var geocoder = new daum.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
			      wtmX = "${hvo.HOSLOCX}", // 변환할 WTM X 좌표 입니다
			      wtmY = "${hvo.HOSLOCY}"; // 변환할 WTM Y 좌표 입니다
		
			  // WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
			  geocoder.transCoord(wtmX, wtmY, transCoordCB, {
			      input_coord: daum.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
			      output_coord: daum.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
			  });
			      
		</c:forEach>
		      
		      
		      
	
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
		    
		    
	    
	    
	    
	    }, 
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    function(error) {
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

	<br>
	<br>
	<br>

	<%@ include file="../setting/footer01.jsp"%>
</body>
</html>