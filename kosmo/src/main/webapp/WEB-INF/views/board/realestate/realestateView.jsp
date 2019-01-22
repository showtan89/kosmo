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
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${realimage}realestatemenu.jpg);">
		<h2>REALESTATE</h2>
	</div>
	<br> <br>
</div>

<!-- 부동산 게시판 본문  -->
<div class="container" style="margin-bottom: 50px;">
	<h5>Read Post</h5>
	<hr>
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
										<a class="product-img" href="img/bg-img/49.jpg"
											title="Product Image"> <img class="d-block w-100"
											src="img/bg-img/49.jpg" alt="1">
										</a>
									</div>
									<div class="carousel-item">
										<a class="product-img" href="img/bg-img/49.jpg"
											title="Product Image"> <img class="d-block w-100"
											src="img/bg-img/49.jpg" alt="1">
										</a>
									</div>
									<div class="carousel-item">
										<a class="product-img" href="img/bg-img/49.jpg"
											title="Product Image"> <img class="d-block w-100"
											src="img/bg-img/49.jpg" alt="1">
										</a>
									</div>
								</div>
								<ol class="carousel-indicators">
									<li class="active" data-target="#product_details_slider"
										data-slide-to="0"
										style="background-image: url(img/bg-img/49.jpg);"></li>
									<li data-target="#product_details_slider" data-slide-to="1"
										style="background-image: url(img/bg-img/49.jpg);"></li>
									<li data-target="#product_details_slider" data-slide-to="2"
										style="background-image: url(img/bg-img/49.jpg);"></li>
								</ol>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="single_product_desc">
							<h4 class="title">${rVO.realestateSubject}</h4>
							<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
							<h4 class="price">
								<fmt:setLocale value="ko_KR" />
								<fmt:formatNumber value="${rVO.realestatePrice}" type="currency" />
							</h4>
							<div class="description_area">
								<p>${rVO.realestateContent}</p>
							</div>
							<!-- 
	realestateNumber=541, memberNumber=10006, 
	boardCode=20, memberEmail=korea@naver.com, memberId=korea, 
	realestateCategory1=seoul, 
	realestateDeposit=0, realestateDepositCheck=off, realestateManagement=350000,
	realestateState=6to10, realestateHeatingtype=district, realestateBalcony=on, realestateTerm=undetemined, 
	realestateMoveindate=2019-05-17 00:00:00, realestateGender=female, realestateRoom=over3, realestateToilet=over3, realestateCar=on, 
	realestateSize=198to231, realestateType=house, realestateLocation=경남 성북구, realestateFavorite=empty, realestateRecommend=0, 
	realestateLookup=0, realestateRegdate=19/01/21, realestateCheckday=empty, realestateImg1=demo29.jpg, realestateImg2=empty, 
	realestateImg3=empty, realestateTemp1=on, realestateTemp2=null, realestateTemp3=0, realestatePriceEnd=0, realestateStart=0, 
	realestateEnd=0
	 -->
							<div class="description_area">
								<p>
									<span>Fully Furnished:</span> <span>${rVO.realestateOptionCheck}</span>
								</p>
								<p>
									<span>Smoking Allowed:</span> <span>${rVO.realestateTobaccoCheck}</span>
								</p>
								<p>
									<span>Pets Allowed:</span> <span>${rVO.realestatePetCheck}</span>
								</p>
							</div>
							 <div class="single-widget-area products--meta">
								 <ol class="popular-tags d-flex flex-wrap">
								 	
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
								 	
	                            </ol>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_details_tab clearfix">
						<!-- Tabs -->
						<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							<li class="nav-item"><a href="#description"
								class="nav-link active" data-toggle="tab" role="tab">Additional
									Information</a></li>
							<li class="nav-item"><a href="#reviews" class="nav-link"
								data-toggle="tab" role="tab"> Reviews <span	class="text-muted">(1)</span></a></li>
						</ul>
						<!-- Tab Content -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active" id="description">
								<div class="description_area">
										<p>상세정보가 들어가는 곳입니다 </p>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="reviews">
								<div class="reviews_area">
									<ul>
										<li>
											<div class="single_user_review mb-15">
												<div class="review-rating">
													<i class="fa fa-star" aria-hidden="true"></i> 
													<i class="fa fa-star" aria-hidden="true"></i> 
													<i class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <span>for
														Quality</span>
												</div>
												<div class="review-details">
													<p>
														by <a href="#">Colorlib</a> on <span>12 Sep 2018</span>
													</p>
												</div>
											</div>
											<div class="single_user_review mb-15">
												<div class="review-rating">
													<i class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <span>for
														Design</span>
												</div>
												<div class="review-details">
													<p>
														by <a href="#">Colorlib</a> on <span>12 Sep 2018</span>
													</p>
												</div>
											</div>
											<div class="single_user_review">
												<div class="review-rating">
													<i class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <span>for
														Value</span>
												</div>
												<div class="review-details">
													<p>
														by <a href="#">Colorlib</a> on <span>12 Sep 2018</span>
													</p>
												</div>
											</div>
										</li>
									</ul>
								</div>

								<div class="submit_a_review_area mt-50">
									<h4>Submit A Review</h4>
									<form action="#" method="post">
										<div class="row">
											<div class="col-12">
												<div class="form-group d-flex align-items-center">
													<span class="mr-15">Your Ratings:</span>
													<div class="stars">
														<input type="radio" name="star" class="star-1" id="star-1">
														<label class="star-1" for="star-1">1</label> <input
															type="radio" name="star" class="star-2" id="star-2">
														<label class="star-2" for="star-2">2</label> <input
															type="radio" name="star" class="star-3" id="star-3">
														<label class="star-3" for="star-3">3</label> <input
															type="radio" name="star" class="star-4" id="star-4">
														<label class="star-4" for="star-4">4</label> <input
															type="radio" name="star" class="star-5" id="star-5">
														<label class="star-5" for="star-5">5</label> <span></span>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label for="name">Nickname</label> <input type="email"
														class="form-control" id="name" placeholder="Nazrul">
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label for="options">Reason for your rating</label> <select
														class="form-control" id="options">
														<option>Quality</option>
														<option>Value</option>
														<option>Design</option>
														<option>Price</option>
														<option>Others</option>
													</select>
												</div>
											</div>
											<div class="col-12">
												<div class="form-group">
													<label for="comments">Comments</label>
													<textarea class="form-control" id="comments" rows="5"
														data-max-length="150"></textarea>
												</div>
											</div>
											<div class="col-12">
												<button type="submit" class="btn alazea-btn">Submit
													Your Review</button>
											</div>
										</div>
									</form>
								</div>
							</div>
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
<!-- 입력폼 확인 -->
</body>
</html>