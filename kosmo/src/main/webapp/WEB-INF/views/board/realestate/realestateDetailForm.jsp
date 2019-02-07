<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Helper - Realestate</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2113e8e90cb14482a6dafae2a87eac5d&libraries=services"></script>
<style>
.dropdown-menu {
	min-width: 65px !important;
	margin-left: auto;
	margin-right: auto;
}

.writerTag {
	background-color: #70c745;
	border-radius: 2px;
	display: inline-block;
	padding: 0 10px;
	color: #ffffff;
	z-index: 10;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 200px; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

</style>
</head>

<!-- 프리로더 이미지 -->
<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<jsp:include page="../../setting/header01.jsp" flush="false" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="realimage" value="resources/img/board/realestate/" />

<!-- 메뉴바 아래 이미지 -->
<div class="breadcrumb-area">
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${realimage}realestatemenu.jpg);">
		<h2>REALESTATE</h2>
	</div>
	<br> <br>
</div>

<!-- 부동산 게시판 본문  -->
<div class="container" style="margin-bottom: 50px;">
	<hr>
	<br> <br>

	<!-- 로그인 및 회원정보 관련 부분 -->
	<%@page import="com.spring.helper.vo.BoardVO.UserVO"%>
	<c:if test="${sessionScope.userVO!=null }">
		<c:set var="loginId" value="${sessionScope.userVO.memberId}" />
	</c:if>
	<c:if test="${sessionScope.userVO==null }">
		<c:set var="loginId" value="null" />
	</c:if>
	<input type="hidden" name="realestateNumber" id="realestateNumber" value="${param.realestateNumber}"> 
	<input type="hidden" name="memberId" id="memberId" value="${rVO.memberId}"> 
	<input type="hidden" name="memberEmail" id="memberEmail" value="${rVO.memberEmail}"> 
	<input type="hidden" name="loginId" id="loginId" value="${loginId}">
	<!-- 로그인 및 회원정보 관련 부분 끝 -->

	<section class="single_product_details_area mb-50">
		<div class="produts-details--content mb-50">
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-12 col-md-6 col-lg-5">
						<div class="single_product_thumb">
							<div id="product_details_slider" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<a class="product-img" href="${realimage}${rVO.realestateImg1}" title="Image 1">
										<img class="d-block w-100" src="${realimage}${rVO.realestateImg1}" alt="1">
										</a>
									</div>
									<c:if test="${!rVO.realestateImg2.equals('empty')}">
										<div class="carousel-item">
											<a class="product-img" href="${realimage}${rVO.realestateImg2}" title="Image 2">
											<img class="d-block w-100" src="${realimage}${rVO.realestateImg2}" alt="2">
											</a>
										</div>
									</c:if>
									<c:if test="${!rVO.realestateImg3.equals('empty')}">
										<div class="carousel-item">
											<a class="product-img" href="${realimage}${rVO.realestateImg3}" title="Image 3">
											<img class="d-block w-100" src="${realimage}${rVO.realestateImg3}" alt="3">
											</a>
										</div>
									</c:if>
								</div>
								<ol class="carousel-indicators">
									<c:if test="${rVO.realestateImg1 ne 'empty'}">
										<li class="active" data-target="#product_details_slider"
											data-slide-to="0"
											style="background-image: url(${realimage}${rVO.realestateImg1});"></li>
									</c:if>
									<c:if test="${rVO.realestateImg2 ne 'empty'}">
										<li data-target="#product_details_slider" data-slide-to="1"
											style="background-image: url(${realimage}${rVO.realestateImg2});"></li>
									</c:if>
									<c:if test="${rVO.realestateImg3 ne 'empty'}">
										<li data-target="#product_details_slider" data-slide-to="2"
											style="background-image: url(${realimage}${rVO.realestateImg3});"></li>
									</c:if>
								</ol>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="single_product_desc">
							<h4 class="title">${rVO.realestateSubject}</h4>
							<h4 class="price">
								<fmt:setLocale value="ko_KR" />
								<fmt:formatNumber value="${rVO.realestatePrice}" type="currency" />
							</h4>
							<!-- 
							realestateNumber=541, memberNumber=10006, 
							boardCode=20, memberEmail=korea@naver.com, memberId=korea, 
							realestateTerm=undetemined, 
							realestateMoveindate=2019-05-17 00:00:00, 
							realestateFavorite=empty, realestateRecommend=0, 
							realestateLookup=0, realestateRegdate=19/01/21, realestateCheckday=empty, 
							realestateImg1=demo29.jpg, realestateImg2=empty, 
							realestateImg3=empty, 
							 -->
							<div class="description_area">
								<p>
									<span>Location detail : </span> <span>${rVO.realestateLocation}</span>
									<input type="hidden" value='${rVO.realestateTemp2}' id="realestateTemp2">
								</p>
								<p>
									<span>Management fees per Week : </span> <span> <fmt:setLocale
											value="ko_KR" /> <fmt:formatNumber
											value="${rVO.realestateManagement}" type="currency" /></span>
								</p>

								<p>
									<span>Security Deposit : </span> <span> <c:if
											test="${rVO.realestateDepositCheck.equals('off')}">
										none
									</c:if> <c:if test="${rVO.realestateDepositCheck.equals('on')}">
											<fmt:setLocale value="ko_KR" />
											<fmt:formatNumber value="${rVO.realestateDeposit}"
												type="currency" />
										</c:if></span>
								</p>
								<p>
									<span>Number of Rooms : </span> <span> <c:if
											test="${rVO.realestateRoom.equals('over3')}">
									 			more than 3
									 	</c:if> <c:if test="${!rVO.realestateRoom.equals('over3')}">
								 			${rVO.realestateRoom }
								 		</c:if>
									</span>
								</p>
								<p>
									<span>Number of Bathrooms : </span> <span> <c:if
											test="${rVO.realestateToilet.equals('over3')}">
								 			more than 3
								 		</c:if> <c:if test="${!rVO.realestateToilet.equals('over3')}">
								 			${rVO.realestateToilet }
								 		</c:if>
									</span>
								</p>
								<p>
									<span>Floor / Level : </span> <span> 
										<c:if test="${rVO.realestateState.equals('1')}">
								 			1
								 		</c:if> <c:if test="${rVO.realestateState.equals('2')}">
								 			2
								 		</c:if> <c:if test="${rVO.realestateState.equals('3')}">
								 			3
								 		</c:if> <c:if test="${rVO.realestateState.equals('4')}">
								 			4
								 		</c:if> <c:if test="${rVO.realestateState.equals('5')}">
								 			5
								 		</c:if> <c:if test="${rVO.realestateState.equals('6to10')}">
								 			Between 6 and 10
								 		</c:if> <c:if test="${rVO.realestateState.equals('11to15')}">
								 			Between 11 and 15
								 		</c:if> <c:if test="${rVO.realestateState.equals('16to20')}">
								 			Between 16 and 20
								 		</c:if> <c:if test="${rVO.realestateState.equals('over20')}">
								 			Higher than 20
								 		</c:if> <c:if test="${rVO.realestateState.equals('under')}">
								 			Underground
								 		</c:if>
									</span>
								</p>
								<div class="description_area">
									<p>${rVO.realestateContent}</p>
								</div>

							</div>
							<div class="single-widget-area products--meta">
								<ol class="popular-tags d-flex flex-wrap">

									<c:if test="${rVO.realestateCategory1.equals('seoul')}">
										<li><a>Seoul (서울)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('busan')}">
										<li><a>Busan (부산)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('incheon')}">
										<li><a>Incheon (인천)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('gwangju')}">
										<li><a>Gwangju (광주)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('daejeon')}">
										<li><a>Daejeon (대전)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('sejong')}">
										<li><a>Sejong (세종)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('daegu')}">
										<li><a>Daegu (대구)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('ulsan')}">
										<li><a>Ulsan (울산)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('gyeonggi')}">
										<li><a>Gyeonggi-do (경기도)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('gangwon')}">
										<li><a>Gangwon-do (강원도)</a></li>
									</c:if>
									<c:if
										test="${rVO.realestateCategory1.equals('chungcheongbuk')}">
										<li><a>Chungcheongbuk-do (충청북도)</a></li>
									</c:if>
									<c:if
										test="${rVO.realestateCategory1.equals('chungcheongnam')}">
										<li><a>Chungcheongnam-do (충청남도)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('gyeongsangbuk')}">
										<li><a>Gyeongsangbuk-do (경상북도)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('gyeongsangnam')}">
										<li><a>Gyeongsangnam-do (경상남도)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('jeollabuk')}">
										<li><a>Jeollabuk-do (전라북도)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('jeollanam')}">
										<li><a>Jeollanam-do (전라남도)</a></li>
									</c:if>
									<c:if test="${rVO.realestateCategory1.equals('jeju')}">
										<li><a>Jeju-do (제주도)</a></li>
									</c:if>

									<c:if test="${rVO.realestateType.equals('apart')}">
										<li><a>Apartment</a></li>
									</c:if>
									<c:if test="${rVO.realestateType.equals('villa')}">
										<li><a>Villa</a></li>
									</c:if>
									<c:if test="${rVO.realestateType.equals('house')}">
										<li><a>House</a></li>
									</c:if>
									<c:if test="${rVO.realestateType.equals('studio')}">
										<li><a>Studio</a></li>
									</c:if>
									<c:if test="${rVO.realestateType.equals('office')}">
										<li><a>Office</a></li>
									</c:if>

									<c:if test="${rVO.realestateSize.equals('under33')}">
										<li><a>~33㎡</a></li>
									</c:if>
									<c:if test="${rVO.realestateSize.equals('33to66')}">
										<li><a>33~66㎡</a></li>
									</c:if>
									<c:if test="${rVO.realestateSize.equals('66to99')}">
										<li><a>66~99㎡</a></li>
									</c:if>
									<c:if test="${rVO.realestateSize.equals('99to132')}">
										<li><a>99~132㎡</a></li>
									</c:if>
									<c:if test="${rVO.realestateSize.equals('132to165')}">
										<li><a>132~165㎡</a></li>
									</c:if>
									<c:if test="${rVO.realestateSize.equals('165to198')}">
										<li><a>165~198㎡</a></li>
									</c:if>
									<c:if test="${rVO.realestateSize.equals('198to231')}">
										<li><a>198~231㎡</a></li>
									</c:if>
									<c:if test="${rVO.realestateSize.equals('more231')}">
										<li><a>231㎡~</a></li>
									</c:if>

									<c:if test="${rVO.realestateGender.equals('both')}">
										<li><a>Both Gender</a></li>
									</c:if>
									<c:if test="${rVO.realestateGender.equals('male')}">
										<li><a>Male Only</a></li>
									</c:if>
									<c:if test="${rVO.realestateGender.equals('female')}">
										<li><a>Female Only</a></li>
									</c:if>

									<c:if test="${rVO.realestateOptionCheck.equals('on')}">
										<li><a>Fully Furnished</a></li>
									</c:if>
									<c:if test="${rVO.realestateTobaccoCheck.equals('on')}">
										<li><a>Smoking Allowed</a></li>
									</c:if>
									<c:if test="${rVO.realestatePetCheck.equals('on')}">
										<li><a>Pets Allowed</a></li>
									</c:if>
									<c:if test="${rVO.realestateBalcony.equals('on')}">
										<li><a>Has Balcony</a></li>
									</c:if>
									<c:if test="${rVO.realestateCar.equals('on')}">
										<li><a>Has Parking lot</a></li>
									</c:if>
									<c:if test="${rVO.realestateTemp1.equals('on')}">
										<li><a>Has Elevator</a></li>
									</c:if>

									<c:if test="${rVO.realestateHeatingtype.equals('individual')}">
										<li><a>Individual heating</a></li>
									</c:if>
									<c:if test="${rVO.realestateHeatingtype.equals('central')}">
										<li><a>Central heating</a></li>
									</c:if>
									<c:if test="${rVO.realestateHeatingtype.equals('district')}">
										<li><a>District heating</a></li>
									</c:if>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${rVO.memberId.equals(loginId)}">
			<a href="realestateModifyForm?realestateNumber=${param.realestateNumber}"><button type="button" class='btn alazea-btn'>Modify</button></a>
			<button id="myBtn" class='btn alazea-btn active'>Delete</button>
			
			<!-- The Modal -->
			<div id="myModal" class="modal">
				<!-- Modal content -->
				<div class="modal-content">
					<h5 align='center'>Are you sure?</h5><br>
					<a href="realestateDeletePro?realestateNumber=${param.realestateNumber}"><button type="button" class='btn alazea-btn'>Delete</button></a><br>
					<a><button type="button" id="closeModal" class='btn alazea-btn'>CLOSE</button></a>
				</div>
			</div>
			<script>
			// Get the modal
			var modal = document.getElementById('myModal');
			var btn = document.getElementById("myBtn");
			var span = document.getElementById("closeModal");
			btn.onclick = function() {
				modal.style.display = "block";
			}
			span.onclick = function() {
				modal.style.display = "none";
			}
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}
			</script>
		</c:if>
		
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_details_tab clearfix">
						<!-- Tabs -->
						
						<div class="col-md-12 mb-4" id="map">
						</div>
						
						<!--<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							<li class="nav-item"><a href="#reviews" class="nav-link active" data-toggle="tab" role="tab">Comments</a></li>
							 <li class="nav-item"><a href="#description" class="nav-link" data-toggle="tab" role="tab"> Additional Information</a></li> 
						</ul>-->
						<!-- Tab Content -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active" id="reviews">
								<c:if test="${sessionScope.userVO ne null }">
									<c:if test="${sessionScope.userVO.authority ne 'ROLE_GUEST' }">
									<div class="submit_a_review_area mt-50">
										<h4>Submit Comment</h4>
										<!-- <form action="realestateCommentPro" method="post"> -->
										<div class="row">
											<div class="col-12">
												<div class="form-group">
													<input type="hidden" name="realestateNumber"
														id="realestateNumber" value="${param.realestateNumber}">
													<textarea class="form-control" id="rCommentContent"
														name='rCommentContent' rows="5" data-max-length="150"></textarea>
												</div>
											</div>
											<div class="col-12">
												<button type="button" id="submitComment"
													class="btn alazea-btn">Submit Your Comment</button>
											</div>
										</div>
										<!-- </form> -->
									</div>
									</c:if>
								</c:if>
								<!-- JSON -->
								<div id="realestateCommentJson">
								
								</div>
							</div>
							<!-- <div role="tabpanel" class="tab-pane fade" id="description"  style="height:300px">
								<div class="description_area">
									
								</div>
							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Single Product Details Area End ##### -->
</div>
<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/realestate.js"></script>
<script>
	/*$(document).ready(getJsonData());*/
	$(function(){
		getJsonData();
		var temp = $("#realestateTemp2").val();
		if(temp != null){
			var Juso = temp;
		}else {
			var Juso = "서울특별시 금천구 가산동 426-5";
		}
		var Name = 'Here';
		
		var mapContainer = document.getElementById('map'), 
		mapOption = {
			center: new daum.maps.LatLng(33.450701, 126.570667), 
			level: 4,
		};
		mapContainer.style.height = '300px'; 
		var map = new daum.maps.Map(mapContainer, mapOption); 
		var geocoder = new daum.maps.services.Geocoder();
		geocoder.addressSearch(Juso, function(result, status) {
			if (status === daum.maps.services.Status.OK) {
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				var marker = new daum.maps.Marker({
					map: map,
					position: coords
				});
				var infowindow = new daum.maps.InfoWindow({
					content: '<div style="width:150px;text-align:center;padding:6px 0;">'+Name+'</div>'
				});
				infowindow.open(map, marker);
				map.setCenter(coords);
			} 
		});
	});
</script>
</body>
</html>