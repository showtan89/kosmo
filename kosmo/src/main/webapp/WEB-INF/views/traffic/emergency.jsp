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
			style="background-image: url(resources/img/ehddnr2.jpg);">
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
<script>
var map = new naver.maps.Map('map', mapOptions);



var infoWindow = new naver.maps.InfoWindow({
    anchorSkew: true
});

map.setCursor('pointer');
//search by tm128 coordinate
function searchCoordinateToAddress(latlng) {
    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

    infoWindow.close();

    naver.maps.Service.reverseGeocode({
        location: tm128,
        coordType: naver.maps.Service.CoordType.TM128
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var items = response.result.items,
            htmlAddresses = [];

        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
            item = items[i];
            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
        }

        infoWindow.setContent([
                '<div style="padding:10px;min-width:200px;line-height:150%;">',
                '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
                htmlAddresses.join('<br />'),
                '</div>'
            ].join('\n'));

        infoWindow.open(map, latlng);
    });
}

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

        infoWindow.setContent([
                '<div style="padding:10px;min-width:200px;line-height:150%;">',
                '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
                addrType +' '+ item.address +'<br />',
                '</div>'
            ].join('\n'));


        map.setCenter(point);
        infoWindow.open(map, point);
    });
}

function initGeocoder() {
    map.addListener('click', function(e) {
        searchCoordinateToAddress(e.coord);
    });

    $('#address').on('keydown', function(e) {
        var keyCode = e.which;

        if (keyCode === 13) { // Enter Key
            searchAddressToCoordinate($('#address').val());
        }
    });

    $('#submit').on('click', function(e) {
        e.preventDefault();

        searchAddressToCoordinate($('#address').val());
    });

    searchAddressToCoordinate('정자동 178-1');
}

naver.maps.onJSContentLoaded = initGeocoder;


/* 
var mapOptions = {
		center: new naver.maps.LatLng(37.3595704, 127.105399),
		zoom: 10
	};

	var map = new naver.maps.Map('map', mapOptions);
	
	var sx = 126.93737555322481;
	var sy = 37.55525165729346;
	var ex = 126.88265238619182;
	var ey = 37.481440035175375;
	
	function searchPubTransPathAJAX() {
		var xhr = new XMLHttpRequest();
		//ODsay apiKey 입력
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
	searchPubTransPathAJAX();
	
	function callMapObjApiAJAX(mabObj){
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
	} */
</script>
	
<!-- 
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c2e71a114ce757eb2a4b922679624c&libraries=services"></script>
<script>
		<script type="text/javascript"
			src="resources/js/plugins/hospitalData.js"></script>
		<script>
			var map = new naver.maps.Map("map", {
				zoom : 2,
				center : new naver.maps.LatLng(36.2253017, 127.6460516),
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


		<!-- <script>
		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.5666805, 126.9784147),
			zoom : 5,
			mapTypeId : naver.maps.MapTypeId.NORMAL
		});

		<c:forEach var="hvo" items="${hlist}">

		var geocoder = new daum.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
		wtmX = "${hvo.HOSLOCX}", // 변환할 WTM X 좌표 입니다
		wtmY = "${hvo.HOSLOCY}"; // 변환할 WTM Y 좌표 입니다

		// WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
		geocoder.transCoord(wtmX, wtmY, transCoordCB, {
			input_coord : daum.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
			output_coord : daum.maps.services.Coords.WGS84, // 변환 결과로 받을 좌표계 입니다 
		});
		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(wtmX, wtmY),
			map : map
		});

		</c:forEach>
	</script> -->

		<!-- <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c2e71a114ce757eb2a4b922679624c&libraries=services"></script>
	<script>
		function getLocation() {
			if (navigator.geolocation) { // GPS를 지원하면
				navigator.geolocation.getCurrentPosition(function(position) {
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new daum.maps.LatLng(position.coords.latitude,
								position.coords.longitude), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					console.log("cetner" + mapOption.center)

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption);

					<c:forEach var="hvo" items="${hlist}">
					var geocoder = new daum.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
					wtmX = "${hvo.HOSLOCX}", // 변환할 WTM X 좌표 입니다
					wtmY = "${hvo.HOSLOCY}"; // 변환할 WTM Y 좌표 입니다

					// WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
					geocoder.transCoord(wtmX, wtmY, transCoordCB, {
						input_coord : daum.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
						output_coord : daum.maps.services.Coords.WGS84, // 변환 결과로 받을 좌표계 입니다 
					});
					</c:forEach>

					// 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
					function transCoordCB(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === daum.maps.services.Status.OK) {

							// 마커를 변환된 위치에 표시합니다
							var marker = new daum.maps.Marker({

								position : new daum.maps.LatLng(result[0].y,
										result[0].x), // 마커를 표시할 위치입니다
								map : map
							// 마커를 표시할 지도객체입니다
							})
						}
					}
				},

				function(error) {
					console.error(error);
				}, {
					enableHighAccuracy : false,
					maximumAge : 0,
					timeout : Infinity
				});

			} else {
				alert('GPS를 지원하지 않습니다');
			}
		}
		getLocation();
	</script> -->

		<br> <br> <br>
	</div>
	<%@ include file="../setting/footer01.jsp"%>
	<script>

	/* $(window).on("load", function() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
	    } else {
	        var center = map.getCenter();
	        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
	        infowindow.open(map, center);
	    }
	}); */
	
	</script>
</body>
</html>