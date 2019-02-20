<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Directions</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
<style>

.Routeinformation p {
	margin: 0 0 3px 0;
	font-weight: bold;
}

</style>

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
			<h2>Get Directions</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<div class="row" style="margin: 20px 0;">
		<div class="col-12 col-md-3 col-lg-3" style="display:inline-block;margin: 30px 0;">
			<div class="row">
				<div align="center" style="display: block;" class="col-12 col-md-12 col-lg-12">
					<input type="text" placeholder="Please enter an Startaddress." 
						id="roadAddr_StartAddress" onclick="goPopup();" style="padding:0 5px;height: 50px; width: 100%;" readonly><br><br> 
					<input type="hidden" id="ehddnr" value="">
					<input type="button" class='btn alazea-btn' onclick="goPopup();" style="width: 100%;" value="Start Address Search"><br><br> 
					<input readonly type="text" placeholder="Please enter an Endaddress."
						id="roadAddr_EndAddress" onclick="goPopup2();" style="padding:0 5px;height: 50px; width: 100%;"><br><br>
					<input type="hidden" id="ehddnr2" value=""> 
					<input type="button" class='btn alazea-btn' onclick="goPopup2();" style="width: 100%;"
						value="End Address Search"><br><br> 
					<input type="button" class='btn alazea-btn'
						onclick="return searchjido();" style="width: 100%;" value="Get Directions">
					<input type="hidden" value="" id="x1"> <input type="hidden"
						value="" id="y1"> <input type="hidden" value="" id="x2">
					<input type="hidden" value="" id="y2">
				</div>
				<div class="col-12 col-md-12 col-lg-12" id="searchjson" align="center" style="margin-top: 20px; height: 400px;" >
				</div>
			</div>
		</div>
		<div class="col-12 col-md-9 col-lg-9" style="display:inline-block;margin: 0;" >
			<div id="map2" style="width: 100%; height: 800px;"></div>
		</div>
	</div>


	<%@ include file="../setting/footer01.jsp"%>
	
	
<!-- // 길찾기기능-======================================================================= -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=u91vrld6gw&submodules=geocoder"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5YhdM97rzIO5e2jM_nEK"></script>
<script language="javascript">
function goPopup(){
	$('#roadAddr_StartAddress').val(null);
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
    var pop = window.open("popStartAddress","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	
    if(checkNum == 1){
    	setmapmarker();
		for(pM = 0; pM<pMarkers.length; pM++){
			var pMarker = pMarkers[pM];
			pMarker.setMap(null);
		}
		var poly = polylines[0];
		poly.setMap(null);
		poly = polylines[1];
		poly.setMap(null);
		poly = polylines[2];
		poly.setMap(null);
		
		var mm1 = markers[0];
		var mm2 = markers[1];
		mm1.setMap(null);
		mm2.setMap(null);
		var infor1 = infoWindows[0];
		var infor2 = infoWindows[1];
		infor1.setMap(null);
		infor2.setMap(null);
		markers = [];
		infoWindows = [];
		mapObjArray = [];
		nStartArray = [];
		nEndArray = [];
		markerArray = [];
		infoWindowArray = [];
		polylines = [];
		marker4 = null;
		pMarkers = [];
		checkNum = 0;
		$('#roadAddr_EndAddress').val(null);
		$('#searchjson').empty();
	}
}

function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
						, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	$('#roadAddr_StartAddress').val(roadAddr);
	$('#ehddnr').val(korAddr);
	initGeocoder();
	
}

function goPopup2(){
	$('#roadAddr_EndAddress').val(null);
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
    var pop = window.open("popEndAddress","pop","width=570,height=420, scrollbars=yes, resizable=yes");
    
	if(checkNum == 1){
		setmapmarker();
		for(pM = 0; pM<pMarkers.length; pM++){
			var pMarker = pMarkers[pM];
			pMarker.setMap(null);
		}
		var poly = polylines[0];
		poly.setMap(null);
		poly = polylines[1];
		poly.setMap(null);
		poly = polylines[2];
		poly.setMap(null);
		
		var mm1 = markers[0];
		var mm2 = markers[1];
		mm1.setMap(null);
		mm2.setMap(null);
		var infor1 = infoWindows[0];
		var infor2 = infoWindows[1];
		infor1.setMap(null);
		infor2.setMap(null);
		markers = [];
		infoWindows = [];
		mapObjArray = [];
		nStartArray = [];
		nEndArray = [];
		markerArray = [];
		infoWindowArray = [];
		polylines = [];
		marker4 = null;
		pMarkers = [];
		checkNum = 0;
		$('#roadAddr_StartAddress').val(null);
		$('#searchjson').empty();
	}
}

function jusoCallBack2(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
						, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	$('#roadAddr_EndAddress').val(roadAddr);
	$('#ehddnr2').val(korAddr);
	initGeocoder2();
}

function findDirection(start,end){
	$('#roadAddr_StartAddress').val(start);
	$('#ehddnr').val(start);
	searchAddressToCoordinate(start);
	$('#roadAddr_EndAddress').val(end);
	$('#ehddnr2').val(end);
	searchAddressToCoordinate2(end);
	console.log(start,end);
}

naver.maps.onJSContentLoaded = initGeocoder;
</script>
	<script>
	var pointArray = new Array();
	
		/* 네이버 지도 열기 시작 */
		var mapOptions = {
			center : new naver.maps.LatLng(37.475382, 126.880625),
			zoom : 10,
			zoomControl : true,
			zoomControlOptions : {
				position : naver.maps.Position.TOP_LEFT,
				style : naver.maps.ZoomControlStyle.SMALL
			}
		};
		var map = new naver.maps.Map('map2', mapOptions);

		var markers = [];
		var infoWindows = [];
		var marker = new naver.maps.Marker;
		var marker2 = new naver.maps.Marker;
		var mapObjArray = new Array();
		var nStartArray = new Array();
		var nEndArray = new Array();
		var markerArray = new Array();
		var infoWindowArray = new Array();
		var polylines = new Array();
		var PoNum = 1;
		var marker4 = null;
		var pMarkers = [];
		var checkNum = 0;
		// 지도생성

		function initGeocoder() {
			var address2 = document.getElementById("ehddnr").value;
			searchAddressToCoordinate(address2);
			
		}
		
		function initGeocoder2() {
			var address3 = document.getElementById("ehddnr2").value;
			searchAddressToCoordinate2(address3);
			
		}
		
		// result by latlng coordinate
		function searchAddressToCoordinate(address) {
			marker.setMap(null);
			var  startx, starty;
			naver.maps.Service.geocode(
							{
								address : address
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									return alert('Something Wrong!');
								}
								var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명 주소]'
										: '[지번 주소]', point = new naver.maps.Point(
										item.point.x, item.point.y);

								startx = item.point.x;
								starty = item.point.y;
								document.getElementById("x1").value = startx;
								document.getElementById("y1").value = starty;
								var start = new naver.maps.Point(startx, starty);
								map.setCenter(start);
								marker = new naver.maps.Marker({
									position : new naver.maps.Point(startx,
											starty),
									map : map,
									draggable : false
								});
							});
		}
		
		function searchAddressToCoordinate2(address) {
			marker2.setMap(null);
			var endx2, endy2;
			naver.maps.Service.geocode(
					{
						address : address
					},
					function(status, response) {
						if (status === naver.maps.Service.Status.ERROR) {
							return alert('Something Wrong!');
						}
						var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명 주소]'
								: '[지번 주소]', point = new naver.maps.Point(
								item.point.x, item.point.y);
						
						endx2 = item.point.x;
						endy2 = item.point.y;
						
						document.getElementById("x2").value = endx2;
						document.getElementById("y2").value = endy2;

						var end = new naver.maps.Point(endx2, endy2);
						
						map.setCenter(end);

						marker2 = new naver.maps.Marker({
							position : new naver.maps.Point(endx2,
									endy2),
							map : map,
							draggable : false
						});
						
						
					});
			
		}
		
		
		
	
//===============길찾기 API 호출===========================================================================
		// 상세보기 클릭시 폴리레인 다시 표시
		function gidokilsearch(mapobjnum){
			if(checkNum == 1){
				for(pM = 0; pM<pMarkers.length; pM++){
					var pMarker = pMarkers[pM];
					pMarker.setMap(null);
				}
				var poly = polylines[0];
				poly.setMap(null);
				poly = polylines[1];
				poly.setMap(null);
				poly = polylines[2];
				poly.setMap(null);
				
			} 
			var nym = parseInt(mapobjnum+1);
			PoNum = nym;
			var mapnameObj = mapObjArray[mapobjnum];
			callMapObjApiAJAX(mapnameObj);
			
		} 
		
		function searchjido() {
			
			if(!document.getElementById("roadAddr_StartAddress").value){
				alert('Please enter your address.');
				document.getElementById("roadAddr_StartAddress").focus();
				return false;
			} else if(!document.getElementById("roadAddr_EndAddress").value){
				alert('Please enter your address.');
				document.getElementById("roadAddr_EndAddress").focus();
				return false;
			}
			
			if(checkNum == 1){
				return false;
			}
			checkNum = 1;
			gidoStartMarker();
			gidomarker();
				
	
			$('#searchjson').css('overflow', 'auto');
			var busType = new Array(); 
			busType[1] = '일반'; 	busType[2] = '좌석'; 	busType[3] = '마을'; busType[4] = '직행좌석'; 	busType[5] = '공항';
			busType[6] = '간선급행'; busType[10] = '외곽'; busType[11] = '간선'; 	busType[12] = '지선';
			busType[13] = '순환'; busType[14] = '광역'; busType[15] = '급행'; busType[20] = '농어촌'; busType[21] = '제주도시외';
			busType[22] = '경기도시외'; 	busType[26] = '급행간선';
		

			var subwayType = new Array();
			subwayType[1] = '1호선'; subwayType[2] = '2호선'; subwayType[3] = '3호선'; subwayType[4] = '4호선';
			subwayType[5] = '5호선'; subwayType[6] = '6호선'; subwayType[7] = '7호선'; 	subwayType[8] = '8호선';
			subwayType[9] = '9호선'; 	subwayType[100] = '분당선'; 	subwayType[101] = '공항'; 	subwayType[104] = '경의선';
			subwayType[107] = '에버라인'; 	subwayType[108] = '경춘선'; 	subwayType[102] = '자기부상'; 	subwayType[109] = '신분당선';
			subwayType[110] = '의정부'; 		subwayType[111] = '수인선'; 		subwayType[112] = '경강선';
			subwayType[113] = '우이신설선'; 	subwayType[114] = '서해선'; 			subwayType[21] = '인천1호선'; 		subwayType[22] = '인천2호선';
			subwayType[31] = '대전1호선'; 		subwayType[41] = '대구1호선'; 		subwayType[42] = '대구2호선';
			subwayType[43] = '대구3호선'; subwayType[51] = '광주1호선'; 			subwayType[71] = '부산1호선';
			subwayType[72] = '부산2호선'; 	subwayType[73] = '부산3호선'; 	subwayType[74] = '부산4호선'; 		subwayType[78] = '동해선';
			subwayType[79] = '부산-김해경';

			$(function() {
				var obj = new Object();
				var x1 = document.getElementById("x1").value;
				var y1 = document.getElementById("y1").value;
				var x2 = document.getElementById("x2").value;
				var y2 = document.getElementById("y2").value;
				var url2 = 'AddressJson?x1=' + x1 + '&y1=' + y1 + '&x2=' + x2
						+ '&y2=' + y2;
				$.ajax({
							url : url2,
							type : 'GET',
							dataType : 'json',
							success : function(obj) {
								var result = obj.result;
								var path = result.path;
								var subpath = path[0].subPath;
								var pathType = path[0].pathType;
								for (var i = 0; i < subpath.length; i++) {
									if (subpath[i].startExitX != null) {
										document.getElementById("x1").value = subpath[i].startExitX;
										document.getElementById("y1").value = subpath[i].startExitY;
									}
									if (subpath[i].endExitX != null) {
										document.getElementById("x2").value = subpath[i].endExitX;
										document.getElementById("y2").value = subpath[i].endExitY;
									}
								}
								var str;
								var c_num = 0;
								str = '<ul style="padding:10px;width:100%;" >';
								for (var i = 0; i < path.length; i++) {
									var info = path[i].info;
									var subPath = path[i].subPath;
									var a = parseInt(info.totalTime / 60);
									var b = parseInt(info.totalTime % 60);
									var totalDistance = 0;
									var markerArrayposition = new Array();
									var infoWindowArrayposition = new Array();
									 for(var np = 0; np<subPath.length;np++){
											if(subPath[np].trafficType==1 || subPath[np].trafficType==2 ){
												var passStop = subPath[np].passStopList;
												var stat = passStop.stations; 
												markerArrayposition.push(new naver.maps.Point(stat[0].x,stat[0].y));
												markerArrayposition.push(new naver.maps.Point(stat[(stat.length-1)].x,stat[(stat.length-1)].y));
												if(subPath[np].trafficType==1){
													var lane2 = subPath[np].lane;
													var Type2 = parseInt(lane2[0].subwayCode);
													
													var contentString3 = [
														  '<div class="iw_inner" style="padding: 10px;">',
													        '  <p>'+subwayType[Type2]+'('+ subPath[np].startName+'station)</p></div>'
												    ].join('');
												} else{
													var lane2 = subPath[np].lane;
													var Type2 = parseInt(lane2[0].type);
													var contentString3 = [
														  '<div class="iw_inner" style="padding: 10px;">',
													        '  <p>Bus' + 'No.'+ lane2[0].busNo+'('+subPath[np].startName+')</p></div>'
												    ].join('');
												}
												var infoWindow3 = new naver.maps.InfoWindow({
												    content: contentString3,
												    maxWidth: 300,
												    backgroundColor: "#eee",
												    borderColor: "#2db400",
												    borderWidth: 2,
												    anchorSize: new naver.maps.Size(30, 30),
												    anchorSkew: true,
												    anchorColor: "#eee",
												    pixelOffset: new naver.maps.Point(20, -20)
												});
												infoWindowArrayposition.push(infoWindow3);
												
											}
									}   
									 markerArray.push(markerArrayposition);
									 infoWindowArray.push(infoWindowArrayposition);
									 
									 for(var np = 0; np<subPath.length;np++){
										if(subPath[np].trafficType==1 || subPath[np].trafficType==2 ){
											if(subPath.length == 3){
												var passStop = subPath[np].passStopList;
												var stat = passStop.stations; 	
												 nEndArray.push(new naver.maps.Point(stat[(stat.length-1)].x,stat[(stat.length-1)].y));
												 nStartArray.push(new naver.maps.Point(stat[0].x,stat[0].y));
											} else if(np==(subPath.length-2)){
												var passStop = subPath[np].passStopList;
												var stat = passStop.stations; 	
												 nEndArray.push(new naver.maps.Point(stat[(stat.length-1)].x,stat[(stat.length-1)].y));
											} else if(nStartArray[(i+1)] == null){
												var passStop = subPath[np].passStopList;
												var stat = passStop.stations; 
												nStartArray.push(new naver.maps.Point(stat[0].x,stat[0].y));
												
											}  
										}
									}   
									mapObjArray[i] = info.mapObj;
									if (info.totalDistance > 1000) {
										totalDistance = parseInt(info.totalDistance / 1000);
										str += '<div >';
										str += '<li style="margin-top:10px;border-top:1px solid black;padding-top:5px;display:inline;position:relative;">';
										str += '<p onclick="gidokilsearch('+i+');"style="width:100%;margin:0;" align="left"><span style="border:1px solid black;width:25%;color:blue;padding:0 5px;"align="left">Route'
												+ (i + 1)
												+ '</span><span style="width:50%;color:red;font-size:20px;margin-left:5px;">&nbsp;&nbsp;About ';
										if (a > 0) {
											str += a + ' Hours '
										}
										str += b+ ' Minute&nbsp;&nbsp;</span><span style="width:30%;color:black;font-size:18px;margin-left:5px;">';
										if(info.payment==0){		
											str +=	'Unidentified</span></p>';
										} else{
											str += info.payment + '원</span></p>';
										}
										str += '<div style="border:1px solid black;position:absolute;top:-35px;right:-195px;"><a  id="styleblock'+ i
												+ '" onclick="Detail(Detailedpath'+ i+ ',stylenone'+ i+ ',styleblock'+ i+ ');">&nbsp;<img style="width:25px;height:25px;" src="resources/img/gido/gidosearch.png"></a></div>';
										str += '<div style="border:1px solid black;position:absolute;top:-35px;right:-195px;"><a id="stylenone'
												+ i+ '" onclick="Detailnone(Detailedpath'+ i+ ',styleblock'+ i+ ',stylenone'+ i+ ');" style="display:none">&nbsp;<img style="width:22px;height:25px;" src="resources/img/gido/gidosearch2.png">&nbsp;</a></div>';
										str += '</li>';

										// subPath for문 길찾기 노선 바뀌는 구간 표시 시작
										str += '<li width:100%;><p style="margin:0; font-weight:bold;word-break: normal;" align="left">';
									
										
										for (var j = 0; j < subPath.length; j++) {
											if (subPath[j].trafficType == 2) {
												var lane = subPath[j].lane;
												var Type = parseInt(lane[0].type);
												str += 'Bus' + 'No.'
														+ lane[0].busNo + '('
														+ subPath[j].startName
														+ ')   ';
											} else if (subPath[j].trafficType == 1) {
												var lane = subPath[j].lane;
												var Type = parseInt(lane[0].subwayCode);
												str += subwayType[Type] + '('
														+ subPath[j].startName
														+ 'station)   ';
											}
											if (subPath[j].trafficType != 3) {
												if ((j + 2) != subPath.length)
													str += ' -> ';
											}
										}

										str += '</p></li>';
										str += '<li style="width:100%;border-buttom:1px solid black;"><p style="margin:0;" align="left">';
										if (path[i].pathType == 2) {
											str += info.busTransitCount
													+ 'buses&nbsp;&nbsp;&nbsp;Total distance   :   '
													+ totalDistance;
											if (info.totalDistance > 1000) {
												str += "Km   ";
											} else {
												str += "M   ";
											}
										} else if (path[i].pathType == 1) {
											str += info.subwayTransitCount
													+ 'subways&nbsp;&nbsp;&nbsp;Total distance : '
													+ totalDistance;
											if (info.totalDistance > 1000) {
												str += "Km   ";
											} else {
												str += "M   ";
											}
										} else {
											str += info.busTransitCount
													+ '   buses&nbsp;  + &nbsp; '
													+ info.subwayTransitCount
													+ '   subways&nbsp;&nbsp;&nbsp;Total distance : '
													+ totalDistance;
											if (info.totalDistance > 1000) {
												str += "Km   ";
											} else {
												str += "M   ";
											}
										}
										str += '</p></li>';
										str += '<li class="Routeinformation" id="Detailedpath'+i+'" style="display:none;" align="left">';
										var StartAddress = document
												.getElementById("ehddnr").value;
										var EndAddress = document
												.getElementById("ehddnr2").value;
										str += '<p style="margin-top:5px;">'
												+ 'Start : ' + StartAddress
												+ '</p>';
										var ca = '';
										var pOldNum = 0;
										for (var p = 0; p < subPath.length; p++) {
											var pnewNum = parseInt(subPath[p].trafficType);
											if (pOldNum == 0) {
												if (pnewNum == 3) {
													pOldNum = pnewNum;
													if ((p + 1) == subPath.length) {
														if (subPath[p].distance > 1000) {
															var pNum = subPath[p].distance / 1000;
															pNum = Number(pNum)
																	.toFixed(2);
															str += 'Walk About   '
																	+ pNum
																	+ 'Km   '
																	+ EndAddress;
														} else {
															str += 'Walk About   '
																	+ subPath[p].distance
																	+ 'M   '
																	+ EndAddress;
														}
													}
													if (subPath[p].distance > 1000) {
														var pNum = subPath[p].distance / 1000;
														pNum = Number(pNum)
																.toFixed(2);
														ca = 'Walk About   '
																+ pNum + 'Km   ';
													} else {
														ca = 'Walk About '
																+ subPath[p].distance
																+ 'M   ';
													}

												} else if (pnewNum == 2) {
													var lane = subPath[p].lane;
													var Type = parseInt(lane[0].type);
													str += '<p>'
															+ 'Bus'
															+ 'No.'
															+ lane[0].busNo
															+ '('
															+ subPath[p].startName
															+ ')   After boarding,   ';
													str += subPath[p].endName
															+ '   Get off at the stop   ';
													pOldNum = pnewNum;
												} else {
													var lane = subPath[p].lane;
													var Type = parseInt(lane[0].subwayCode);
													str += '<p>'
															+ subwayType[Type]
															+ '   '
															+ subPath[p].startName
															+ '   station After boarding   '
															+ subPath[p].endName
															+ '   Get off at the stop   ';
													pOldNum = pnewNum;
												}
											} else {
												if (pOldNum == 3
														&& pnewNum != 3) {
													if (pnewNum == 1) {
														var lane = subPath[p].lane;
														var Type = parseInt(lane[0].subwayCode);
														if (subPath[p].distance != 0) {
															str += '<p>'
																	+ ca
																	+ subwayType[Type]
																	+ '   '
																	+ subPath[p].startName
																	+ '   station   </p>';
														}
														str += '<p>'
																+ subwayType[Type]
																+ '   '
																+ subPath[p].startName
																+ '   station After boarding   '
																+ subPath[p].endName
																+ '   Get off at the stop   </p>';
														pOldNum = pnewNum;
													} else {
														var lane = subPath[p].lane;
														var Type = parseInt(lane[0].type);
														if (subPath[p].distance != 0) {
															str += '<p>'
																	+ ca
																	+ subPath[p].startName
																	+ '   Bus Stop   </p>';
														}
														str += '<p>'
																+ 'Bus'
																+ 'No.'
																+ lane[0].busNo
																+ '('
																+ subPath[p].startName
																+ ')   After boarding,   ';
														str += subPath[p].endName
																+ '   Get off at the stop</p>   ';
														pOldNum = pnewNum;
													}
												} else if (pOldNum == 2
														&& pnewNum != 3) {
													if (pnewNum == 1) {
														var lane = subPath[p].lane;
														var Type = parseInt(lane[0].subwayCode);
														if (subPath[p].distance != 0) {
															str += '<p>'
																	+ ca
																	+ subwayType[Type]
																	+ '   '
																	+ subPath[p].startName
																	+ '   station   </p>';
														}
														str += '<p>'
																+ subwayType[Type]
																+ '   '
																+ subPath[p].startName
																+ '   station After boarding   '
																+ subPath[p].endName
																+ '   Get off at the stop   ';
														pOldNum = pnewNum;
													}
												} else if (pnewNum == 2) {
													var lane = subPath[p].lane;
													var Type = parseInt(lane[0].type);
													if (subPath[p].distance != 0) {
														str += '<p>'
																+ ca
																+ subPath[p].startName
																+ '   Bus Stop   </p>';
													}
													str += '<p>'
															+ 'Bus'
															+ 'No.'
															+ lane[0].busNo
															+ '('
															+ subPath[p].startName
															+ ')   After boarding,   ';
													str += subPath[p].endName
															+ '   Get off at the stop   ';
													pOldNum = pnewNum;
												} else if (pOldNum == 1
														&& pnewNum != 3) {
													if (pnewNum == 1) {
														var lane = subPath[p].lane;
														var Type = parseInt(lane[0].subwayCode);
														if (subPath[p].distance != 0) {
															str += '<p>'
																	+ ca
																	+ subwayType[Type]
																	+ '   '
																	+ subPath[p].startName
																	+ '   station   </p>';
														}
														str += '<p>'
																+ subwayType[Type]
																+ '   '
																+ subPath[p].startName
																+ '   station After boarding   '
																+ subPath[p].endName
																+ '   Get off at the stop   ';
														pOldNum = pnewNum;
													} else if (pnewNum == 2) {
														var lane = subPath[p].lane;
														var Type = parseInt(lane[0].type);
														if (subPath[p].distance != 0) {
															str += '<p>'
																	+ ca
																	+ subPath[p].startName
																	+ '   Bus Stop </p>';
														}
														str += '<p>'
																+ 'Bus'
																+ 'No.'
																+ lane[0].busNo
																+ '('
																+ subPath[p].startName
																+ ')   After boarding,   ';
														str += subPath[p].endName
																+ '   Get off at the stop   ';
														pOldNum = pnewNum;
													}
												} else if (pnewNum == 3
														&& subPath[p].distance != 0) {
													pOldNum = pnewNum;
													if ((p + 1) == subPath.length) {
														if (subPath[p].distance > 1000) {
															var pNum = subPath[p].distance / 1000;
															pNum = Number(pNum)
																	.toFixed(2);
															str += '<p>Walk   About   '
																	+ pNum
																	+ 'Km   '
																	+ EndAddress
																	+ '</p>';
														} else {
															str += '<p>Walk   About   '
																	+ subPath[p].distance
																	+ 'M   '
																	+ EndAddress
																	+ '</p>';
														}
													}
													if (subPath[p].distance > 1000) {
														var pNum = subPath[p].distance / 1000;
														pNum = Number(pNum)
																.toFixed(2);
														ca = 'Walk   About   '
																+ pNum + 'Km   ';
													} else {
														ca = 'Walk   About '
																+ subPath[p].distance
																+ 'M   ';
													}
												}

											}
											// subPath for문 길찾기 노선 바뀌는 구간 표시 종료

										}
										str += '<p>' + 'End: ' + EndAddress
												+ '</p>';
										str += '</li>';
									}
									c_num += c_num + 1;
									str+='</div>';
								}

								if (c_num == 0) {
									str += '<li>If the straight line distance between the place of departure and destination is less than 700m, no results will be provided.</li>';
								}
								str += '</ul>';
								$('#searchjson').html(str);
							},
							error : function() {
								alert('잠시 후 다시 시도해주세요.');
							}
						});
			});
			searchPubTransPathAJAX();
		}

		function callMapObjApiAJAX(mabObj) {
			var sx = document.getElementById("x1").value;
			var sy = document.getElementById("y1").value;
			var ex = document.getElementById("x2").value;
			var ey = document.getElementById("y2").value;
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"
					+ mabObj
					+ "&apiKey=hnsqv%2Bnl81sOEEMyauqSk2DiKsoH%2BY2VTPN4c2%2FhmB0";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var resultJsonData = JSON.parse(xhr.responseText);
					drawNaverPolyLine(resultJsonData); // 노선그래픽데이터 지도위 표시
					// boundary 데이터가 있을경우, 해당 boundary로 지도이동
					if (resultJsonData.result.boundary) {
						var boundary = new naver.maps.LatLngBounds(
								new naver.maps.LatLng(
										resultJsonData.result.boundary.top,
										resultJsonData.result.boundary.left),
								new naver.maps.LatLng(
										resultJsonData.result.boundary.bottom,
										resultJsonData.result.boundary.right));
						map.panToBounds(boundary);
					}
				}
			}
		}

		

		/* 노선그래픽 데이터 호출 시작 */

		function searchPubTransPathAJAX() {

			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var sx = document.getElementById("x1").value;
			var sy = document.getElementById("y1").value;
			var ex = document.getElementById("x2").value;
			var ey = document.getElementById("y2").value;
			var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+ sx+ "&SY="+ sy+ "&EX="+ ex+ "&EY="+ ey
					+ "&apiKey=hnsqv%2Bnl81sOEEMyauqSk2DiKsoH%2BY2VTPN4c2%2FhmB0";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log(JSON.parse(xhr.responseText)); // <- xhr.responseText 로 결과를 가져올 수 있음
					//노선그래픽 데이터 호출
					callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
				}
			}
		}
		/* 노선그래픽 데이터 호출 종료 */
		
		// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
		function drawNaverPolyLine(data) {
			var lineArray;
			lineArray = null;
			lineArray = new Array();
			for (var i = 0; i < data.result.lane.length; i++) {
				for (var j = 0; j < data.result.lane[i].section.length; j++) {
					for (var k = 0; k < data.result.lane[i].section[j].graphPos.length; k++) {
						lineArray.push(new naver.maps.LatLng(
								data.result.lane[i].section[j].graphPos[k].y,
								data.result.lane[i].section[j].graphPos[k].x));
					}
				}
			}
			
			polylines = [];
					var polyline1 = new naver.maps.Polyline({
						map : map,
						path : lineArray, 
						strokeWeight : 3,
						strokeColor : '#003499'
					});
					var polyline2 = new naver.maps.Polyline({
						map : map,
						path : [nStartArray[0],nStartArray[PoNum]], 
						strokeWeight : 3,
						strokeStyle : 'shortdash',
						strokeColor : '#003499'
					});
					var polyline3 = new naver.maps.Polyline({
						map : map,
						path : [nEndArray[0],nEndArray[PoNum]], 
						strokeWeight : 3,
						strokeStyle : 'shortdash',
						strokeColor : '#003499'
					});
					polylines.push(polyline1);
					polylines.push(polyline2);
					polylines.push(polyline3);
					var pos = markerArray[(PoNum-1)];
					pMarkers = [];
					for(var po=0; po<pos.length;po++){
						marker4 = new naver.maps.Marker({
							position : new naver.maps.Point(pos[po].x,
							pos[po].y),
							map : map,
						});
						pMarkers.push(marker4);
					}
					
					
		}
		
		
		function gidoStartMarker(){
			nStartArray = [];
			nEndArray = [];
			markers = [];
			infoWindows = [];
			
				var startx = document.getElementById("x1").value;
				var starty = document.getElementById("y1").value;
				var addres = document.getElementById("roadAddr_StartAddress").value;
				var contentString = [
					  '<div class="iw_inner" style="padding: 10px;">',
				        '   <h4 align="center">Start Address</h2>',
				        '   <p>'+addres+'</p>',
				        '</div>'
			    ].join('');
				var infoWindow = new naver.maps.InfoWindow({
				    content: contentString,
				    maxWidth: 300,
				    backgroundColor: "#eee",
				    borderColor: "#2db400",
				    borderWidth: 2,
				    anchorSize: new naver.maps.Size(30, 30),
				    anchorSkew: true,
				    anchorColor: "#eee",
				    pixelOffset: new naver.maps.Point(20, -20)
				});
				nStartArray.push(new naver.maps.Point(startx,starty));
				markers.push(marker);
				infoWindows.push(infoWindow);
				
		
				var endx2 = document.getElementById("x2").value;
				var endy2 = document.getElementById("y2").value;
				var addres2 = document.getElementById("roadAddr_EndAddress").value;
				var contentString2 = [
			        '<div class="iw_inner" style="padding: 10px;">',
			        '   <h4 align="center">End Address</h2>',
			        '   <p>'+addres2+'</p>',
			        '</div>'
			    ].join('');
				var infoWindow2 = new naver.maps.InfoWindow({
				    content: contentString2,
				    maxWidth: 300,
				    backgroundColor: "#eee",
				    borderColor: "#2db400",
				    borderWidth: 2,
				    anchorSize: new naver.maps.Size(30, 30),
				    anchorSkew: true,
				    anchorColor: "#eee",
				    pixelOffset: new naver.maps.Point(20, -20)
				});
				nEndArray.push(new naver.maps.Point(endx2, endy2));
				markers.push(marker2);
				infoWindows.push(infoWindow2);
			
		}
		
		
		
		
		
		function gidomarker(){
			naver.maps.Event.addListener(map, 'idle', function() {
			    updateMarkers(map, markers);
			});

			function updateMarkers(map, markers) {

			    var mapBounds = map.getBounds();
			    var marker3, position;

			    for (var i = 0; i < markers.length; i++) {

			        marker3 = markers[i];
			        position = marker3.getPosition();

			        if (mapBounds.hasLatLng(position)) {
			            showMarker(map, marker3);
			        } else {
			            hideMarker(map, marker3);
			        }
			    }
			}

			function showMarker(map, marker) {
			    if (marker.setMap()) return;
			    marker.setMap(map);
			}

			function hideMarker(map, marker) {
			    if (!marker.setMap()) return;
			    marker.setMap(null);
			}

			// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
			function getClickHandler(seq) {
			    return function(e) {
			        var marker3 = markers[seq],
			            infoWindow = infoWindows[seq];
			        if (infoWindow.getMap()) {
			            infoWindow.close();
			        } else {
			            infoWindow.open(map, marker3);
			        }
			    }
			}

			for (var i=0, ii=markers.length; i<ii; i++) {
			    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
			}
		}
		
		
		function setmapmarker(){
			naver.maps.Event.addListener(map, 'markernull', function() {
			    updateMarkers(map, markers);
			});

			function updateMarkers(map, markers) {

			    var mapBounds = map.getBounds();
			    var marker3, position;

			    for (var i = 0; i < markers.length; i++) {
			        marker3 = markers[i];
			        position = marker3.getPosition();

			        if (mapBounds.hasLatLng(position)) {
			            marker3.setMap(null);
			        } else {
			            marker3.setMap(null);
			        }
			    }
			}

			function showMarker(map, marker) {
			    if (marker.setMap()) return;
			    marker.setMap(null);
			}

			function hideMarker(map, marker) {
			    if (!marker.setMap()) return;
			    marker.setMap(null);
			}

			// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
			function getClickHandler(seq) {
			    return function(e) {
			        var marker3 = markers[seq],
			            infoWindow = infoWindows[seq];
			        if (infoWindow.getMap()) {
			            infoWindow.setMap(null);
			        } else {
			        	infoWindow.setMap(null);
			        }
			    }
			}

			for (var i=0, ii=markers.length; i<ii; i++) {
			    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
			}
		}
	</script>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<script>
		function Detail(Detailid, style, style2) {
			var name = Detailid;
			$(style).css('display', 'block');
			$(style2).css('display', 'none');
			$(Detailid).css('display', 'block');
		}
		function Detailnone(Detailid, style, style2) {
			var name = Detailid;
			$(style).css('display', 'block');
			$(style2).css('display', 'none');
			$(Detailid).css('display', 'none');
		}
		
		
		
		$(function(){
			<c:if test="${fn:length(startPoint) >0 && fn:length(endPoint) >0}">
				var start = "${startPoint}";
				var end = "${endPoint}";
				findDirection(start,end);
			</c:if>
		})
		
	</script>
	
</body>
</html>