<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="images" value="/kosmo/resources/img/board/onedayclass/" />
	
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


<form action="onedayclassModifyPro" method="post" name="onedayclassModifyPro" onsubmit="return modifyCheck()">
<input type="hidden" name="onedayclassNumber" value="${dto.onedayclassNumber}">
<%-- <input type="hidden" name="pageNum" value="${pageNum}"> --%>

<section class="about-us-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>글  제목<pre><input class="input" type="text" name="onedayclassSubject" maxlength="50" value="${dto.onedayclassSubject}" style="width:100%"></h2>
                        <p>클래스 개설자: ${dto.memberId}<br> 카테고리:<input class="input" type="text" name="onedayclassCategory" maxlength="50" value="${dto.onedayclassCategory}" style="width:100%"></p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-12">
                    <!-- Section Heading -->
                    <p>글 내용 <pre><textarea class="input" rows="100" cols="130" name="onedayclassContent" word-break:break-all>${dto.onedayclassContent}</textarea></p>
                    
			    <!-- ##### Testimonial Area Start ##### -->
	               
	                    <div class="testimonials-slides owl-carousel">
	                        <!-- Single Testimonial Slide -->
	                        <div class="single-testimonial-slide">
	                            <div class="row align-items-center">
	                                <div class="col-12">
	                                    <div class="testimonial-thumb"><%-- ${dto.onedayclassImg1} --%>
	                                        <img src="resources/img/board/onedayclass/odc7.jpg" alt="">
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Single Testimonial Slide -->
	                        <div class="single-testimonial-slide">
	                            <div class="row align-items-center">
	                                <div class="col-12">
	                                    <div class="testimonial-thumb"><%-- ${dto.onedayclassImg2} --%>
	                                        <img src="resources/img/board/onedayclass/odc8.jpg" alt="">
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Single Testimonial Slide -->
	                        <div class="single-testimonial-slide">
	                            <div class="row align-items-center">
	                                <div class="col-12">
	                                    <div class="testimonial-thumb"><%-- ${dto.onedayclassImg3} --%>
	                                        <img src="resources/img/board/onedayclass/odc9.jpg" alt="">
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                
	              </div>
	           </div>  
			    <!-- ##### Testimonial Area End ##### -->

             <div class="col-12 col-lg-12">
                 <div class="alazea-benefits-area">
                     <div class="row">
                         
                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>평점</h5>
                                 <p>${dto.onedayclassGrade}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>모집인원</h5>
                                 <p><input class="input" type="text" name="onedayclassRecruitment" maxlength="50" value="${dto.onedayclassRecruitment}"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>위치</h5>
                                 <p><input class="input" type="text" name="onedayclassLocation" maxlength="50" value="${dto.onedayclassLocation}"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:90px">
                                 <h5>날짜</h5>
                                 <p>${dto.onedayclassOpendate}</p>
                             </div>
                         </div>
                         
                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconMoney.jpeg" style="width:110px">
                                 <h5>가격</h5>
                                 <p><input class="input" type="text" name="onedayclassPrice" maxlength="50" value="${dto.onedayclassPrice}"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>누적인원</h5>
                                 <p>${dto.onedayclassTotalpeople}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>조회수</h5>
                                 <p>${dto.onedayclassLookup}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:90px">
                                 <h5>작성일</h5>
                                 <p>${dto.onedayclassRegdate}</p>
                             </div>
                         </div>
                                                     
                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconMoney.jpeg" style="width:110px">
                                 <h5>종료여부</h5>
                                 <p>${dto.onedayclassEndCheck}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>마감여부</h5>
                                 <p><input class="input" type="text" name="onedayclassDeadlineCheck" maxlength="50" value="${dto.onedayclassDeadlineCheck}"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>예약</h5>
                                 <p>${dto.onedayclassReservation}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:90px">
                                 <h5>결제</h5>
                                 <p>${dto.onedayclassPay}</p>
                             </div>
                         </div> 
                     </div>
                 </div>
             </div>
         </div>
    </section>
    
    
<%-- <c:if test="${userVO.memberId} == ${dto.memberId}"> --%>
	<table style="margin-left: auto; margin-right: auto;">
		<th colspan="2">
			<input class="inputButton" type="submit" value="수정완료">
			<input class="inputButton" type="reset" value="수정취소" onclick="window.history.back()">
		</th>
	</table>
<%-- </c:if> --%>



<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>