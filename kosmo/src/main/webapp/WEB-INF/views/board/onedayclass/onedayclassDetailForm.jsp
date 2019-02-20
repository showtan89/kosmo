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
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
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

<!-- <script type="text/javascript">
var curDate = new Date();

var curTime = curDate.getFullYear() + "-" + (curDate.getMonth() + 1) + "-" 
+ curDate.getDate() + " " + curDate.getHours() + ":" 
+ curDate.getMinutes() + ":" + curDate.getSeconds();

</script> -->

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
                <div class="col-12">
                    <!-- Section Heading -->
                    <p>${dto.onedayclassContent}</p>
                    
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
                                 <p id="recruitment">${dto.onedayclassRecruitment}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>위치</h5>
                                 <p>${dto.onedayclassLocation}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:90px">
                                 <h5>오픈날짜</h5>
                                 <p>${dto.onedayclassOpendate}</p>
                             </div>
                         </div>
                         
                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconMoney.jpeg" style="width:110px">
                                 <h5>가격</h5>
                                 <p>${dto.onedayclassPrice}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>참여인원</h5>
                                 <p id="totalpeople">${dto.onedayclassTotalpeople}</p>
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
									<c:choose>
									  <c:when test="${endDate.DAYS gt 0}">
									  		남은시간 ${endDate.DAYS} 일
									  		<c:choose>
									  			<c:when test="${endDate.HOURS gt 0}">
									  				${endDate.HOURS} 시간
									  					<c:choose>
									  						<c:when test="${endDate.MINUTES gt 0}">
									  							${endDate.MINUTES} 분
									  						</c:when>
												        </c:choose>
									  			</c:when>
									  			<c:when test="${endDate.HOURS eq 0}">
									  					<c:choose>
									  						<c:when test="${endDate.MINUTES gt 0}">
									  							${endDate.MINUTES} 분
									  						</c:when>
												        </c:choose>
									  			</c:when>	
									        </c:choose>	
									  </c:when>
									  <c:when test="${endDate.DAYS eq 0}">
									     	<c:choose>
									  			<c:when test="${endDate.HOURS gt 0}">
									  				${endDate.HOURS} 시간
									  					<c:choose>
									  						<c:when test="${endDate.MINUTES gt 0}">
									  							${endDate.MINUTES} 분
									  						</c:when>
												        </c:choose>
									  			</c:when>
									  		</c:choose>	
									  </c:when>
									  <c:otherwise>
									     	종료
									  </c:otherwise>
									</c:choose>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>마감여부</h5>
                                 <p>${dto.onedayclassDeadlineCheck}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-2">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconPenguin.jpeg" style="width:100px">
                                 <h5>예약</h5>
                                 <%-- <p>${dto.onedayclassReservation}</p> --%>
                                 <fmt:parseNumber value = "${dto.onedayclassRecruitment}" var = "Recruitment" />
	                             <c:if test="${Recruitment - dto.onedayclassTotalpeople ge 0}">
                                 	<c:if test="${dto.onedayclassDeadlineCheck ne 'close'}">
                                 		<c:if test="${endDate.DAYS ge 0 && endDate.HOURS ge 0 && endDate.MINUTES ge 0}">
                                 			<button type="button" class="btn btn-primary" id="reservationFunction" onClick="reservationFunction();">Reservation</button>	
                                 		</c:if>
                                 	</c:if>
                                 </c:if>
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


<c:if test="${userVO.memberId eq dto.memberId}">
<table style="margin-left: auto; margin-right: auto;">
	<th colspan="2"><input class="btn alazea-btn mt-15" type="button"
		value="글수정"
		onclick="window.location='onedayclassModifyForm?onedayclassNumber=${dto.onedayclassNumber}'">
		<input class="btn alazea-btn mt-15" type="button" value="글삭제"
		onclick="window.location='onedayclassDeletePro?onedayclassNumber=${dto.onedayclassNumber}'">
	</th>
</table>
</c:if>

<c:if test="${userVO.memberId != null}">
<!-- 표시할 내용 :: 회원번호, 이메일, 아이디, ---- 제목, 종류, 행사일, 위치, 금액, 종료여부, 마감여부, 누적인원 -->

            <div class="col-12 col-lg-12">
                 <div class="alazea-benefits-area">
                     <div class="row">
                         
                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-1">
                             <div class="single-benefits-area">
                                 <h5>회원번호</h5>
                                 <p>${dto.onedayclassGrade}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-12 col-md-1">
                             <div class="single-benefits-area">
                                 <h5>이메일</h5>
                                 <p id="recruitment">${dto.onedayclassRecruitment}</p>
                             </div>
                         </div>
                 	</div>
                 </div>        
            </div>             











<!-- <div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="box box-success"> -->
			<div class="box-header">
				<h3 class="box-title" style="text-align:center">댓글 추가</h3>
			</div>
			<div class="box-body" style="text-align:center">
				<p>${userVO.memberId}님 댓글을 남겨주세요</p>
				<!-- <label for="oCommentContent">댓글을 남겨주세요</label> -->
				<input class="form-control" type="text" placeholder="REPLY TEXT" id="oCommentContent" style="width:700px; margin-left:auto; margin-right:auto";>
			</div>
			<!-- /.box-body -->
			<div class="box-footer" style="text-align:center">
				<button type="button" class="btn btn-primary" id="submitFunction" onClick="submitFunction()">ADD REPLY</button>
			</div>
<!-- 		</div>
	</div>
</div> -->
</c:if>

<div class="container"  style="width:500px; margin-left:auto; margin-right:auto;"> 
<div id ="getoCommentList" >
</div>
</div>

<%-- <div id ="getoCommentList">
<table>
<c:forEach var="row" items="${getoCommentList}">
	<tr>
		<td>${row.oCommentNumber}</td>
		<td>${row.memberId}</td>
		<td>${row.oCommentRegdate}</td>
		<td>${row.oCommentContent}</td>
		<td>
			<c:if test="${userVO.memberId == row.memberId}">
				<input type="button" value="Modify">
			</c:if>
		</td>
	</tr>	
</c:forEach>
</table>
</div> --%>

<!-- The time line -->
<ul class="text-center">
	<!-- timeline time label -->
	<li class="time-label" id="repliesDiv">
		<span class="bg-green">Replies List</span>
	</li>	
</ul>
<div class='text-center'>
	<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
</div>


<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->


<script type="text/javascript">



/* 예약 */
function reservationFunction() {
	var onedayclassTotalpeople = "${dto.onedayclassTotalpeople}";
	var onedayclassRecruitment = "${dto.onedayclassRecruitment}";
	var onedayclassNumber = "${dto.onedayclassNumber}";
	
	$.ajax({
		type : "PUT",
		url : "peopleUpdate",
		data: JSON.stringify({
			onedayclassTotalpeople : onedayclassTotalpeople,
			onedayclassRecruitment : onedayclassRecruitment,
			onedayclassNumber : onedayclassNumber
		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		success: function(map) {
				var onedayclassTotalpeople = map.ONEDAYCLASSTOTALPEOPLE;
				var onedayclassRecruitment = map.ONEDAYCLASSRECRUITMENT;
				$("#totalpeople").html(onedayclassTotalpeople);
				$("#recruitment").html(onedayclassRecruitment);
		}		
	});
}

/* 댓글 추가 */
function submitFunction() {
	var oCommentNumber = "${oCommentNumber}";
	var onedayclassNumber = "${dto.onedayclassNumber}";
	var memberEmail = "${userVO.memberEmail}";
	/* alert(memberEmail) */
	var memberId = "${userVO.memberId}";
	var oCommentContent = $('#oCommentContent').val();

	$.ajax({
		type : "POST",
		url: "oCommentInsert",
		data: JSON.stringify({
			oCommentNumber: oCommentNumber,
			onedayclassNumber: onedayclassNumber,
			memberEmail: memberEmail,
			memberId: memberId,
			oCommentContent: oCommentContent

		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		success: function(result) {
			getoCommentList();
		}
	});
	$('#oCommentContent').val('');
/* 	setTimeout(function(){
		getoCommentList();
    }, 3000); */
}

/* 댓글 목록을 출력할 영역 */
function getoCommentList() {
	/* alert("댓글떳2222음!!!!!!!") */
	 $.ajax({
		type: "get",
		contentType: "application/json",
		url:"list_json?onedayclassNumber=${dto.onedayclassNumber}",
		success:function(result){
			console.log(result);
			
			var output="<table>";
			for(var i in result){
				output += "<tr>";
				output += "<td>"+result[i].oCommentNumber + "</td>";
				output += "<td>"+result[i].memberId + "</td>";
				output += "<td>"+changeDate(result[i].oCommentRegdate) + "</td>";
				output += "<td>"+result[i].oCommentContent + "</td>";
				if("${userVO.memberId}" == result[i].memberId){
					var oComm = result[i].oCommentNumber;
					output += "<td><input type='button' value='Modify' onclick='updateOpen("+oComm+")'></td>";
				}
				if("${userVO.memberId}" == result[i].memberId){
					var oComm = result[i].oCommentNumber;
					output += "<td><input type='button' value='Delete' onclick='deleteOpen("+oComm+")'></td>";
				}	
				output += "</tr>";
			}
			output += "</table>";
			console.log(output);
			$("#getoCommentList").html(output); 
			/* $(output).appendTo("#getoCommentList"); */
			/* $('table').append("#getoCommentList"); */
		}
	})
}

/* 날짜 포맷 바꾸는 함수 */
function changeDate(date) {
	date = new Date(parseInt(date));
	year = date.getFullYear();
	month = date.getMonth();
	day = date.getDate();
	strDate = year+ "-" +month+ "-" +day;
	return strDate;
	}

/* 댓글 수정창 */
function updateOpen(data2){
	/* alert("진짜넘어온다.." + oComm); */
	window.name = "parentForm";  // 부모창 이름
	window.open("readOneComment?oCommentNumber=" + data2,
				"childForm", "width=570, height=350, resizable = no, scrollbars = no");// 자식창 이름
	
}

/* 댓글 삭제 확인창 */
function deleteOpen(data2) {
	var msg = confirm("댓글을 삭제합니다.");
	if(msg == true) {//확인을 누를경우
		deleteComment(data2);	
	}
	else {
		return false; //삭제취소
	}
}



/* 댓글 삭제 */
function deleteComment(data2){
	var oCommentNumber = data2;
	/* alert("삭제값 넘어오나?" + data2); */
	$.ajax({
		type : "DELETE",
		url: "deleteComment",
		data: JSON.stringify({
			"oCommentNumber": oCommentNumber,
		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		success: function(result) {
			getoCommentList();
		}
	});
/* 	setTimeout(function(){
		getoCommentList();
    }, 4000); */
}



$(function(){
	/* alert("댓글떳음!!!!!!!") */
	getoCommentList();
})
	</script>
</body>
</html>