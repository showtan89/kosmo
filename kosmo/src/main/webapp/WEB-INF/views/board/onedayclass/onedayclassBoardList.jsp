<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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
		<h2>ONEDAYCLASS</h2>
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

      <!-- ##### Shop Area Start ##### -->
        <div class="container">
            <div class="row">
                <!-- Sidebar Area -->
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="shop-sidebar-area">

                        <!-- Shop Widget -->
                        <div class="shop-widget price mb-50">
                            <h4 class="widget-title">Prices</h4>
                            <div class="widget-desc">
                                <div class="slider-range">
                                    <div data-min="10000" data-max="30000" data-unit="￦" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="8" data-value-max="30" data-label-result="Price:">
                                        <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all first-handle" tabindex="0"></span>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                    </div>
                                    <div class="range-price">Price:  ￦10,000 - ￦30,000</div>
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
						<div class="shop-widget sort-by mb-50">
							<c:if test="${userVO.memberTemp1 eq '0' or userVO.memberTemp1 eq null}">
								<h6 class="widget-title"><a href="onedayclassAuthorityForm?memberId=${userVO.memberId}&onedayclassNumber=${dtos.get(0).onedayclassNumber}">클래스개설 권한신청</a></h6>
							</c:if>
							<c:if test="${userVO.memberTemp1 eq '2'}">						
								<h6 class="widget-title"><a href="onedayclassWriteForm?pageNum=${pageNum}">클래스개설 새글쓰기</a></h6>						
							</c:if>
						</div>
                    </div>
                </div>

                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area">
                        <div class="row">
                       	
                       	<c:if test="${cnt > 0}">
                        <c:forEach var="dto" items="${dtos}">

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <!-- <div class="product-img"> -->
                                        <a href="onedayclassDetailForm?onedayclassNumber=${dto.onedayclassNumber}&pageNum=${pageNum}&number=${number+1}">
                                        	
                                        	<!-- 깃에 이미지 추가 부분 해결되면 하나로 만들것임 -->
                                        	<c:if test="${dto.onedayclassNumber eq 1}">
                                        		<img src="resources/img/board/onedayclass/odc1.jpg" alt="">
                                        	</c:if>
                                        	<c:if test="${dto.onedayclassNumber eq 2}">
                                        		<img src="resources/img/board/onedayclass/odc2.jpg" alt="">
                                        	</c:if>	
                                        	<c:if test="${dto.onedayclassNumber eq 3}">
                                        		<img src="resources/img/board/onedayclass/odc3.jpg" alt="">
                                        	</c:if>	
                                        	<c:if test="${dto.onedayclassNumber eq 4}">
                                        		<img src="resources/img/board/onedayclass/odc5.jpg" alt="">
                                        	</c:if>	
                                        	<c:if test="${dto.onedayclassNumber eq 5}">
                                        		<img src="resources/img/board/onedayclass/odc6.jpg" alt="">
                                        	</c:if>	
                                        	<c:if test="${dto.onedayclassNumber eq 6}">
                                        		<img src="resources/img/board/onedayclass/odc7.jpg" alt="">
                                        	</c:if>	
                                        	<c:if test="${dto.onedayclassNumber eq 7}">
                                        		<img src="resources/img/board/onedayclass/odc8.jpg" alt="">
                                        	</c:if>
                                        	<c:if test="${dto.onedayclassNumber eq 8}">
                                        		<img src="resources/img/board/onedayclass/odc9.jpg" alt="">
                                        	</c:if>	
                                        	<c:if test="${dto.onedayclassNumber eq 9}">
                                        		<img src="resources/img/board/onedayclass/odc10.jpg" alt="">
                                        	</c:if>	
                                        	<c:if test="${dto.onedayclassNumber eq 10}">
                                        		<img src="resources/img/board/onedayclass/odc10.jpg" alt="">
                                        	</c:if>
                                        	<c:if test="${dto.onedayclassNumber eq 11}">
                                        		<img src="resources/img/board/onedayclass/odc10.jpg" alt="">
                                        	</c:if>	
                                        	<c:if test="${dto.onedayclassNumber eq 12}">
                                        		<img src="resources/img/board/onedayclass/odc10.jpg" alt="">
                                        	</c:if>
                                        	<c:if test="${dto.onedayclassNumber eq 13}">
                                        		<img src="resources/img/board/onedayclass/odc10.jpg" alt="">
                                        	</c:if>
                                        	<c:if test="${dto.onedayclassNumber eq 14}">
                                        		<img src="resources/img/board/onedayclass/odc10.jpg" alt="">
                                        	</c:if>
                                        	<c:if test="${dto.onedayclassNumber eq 15}">
                                        		<img src="resources/img/board/onedayclass/odc10.jpg" alt="">
                                        	</c:if>
                                        	<c:if test="${dto.onedayclassNumber eq 16}">
                                        		<img src="resources/img/board/onedayclass/odc10.jpg" alt="">
                                        	</c:if>
                                        	<c:if test="${dto.onedayclassNumber eq 17}">
                                        		<img src="resources/img/board/onedayclass/odc10.jpg" alt="">
                                        	</c:if>
                                        	<!-- 깃에 이미지 추가 부분 해결되면 하나로 만들것임 -->				
                                        </a>
                                        <%-- <div class="product-meta d-flex">
	                                        <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
	                                        <a href="onedayclassDetailForm?onedayclassNumber=${dto.onedayclassNumber}&pageNum=${pageNum}&number=${number+1}" class="add-to-cart-btn">상세페이지</a>
	                                        <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
	                                    </div> --%>
	                                <!-- </div> -->
	                                <!-- Product Info -->
	                                <div class="product-info mt-15 text-center">
	                                    <a href="onedayclassDetailForm?onedayclassNumber=${dto.onedayclassNumber}&pageNum=${pageNum}&number=${number+1}">
	                                        <p>${dto.onedayclassSubject}</p>
	                                    </a>
	                                    <h6>${dto.onedayclassPrice} ${dto.onedayclassLocation}</h6>
	                                </div>
	                            </div>
							</div>

						</c:forEach>
						</c:if>
						
						</div>

                        <!-- Pagination -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                            	<!-- 게시글이 있으면 -->
								<c:if test="${cnt > 0}">
									<!-- 이전블록[◀] -->
									<c:if test="${startPage > pageBlock}">									
		                            	<li class="page-item"><a class="page-link" href="onedayclassBoardList?pageNum=${startPage - pageBlock}"><i class="fa fa-angle-left"></i></a></li>
		                            </c:if>	
		                            
		                        	<!--  블록내의 페이지 번호 -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<span><b>[${i}]</b></span>
										</c:if>
										<c:if test="${i != currentPage}">
			                                <li class="page-item"><a class="page-link" href="onedayclassBoardList?pageNum=${i}">[${i}]</a></li>
		                                </c:if>
		                            </c:forEach>
		                            
		                            <!-- 다음블록[▶] -->
		                            <c:if test="${pageCount > endPage}">   
		                                <li class="page-item"><a class="page-link" href="onedayclassBoardList?pageNum=${startPage + pageBlock}"><i class="fa fa-angle-right"></i></a></li>
		                            </c:if>   
	                            </c:if>    
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>



</div>
<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>