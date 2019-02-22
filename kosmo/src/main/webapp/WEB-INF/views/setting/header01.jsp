<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="resources/js/request.js"></script>
<script src="resources/js/request2.js"></script>


<style type="text/css">
.card {
	border: 1px solid #28a745;
}

.card-login {
	padding: 18px;
}

.bg-dark {
	background-color: #70c745 !important;
}

.card-header {
	color: #fff;
	/*background: #ff0000;*/
	font-family: sans-serif;
	font-size: 20px;
	font-weight: 600 !important;
	margin-top: 10px;
	border-bottom: 0;
}

.input-group-prepend span {
	width: 50px;
	background-color: #ff0000;
	color: #fff;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
}

.login_btn {
	width: 130px;
}

.login_btn:hover {
	color: #fff;
	background-color: #ff0000;
}

.btn-outline-danger {
	color: #fff;
	font-size: 18px;
	background-color: #28a745;
	background-image: none;
	border-color: #28a745;
}

.form-control {
	display: block;
	width: 100%;
	height: calc(2.25rem + 2px);
	padding: 0.375rem 0.75rem;
	font-size: 1.2rem;
	line-height: 1.6;
	color: #28a745;
	background-color: transparent;
	background-clip: padding-box;
	border: 1px solid #28a745;
	border-radius: 0;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.input-group-text {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding: 0.375rem 0.75rem;
	margin-bottom: 0;
	font-size: 1.5rem;
	font-weight: 700;
	line-height: 1.6;
	color: #495057;
	text-align: center;
	white-space: nowrap;
	background-color: #e9ecef;
	border: 1px solid #ced4da;
	border-radius: 0;
}
</style>
<link rel="stylesheet" href="resources/css/googleTranslate.css">

<!-- ajax 알람  -->
<script>

function alarm() {
		//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
		if(${sessionScope.userVO != null}){
			$.getJSON("alarmCnt", function(cnt){
				$('#alarmCnt').html(cnt); 
				
			}); }
	}
/* alarm(); */


setInterval("alarm();", 60000);//원래 2000, 개발중  60000, 시연때 2000


//헤더 상단 날씨 / 미세먼지 정보 얻기
$(function() {
	var weatherURI = "http://api.openweathermap.org/data/2.5/weather?id=1835848&APPID=65ded33b5934b593a7ef3603b3398724&units=metric";
	
	
	$.ajax({
        url: weatherURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(result) {
        	var temp = Math.round(result.main.temp);
        	/* var humid = result.main.humidity; */
        	var weather = result.weather[0].main;
        	var image = "http://openweathermap.org/img/w/"+result.weather[0].icon+".png";
        	$("#tempr").html(temp+"'C");
        	/* $("#humid").html(humid+"%"); */
        	$("#weatherTxt").html(weather);
        	$("#weatherImg").attr("src",image);
        }
    })
    
    
    <c:if test="${checked eq 'Y'}">
    	var pm25grade = ${pm25Grade};
    	var pm10grade = ${pm10Grade};
    	var pm25 = ${pm25Value};
    	var pm10 = ${pm10Value};
    	
    	$("#smdtext").html(pm25);
    	$("#mdtext").html(pm10);
    	
		switch(pm25grade){
			case 1: var color25 = "green";break;
			case 2: var color25 = "yellow";break;
			case 3: var color25 = "orange";break;
			case 4: var color25 = "red";break;
		}
		$("#smdtext").css("color",color25);
       	switch(pm10grade){
    		case 1: var color10 = "green";break;
    		case 2: var color10 = "yellow";break;
    		case 3: var color10 = "orange";break;
    		case 4: var color10 = "red";break;
   		}
       	$("#smdtext").css("color",color10);
	</c:if>
	<c:if test="${checked ne 'Y'}">
   	$.ajax({
        url: "dustInfo",
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(result) {
        	console.log(result);
        	var item = result.response.body.items.item;
        	var pm10 = item.pm10Value;
        	var pm10grade = item.pm10Grade;
        	var pm25 = item.pm25Value;
        	var pm25grade = item.pm25Grade;
        	$("#smdtext").html(pm25);
        	$("#mdtext").html(pm10);
        	switch(pm25grade){
        		case 1: var color25 = "green";break;
        		case 2: var color25 = "yellow";break;
        		case 3: var color25 = "orange";break;
        		case 4: var color25 = "red";break;
        	}
        	$("#smdtext").css("color",color25);
        	switch(pm10grade){
	    		case 1: var color10 = "green";break;
	    		case 2: var color10 = "yellow";break;
	    		case 3: var color10 = "orange";break;
	    		case 4: var color10 = "red";break;
    		}
        	$("#smdtext").css("color",color10);
        }
    })
    </c:if>
})

</script>
 
<body onload="alarm();">
	<header class="header-area">
		<!-- ***** Top Header Area ***** -->
		<div class="top-header-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="top-header-content d-flex align-items-center justify-content-between">
							<!-- Top Header Content -->
		
							<div class="top-header-meta">
								<a>
									<img id="weatherImg" style="margin-right:2px;max-width:20px;background-color:#70c745; border-radius: 30%">
									<span id="weatherTxt" style="margin-right:12px;"></span>
									<i class="fa fa-thermometer-half"></i><span id="tempr" style="margin-right:8px;"></span>
									<span>fine dust : </span><span id="mdtext" style="margin-right:8px;"></span>
									<span>super fine dust : </span><span id="smdtext"></span>
									<!-- <i class="fa fa-tint"></i><span id="humid"></span> -->
								</a>
							</div>

							<!-- Top Header Content -->
							<div class="top-header-meta d-flex">
								<!-- Language Dropdown -->
								<div id="google_translate_element"></div>
								<script type="text/javascript">
								function googleTranslateElementInit() {
								  new google.translate.TranslateElement({pageLanguage: 'en', 
									  includedLanguages: 'ar,en,es,jv,ko,pa,pt,ru,zh-CN', 
									  layout: google.translate.TranslateElement.InlineLayout.SIMPLE, 
									  autoDisplay: true}, 'google_translate_element');
								}
								</script>
								<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
								<div class="cart">
								</div>
								<!-- <div class="language-dropdown">
									<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle mr-30"
											type="button" id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">Language</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton">
											<a class="dropdown-item" href="#">USA</a> <a
												class="dropdown-item" href="#">UK</a> <a
												class="dropdown-item" href="#">Bangla</a> <a
												class="dropdown-item" href="#">Hindi</a> <a
												class="dropdown-item" href="#">Spanish</a> <a
												class="dropdown-item" href="#">Latin</a>
										</div>
									</div>
								</div> -->
								
								
								<!-- Login -->
								<div class="login">
									<sec:authorize access="isAnonymous()">
										<a href="<c:url value='/loginCheck'/>"><i
											class="fa fa-user" aria-hidden="true">Login</i> </a>
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
										<a href="<c:url value='/j_spring_security_logout'/>"><i
											class="fa fa-user" aria-hidden="true">Logout</i> </a>
									</sec:authorize>
								</div>
								
								
								<!-- Mypage Button -->
								<sec:authorize access="isAuthenticated()">
									<div class="language-dropdown">
										<div class="dropdown">
											<c:if test="${userVO.authority ne 'ROLE_ADMIN'}">
												<a href="myPage">
													<button class="btn btn-secondary mr-30"
														type="button" id="dropdownMenuButton"
														aria-haspopup="true" aria-expanded="false">
														MyPage
													</button>
												</a>
											</c:if>
											
											<c:if test="${userVO.authority eq 'ROLE_ADMIN'}">
												<a href="adminPage">
													<button class="btn btn-secondary mr-30"
														type="button" id="dropdownMenuButton"
														aria-haspopup="true" aria-expanded="false">
														AdminPage
													</button>
												</a>
											</c:if>
										</div>
									</div>
								</sec:authorize>
								
							
								<!-- Alarm -->
								<div class="cart">
								<c:if test="${userVO ne null}">
									<a href="alarmBoard">
										<i class="fa fa-envelope" aria-hidden="true"></i> 
										<span>Alarm</span>
										<span id="alarmCnt"><class="messege-quantity">
										</span></a>
								</c:if>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="alazea-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="alazeaNav">

						<!-- Nav Brand -->
						<a href="index" class="nav-brand"><img
							src="resources/img/core-img/logo.png" alt=""></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Navbar Start -->
							<div class="classynav">
								<ul>
									<li><a href="#">Community</a>
										<ul class="dropdown">
											<!-- <li><a href="content">Contents</a></li> -->
											<li><a href="knowledge">Knowledge IN</a></li>
											<li><a href="realestate">Real Estate</a></li>
											<li><a href="onedayclass">Oneday Class</a></li>
										</ul></li>
									<li><a href="#">Information</a>
										<ul class="dropdown">
											<li><a href="weather">Weather Info</a></li>
											<li><a href="travelBoard">Travel Info</a></li> 
											<li><a href="emergency">Emergency Info</a></li>
											<li><a href="legalinfo">Legal Info</a></li>
											
										</ul></li>
									<li><a href="#">Utility</a>
										<ul class="dropdown">
											<li><a href="getDirections">Traffic Search</a></li>
											<li><a href="imageSearch">Image Search</a></li>
											<li><a href="convertSize">Conversion Calculator</a></li>
											<li><a href="exchangerate">Exchange Calculator</a></li>
										</ul></li>
									<!-- <li><a href="#">Trash</a>
										<ul class="dropdown">
											<li><a href="employment">Employment</a></li>
											<li><a href="restaurantlocation">Restaurant Location</a></li>
											<li><a href="news">News</a></li> 재영 추가 
											<li><a href="eventculture">Event/Cultural Heritage</a></li>
											<li><a href="multicultural">Multicultural</a></li>
										</ul></li> 
									 <li><a href="#">Utility</a>
										<ul class="dropdown">
										</ul></li> -->
								</ul>
								<!-- Search Icon -->
								<!-- <div id="searchIcon">
									<i class="fa fa-search" aria-hidden="true"></i>
								</div> -->

							</div>
							<!-- Navbar End -->
						</div>
					</nav>

					<!-- Search Form -->
					<!-- <div class="search-form">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type keywords &amp; press enter...">
							<button type="submit" class="d-none"></button>
						</form>-->
						<!-- Close Icon -->
						<!--<div class="closeIcon">
							<i class="fa fa-times" aria-hidden="true"></i>
						</div>
					</div>-->
					
				</div>
			</div>
		</div>
	</header>

</body>
<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="resources/js/googleTranslate.js"></script>