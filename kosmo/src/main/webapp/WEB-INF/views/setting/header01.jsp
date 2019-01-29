<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

<!-- ajax 알람  -->

<script type="text/javascript"> 

function alarm(){
	if(loopSendKeyword == false) return false;
	var alarmCnt = document.header01.alarmCnt.value;
	var parms = "alarmCnt=" + alarmCnt;
	
	sendRequest(result_callback, "alarmServiceCnt", "GET", params);
	setTimeout("alarm()", 1000); //실시간 제일 중요한 개념
}

function result_callback() {
	var alarmCnt = document.getElementById("alarmCnt");
	if(httpRequest.readyState == 4){}
		if(httpRequest.status == 200){
			loopSendKeyword = true; // 0.5초마다 반복해라
			setTimeout(sendKeyword(), 100);
			
			if(data != null){
				aCnt = data;
				checkFirst = true;
			 alarmCnt.innerHtml = aCnt;
			}
		}
} 
</script>
<body onload="alarm();">
	<div style="position: relative;">
		<div
			style="z-index: 1; display: inline; position: absolute; top: 0; background: black; height: 200px; widht: 1000px;"></div>
	</div>
	<header class="header-area">
		<!-- ***** Top Header Area ***** -->
		<div class="top-header-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div
							class="top-header-content d-flex align-items-center justify-content-between">
							<!-- Top Header Content -->
							<div class="top-header-meta">
								<a href="#" data-toggle="tooltip" data-placement="bottom"
									title="infodeercreative@gmail.com"><i
									class="fa fa-envelope-o" aria-hidden="true"></i> <span>Email:
										infodeercreative@gmail.com</span></a> <a href="#" data-toggle="tooltip"
									data-placement="bottom" title="+1 234 122 122"><i
									class="fa fa-phone" aria-hidden="true"></i> <span>Call
										Us: +1 234 122 122</span></a>
							</div>

							<!-- Top Header Content -->
							<div class="top-header-meta d-flex">
								<!-- Language Dropdown -->
								<div class="language-dropdown">
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
								</div>
								
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
											<a href="myPage">
												<button class="btn btn-secondary mr-30"
													type="button" id="dropdownMenuButton"
													aria-haspopup="true" aria-expanded="false">
													MyPage
												</button>
											</a>
										</div>
									</div>
								</sec:authorize>
							
								<!-- Alarm -->
								<div class="cart">
									<a href="alarmBoard"><i class="fa fa-envelope"
										aria-hidden="true"></i> <span>Alarm</span>
										<span><class="messege-quantity">
										<div class="alarm" load="alarmCnt();"></div>
										</span></a>
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
											<li><a href="content">Contents</a></li>
											<li><a href="knowledge">Knowledge IN</a></li>
											<li><a href="realestate">Real Estate</a></li>
											<li><a href="onedayclass">Oneday Class</a></li>
											<li><a href="alarmBoard">Alarm</a></li>
										</ul></li>
									<li><a href="#">Traffic</a>
										<ul class="dropdown">
											<li><a href="getdirections.jsp">Get Directions</a></li>
											<li><a href="restaurantlocation.jsp">Restaurant
													Location</a></li>
											<li><a href="emergencyfacility.jsp">Emergency
													facility</a></li>
										</ul></li>
									<li><a href="#">Tourism</a>
										<ul class="dropdown">
											<li><a href="weather.jsp">Weather</a></li>
											<li><a href="eventcultur.jsp">Event/Cultural
													Heritage</a></li>
											<li><a href="exchangerate.jsp">Exchange Rate</a></li>
										</ul></li>
									<li><a href="#">Foreign policy</a>
										<ul class="dropdown">
											<li><a href="employment.jsp">Employment</a></li>
											<li><a href="multicultural.jsp">Multicultural</a></li>
											<li><a href="legalinfo.jsp">Legal Information</a></li>
										</ul></li>
									<li><a href="#">Etc</a>
										<ul class="dropdown">
											<li><a href="size.jsp">Convert to Size</a></li>
											<li><a href="join.jsp">Join</a></li>
										</ul></li>
								</ul>

								<!-- Search Icon -->
								<div id="searchIcon">
									<i class="fa fa-search" aria-hidden="true"></i>
								</div>

							</div>
							<!-- Navbar End -->
						</div>
					</nav>

					<!-- Search Form -->
					<div class="search-form">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type keywords &amp; press enter...">
							<button type="submit" class="d-none"></button>
						</form>
						<!-- Close Icon -->
						<div class="closeIcon">
							<i class="fa fa-times" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

</body>
<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>