<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Helper - Realestate</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
	<style>
	.realImage {
		max-width: 200px;
		min-height: 150px;
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
<c:set var="realimage" value="resources/img/board/realestate/" />

<!-- 메뉴바 아래 이미지 -->
<div class="breadcrumb-area">
	<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${realimage}realestatemenu.jpg);">
		<h2>REALESTATE</h2>
	</div><br><br>
</div>

<!-- 부동산 게시판 본문  -->
<div class="container" style="margin-bottom: 50px;">
	<div class="row">
		<div class="col-12">
			<div
				class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
				<div class="shop-page-count">
					<!-- 이부분 바꿔야함  -->
					<p>Showing ${pVO.startNumber}–${pVO.endNumber} of ${pVO.totalCount} results</p>
				</div>
				<!-- Search by Terms -->
				<div class="search_by_terms">
					<!-- 데이터 생성용 버튼 - 주석 처리 -->
					<!-- <a href="realestateDummyMaker"><button type="button" class='btn alazea-btn'>DUMMY</button></a> -->
					<a href="realestateWrite"><button type="button" class='btn alazea-btn'>Write</button></a>
					<!-- 필터 기능 일단 주석 -->
					<!-- <form action="#" method="post" class="form-inline">
                               <select class="custom-select widget-title">
                                 <option selected>Short by Popularity</option>
                                 <option value="1">Short by Newest</option>
                                 <option value="2">Short by Sales</option>
                                 <option value="3">Short by Ratings</option>
                               </select>
                              <select class="custom-select widget-title">
                                 <option selected>Show: 9</option>
                                 <option value="1">12</option>
                                 <option value="2">18</option>
                                 <option value="3">24</option>
                               </select>
                           </form> -->
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- 사이드바 -->
		<div class="col-12 col-md-4 col-lg-3">
			<div class="shop-sidebar-area">
				<form>
					<div class="shop-widget price mb-50">
						<h4 class="widget-title">Prices</h4>
						<div class="widget-desc">
							<div class="slider-range">
								<div data-min="8" data-max="30" data-unit="$"
									class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
									data-value-min="8" data-value-max="30"
									data-label-result="Price:">
									<div class="ui-slider-range ui-widget-header ui-corner-all"></div>
									<span
										class="ui-slider-handle ui-state-default ui-corner-all first-handle"
										tabindex="0"></span> <span
										class="ui-slider-handle ui-state-default ui-corner-all"
										tabindex="0"></span>
								</div>
								<div class="range-price">Price: $8 - $30</div>
							</div>
						</div>
					</div>

					<div class="shop-widget catagory mb-50">
						<h4 class="widget-title">Categories</h4>
						<div class="widget-desc">
							<!-- Single Checkbox -->
							<div class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"	id="customCheck1"> 
								<label class="custom-control-label" for="customCheck1">All plants <span class="text-muted">(72)</span></label>
							</div>
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck2"> <label class="custom-control-label"
									for="customCheck2">Outdoor plants <span
									class="text-muted">(20)</span></label>
							</div>
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck3">Indoor plants <span
									class="text-muted">(15)</span></label>
							</div>
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck4"> <label class="custom-control-label"
									for="customCheck4">Office Plants <span
									class="text-muted">(20)</span></label>
							</div>
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck5"> <label class="custom-control-label"
									for="customCheck5">Potted <span class="text-muted">(15)</span></label>
							</div>
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck6"> <label class="custom-control-label"
									for="customCheck6">Others <span class="text-muted">(2)</span></label>
							</div>
						</div>
					</div>

					<!-- Shop Widget -->
					<div class="shop-widget sort-by mb-50">
						<h4 class="widget-title">Sort by</h4>
						<div class="widget-desc">
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck7"> <label class="custom-control-label"
									for="customCheck7">New arrivals</label>
							</div>
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck8"> <label class="custom-control-label"
									for="customCheck8">Alphabetically, A-Z</label>
							</div>
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck9"> <label class="custom-control-label"
									for="customCheck9">Alphabetically, Z-A</label>
							</div>
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck10"> <label
									class="custom-control-label" for="customCheck10">Price:
									low to high</label>
							</div>
							<!-- Single Checkbox -->
							<div
								class="custom-control custom-checkbox d-flex align-items-center">
								<input type="checkbox" class="custom-control-input"
									id="customCheck11"> <label
									class="custom-control-label" for="customCheck11">Price:
									high to low</label>
							</div>
						</div>
						<hr>
						<!-- 검색 버튼 -->
						<input type="submit" class='btn alazea-btn' value="Search"></input>
					</div>
				</form>
			</div>
		</div>

		<!-- 목록 부분 -->
		<div class="col-12 col-md-8 col-lg-9">
			<div class="shop-products-area">
				<div class="row">
					<c:forEach var="dto" items="${list}">
						<div class="col-12">
							<div class="card flex-md-row mb-4 shadow-sm h-md-250">
								<a href=realestateView?realestateNumber=${dto.realestateNumber}><img class="card-img-right flex-auto d-none d-lg-block realImage"	src="${realimage}${dto.realestateImg1}" alt=""></a>
								<div class="card-body d-flex flex-column align-items-start">
									<strong class="d-inline-block mb-2 text-warning">
									<c:set var="loca" value="${dto.realestateCategory1}"/>
									<c:choose>
										<c:when test="${loca.equals('seoul')}">
											Seoul (서울)
										</c:when>
										<c:when test="${loca.equals('busan')}">
											Busan (부산)
										</c:when>
										<c:when test="${loca.equals('incheon')}">
											Incheon (인천)
										</c:when>
										<c:when test="${loca.equals('gwangju')}">
											Gwangju (광주)
										</c:when>
										<c:when test="${loca.equals('daejeon')}">
											Daejeon (대전)
										</c:when>
										<c:when test="${loca.equals('sejong')}">
											Sejong (세종)
										</c:when>
										<c:when test="${loca.equals('daegu')}">
											Daegu (대구)
										</c:when>
										<c:when test="${loca.equals('ulsan')}">
											Ulsan (울산)
										</c:when>
										<c:when test="${loca.equals('gyeonggi')}">
											Gyeonggi-do (경기도)
										</c:when>
										<c:when test="${loca.equals('gangwon')}">
											Gangwon-do (강원도)
										</c:when>
										<c:when test="${loca.equals('chungcheongbuk')}">
											Chungcheongbuk-do (충청북도)
										</c:when>
										<c:when test="${loca.equals('chungcheongnam')}">
											Chungcheongnam-do (충청남도)
										</c:when>
										<c:when test="${loca.equals('gyeongsangbuk')}">
											Gyeongsangbuk-do (경상북도)
										</c:when>
										<c:when test="${loca.equals('gyeongsangnam')}">
											Gyeongsangnam-do (경상남도)
										</c:when>
										<c:when test="${loca.equals('jeollabuk')}">
											Jeollabuk-do (전라북도)
										</c:when>
										<c:when test="${loca.equals('jeollanam')}">
											Jeollanam-do (전라남도)
										</c:when>
										<c:when test="${loca.equals('jeju')}">
											Jeju-do (제주도)
										</c:when>
									</c:choose>
									</strong>
									<strong class="d-inline-block mb-2 text-success">${dto.realestateSubject}</strong>
									<%-- <span class="card-text mb-auto">${dto.realestateContent}</span> --%>
									<div class='iconsArea'>
										<!-- 풀옵션 --><!-- 아이콘 못찾겠다 꾀꼬리  -->
										<c:if test="${dto.realestateOptionCheck.equals('on')}">
										
										</c:if>
										<!-- 흡연 -->
										<c:if test="${dto.realestateTobaccoCheck.equals('on')}">
											<i class="fa fa-cloud">&nbsp </i>
										</c:if>
										<!-- 발코니 --><!-- 아이콘 못찾겠다 꾀꼬리  -->
										<c:if test="${dto.realestateBalcony.equals('on')}">
										
										</c:if>
										<!-- 애완동물 -->
										<c:if test="${dto.realestatePetCheck.equals('on')}">
											 <i class="fa fa-paw">&nbsp </i> 
										</c:if>
										<!-- 엘리베이터 -->
										<c:if test="${dto.realestateTemp1.equals('on')}">
											<i class="fa fa-square">&nbsp </i>
										</c:if>
										<!-- 주차가능 -->
										<c:if test="${dto.realestateCar.equals('on')}">
											<i class="fa fa-car">&nbsp </i> 
										</c:if>
										<!-- 성별 -->
										<c:if test="${dto.realestateGender.equals('female')}">
											<i class="fa fa-female">&nbsp </i>
										</c:if>
										<c:if test="${dto.realestateGender.equals('male')}">
											<i class="fa fa-male">&nbsp </i>
										</c:if>
										<c:if test="${dto.realestateGender.equals('both')}">
											<i class="fa fa-transgender">&nbsp </i>
										</c:if>
										<!-- 방 수 -->
										<i class="fa fa-bed">
										<c:set var="room" value="${dto.realestateRoom}"/>
										<c:choose>
											<c:when test="${room.equals('over3')}">
											3↑&nbsp 
											</c:when>
											<c:when test="${!room.equals('over3')}">
											${dto.realestateRoom}&nbsp 
											</c:when>
										</c:choose>
										</i> 
										<!-- 화장실 수 -->
										<i class="fa fa-bath">
										<c:set var="bath" value="${dto.realestateToilet}"/>
										<c:choose>
											<c:when test="${bath.equals('over3')}">
											3↑&nbsp 
											</c:when>
											<c:when test="${!bath.equals('over3')}">
											${dto.realestateToilet}&nbsp 
											</c:when>
										</c:choose>
										</i>
										<!-- 금액 --> 
										<span class='text-success'>
										<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
										<fmt:setLocale value = "ko_KR"/>
       									<fmt:formatNumber value = "${dto.realestatePrice}" type = "currency"/>			
										</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- 페이지 -->
				<c:set var="linkURL" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
				<c:set var="URL1" value="${pageContext.request.requestURL}" />
				<c:set var="URL2" value="${pageContext.request.requestURI}" />
				<h1>${linkURL}</h1>
				<nav aria-label="Page navigation">
					<ul class="pagination">
					<c:if test="${pVO.totalCount>0}">
						<c:if test="${pVO.startPage>pVO.pageBlock}">
							<li class="page-item"><a class="page-link" href="${linkURL}"><i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
							<li class="page-item"><a class="page-link" href="${linkURL}?pageNum=${(pVO.startPage-pVO.pageBlock)+(pVO.pageBlock-1)}"><i class="fa fa-angle-left"></i></a></li>
						</c:if>
	
						<c:forEach var="i" begin="${pVO.startPage}" end="${pVO.endPage}">
							<c:if test="${i==pVO.currentPage}">
								<li class="page-item"><a class="page-link" style="background-color: #28a745 !important; color:white !important">${i}</a></li>
							</c:if>
							<c:if test="${i!=pVO.currentPage}">
								<li class="page-item"><a class="page-link" href="${linkURL}?pageNum=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
	
						<c:if test="${pVO.pageCount > pVO.endPage }">
							<li class="page-item"><a class="page-link" href="${linkURL}?pageNum=${(pVO.startPage + pVO.pageBlock)}"><i class="fa fa-angle-right"></i></a></li>
							<li class="page-item"><a class="page-link" href="${linkURL}?pageNum=${pVO.pageCount}"><i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>
						</c:if>
					</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../../setting/footer01.jsp" flush="false" />

</body>
</html>