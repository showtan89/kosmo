<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.helper.vo.BoardVO.KnowledgeVO"%>
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
		style="background-image: url(resources/img/ehddnr2.jpg);">
		<h2>CONTENT</h2>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" style="margin-bottom: 50px;margin-top: 30px;">
	<div style="width:800px; margin:auto;"class="col-12 col-md-9 col-lg-10">
	
	<% KnowledgeVO Knowledge = (KnowledgeVO)request.getAttribute("Knowledge"); %>
	
<!-- 동욱이 css -->
<link rel="stylesheet" href="resources/ehddnr.css">
<script type="text/javascript">
	function onsubmitcheck(){
		if(!$('#knowledgeSubject').val()){
			$('#knowledgeSubject').focus();
			$('#knowledgeSubject').attr('placeholder',"Please enter a title.");
			$('#knowledgeSubject').focus().fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		} else if(!$('#knowledgeContent').val()){
			$('#knowledgeContent').focus();
			$('#knowledgeContent').attr('placeholder',"Please enter your content.");
			$('#knowledgeContent').focus().fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		} 
	}
		$(function() {
			$('textarea.content').keyup(function() {
				bytesHandler(this);
			});
		});
		
		function getTextLength(str) {
			var len = 0;

			for (var i = 0; i < str.length; i++) {
				if (escape(str.charAt(i)).length == 6) {
					len++;
				}
				len++;
			}
			return len;
		}

		function bytesHandler(obj) {
			var text = $(obj).val();
			$('p.bytes').text(getTextLength(text));
		}

		function knowledge() {
			window.location = "knowledge";
		}
		function thbackground(Reward_th) {
			var Reward_th2 = $(Reward_th).text();
			$('.knowledgeWriteForm_Reward_th').css('background-color', '#fff');
			$(Reward_th).css('background-color', 'green');
			$('#addReward').val(Reward_th2);
		}
		function knowledgeWriteForm_Reward_block() {
			$('.knowledgeWriteForm_Reward').css('display', 'block')
			
		}
		function knowledgeWriteForm_Reward_none() {
			$('.knowledgeWriteForm_Reward').css('display', 'none')
			$('#addReward').val(<%=Knowledge.getKnowledgeReward()%>);
		}
		$(document).ready(function() {
			$(function() {
				$('textarea.content').text(function() {
					bytesHandler(this);
				});
			});
			
			function getTextLength(str) {
				var len = 0;

				for (var i = 0; i < str.length; i++) {
					if (escape(str.charAt(i)).length == 6) {
						len++;
					}
					len++;
				}
				return len;
			}

			function bytesHandler(obj) {
				var text = $(obj).val();
				$('p.bytes').text(getTextLength(text));
			}
			$("#btn_select").val("<%=Knowledge.getKnowledgeCategory()%>").prop("selected", true);
			if('<%=Knowledge.getKnowledgeOpenCheck()%>'=='Y'){
				$('#knowledgeOpenCheck1').prop("checked", true);
			} else {
				$('#knowledgeOpenCheck2').prop("checked", true);
			}
			if('<%=Knowledge.getKnowledgeReward()%>'!='0'){
				$('p.class_addReward').text('I will give you Point  '+<%=Knowledge.getKnowledgeReward()%>);
			} else {
				$('p.class_addReward').text('Points to the selected answerer.');
			}
		});
		function knowledgeWriteForm_addReward(){
			var addReward = $('#addReward').val();
			if(!$.isNumeric(addReward)){
				$('#addReward').focus();
				$('#addReward').val(null);
				$('#addReward').attr('placeholder',"Please enter a number.");
				$('#addReward').focus().fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
				return false;
			} else if(addReward != '0'){
				$('p.class_addReward').text('I will give you Point  '+addReward);
				$('.knowledgeWriteForm_Reward').css('display', 'none');
			} else {
				$('p.class_addReward').text('Points to the selected answerer.');
				$('.knowledgeWriteForm_Reward').css('display', 'none');
			}
		}
	</script>
	<form action="knowledgeModifyPro" method="post" name="knowledgeForm" onsubmit="return onsubmitcheck();">
		<ul>
			<li>
				<p align="center">
				 <img src="resources/img/ehddnr.gif" style="margin:0 0 10px 0;"> 
				 <input type="text"  maxlength="100" name="knowledgeSubject" id="knowledgeSubject" value="${Knowledge.knowledgeSubject}" style="width:100%;padding:0 5px;">
				</p>
			</li>
			<li>
			<p style="display: inline" class="bytes">0</p>/5000</li>
			<li style="width: 100%; height: 500px; margin: 0 0 20px 0;padding:5px 5px;">
			<textarea class="content" maxlength="5000"style="width: 100%; height: 100%;padding:5px 5px;" name="knowledgeContent" id="knowledgeContent">${Knowledge.knowledgeContent}</textarea>
			</li>
			<li style="position: relative; display:inline;">
					<input class="knowledgeWriteForm_button3" type="button" value="POINT OPTION"
						onclick="knowledgeWriteForm_Reward_block();" style="display:inline-block;">
						&nbsp;<p class="class_addReward" style="display:inline-block;">
				</p>
				<div class="knowledgeWriteForm_Reward">
					<table>
						<tr style="height: 10%">
							<th colspan="5">POINT</th>
						</tr>
						<tr style="height: 20%">
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th1"><span
								onclick="thbackground(Reward_th1);" >10</span></th>
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th2"
								onclick="thbackground(Reward_th2);">20</th>
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th3"
								onclick="thbackground(Reward_th3);">30</th>
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th4"
								onclick="thbackground(Reward_th4);">40</th>
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th5"
								onclick="thbackground(Reward_th5);">50</th>
						</tr>
						<tr style="height: 20%">
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th6"
								onclick="thbackground(Reward_th6);">60</th>
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th7"
								onclick="thbackground(Reward_th7);">70</th>
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th8"
								onclick="thbackground(Reward_th8);">80</th>
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th9"
								onclick="thbackground(Reward_th9);">90</th>
							<th class="knowledgeWriteForm_Reward_th" id="Reward_th10"
								onclick="thbackground(Reward_th10);">100</th>
						</tr>
						<tr style="height: 30%; width: 100%;">
							<td colspan="5" style="padding-top: 10px; text-align: left;">
								<p>
									<span style="font-size: 10px; float: right;">My Point : ${userVO.memberPoint} </span><br>
									<input style="width: 100%;" type="text" id="addReward" name="addReward" value="${Knowledge.knowledgeReward}">
								</p>
							</td>
						</tr>
						<tr center="center" style="height: 20%">
							<td colspan="5">
								<input class="knowledgeWriteForm_button3" type="button"	value="SELECT" onclick="return knowledgeWriteForm_addReward();">
								<input class="knowledgeWriteForm_button3" type="button" value="CANCLE" onclick="knowledgeWriteForm_Reward_none();">
							</td>
						</tr>
					</table>
				</div>
				<p>
					<input class="knowledgeWriteForm_button3" type="button" value="CATEGORY">&nbsp;
					<select class="btn_select" name="knowledgeCategory" id="btn_select">
						<option value="Education">Education</option>
						<option value="Computer">Computer</option>
						<option value="Game">Game</option>
						<option value="entertainment">Entertainment</option>
						<option value="life">Life</option>
						<option value="Health">Health</option>
						<option value="society">Society</option>
						<option value="travel">Travel</option>
						<option value="sports">Sports</option>
						<option value="Shopping">Shopping</option>
						<option value="Worry">Worry</option>
					</select>
					<input type="hidden" name="knowledgeNumber" value="${Knowledge.knowledgeNumber}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="btn_select" value="${btn_select}">
				</p>
			</li>
			<li >
				<input style="margin:0 5px 0 0;"class="knowledgeWriteForm_button3" type="button" value="ID">
				<input type="radio" name="knowledgeOpenCheck" id="knowledgeOpenCheck1" value="Y" checked="checked">OPEN
				<input type="radio" name="knowledgeOpenCheck" id="knowledgeOpenCheck2" value="N" >CLOSE
			</li>
			<li align="center">
				<br>
				<input class="knowledgeWriteForm_button3" type="submit" value="WRITE">
				<input class="knowledgeWriteForm_button3" type="button"	value="BACK" onclick="window.history.back();">
			</li>
		</ul>
	</form>
	</div>
</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>