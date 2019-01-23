<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Helper - Foriener &amp; Help HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

</head>
<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<jsp:include page="../../setting/header01.jsp" flush="false" />

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>REALESTATE</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">About</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" style="margin-bottom: 50px;">

<!-- 동욱 시작 -->
<style type="text/css">
.tab-box {
	margin: 50px auto 0 auto;
	width: 520px;
}

.tab-box ul {
	height: 30px;
}

.tab-box li {
	float: left;
	width: 100px;
	height: 30px;
	line-height: 30px; /* 중앙정렬 */
	margin-right: 2px;
	text-align: center;
	background-color: #ccc;
	border-radius: 3px 3px 0 0;
	cursor: pointer;
}

.tab-box li.selected {
	background-color: orange;
}

.tab-view {
	width: 506px;
	height: 100px;
	line-height: 100px;
	border: 1px solid gray;
	text-align: center;
	margin-top: -1px;
}

.tbl-ex {
	margin: 100px auto 0px auto;
}

.tbl-ex, .tbl-ex th, .tbl-ex td {
	border: 1px solid gray;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	padding: 8px;
}

.tbl-ex th {
	background-color: #999;
	font-size: 1.1em;
	color: #fff;
	border-width: 2px 0;
}

.tbl-ex td {
	border-style: dotted;
}

.tbl-ex tr:hover td {
	background-color: tomato;
	cursor: pointer;
}

.even {
	background-color: highlight;
}
</style>

<table class="tbl-ex">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>글쓴이</th>
		</tr>
		<tr>
			<td>a</td>
			<td>HTML</td>
			<td>모든 HTML에 적용</td>
			<td>IE4, FF1,Safari 1, 크롬 1,오페라 3.5, CSS1</td>
		</tr>
		<tr class="even">
			<td>.classname</td>
			<td>클래스</td>
			<td>클래스로 정의해 준 HTML 태그</td>
			<td>IE4, FF1,Safari 1, 크롬 1,오페라 3.5, CSS1</td>
		</tr>
		<tr>
			<td>a.classname</td>
			<td>종속 클래스</td>
			<td>특정 HTML 태그에 종속된 클래스</td>
			<td>IE4, FF1,Safari 1, 크롬 1,오페라 3.5, CSS1</td>
		</tr>
		<tr class="even">
			<td>#idname</td>
			<td>아이디</td>
			<td>아이디로 정의해준 HTML 태그</td>
			<td>IE4, FF1,Safari 1, 크롬 1,오페라 3.5, CSS1</td>
		</tr>
		<tr>
			<td>a#idname</td>
			<td>종속아이디</td>
			<td>특정 HTML 태그에 종속된 아이디</td>
			<td>IE4, FF1,Safari 1, 크롬 1,오페라 3.5, CSS1</td>
		</tr>
		<tr class="even">
			<td>*</td>
			<td>전체 선택</td>
			<td>모든 HTML 태그에 적용</td>
			<td>IE4, FF1,Safari 1, 크롬 1,오페라 3.5, CSS2</td>
		</tr>
	</table>
	<!-- 동욱 끝 -->

	<!-- 재영 시작 -->
<table class="table">
         <thead class="table-success">
            <tr>
               <th scope="col">#</th>
               <th scope="col">First</th>
               <th scope="col">Last</th>
               <th scope="col">Handle</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <th scope="row">1</th>
               <td>Mark</td>
               <td>Otto</td>
               <td>@mdo</td>
            </tr>
            <tr>
               <th scope="row">2</th>
               <td>Jacob</td>
               <td>Thornton</td>
               <td>@fat</td>
            </tr>
            <tr>
               <th scope="row">3</th>
               <td>Larry</td>
               <td>the Bird</td>
               <td>@twitter</td>
            </tr>
            <tr>
               <th scope="row">1</th>
               <td>Mark</td>
               <td>Otto</td>
               <td>@mdo</td>
            </tr>
            <tr>
               <th scope="row">2</th>
               <td>Jacob</td>
               <td>Thornton</td>
               <td>@fat</td>
            </tr>
            <tr>
               <th scope="row">3</th>
               <td>Larry</td>
               <td>the Bird</td>
               <td>@twitter</td>
            </tr>
            <tr>
               <th scope="row">1</th>
               <td>Mark</td>
               <td>Otto</td>
               <td>@mdo</td>
            </tr>
            <tr>
               <th scope="row">2</th>
               <td>Jacob</td>
               <td>Thornton</td>
               <td>@fat</td>
            </tr>
            <tr>
               <th scope="row">3</th>
               <td>Larry</td>
               <td>the Bird</td>
               <td>@twitter</td>
            </tr>
            <tr>
               <th scope="row">1</th>
               <td>Mark</td>
               <td>Otto</td>
               <td>@mdo</td>
            </tr>
            <tr>
               <th scope="row">2</th>
               <td>Jacob</td>
               <td>Thornton</td>
               <td>@fat</td>
            </tr>
            <tr>
               <th scope="row">3</th>
               <td>Larry</td>
               <td>the Bird</td>
               <td>@twitter</td>
            </tr>
            <tr>
               <th scope="row">1</th>
               <td>Mark</td>
               <td>Otto</td>
               <td>@mdo</td>
            </tr>
            <tr>
               <th scope="row">2</th>
               <td>Jacob</td>
               <td>Thornton</td>
               <td>@fat</td>
            </tr>
            <tr>
               <th scope="row">3</th>
               <td>Larry</td>
               <td>the Bird</td>
               <td>@twitter</td>
            </tr>
            <tr>
               <th scope="row">1</th>
               <td>Mark</td>
               <td>Otto</td>
               <td>@mdo</td>
            </tr>
            <tr>
               <th scope="row">2</th>
               <td>Jacob</td>
               <td>Thornton</td>
               <td>@fat</td>
            </tr>
            <tr>
               <th scope="row">3</th>
               <td>Larry</td>
               <td>the Bird</td>
               <td>@twitter</td>
            </tr>
         </tbody>
      </table>

      <!-- Pagination -->
      <nav aria-label="Page navigation">
         <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#"><i
                  class="fa fa-angle-right"></i></a></li>
         </ul>
      </nav>
      
      <hr>
      <hr>
      <hr>
      
      <!-- ##### Shop Area Start ##### -->
        <div class="container">
            <div class="row">
                <!-- Shop Sorting Data -->
                <div class="col-12">
                    <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                        <!-- Shop Page Count -->
                        <div class="shop-page-count">
                            <p>Showing 1–9 of 72 results</p>
                        </div>
                        <!-- Search by Terms -->
                        <div class="search_by_terms">
                            <form action="#" method="post" class="form-inline">
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
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Sidebar Area -->
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="shop-sidebar-area">

                        <!-- Shop Widget -->
                        <div class="shop-widget price mb-50">
                            <h4 class="widget-title">Prices</h4>
                            <div class="widget-desc">
                                <div class="slider-range">
                                    <div data-min="8" data-max="30" data-unit="$" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="8" data-value-max="30" data-label-result="Price:">
                                        <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all first-handle" tabindex="0"></span>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                    </div>
                                    <div class="range-price">Price: $8 - $30</div>
                                </div>
                            </div>
                        </div>

                        <!-- Shop Widget -->
                        <div class="shop-widget catagory mb-50">
                            <h4 class="widget-title">Categories</h4>
                            <div class="widget-desc">
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">All plants <span class="text-muted">(72)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                    <label class="custom-control-label" for="customCheck2">Outdoor plants <span class="text-muted">(20)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck3">
                                    <label class="custom-control-label" for="customCheck3">Indoor plants <span class="text-muted">(15)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck4">
                                    <label class="custom-control-label" for="customCheck4">Office Plants <span class="text-muted">(20)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck5">
                                    <label class="custom-control-label" for="customCheck5">Potted <span class="text-muted">(15)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck6">
                                    <label class="custom-control-label" for="customCheck6">Others <span class="text-muted">(2)</span></label>
                                </div>
                            </div>
                        </div>

                        <!-- Shop Widget -->
                        <div class="shop-widget sort-by mb-50">
                            <h4 class="widget-title">Sort by</h4>
                            <div class="widget-desc">
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck7">
                                    <label class="custom-control-label" for="customCheck7">New arrivals</label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck8">
                                    <label class="custom-control-label" for="customCheck8">Alphabetically, A-Z</label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck9">
                                    <label class="custom-control-label" for="customCheck9">Alphabetically, Z-A</label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck10">
                                    <label class="custom-control-label" for="customCheck10">Price: low to high</label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center">
                                    <input type="checkbox" class="custom-control-input" id="customCheck11">
                                    <label class="custom-control-label" for="customCheck11">Price: high to low</label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area">
                        <div class="row">

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="shop-details.html"><img src="img/bg-img/40.png" alt=""></a>
                                        <!-- Product Tag -->
                                        <div class="product-tag">
                                            <a href="#">Hot</a>
                                        </div>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="shop-details.html">
                                            <p>Cactus Flower</p>
                                        </a>
                                        <h6>$10.99</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="shop-details.html"><img src="img/bg-img/41.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="shop-details.html">
                                            <p>Cactus Flower</p>
                                        </a>
                                        <h6>$10.99</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="shop-details.html"><img src="img/bg-img/42.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="shop-details.html">
                                            <p>Cactus Flower</p>
                                        </a>
                                        <h6>$10.99</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="shop-details.html"><img src="img/bg-img/43.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="shop-details.html">
                                            <p>Cactus Flower</p>
                                        </a>
                                        <h6>$10.99</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="shop-details.html"><img src="img/bg-img/44.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="shop-details.html">
                                            <p>Cactus Flower</p>
                                        </a>
                                        <h6>$10.99</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="shop-details.html"><img src="img/bg-img/45.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="shop-details.html">
                                            <p>Cactus Flower</p>
                                        </a>
                                        <h6>$10.99</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="shop-details.html"><img src="img/bg-img/46.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="shop-details.html">
                                            <p>Cactus Flower</p>
                                        </a>
                                        <h6>$10.99</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="shop-details.html"><img src="img/bg-img/47.png" alt=""></a>
                                        <!-- Product Tag -->
                                        <div class="product-tag sale-tag">
                                            <a href="#">Sale</a>
                                        </div>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="shop-details.html">
                                            <p>Cactus Flower</p>
                                        </a>
                                        <h6>$10.99</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="shop-details.html"><img src="img/bg-img/48.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="shop-details.html">
                                            <p>Cactus Flower</p>
                                        </a>
                                        <h6>$10.99</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
	<!-- 재영 끝 -->
	
	
	<!-- 민석 시작 -->
		<div class="breadcomb-list">

			<div id="ctgr_new">
				<div class="ct_t">
					<img src="/images/blt_b.gif" class="ct_bl"><a
						href="memo_list.html" class="bo">나의 쪽지</a>
				</div>

				<div class="slc_c">
					| <a href="memo_list.html" class="bd">받은 쪽지함</a> | <a
						href="memo_list.html?mode=send">보낸 쪽지함</a> | <a
						href="javascript:show_memo_popup_view();">쪽지보내기</a> | <a
						href="memo_config.html">쪽지수신설정</a> | <a href="memo_deny_list.html">쪽지차단명단</a>
				</div>

				<div class="slc_c">&nbsp;&nbsp;&nbsp;&nbsp; ☞ 쪽지를 1:1 대화처럼
					사용하실 수 있습니다.</div>
			</div>

			<div id="cnts">
				<div class="body_main">
					<table width="98%" border="1" cellspacing="0" cellpadding="10"
						align="center" style="border-collapse: collapse;">
						<tbody>
							<tr height="25">
								<th align="center" class="th">보낸사람</th>
								<th align="center" class="th">(최신) 쪽지 내용</th>
								<th align="center" class="th">보낸시간</th>
								<th align="center" class="th">수신확인</th>
								<th align="center" class="th">쪽지 삭제</th>
							</tr>

							<tr>
								<td align="left" width="150" valign="center" class="td">

									<table cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td align="right" style="padding-left: 5px;"><img
													class="hu_icon"
													src="http://i.huv.kr:8080/b5e0b6fbb0ed6f.jpg" width="25"
													height="25" style="width: 25px; height: 25px;"></td>
												<td align="left" valign="center" style="padding-left: 5px;">
													<span style="cursor: pointer; cursor: hand"
													onclick="pong2('듀랑고o', 'ponnt29121017');"><span
														class="hu_nick_txt">듀랑고o</span>
													<div id="ponnt29121017" name="ponnt29121017"
															style="position: absolute; visibility: visible; z-index: 100;"></div></span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="td" style="word-break: break-all;"><a
									href="javascript:memo_popup('b5e0b6fbb0ed6f');">
										https://discord.gg/6Cjs4z </a> <span class="send_count">4</span> <span
									class="rcv_count">20</span></td>
								<td align="center" width="100" class="td">2018-11-28 17:52
								</td>
								<td align="center" width="70" class="td">읽음</td>
								<td align="center" width="100" class="td"><input
									type="button" value="모든쪽지삭제" class="submit"
									onclick="javascript:memo_del_all('b5e0b6fbb0ed6f');"></td>
							</tr>
							<tr>
								<td align="left" width="150" valign="center" class="td">
							
									
									<table cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td align="right" style="padding-left: 5px;"><img
													class="hu_icon" src="http://i.huv.kr:8080/baa3b3f076.jpg"
													width="25" height="25" style="width: 25px; height: 25px;">
												</td>
												<td align="left" valign="center" style="padding-left: 5px;">
													<span style="cursor: pointer; cursor: hand"
													onclick="pong2('베놈v', 'ponnt27238963');"><span
														class="hu_nick_txt">베놈v</span>
													<div id="ponnt27238963" name="ponnt27238963"
															style="position: absolute; visibility: visible; z-index: 100;"></div></span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="td" style="word-break: break-all;"><a
									href="javascript:memo_popup('baa3b3f076');"> ...... 절레절레 </a> <span
									class="send_count">8</span> <span class="rcv_count">7</span></td>
								<td align="center" width="100" class="td">2018-05-01 21:33
								</td>
								<td align="center" width="70" class="td">읽음</td>
								<td align="center" width="100" class="td"><input
									type="button" value="모든쪽지삭제" class="submit"
									onclick="javascript:memo_del_all('baa3b3f076');"></td>
							</tr>
						</tbody>
					</table>
				</div>


				<!-- 페이징 -->
				<div style="margin: 0 0 20px 0;">
					<table width="100%" border="0" cellspacing="0" cellpadding="10">
						<tbody>
							<tr>
								<td align="center">
									<div class="paging">
										<span class="link"> <a
											href="/memo/memo_list.html?&amp;page=1" class="def"
											style="padding-left: 10px; padding-right: 10px; margin-right: 7px;">
												Top</a> <a href="/memo/memo_list.html?&amp;page=1"
											class="def o_bd">1</a><a
											href="/memo/memo_list.html?&amp;page=2"
											class="page_number def">2</a><a
											href="/memo/memo_list.html?&amp;page=3"
											class="page_number def">3</a><a
											href="/memo/memo_list.html?&amp;page=4"
											class="page_number def">4</a><a
											href="/memo/memo_list.html?&amp;page=5"
											class="page_number def">5</a><a
											href="/memo/memo_list.html?&amp;page=6"
											class="page_number def">6</a><a
											href="/memo/memo_list.html?&amp;page=7"
											class="page_number def">7</a> <a
											href="/memo/memo_list.html?&amp;page=7" class="def"
											style="padding-left: 10px; padding-right: 10px;">End</a>
										</span>
									</div> <span style="font-size: 12px; color: gray;">총 153 개 / 7
										Page</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- /페이징 -->

				<form name="search_form">
					<table width="98%">
						<tbody>
							<tr>
								<td align="center"><input type="text" name="search"
									value="" style="padding: 1px; border: 1px solid #333;">
									<select name="mode" style="padding: 1px; height: 20px;">
										<option value="rcv">받은쪽지함</option>
										<option value="send">보낸쪽지함</option>
								</select> &nbsp; <input type="submit" value="쪽지검색" class="input_button_b">
								</td>
							</tr>
						</tbody>
					</table>
				</form>

			</div>

		</div>


	<!-- 민석 끝 -->
	
</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>