<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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


<!-- <section class="testimonial-area section-padding-100">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="testimonials-slides owl-carousel owl-loaded owl-drag">

					Single Testimonial Slide


					Single Testimonial Slide


					Single Testimonial Slide


					<div class="owl-stage-outer">
						<div class="owl-stage"
							style="transform: translate3d(-4440px, 0px, 0px); transition: all 0s ease 0s; width: 7770px;">
							<div class="owl-item cloned" style="width: 1110px;">
								<div class="single-testimonial-slide">
									<div class="row align-items-center">
										<div class="col-12 col-md-6">
											<div class="testimonial-thumb">
												<img src="#" alt="">
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="testimonial-content">
												Section Heading
												<div class="section-heading">
													<h2>TESTIMONIAL</h2>
													<p>Some kind words from clients about Alazea</p>
												</div>
												<p>“Alazea is a pleasure to work with. Their ideas are
													creative, they came up with imaginative solutions to some
													tricky issues, their landscaping and planting contacts are
													equally excellent we have a beautiful but also manageable
													garden as a result. Thank you!”</p>
												<div class="testimonial-author-info">
													<h6>Mr. Nazrul Islam</h6>
													<p>CEO of NAVATECH</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1110px;">
								<div class="single-testimonial-slide">
									<div class="row align-items-center">
										<div class="col-12 col-md-6">
											<div class="testimonial-thumb">
												<img src="#" alt="">
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="testimonial-content">
												Section Heading
												<div class="section-heading">
													<h2>TESTIMONIAL</h2>
													<p>Some kind words from clients about Alazea</p>
												</div>
												<p>“Alazea is a pleasure to work with. Their ideas are
													creative, they came up with imaginative solutions to some
													tricky issues, their landscaping and planting contacts are
													equally excellent we have a beautiful but also manageable
													garden as a result. Thank you!”</p>
												<div class="testimonial-author-info">
													<h6>Mr. Jonas Nick</h6>
													<p>CEO of NAVATECH</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item" style="width: 1110px;">
								<div class="single-testimonial-slide">
									<div class="row align-items-center">
										<div class="col-12 col-md-6">
											<div class="testimonial-thumb">
												<img src="#" alt="">
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="testimonial-content">
												Section Heading
												<div class="section-heading">
													<h2>TESTIMONIAL</h2>
													<p>Some kind words from clients about Alazea</p>
												</div>
												<p>“Alazea is a pleasure to work with. Their ideas are
													creative, they came up with imaginative solutions to some
													tricky issues, their landscaping and planting contacts are
													equally excellent we have a beautiful but also manageable
													garden as a result. Thank you!”</p>
												<div class="testimonial-author-info">
													<h6>Mr. Nick Jonas</h6>
													<p>CEO of NAVATECH</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item" style="width: 1110px;">
								<div class="single-testimonial-slide">
									<div class="row align-items-center">
										<div class="col-12 col-md-6">
											<div class="testimonial-thumb">
												<img src="img/bg-img/14.jpg" alt="">
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="testimonial-content">
												Section Heading
												<div class="section-heading">
													<h2>TESTIMONIAL</h2>
													<p>Some kind words from clients about Alazea</p>
												</div>
												<p>“Alazea is a pleasure to work with. Their ideas are
													creative, they came up with imaginative solutions to some
													tricky issues, their landscaping and planting contacts are
													equally excellent we have a beautiful but also manageable
													garden as a result. Thank you!”</p>
												<div class="testimonial-author-info">
													<h6>Mr. Nazrul Islam</h6>
													<p>CEO of NAVATECH</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item active" style="width: 1110px;">
								<div class="single-testimonial-slide">
									<div class="row align-items-center">
										<div class="col-12 col-md-6">
											<div class="testimonial-thumb">
												<img src="resources/img/board/onedayclass/odc8.jpg" alt="">
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="alazea-benefits-area">
												<div class="row">
													Single Benefits Area
													<div class="col-12 col-sm-6">
														<div class="single-benefits-area">
															<img src="img/core-img/b1.png" alt="">
															<h5>Quality Products</h5>
															<p>Intiam eu sagittis est, at commodo lacini libero.
																Praesent dignissim sed odio vel aliquam manta lagorn.</p>
														</div>
													</div>

													Single Benefits Area
													<div class="col-12 col-sm-6">
														<div class="single-benefits-area">
															<img src="img/core-img/b2.png" alt="">
															<h5>Perfect Service</h5>
															<p>Intiam eu sagittis est, at commodo lacini libero.
																Praesent dignissim sed odio vel aliquam manta lagorn.</p>
														</div>
													</div>

													Single Benefits Area
													<div class="col-12 col-sm-6">
														<div class="single-benefits-area">
															<img src="img/core-img/b3.png" alt="">
															<h5>100% Natural</h5>
															<p>Intiam eu sagittis est, at commodo lacini libero.
																Praesent dignissim sed odio vel aliquam manta lagorn.</p>
														</div>
													</div>

													Single Benefits Area
													<div class="col-12 col-sm-6">
														<div class="single-benefits-area">
															<img src="img/core-img/b4.png" alt="">
															<h5>Environmentally friendly</h5>
															<p>Intiam eu sagittis est, at commodo lacini libero.
																Praesent dignissim sed odio vel aliquam manta lagorn.</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1110px;">
								<div class="single-testimonial-slide">
									<div class="row align-items-center">
										<div class="col-12 col-md-6">
											<div class="testimonial-thumb">
												<img src="img/bg-img/13.jpg" alt="">
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="testimonial-content">
												Section Heading
												<div class="section-heading">
													<h2>TESTIMONIAL</h2>
													<p>Some kind words from clients about Alazea</p>
												</div>
												<p>“Alazea is a pleasure to work with. Their ideas are
													creative, they came up with imaginative solutions to some
													tricky issues, their landscaping and planting contacts are
													equally excellent we have a beautiful but also manageable
													garden as a result. Thank you!”</p>
												<div class="testimonial-author-info">
													<h6>Mr. Nick Jonas</h6>
													<p>CEO of NAVATECH</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1110px;">
								<div class="single-testimonial-slide">
									<div class="row align-items-center">
										<div class="col-12 col-md-6">
											<div class="testimonial-thumb">
												<img src="img/bg-img/14.jpg" alt="">
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="testimonial-content">
												Section Heading
												<div class="section-heading">
													<h2>TESTIMONIAL</h2>
													<p>Some kind words from clients about Alazea</p>
												</div>
												<p>“Alazea is a pleasure to work with. Their ideas are
													creative, they came up with imaginative solutions to some
													tricky issues, their landscaping and planting contacts are
													equally excellent we have a beautiful but also manageable
													garden as a result. Thank you!”</p>
												<div class="testimonial-author-info">
													<h6>Mr. Nazrul Islam</h6>
													<p>CEO of NAVATECH</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="owl-nav disabled">
						<div class="owl-prev">prev</div>
						<div class="owl-next">next</div>
					</div>
					<div class="owl-dots">
						<div class="owl-dot">
							<span></span>
						</div>
						<div class="owl-dot">
							<span></span>
						</div>
						<div class="owl-dot active">
							<span></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> -->


	<section class="about-us-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>${dto.onedayclassSubject}</h2>
                        <p>클래스 개설자: ${dto.memberId}<br> 카테고리:${dto.onedayclassCategory}</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-12 col-lg-6">
                    <!-- Section Heading -->
                    <p>${dto.onedayclassContent}</p>
                    
			    <!-- ##### Testimonial Area Start ##### -->
	               
	                    <div class="testimonials-slides owl-carousel">
	                        <!-- Single Testimonial Slide -->
	                        <div class="single-testimonial-slide">
	                            <div class="row align-items-center">
	                                <div class="col-12 col-md-6">
	                                    <div class="testimonial-thumb">${dto.onedayclassImg1}
	                                        <img src="resources/img/board/onedayclass/odc7.jpg" alt="">
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Single Testimonial Slide -->
	                        <div class="single-testimonial-slide">
	                            <div class="row align-items-center">
	                                <div class="col-12 col-md-6">
	                                    <div class="testimonial-thumb">${dto.onedayclassImg2}
	                                        <img src="resources/img/board/onedayclass/odc8.jpg" alt="">
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Single Testimonial Slide -->
	                        <div class="single-testimonial-slide">
	                            <div class="row align-items-center">
	                                <div class="col-12 col-md-6">
	                                    <div class="testimonial-thumb">${dto.onedayclassImg3}
	                                        <img src="resources/img/board/onedayclass/odc9.jpg" alt="">
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                
	              </div>
	           </div>  
			    <!-- ##### Testimonial Area End ##### -->

             <div class="col-12 col-lg-6">
                 <div class="alazea-benefits-area">
                     <div class="row">
                         
                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>평점</h5>
                                 <p>${dto.onedayclassGrade}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>모집인원</h5>
                                 <p>${dto.onedayclassRecruitment}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>위치</h5>
                                 <p>${dto.onedayclassLocation}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:90px">
                                 <h5>날짜</h5>
                                 <p>${dto.onedayclassOpendate}</p>
                             </div>
                         </div>
                         
                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconMoney.jpeg" style="width:110px">
                                 <h5>가격</h5>
                                 <p>${dto.onedayclassPrice}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>누적인원</h5>
                                 <p>${dto.onedayclassTotalpeople}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>조회수</h5>
                                 <p>${dto.onedayclassLookup}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:90px">
                                 <h5>작성일</h5>
                                 <p>${dto.onedayclassRegdate}</p>
                             </div>
                         </div>
                                                     
                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconMoney.jpeg" style="width:110px">
                                 <h5>종료여부</h5>
                                 <p>${dto.onedayclassEndCheck}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>마감여부</h5>
                                 <p>${dto.onedayclassDeadlineCheck}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>예약</h5>
                                 <p>${dto.onedayclassReservation}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-6">
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
	<th colspan="2"><input class="inputButton" type="button"
		value="글수정"
		onclick="window.location='onedayclassModifyForm?onedayclassNumber=${dto.onedayclassNumber}'">
		<input class="inputButton" type="button" value="글삭제"
		onclick="window.location='onedayclassDeletePro?onedayclassNumber=${dto.onedayclassNumber}'">
	</th>
</table>
<%-- </c:if> --%>



<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>