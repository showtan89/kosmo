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
<script language="javascript">
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
    var pop = window.open("popStartAddress","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
						, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	$('#roadAddr_StartAddress').val(roadAddr);
	$('#ehddnr').val(korAddr);
	initGeocoder();
	
}

function goPopup2(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
    var pop = window.open("popEndAddress","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack2(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
						, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	$('#roadAddr_EndAddress').val(roadAddr);
	$('#ehddnr2').val(korAddr);
	initGeocoder2();
}
</script>
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
					<input type="text" placeholder="Please enter an address."
						id="roadAddr_StartAddress" style="height: 50px; width: 100%;"><br><br> 
					<input type="hidden" id="ehddnr" value="">
					<input type="button" class='btn alazea-btn'
						onclick="goPopup();" style="width: 100%;" value="Start Address Search"><br><br> 
					<input type="text" placeholder="Please enter an address."
						id="roadAddr_EndAddress" style="height: 50px; width: 100%;"><br><br>
					<input type="hidden" id="ehddnr2" value=""> 
					<input type="button" class='btn alazea-btn'
						onclick="goPopup2();" style="width: 100%;"
						value="End Address Search"><br><br> 
					<input type="button" class='btn alazea-btn'
						onclick="searchjido();" style="width: 100%;" value="Get Directions">
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

	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=u91vrld6gw&submodules=geocoder"></script>
	<!-- // 길찾기기능-======================================================================= -->
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5YhdM97rzIO5e2jM_nEK"></script>
	<script>
	var pointArray = new Array();
	
		/* 네이버 지도 열기 시작 */
		var mapOptions = {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
		};
		var map = new naver.maps.Map('map2', mapOptions);

		
		var startx, starty, endx2, endy2;
		var marker = new naver.maps.Marker;
		var marker2 = new naver.maps.Marker;
		
		var nStartArray = new Array();
		var nEndArray = new Array();
		// 지도생성

		function initGeocoder() {
			var address2 = document.getElementById("ehddnr").value;
			searchAddressToCoordinate(address2);
		}
		
		function initGeocoder2() {
			var address3 = document.getElementById("ehddnr2").value;
			searchAddressToCoordinate2(address3);
		}
		
		naver.maps.onJSContentLoaded = initGeocoder;
		naver.maps.onJSContentLoaded = initGeocoder2;
		
		// result by latlng coordinate
		function searchAddressToCoordinate(address) {
			marker.setMap(null);
			naver.maps.Service
					.geocode(
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
								nStartArray.push(new naver.maps.Point(startx,starty));
								map.setCenter(start);
								marker = new naver.maps.Marker({
									position : new naver.maps.Point(startx,
											starty),
									map : map
								});
							});
		}

		function searchAddressToCoordinate2(address) {
			marker2.setMap(null);
			naver.maps.Service
				.geocode(
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
						nEndArray.push(new naver.maps.Point(endx2, endy2));
						map.setCenter(end);

						marker2 = new naver.maps.Marker({
							position : new naver.maps.Point(endx2,
									endy2),
							map : map
						});
					});
		}
		
		
		$(document).on('keydown', function(e) {
		    if (e.which === 27) {  // ESC 키
		        polyline.setMap(null);
		        polyline = null;
		       
		        // marker 의 목록을 순회하면서 setMap(null) 호출하여 제거
		    }
		});
		var mapObjArray = new Array();
		
		
//===============길찾기 API 호출===========================================================================
		function searchjido() {
			
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
									
									 for(var np = 0; np<subPath.length;np++){
										if(subPath[np].trafficType==1 || subPath[np].trafficType==2 ){
											if(np==(subPath.length-2)){
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
										var newnum = 0;
										var oldnum = 0;
										for (var k = (subPath.length - 1); k >= 0; k--) {

											if (subPath[k].trafficType == 2
													|| subPath[k].trafficType == 1) {
												newnum = oldnum;
												break;
											} else {
												oldnum += oldnum + 1;
											}
										}
										
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
										str += '<p>' + 'Arrive : ' + EndAddress
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
		
	
		
		
		// 상세보기 클릭시 폴리레인 다시 표시
	
		
		
		
		// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
		var oldlineArray = new Array();
		var polyline=null;
		var polyline2 = null;
		var polyline3 = null;
		var PoNum = 1;
		
		
		function gidokilsearch(mapobjnum){
			polyline.setMap(null);
			polyline2.setMap(null);
			polyline3.setMap(null);
			var nym = parseInt(mapobjnum+1);
			PoNum = nym;
			var mapnameObj = mapObjArray[mapobjnum];
			callMapObjApiAJAX(mapnameObj);
			
		} 
		
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
					polyline = new naver.maps.Polyline({
					map : map,
					path : lineArray, 
					strokeWeight : 3,
					strokeColor : '#003499'
				});
					polyline2 = new naver.maps.Polyline({
						map : map,
						path : [nStartArray[0],nStartArray[PoNum]], 
						strokeWeight : 3,
						strokeStyle : 'shortdash',
						strokeColor : '#003499'
					});
					polyline3 = new naver.maps.Polyline({
						map : map,
						path : [nEndArray[0],nEndArray[PoNum]], 
						strokeWeight : 3,
						strokeStyle : 'shortdash',
						strokeColor : '#003499'
					});
					
		}
		
		
	
		
		
		
	</script>
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
	</script>
	
</body>
</html>