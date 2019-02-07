<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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

<script type="text/javascript">

	function onlyNumber(event){
		
		event = event || window.event;
		
		var keyID = (event.which) ? event.which : event.keyCode;
		
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	
	function removeChar(event) {
		
		event = event || window.event;
		
		var keyID = (event.which) ? event.which : event.keyCode;
		
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}

	function writeChk() {
		
		if (!document.authForm.i.value) {
			alert("Must be write your account number");
			document.authForm.i.focus();
			return false;
		}
	}
</script>


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


<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-h6ay{background-color:#f9f9f9;border-color:inherit;text-align:left}
.tg .tg-xldj{border-color:inherit;text-align:left}
</style>

<form action="onedayclassAuthorityPro" method="post" name="authForm" onsubmit="return writeChk();">
<table class="tg" style="margin-left: auto; margin-right: auto;">
  <tr>
    <th class="tg-xldj" colspan="4">
    	<h2>원데이 클래스 개설 권한 신청</h2>
    </th>
  </tr>
  <tr>
    <td class="tg-xldj" colspan="4">
    	원데이 클래스 개설 권한을 신청하고 계좌번호를 입력하면 자유롭게 클래스 개설을 할 수 있습니다.
    </td>
  </tr>
  <tr>
    <td class="tg-xldj">
    	권한 신청 약관
    </td>
    <td class="tg-h6ay" colspan="3">
    
    	<div style="font-size: 12px; display: block; padding:10px; border: solid 1px rgba(218,222,225,0.7); 
    	height: 400px; overflow: auto; font-family: nanum gothic !important; margin-bottom: 5px; width: 100;">
    
    	제1장 총칙<br>
    	제1조 (목적)<br>
		이 약관은 helper(이하 '회사'라 합니다.)가 제공하는 서비스의 이용조건 및 절차, 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
		제2조(약관의 효력 및 변경)<br>
		1. 이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생합니다.<br>
		2. 회사는 합리적인 사유가 발생될 경우에는 이 약관을 변경할 수 있으며, 약관이 변경되는 경우에는<br>
		최소한 7일전에 1항과 같은 방법으로 공시합니다.<br>
		3. 본 사이트 안에 새로운 서비스가 개설될 경우 별도의 명시된 설명이 없는 한 이 약관에 따라 제공됩니다.<br>
		제3조(약관 외 준칙)<br>
    	법관이 중대한 심신상의 장해로 직무를 수행할 수 없을 때에는 법률이 정하는 바에 의하여 퇴직하게 할 수 있다.<br> 
    	이 헌법시행 당시의 법령과 조약은 이 헌법에 위배되지 아니하는 한 그 효력을 지속한다.<br>
		대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다. 감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.<br> 
		모든 국민은 능력에 따라 균등하게 교육을 받을 권리를 가진다.<br>
		공공필요에 의한 재산권의 수용·사용 또는 제한 및 그에 대한 보상은 법률로써 하되, 정당한 보상을 지급하여야 한다.<br>
		 신체장애자 및 질병·노령 기타의 사유로 생활능력이 없는 국민은 법률이 정하는 바에 의하여 국가의 보호를 받는다.<br>
		훈장등의 영전은 이를 받은 자에게만 효력이 있고, 어떠한 특권도 이에 따르지 아니한다. 모든 국민은 양심의 자유를 가진다.<br> 
		저작자·발명가·과학기술자와 예술가의 권리는 법률로써 보호한다.<br>
		대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.<br> 
		모든 국민은 헌법과 법률이 정한 법관에 의하여 법률에 의한 재판을 받을 권리를 가진다.<br>
		국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, <br>
		경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.<br>
		근로조건의 기준은 인간의 존엄성을 보장하도록 법률로 정한다. <br>
		체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. <br>
		다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다.<br>
		누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다.<br> 
		법률이 헌법에 위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다.<br>
		헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 국회의 회의는 공개한다.<br> 
		다만, 출석의원 과반수의 찬성이 있거나 의장이 국가의 안전보장을 위하여 필요하다고 인정할 때에는 공개하지 아니할 수 있다.<br>
		국회는 국정을 감사하거나 특정한 국정사안에 대하여 조사할 수 있으며, 이에 필요한 서류의 제출 또는 증인의 출석과 증언이나 의견의 진술을 요구할 수 있다. <br>
		이 헌법공포 당시의 국회의원의 임기는 제1항에 의한 국회의 최초의 집회일 전일까지로 한다.<br> 
		대통령은 조약을 체결·비준하고, 외교사절을 신임·접수 또는 파견하며, 선전포고와 강화를 한다.<br>
		모든 국민은 언론·출판의 자유와 집회·결사의 자유를 가진다. <br>
		국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다.<br>
		대한민국의 영토는 한반도와 그 부속도서로 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. <br>
		지방자치단체는 주민의 복리에 관한 사무를 처리하고 재산을 관리하며, 법령의 범위안에서 자치에 관한 규정을 제정할 수 있다.<br>
		</div>
    
    </td>
  </tr>
  <tr>
    <td class="tg-xldj">
    	사용할 계좌번호
    </td>
    <td class="tg-h6ay" colspan="3">
    	<input class="text"  style="width : 500px" type="text" name="i" maxlength="100" placeholder="숫자만 입력해주세요"
    		onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
    </td>
  </tr>
  <tr>
    <td class="tg-xldj"></td>
    <td class="tg-h6ay">
    	<input class="btn alazea-btn mt-15" type="submit" value="신청">
    </td>
    <td class="tg-xldj">
    	<input class="btn alazea-btn mt-15" type="reset" value="취소" onclick="window.history.back();">
	</td>
    <td class="tg-h6ay"></td>
  </tr>
</table>
</form>


<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>