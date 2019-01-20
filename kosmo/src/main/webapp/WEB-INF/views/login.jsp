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
<title>Helper - Foriener &amp; Help HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/css/login.css">
</head>

<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<body>
	<div class="container">
		<div class="row">
			<!-- Mixins-->
			<!-- Pen Title-->
			<div class="pen-title">
				<h1>&nbsp</h1>
			</div>
			<div class="container">
				<div class="card"></div>
				<div class="card">
					<h1 class="title">Login</h1>
					<form>
						<div class="input-container">
							<input type="text" id="Username" required="required" /> <label
								for="Username">Username</label>
							<div class="bar"></div>
						</div>
						<div class="input-container">
							<input type="password" id="Password" required="required" /> <label
								for="Password">Password</label>
							<div class="bar"></div>
						</div>
						<div class="button-container">
							<button>
								<span>Go</span>
							</button>
						</div>
						<div class="footer">
							<a href="#">Forgot your password?</a>
						</div>
					</form>
				</div>
				<div class="card alt">
					<div class="toggle"></div>
					<h1 class="title">
						Register
						<div class="close"></div>
					</h1>
					<form>
						<div class="input-container">
							<input type="text" id="Username" required="required" /> <label
								for="Username">Username</label>
							<div class="bar"></div>
						</div>
						<div class="input-container">
							<input type="password" id="Password" required="required" /> <label
								for="Password">Password</label>
							<div class="bar"></div>
						</div>
						<div class="input-container">
							<input type="password" id="Repeat Password" required="required" />
							<label for="Repeat Password">Repeat Password</label>
							<div class="bar"></div>
						</div>
						<div class="button-container">
							<button>
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
	</script>
</body>
</html>