<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<title></title>

<script src="jquery.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>





	<ul class="nav nav-tabs">

		<li class="active"><a href="#home" data-toggle="tab"
			class="btn btn-large btn-block btn-success disabled">Home</a></li>

		<li><a href="#profile" data-toggle="tab">Profile</a></li>

		<li><a href="#messages" data-toggle="tab">Messages</a></li>

		<li><a href="#settings" data-toggle="tab">Settings</a></li>

	</ul>



	<!-- Tab panes -->

	<div class="tab-content">

		<div class="tab-pane active" id="home">Write Here Tab Home Part1</div>

		<div class="tab-pane" id="profile">Write Here Tab Profile Part2</div>

		<div class="tab-pane" id="messages">Write Here Tab Messages
			Part3</div>

		<div class="tab-pane" id="settings">Write Here Tab Settings
			Part4</div>

	</div>

	<hr />

	<button class="tab-button" type="button">Next</button>

</body>

<script>

$(document).ready(function(){ 
	$(".nav-tabs li a[data-toggle=tab]").on("click",function(e){ 
	 
	     e.preventDefault(); 
	 
	     if($(this).parent('li').is(':last-child')) 
	     { 
		     $('.tab-button').hide(); 
	     } 
	     else 
	     { 
		     $('.tab-button').show(); 
	     } 
	 
	     $('.nav-tabs li:eq(1) a').tab('show'); 
	 
	     $("[class='btn btn-large btn-block btn-success disabled']").removeClass("btn btn-large btn-block btn-success disabled"); 
	     $(this).addClass("btn btn-large btn-block btn-success disabled"); 
	}); 
	 
	$('.tab-button').click(function(){ 
	ss = $("[class='btn btn-large btn-block btn-success disabled']").parent('li').next().find('a').trigger('click'); 
	}); 
	});

</script>

</html>