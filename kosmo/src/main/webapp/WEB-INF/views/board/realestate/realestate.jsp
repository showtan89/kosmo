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
					<p>Showing 1–9 of 72 results</p>
				</div>
				<!-- Search by Terms -->
				<div class="search_by_terms">
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
							<div
								class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1"> <label class="custom-control-label"
									for="customCheck1">All plants <span class="text-muted">(72)</span></label>
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

					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#>
							<img class="card-img-right flex-auto d-none d-lg-block realImage" src="${realimage}demo1.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah blah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
										<span class='text-success'>₩ 30,000</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#><img
								class="card-img-right flex-auto d-none d-lg-block realImage"
								src="${realimage}demo2.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah blah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#><img
								class="card-img-right flex-auto d-none d-lg-block realImage"
								src="${realimage}demo3.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah blah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#><img
								class="card-img-right flex-auto d-none d-lg-block realImage"
								src="${realimage}demo4.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah blah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#><img
								class="card-img-right flex-auto d-none d-lg-block realImage"
								src="${realimage}demo5.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah blah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#><img
								class="card-img-right flex-auto d-none d-lg-block realImage"
								src="${realimage}demo6.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah blah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#><img
								class="card-img-right flex-auto d-none d-lg-block realImage"
								src="${realimage}demo7.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah blah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#><img
								class="card-img-right flex-auto d-none d-lg-block realImage"
								src="${realimage}demo8.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah blah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#><img
								class="card-img-right flex-auto d-none d-lg-block realImage"
								src="${realimage}demo9.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah blah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-12">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
							<a href=#><img
								class="card-img-right flex-auto d-none d-lg-block realImage"
								src="${realimage}demo10.jpg" alt=""></a>
							<div class="card-body d-flex flex-column align-items-start">
								<strong class="d-inline-block mb-2 text-success">Title</strong>
								<span class="card-text mb-auto">blah blah blah blah blah
									blah bdddddddslah blah blah blah blah blah blah blah blah blah blah
									blah blah blah </span>
								<div class='iconsArea'>
									<i class="fa fa-car">car</i> <i class="fa fa-bed">bed</i> <i
										class="fa fa-bath">bath</i> <i class="fa fa-paw">paw</i> <i
										class="fa fa-male">male</i> <i class="fa fa-female">female</i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 페이지 -->
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#"><i
								class="fa fa-angle-right"></i></a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../../setting/footer01.jsp" flush="false" />

</body>
</html>