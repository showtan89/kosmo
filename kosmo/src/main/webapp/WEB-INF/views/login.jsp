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
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Helper - Foreigner &amp; Help HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/css/login.css">
<style type="text/css">

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 999; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  z-index: 999;
  background-color: #fefefe;
  margin: 300px auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 200px; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
</head>

<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<!-- 대호 회원가입 스크립트 시작 -->
<script type="text/javascript">

	
	
	function nameConfirmCheck() {
		
		var name = document.memberInputForm.memberId.value;
		
		if (!name) {
			return false;
		} else {
			var url = "memberIdConfirm?memberId=" + name;
			var popup = window.open(url, "", "width=600, height=400, toolba=no");
			popup.moveTo(0, 0);
		}
	}
	

	function memberInputSubmit() {

		var email = document.memberInputForm.memberEmail.value;

		if (!email) {
			alert("Please input your Email");
			return false;
		} else if (email.indexOf("@") < 0) {
			alert("Please input your Email correctly")
			return false;
		} else if (document.memberInputForm.confirmChk.value < 1) {
			alert("Please check and confirm your Email");
			return false;
		} else if (document.memberInputForm.memberCountry.value == "null") {
			alert("Please select your country");
			return false;
		} else if (document.memberInputForm.password.value != document.memberInputForm.Repeat_Password.value) {
			alert("Password is incorrenct. Please check it.");
			return false;
		} else if (document.memberInputForm.memberId.value.length < 3) {
			alert("Your name is too short. Please check it.");
			return false;
		} else if (document.memberInputForm.memberId.value.length > 40) {
			alert("Your name is too long. Please check it.");
			return false;
		} else if (document.memberInputForm.nameConfirmChk.value == 0) {
			alert("Please check and confirm your name");
			return false;
		}
		
	}
	
	function emailChanged() {
		document.memberInputForm.confirmChk.value = 0;
	}
	
	function nameChanged() {
		document.memberInputForm.nameConfirmChk.value = 0;
	}
	
	
	
</script>


<!-- 회원가입 스트립트 종료 -->

<body>
	<div class="container">
		<div class="row">
			<!-- Mixins-->
			<!-- Pen Title-->
			<div class="pen-title">
				<h1>&nbsp</h1>
				<img src="">
			</div>
			<div class="container">
				<div class="card"></div>
				<div class="card">
					<h1 class="title">Login</h1>
					<form action="j_spring_security_check" method="post">
						<div class="input-container">
							<input type="text" required="required" name="loginEmail"/> <label
								for="Email">Email</label>
							<div class="bar"></div>
						</div>
						<div class="input-container">
							<input type="password" required="required" name="loginPwd"/> <label
								for="Password">Password</label>
							<div class="bar"></div>
						</div>
						<div class="button-container">
							<button type="submit">
								<span>Submit</span>
							</button>
						<br>
							<button type="button" onclick="window.location.href='index'">
								<span>Back</span>
							</button>
						</div>
						<!-- 재영 추가 - 구글 oAuth 적용중 -->
						<%-- <div class="footer button-container">
							<a href="">
							<button type="button">
								<span>Google Id Login</span>
							</button></a>
						</div> --%>
						<!-- 재영 추가 - 구글 oAuth 적용중 -->
					</form>
				</div>
				<div class="card alt">
					<div class="toggle"></div>
					<h1 class="title">
						Register
						<div class="close"></div>
					</h1>
					
					<form action="memberInputPro" method="post" name="memberInputForm" onsubmit="return memberInputSubmit();">
					
						<input type="hidden" id="confirmChk" name="confirmChk" value="0">
					
						<div class="input-container">
							<select class="custom-select d-block w-100" id="memberCountry" name="memberCountry">
								<option style="display: none;" value="null">Select Your Country</option>
								<option value="Australia">Australia</option>
								<option value="China">China</option>
								<option value="France">France</option>
								<option value="Germany">Germany</option>
								<option value="India">India</option>
								<option value="Japan">Japan</option>
								<option value="Korea">Korea</option>
								<option value="Russia">Russia</option>
								<option value="Spain">Spain</option>
								<option value="Thai">Thailand</option>
								<option value="UK">United Kingdom</option>
								<option value="USA">United States of America</option>
							</select>
							<div class="bar"></div>
						</div>
					
						<div class="input-container">
							<input type="text" id="memberEmail" name="memberEmail" required="required" onchange="emailChanged();"/>
							<label for="memberEmail">Email</label>
							<div class="bar"></div>
						</div>
						
						<!-- The Modal -->
						<div id="myModal" class="modal">
							<!-- Modal content -->
							<div class="modal-content">
								<h5 id="innerModal" align='center'></h5><br>
								<a><button type="button" id="closeModal" class='btn alazea-btn'>CLOSE</button></a>
							</div>
						</div>
						
					<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
					<script>
					
						function EmailCheck() {
	
								var modal = document.getElementById('myModal');
								var btn = document.getElementById("cnfEmail");
								var span = document.getElementById("closeModal");
								var email = $('#memberEmail').val();
								
								if (!email) {
									
									$('#innerModal').html("You must write Email");
									
									modal.style.display = "block";
									
									span.onclick = function() {
										modal.style.display = "none";
									}
									window.onclick = function(event) {
										if (event.target == modal) {
											modal.style.display = "none";
										}
									} 
									
									return false;
								} else {
									
									$.ajax({
										url : 'memberConfirmidForm',
										data : 'email=' + email,
										type : 'POST',
										success : function(selectCnt) {
											
											if (selectCnt == 0) {
												
													$('#innerModal').html(email + " is available.");
													$('#confirmChk').val("1");
													
													modal.style.display = "block";
													
													span.onclick = function() {
														modal.style.display = "none";
													}
													window.onclick = function(event) {
														if (event.target == modal) {
															modal.style.display = "none";
														}
													}
													
													
											
											} else if (selectCnt > 0) {
												$('#innerModal').html(email + " is not available");
												
												modal.style.display = "block";
												
												span.onclick = function() {
													modal.style.display = "none";
												}
												window.onclick = function(event) {
													if (event.target == modal) {
														modal.style.display = "none";
													}
												}
											}
										},
										error : function() {
											alert('오류');
										}
									});
								
								}
							}
								
						
					
					</script>
						
						<div class="button-container">
							<button type="button" id="cnfEmail" onclick="return EmailCheck();">
								<span>
									Confirm Email
								</span>
							</button>
						</div>
						<br>
						<br>
						<div class="input-container">
							<input type="password" id="Password" name="password" required="required" /> <label
								for="Password">Password</label>
							<div class="bar"></div>
						</div>
						
						<div class="input-container">
							<input type="password" id="Repeat_Password"/>
							<label for="Repeat_Password">Repeat Password</label>
							<div class="bar"></div>
						</div>
						
						<div class="input-container">
							<input type="text" id="memberId" name="memberId" onchange="nameChanged();"/>
							<label for="memberId">Name</label>
							<div class="bar"></div>
						</div>
						
						<input type="hidden" id="nameConfirmChk" name="nameConfirmChk" value="0">
						
						<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
					<script>
					
						function nameConfirmCheck() {
	
								var modal = document.getElementById('myModal');
								var btn = document.getElementById("nameCheckButton");
								var span = document.getElementById("closeModal");
								var name = $('#memberId').val();
								
								if (!name) {
									
									$('#innerModal').html("You must write name");
									
									modal.style.display = "block";
									
									span.onclick = function() {
										modal.style.display = "none";
									}
									window.onclick = function(event) {
										if (event.target == modal) {
											modal.style.display = "none";
										}
									} 
									
									return false;
									
								} else {
									
									$.ajax({
										url : 'memberIdConfirm',
										data : 'memberId=' + name,
										type : 'POST',
										success : function(selectCnt) {
											
											if (selectCnt == 0) {
												
													$('#innerModal').html(name + " is available.");
													$('#nameConfirmChk').val("1");
													
													modal.style.display = "block";
													
													span.onclick = function() {
														modal.style.display = "none";
													}
													window.onclick = function(event) {
														if (event.target == modal) {
															modal.style.display = "none";
														}
													}
													
													
											
											} else if (selectCnt > 0) {
												$('#innerModal').html(name + " is not available");
												
												modal.style.display = "block";
												
												span.onclick = function() {
													modal.style.display = "none";
												}
												window.onclick = function(event) {
													if (event.target == modal) {
														modal.style.display = "none";
													}
												}
											}
										},
										error : function() {
											alert('오류');
										}
									});
								
								}
							}
								
						
					
					</script>
						
						<div class="button-container">
								<button type="button" id="nameCheckButton" onclick="return nameConfirmCheck();">
									<span>Confirm Name</span>
								</button>
							<br>
							<br>
						</div>
						
						<div class="button-container">
							<button type="submit">
								<span>Next</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="resources/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="resources/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="resources/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="resources/js/active.js"></script>
	<script>
		$(document).ready(function() {
			$('.toggle').on('click', function() {
				$('.container').stop().addClass('active');
			});
			$('.close').on('click', function() {
				$('.container').stop().removeClass('active');
			});
		});
		
		/* 재영 추가 */
		function googleLogin() {
			
		}
		
		
	</script>
</body>
</html>