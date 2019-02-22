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

                                  	<fmt:parseDate value="${onedayclassOpendate}" var="openPlanDate" pattern="yyyy-MM-dd" />
									<fmt:parseNumber value="${openPlanDate}" var="openDate" />
									<fmt:parseDate value="${toDay}" var="nowPlanDate" pattern="yyyy-MM-dd" />
									<fmt:parseNumber value="${nowPlanDate}" var="nowDate" /> --%>
 									<fmt:parseNumber value="${onedayclassOpendate}" var="openDate" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber value="${toDay}" var="nowDate" pattern="yyyy-MM-dd"/>
									<script type="text/javascript">
									alert("숫자계산?" + ${openDate});
									</script>


<!-- <script type="text/javascript">
var curDate = new Date();

var curTime = curDate.getFullYear() + "-" + (curDate.getMonth() + 1) + "-" 
+ curDate.getDate() + " " + curDate.getHours() + ":" 
+ curDate.getMinutes() + ":" + curDate.getSeconds();

</script> -->



<fmt:formatDate value="${result.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/>

	<!-- date 타입을 timeStamp로 형 변환(begin, end) 오정에게 받은 버전 -->
      java.util.Date d = null;
      try {
         d = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(req.getParameter("begin").replace("T"," "));
      } catch (ParseException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      Timestamp ts = new Timestamp(d.getTime());
      vo.setBegin(ts);



		/*	vo.setProduct_date(new Timestamp(System.currentTimeMillis()));*/
		/*int pageNum = Integer.parseInt(req.getParameter("pageNum"));*/
		/*vo.setOnedayclassNumber(Integer.parseInt(req.getParameter("onedayclassNumber")));*/
		/*System.out.println("값나오나?2" + req.getParameter("onedayclassOpendate"));*/
		/*vo.setOnedayclassOpendate(new SimpleDateFormat("YYYY-MM-DD").parse("onedayclassOpendate"));*/
		
/*		String date = String.valueOf(req.getParameter("onedayclassOpendate"));
		System.out.println("데이트 : " + date);
		Date date2 = Date.valueOf(date);
		System.out.println("데이트 2 : " + date2);
		vo.setOnedayclassOpendate(date2);*/
			/*System.out.println("값나오나?" + Date.valueOf("onedayclassOpendate"));*/
		/*vo.setOnedayclassOpendate(Date.valueOf(req.getParameter("onedayclassOpendate")));*/
		// 메세지 보내기 값
		function sendMessage() {
			var messageSendId = $("#messageSendId").val();
			var messageContent1 = $("#messageContent1").val();
			var messageContent2 = $("#messageContent2").val();
			window.location = 'messageSend?messageSendId=' + messageSendId
					+ '&messageContent1=' + messageContent1+ '&messageContent2=' + messageContent2;
		}

		success: function(map) {
				var onedayclassTotalpeople = map.ONEDAYCLASSTOTALPEOPLE;
				var onedayclassRecruitment = map.ONEDAYCLASSRECRUITMENT;
				$("#totalpeople").html(onedayclassTotalpeople);
				$("#recruitment").html(onedayclassRecruitment);
		}
		
		setTimeout(function(){
	            sendRequest(); //this will send request again and again;
	        }, 4000);
	    }

// **날짜 변환 함수 작성
    function changeDate(date){
        date = new Date(parseInt(date));
        year = date.getFullYear();
        month = date.getMonth();
        day = date.getDate();
        hour = date.getHours();
        minute = date.getMinutes();
        second = date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }

 public void setKnowledgeRegdate(Timestamp knowledgeRegdate) {
         Date today = new Date();
       String date = new SimpleDateFormat("yyyy-MM-dd").format(today);
       String time = new SimpleDateFormat("HH:mm:ss").format(today);
       String test = new SimpleDateFormat("yyyy-MM-dd").format(knowledgeRegdate);
       String test2 = new SimpleDateFormat("HH:mm:ss").format(knowledgeRegdate);
         String to1 = time.substring(0,2);
         String to2 = time.substring(3,5);
         String to3 = time.substring(6);
         
         String te1 = test2.substring(0,2);
         String te2 = test2.substring(3,5);
         String te3 = test2.substring(6); 
         System.out.println(to1+" "+to2+" "+to3);
         System.out.println(te1+" "+te2+" "+te3);
      if(test.equals(date)) {
         if(to1.equals(te1)) {
            System.out.println("2");
            if(to2.equals(te2)) {
               int c = Integer.parseInt(to3);
               int d = Integer.parseInt(te3);
               int sub = c-d;
               test = "방금";
            } else {
               int c = Integer.parseInt(to2);
               int d = Integer.parseInt(te2);
               int sub = c-d;
               test = String.valueOf(sub)+" 분 전";
            }
         } else {
            int c = Integer.parseInt(to1);
            int d = Integer.parseInt(te1);
            int sub = c-d;
            test = String.valueOf(sub)+" 시간 전";
         }
      } else {
         test = new SimpleDateFormat("yyyy-MM-dd").format(knowledgeRegdate);
      }
       
      this.knowledgeRegdate = test;
   } 




<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>