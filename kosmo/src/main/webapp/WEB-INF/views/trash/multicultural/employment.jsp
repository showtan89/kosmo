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
<title>Helper - employment</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
<style>
.realImage {
	max-width: 200px;
	min-height: 150px;
}


/* 야후후후후후후후후후후후후후후훟 */


/* 야후후후후후후후후후후후후후후후후 */


</style>
</head>

<!-- 프리로더 이미지 -->
<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<jsp:include page="../../setting/header01.jsp" flush="false" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="realimage" value="resources/img/board/realestate/" />

<!-- 메뉴바 아래 이미지 -->
<div class="breadcrumb-area">
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/min/foreignworker.jpg);">
		<h2>EMPLOYMENT</h2>
	</div>
	<br> <br>
</div>

<div class="container" style="margin-bottom: 50px;">
	<div class="row">
		<div class="col-12">
			<div
				class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
				<div class="shop-page-count">
					<c:if test="${pVO.totalCount>0}">
						<p>Showing ${pVO.startNumber}–${pVO.endNumber} of
							${pVO.totalCount} results</p>
					</c:if>
					<c:if test="${pVO.totalCount==0}">
						<p>0 results</p>
					</c:if>
				</div>
				<!-- Search by Terms -->
				<div class="search_by_terms"></div>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- 사이드바 -->
		<div class="col-12 col-md-3 col-lg-2">
			<div class="shop-sidebar-area">
				<div class="shop-widget catagory mb-50" align="left">
					<h4 class="widget-title">Categories</h4>
					<h6 class="widget-title"><a id="knowledgeCategoryAll" href="employment">Employment</a></h6>
						<h6 class="widget-title"><a id="Education" href="newsBoard">News</a></h6>
						<h6 class="widget-title"><a id="employeInfo" href="employeInfo">employeInfo</a></h6>
						<h6 class="widget-title"><a id="Game" href="knowledgeBoardList?knowledgeCategory=Game">Game</a></h6>
				</div>
			</div>
		</div>
	<div class="col-12 col-md-9 col-lg-10">
		<!-- 목록 부분 -->
		<div class="sub_content"> 
		<section> 
		<h1 class="h1_sub_title">Employment and Vocational Training</h1>
		
		<div class="recruit_box"> 
		<section> 
		<h2 class="h2_sub_title">Employment</h2> 
		
		<div class="h2_sub_text_box"> 
		<p> Employment opportunities for foreign residents vary according 
		to type of visa. Marriage immigrants who have entered Korea 
		under an F-13 or F-21 visa are allowed to seek employment 
		in Korea. </p> <p class="bul_singl_important"> 
		To check your visa status, please contact Hi Korea (
		<a href="http://www.hikorea.go.kr " target="_blank" 
		title="" class="link_blank">www.hikorea.go.kr</a>
		, 1345).<br> Your first step before seeking employment should 
		be to discuss the need for employment, type of work desired and 
		usage of salary with your immediate family members. </p> </div> 
		
		<div class="h3_sub_box"> <section> <h3 class="h3_sub_title">
		Job Centers</h3> <div class="h3_sub_box"> 
		<p> You can obtain information on employment for foreigners 
		(marriage immigrants, etc.) by visiting your local Employment 
		Center, Women Resources Development Center, Foreign Workforce 
		Support Center, or Support Center for Mulitcultural Families. 
		</p> </div> 
		
		<dl class="bul_sudo_rtg_type3"> 
		<dt>Employment Center</dt> 
		<dd> These centers (83 branches nationwide as of August 2013) 
		are representative job placement institutes run free of charge 
		by the State. Korean and foreign jobseekers can inquire at 
		job centers to learn about job openings at companies of interest 
		or to receive career counseling. Company interviews are also 
		held through the center until the jobseeker finds a job. </dd> </dl> 
		
		<dl class="bul_sudo_rtg_type3"> <dt>Job Information Center</dt> 
		<dd> These local agencies provide free information on job 
		opportunities. Job information centers are located at most 
		city halls and county offices. The centers will help you find 
		a job close to your residence. </dd> </dl> 
		
		<dl class="bul_sudo_rtg_type3"> 
		<dt>Women Resources Development Center</dt> 
		<dd> These comprehensive job placement support institutes for 
		women focus mainly on job placement and training. Most of the 
		programs are provided free of charge, but some may require a 
		small fee. </dd> </dl> <dl class="bul_sudo_rtg_type3"> 
		<dt>Foreign Workforce Support Center</dt> <dd> These 
		non-governmental organizations assist foreign workers in dealing 
		with employment issues in Korea. </dd> </dl> 
		
		<dl class="bul_sudo_rtg_type3"> 
		<dt>Multicultural Family Support Center</dt> 
		<dd> These centers offer job opportunities and cultural programs 
		for multicultural families. </dd> </dl> </section> </div> 
		
		<div class="h3_sub_box"> 
		<section>
		 <h3 class="h3_sub_title">Use of the Internet</h3> 
		 <div class="h3_sub_text_box"> <p> Marriage immigrants can use 
		 the Internet to aid in their search for employment. 
		 Most organizations operating employment services for marriage 
		 immigrants manage websites, so users can search for jobs from 
		 home via the Internet. </p> </div> 
		 
		 <dl class="bul_sudo_rtg_type3"> <dt>Seoul Global Center</dt> 
		 <dd> <p>This website is operated by the City of Seoul and 
		 provides information related to fairs and job seeking, and 
		 employment support to foreigners in Korea, in English and 
		 Chinese.</p> 
		 <p><a href="http://global.seoul.go.kr" target="_blank" title="" class="link_blank">
		 http://global.seoul.go.kr</a></p> </dd> </dl> 
		 
		 <dl class="bul_sudo_rtg_type3"> 
		 <dt>WorkNet</dt> <dd> 
		 <p>This employment portal site is run by the Ministry of Employment 
		 and Labor via the Korea Employment Information Service. It provides 
		 job postings, occupational and career information while allowing job 
		 seekers to apply to companies of their interest directly on the website. 
		 Other services provided on the website include the 'Employment 
		 Preparation for Immigrants,' a free occupational psychology test that 
		 assesses job seeking immigrants' potential for getting a job.</p> 
		 <p> <a href="http://www.work.go.kr" target="_blank" title="" class="link_blank">
		 http://www.work.go.kr</a> </p> </dd> </dl> 
		 
		 <dl class="bul_sudo_rtg_type3"> 
		 <dt>Korea Network for Occupations and Workers</dt> 
		 <dd> <p>Run by the Ministry of Employment and Labor via the 
		 Korea Employment Information Service, it is an 
		 occupational/career information website where you can get 
		 occupational, career, and university/college major information. 
		 The website offers cyber counseling services for job seekers 
		 to find the best suitable jobs.</p>
		 <p> <a href="http://know.work.go.kr" target="_blank" title="" class="link_blank">
		 http://know.work.go.kr</a> </p> </dd> </dl> 
		 
		 <dl class="bul_sudo_rtg_type3"> 
		 <dt>Employment &amp; Welfare Plus Center </dt> 
		 <dd> <p>With a nationwide network the website offers integrated 
		 services for job openings, welfare, and micro finances. Job seekers 
		 can get such services and related information until they find jobs. 
		 You can directly access the homepage of the closest employment &amp; 
		 welfare plus center to your residence via the center’s main website. 
		 The employment &amp; welfare plus center runs various career guidance 
		 programs such as short-term group counseling programs, special lectures 
		 on employment, and a 'career guidance program for married immigrant women (WIND)' 
		 to encourage their employment, improve their job skill set, 
		 and provide welfare and financial services.</p> 
		 <p> <a href="http://www.workplus.go.kr" target="_blank" title="" class="link_blank">
		 http://www.workplus.go.kr</a> </p> </dd> </dl> 
		 
		 <dl class="bul_sudo_rtg_type3"> 
		 <dt>Women’s Resource Development Center </dt> <dd> 
		 <p>This center provides various job training programs, vocational 
		 training, and counseling for working women, and serves as a 
		 comprehensive job placement support institution for women.</p> 
		 <p> <a href="http://www.vocation.or.kr" target="_blank" title="" class="link_blank">
		 http://www.vocation.or.kr</a> </p> </dd> </dl> 
		 
		 <dl class="bul_sudo_rtg_type3"> 
		 <dt>Job Information Centers of Cities and Guns Local governments</dt> 
		 <dd> <p>This center operates free job brokerage organizations. Please 
		 refer to the websites of local governments for more information.</p> </dd> </dl> </section> 
		 </div> </section> </div> 
		 
		 <div class="recruit_box"> 
		 <section> 
		 <h2 class="h2_sub_title">Vocational Training</h2> 
		 <div class="h2_sub_text_box"> 
		 <p> Vocational training is a system that helps people who hope 
		 to open a business or work at a company to acquire technologies 
		 and skills. Foreigners can apply if they have a history of 
		 insured qualification, but married immigrants can receive 
		 support without this history. </p> </div> 
		 <ul class="bul_sudo_rtg_type1"> 
		 <li> Employment Center (<a href="http://www.work.go.kr/jobcenter" target="_blank" title="" class="link_blank">
		 www.work.go.kr/jobcenter</a>) </li> 
		 <li> The Ministry of Employment and Labor Counseling Center (☎1350 without area code) </li> 
		 <li> Career capability development information network of the Ministry of Employment and Labor (
		 <a href="http://www.hrd.go.kr" target="_blank" title="" class="link_blank">www.hrd.go.kr</a>) </li> </ul> 
		 
		 <div class="h3_sub_box"> 
		 <section> <h2 class="h3_sub_title">Nae-il-bae-um Card System</h2>
		 <div class="h3_sub_text_box"> <p> The system helps students to 
		 receive proper training by issuing them with a career capability 
		 development account (Nae-il-bae-um Card) to support training 
		 for the unemployed who need it. </p> </div> </section> </div> 
		 
		 <div class="h3_sub_box"> 
		 <section> <h2 class="h3_sub_title">Eligibility for support</h2> 
		 <div class="h3_sub_text_box"> <p>The unemployed over the age of 
		 15 who has applied for a job at employment center, etc., 
		 marriage immigrants and immigrated youth over the age of 15 in 
		 their family, small business owners (provided the business 
		 period has been more than one year, and the annual sales amount 
		 is less than KRW 150 million), high school seniors not going to 
		 college, and university/college graduate candidates, etc.</p> </div> </section> </div> 
		 
		 <div class="h3_sub_box"> <section> 
		 <h2 class="h3_sub_title">Description</h2> 
		 <div class="h3_sub_text_box"> <ul class="bul_sudo_rtg_type4"> 
		 <li> Maximum support: Supports 20%~95% of the actual training costs up 
		 to a maximum of KRW 2 million per person (Trainee pays the remainder 
		 directly.) <ul class="bul_sudo_line_tyoe1"> <li>Participants of type 2 
		 in the employment success package receive 50%~95% of the actual training 
		 costs whereas type 1 participants receive the whole amount of training or 
		 90% of the amount up to a maximum of KRW 3 million.</li> 
		 <li>The entire training costs are refunded to those who paid for it 
		 themselves and maintained their career for more than 6 months by working
		  or starting business in the same job position within 6 months of the 
		  date of training completion (the early employed, and graduates).</li> 
		  <li>When a student attends 80% of the training days (per month), 
		  up to an additional KRW 116,000 is paid monthly.</li> </ul> </li> 
		  <li> Expiration date: 1 year from account issuance date 
		  
		  <ul class="bul_sudo_line_tyoe1"> 
		  <li>If the applicant does not participate in training within 6 months 
		  from opening the account, the account will be suspended and the 
		  remaining amount is forfeited. (The account may be reopened after 
		  applying for jobs.) If re-applying for the account, the previous support
		   limit will be reduced by 50%.</li> </ul> </li> </ul> </div> </section> 
		   </div> 
		   
		   <div class="h3_sub_box"> 
		   <section> <h2 class="h3_sub_title">Supported training courses</h2> 
		   <div class="h3_sub_text_box"> <ul class="bul_sudo_rtg_type4"> 
		   <li> Account-qualified training courses recognized and announced by the 
		   Ministry of Employment and Labor 
		   <ul class="bul_sudo_line_tyoe1"> 
		   <li> Courses are recognized and announced as account-qualified training
		    courses by the Minister of Employment and Labor through review during 
		    training course applied by the training institution. Search on the 
		    job training portal HRD-Net (
		    <a href="http://www.hrd.go.kr" target="_blank" title="" class="link_blank">
		    http://www.hrd.go.kr</a>) to attend training courses selected and negotiated 
		    by trainees and counselors of the employment center. </li> </ul> </li> </ul> </div> </section> </div> 
		    <div class="h3_sub_box"> <section> <h2 class="h3_sub_title">Application 
		    procedure</h2> 
		    
		    <div class="step_list_box_wrap"> 
		    <ol class="step_list_box_list"> <li> <dl> 
		    <dt>1. Training Counseling</dt> <dd> 
		    <p> Job application and application for account / In-depth 
		    counseling (Center ↔ the unemployed) </p> </dd> </dl> </li> 
		    
		    <li> <dl> <dt>2. Opening the account</dt> <dd> 
		    <p>Review on necessity of training, and importance / 
		    Select opening of the account and training position
		    (Center → the unemployed)</p> </dd> </dl> </li> 
		    <li> <dl> <dt>3. Attend courses</dt> 
		    <dd> <p> Register training courses / Attend training courses
		    (The unemployed ↔ training agency) </p> </dd> </dl> </li> 
		    
		    <li> <dl> <dt>4. Support costs</dt> 
		    <dd> <p>Apply for training fee per month / Training fee and training 
		    support subsidy are calculated and paid after checking attendance 
		    days(Hiring center)</p> </dd> </dl> </li> </ol> </div> </section> </div> 
		    
		    <div class="h3_sub_box"> <section> 
		    <h2 class="h3_sub_title">Other Job Training Services</h2> 
		    <div class="h3_sub_text_box"> <ul class="bul_sudo_rtg_type4"> 
		    <li>For married immigrant women, in addition to Nae-il-bae-um
		     card system training conducted through employment insurance, 
		     other free or paid vocational training programs are 
		     available at Women Resources Development Center (
		     <a href="http://www.vocation.or.kr" target="_blank" title="" class="link_blank">
		     www.vocation.or.kr</a>), Women’s Community Center, etc.</li> 
		     
		     <li>Not all agencies offer job training services for married 
		     immigrant women and female foreigners; consult your nearest center 
		     before visiting.</li> 
		     <li>Further details are available at multicultural family support 
		     centers and related organizations.</li> </ul> </div> </section> 
		     </div> </section> 
		     </div> </section> <!-- sub_content_footer --> 
		     
		     <div class="sub_content_footer"> <p class="bul_subfooter">
		     Please note that information contained within this publication is 
		     current as of April 2018; information is subject to change without 
		     notice.</p> </div> <!-- //sub_content_footer --> <!-- ButtonGroup --> 
		     
		     <div class="btn_grp_right_type1">
		     <a href="javascript:fnSnsShare(1);" class="btn_sns">SNS</a></div>
		     <!--// ButtonGroup --></div>
		</div>
	</div>
</div>


<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/realestate.js"></script>
</body>
</html>