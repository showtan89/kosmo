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

<form action="onedayclassWritePro" method="post" name="onedayclassWritePro" onsubmit="return writeCheck()">
<input class="input" type="hidden" name="memberNumber" value="${userVO.memberNumber}">
<input class="input" type="hidden" name="memberEmail" value="${userVO.memberEmail}">

<section class="about-us-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>글  제목<pre><input class="input" type="text" name="onedayclassSubject" maxlength="50" placeholder="클래스 제목을 입력하세요"></h2>
                        <p>클래스 개설자: ${userVO.memberId}<input class="input" type="hidden" name="memberId" value="${userVO.memberId}"><br> 카테고리:<input class="input" type="text" name="onedayclassCategory" maxlength="50" placeholder="카테고리를 입력하세요"></p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-12">
                    <!-- Section Heading -->
                    <p>글 내용 <pre><textarea class="input" rows="7" cols="130" name="onedayclassContent" placeholder="글내용을 입력하세요" word-break:break-all></textarea></p>
                    
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
                                 <p><input class="input" type="text" name="onedayclassRecruitment" maxlength="50" placeholder="모집인원을 입력하세요"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>위치</h5>
                                 <p><input class="input" type="text" name="onedayclassLocation" maxlength="50" placeholder="위치를 입력하세요"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:90px">
                                 <h5>오픈날짜</h5>
                                 <p><input class="input" type="datetime" name="onedayclassOpendate" placeholder="YYYY-MM-DD hh24:mm:ss" style="width:190px"></p>
                                 <!-- <p><input class="input" type="datetime-local" name="onedayclassOpendate" placeholder="yyyy-MM-dd" style="width:190px"></p> -->
                             </div>
                         </div>
                         
                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconMoney.jpeg" style="width:110px">
                                 <h5>가격</h5>
                                 <p><input class="input" type="number" name="onedayclassPrice" maxlength="50" placeholder="가격을 입력하세요"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>참여인원</h5>
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
                                 <p><input class="input" type="radio" name="onedayclassDeadlineCheck" value="close">close</p>
                                 <p><input class="input" type="radio" name="onedayclassDeadlineCheck" value="open">open</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconPenguin.jpeg" style="width:100px">
                                 <h5>예약</h5>
                                 <p>${dto.onedayclassReservation}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconCalculator.jpeg" style="width:90px">
                                 <h5>결제</h5>
                                 <p>${dto.onedayclassPay}</p>
                             </div>
                         </div> 
                     </div>
                 </div>
             </div>
         </div>
    </section>





<c:if test="${userVO.memberTemp1 eq 2}">
	<table style="margin-left: auto; margin-right: auto;">
		<th colspan="2">
			<input class="btn alazea-btn mt-15" type="submit" value="작성">
			<input class="btn alazea-btn mt-15" type="reset" value="취소">
			<input class="btn alazea-btn mt-15" type="button" value="목록"
					onclick="window.location='onedayclassBoardList'">
		</th>
	</table>
</c:if>



<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>