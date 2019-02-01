<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Helper - Realestate</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
<style>
.realImage {
	max-width: 200px;
	min-height: 150px;
}
</style>
</head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<!-- 글 등록 후 처리 - 모달로 바꿀 것 -->
<c:if test="${param.insertResult>0}">
<script type="text/javascript">
	alert('Posting successfully.');
</script>
</c:if>
<c:if test="${param.insertResult==0}">
<script type="text/javascript">
	alert('Posting failed.');
</script>
</c:if>
<c:if test="${param.deleteResult>0}">
<script type="text/javascript">
	alert('Deleted successfully.');
</script>
</c:if>
<c:if test="${param.deleteResult==0}">
<script type="text/javascript">
	alert('Delete failed.');
</script>
</c:if>

<!-- 메뉴바 아래 이미지 -->
<div class="breadcrumb-area">
	<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${realimage}realestatemenu.jpg);">
		<h2>REALESTATE</h2>
	</div><br><br>
</div>

<!-- 부동산 게시판 본문  -->
<div class="container" style="margin-bottom: 50px;">
	<div class="row">
		<div class="col-12">
			<div
				class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
				<div class="shop-page-count">
					<c:if test="${pVO.totalCount>0}">
						<p>Showing ${pVO.startNumber}–${pVO.endNumber} of ${pVO.totalCount} results</p>
					</c:if>
					<c:if test="${pVO.totalCount==0}">
						<p>0 results</p>
					</c:if>
				</div>
				<!-- Search by Terms -->
				<div class="search_by_terms">
					<!-- 데이터 생성용 버튼 - 주석 처리 -->
					<!-- <a href="realestateDummyMaker"><button type="button" class='btn alazea-btn'>DUMMY</button></a> -->
					<a href="realestateWriteForm"><button type="button" class='btn alazea-btn'>Write</button></a>
				
					<!-- 필터 기능 일단 주석 -->
					<!-- <form action="#" method="post" class="form-inline">
                               <select class="custom-select widget-title">
                                 <option selected>Short by Popularity</option>
                                 <option value="1">Short by Newest</option>
                                 <option value="2">Short by Sales</option>
                                 <option value="3">Short by Ratings</option>
                               </select>
                              <select class="custom-select widget-title">
                                 <option selected>Show: 9</option>
                                 <option value="1">12</option>
                                 <option value="2">18</option>
                                 <option value="3">24</option>
                               </select>
                           </form> -->
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- 사이드바 -->
		<div class="col-12 col-md-4 col-lg-3">
			<div class="shop-sidebar-area">
				<form action="realestateBoardList" method="get" onsubmit="return realestateListSearch()">
					
					<!-- Shop Widget -->
					<div class="shop-widget price mb-50">
						<h4 class="widget-title">Prices</h4>
						<div class="input-group">
							<input class="form-control" name="realestatePrice" id="realestatePrice" placeholder="Minimum Price">&nbsp;~&nbsp;
							<input class="form-control" name="realestatePriceEnd" id="realestatePriceEnd" placeholder="Maximum Price">
						</div>
					</div>
					
					<div class="shop-widget catagory mb-50">
						<h4 class="widget-title">CheckList</h4>
						<div class="widget-desc">
							<div class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"	id="realestateOptionCheck" name="realestateOptionCheck"> 
								<label class="custom-control-label" for="realestateOptionCheck">Fully Furnished</label>
							</div>
							<div class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"	id="realestateTobaccoCheck" name="realestateTobaccoCheck"> 
								<label class="custom-control-label" for="realestateTobaccoCheck">Smoking Allowed</label>
							</div>
							<div class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"	id="realestatePetCheck" name="realestatePetCheck"> 
								<label class="custom-control-label" for="realestatePetCheck">Pets Allowed</label>
							</div>
								
							<div class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"	id="realestateBalcony" name="realestateBalcony"> 
								<label class="custom-control-label" for="realestateBalcony">Has Balcony</label>
							</div>
							<div class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"	id="realestateCar" name="realestateCar"> 
								<label class="custom-control-label" for="realestateCar">Has Parking lot</label>
							</div>
							<div class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<input type="checkbox" class="custom-control-input"	id="realestateTemp1" name="realestateTemp1"> 
								<label class="custom-control-label" for="realestateTemp1">Has Elevator</label>
							</div>
						</div>
					</div>

					<!-- Shop Widget -->
					<div class="shop-widget sort-by mb-50">
						<h4 class="widget-title">SELECTLIST</h4>
						<div class="widget-desc child_no_padding">
							<div class="custom-control custom-checkbox d-flex align-items-center mb-2">
								<select	class="custom-select d-block w-100" id="realestateCategory1" name='realestateCategory1'>
									<option style="display:none;" selected>Province</option>
									<option value="seoul">Seoul (서울)</option>
									<option value="busan">Busan (부산)</option>
									<option value="incheon">Incheon (인천)</option>
									<option value="gwangju">Gwangju (광주)</option>
									<option value="daejeon">Daejeon (대전)</option>
									<option value="sejong">Sejong (세종)</option>
									<option value="daegu">Daegu (대구)</option>
									<option value="ulsan">Ulsan (울산)</option>
									<option value="gyeonggi">Gyeonggi-do (경기도)</option>
									<option value="gangwon">Gangwon-do (강원도)</option>
									<option value="chungcheongbuk">Chungcheongbuk-do (충청북도)</option>
									<option value="chungcheongnam">Chungcheongnam-do (충청남도)</option>
									<option value="gyeongsangbuk">Gyeongsangbuk-do (경상북도)</option>
									<option value="gyeongsangnam">Gyeongsangnam-do (경상남도)</option>
									<option value="jeollabuk">Jeollabuk-do (전라북도)</option>
									<option value="jeollanam">Jeollanam-do (전라남도)</option>
									<option value="jeju">Jeju-do (제주도)</option>
								</select>
							</div>
							
							<div class="custom-control d-flex align-items-center mb-2">
								<select	class="custom-select d-block w-100" id="realestateGender" name='realestateGender'>
									<option style="display:none;" selected>Gender</option>
									<option value="both">Both Gender</option>
									<option value="male">Male Only</option>
									<option value="female">Female Only</option>
								</select>
							</div>
							
							<div class="custom-control d-flex align-items-center mb-2">
								<select	class="custom-select d-block w-100" id="realestateType" name='realestateType'>
									<option style="display:none;" selected>Type of Place</option>
									<option value="apart">Apartment</option>
									<option value="villa">Villa</option>
									<option value="house">House</option>
									<option value="studio">Studio</option>
									<option value="office">Office</option>
								</select>
							</div>

							<div class="custom-control d-flex align-items-center mb-2">
								<select	class="custom-select d-block w-100" id="realestateTerm" name='realestateTerm'>
									<option style="display:none;" selected>Minimum Rental Period</option>
									<option value="none">None</option>
									<option value="2w">2 weeks</option>
									<option value="1m">1 month</option>
									<option value="3m">3 months</option>
									<option value="6m">6 months</option>
									<option value="12m">1 year</option>
									<option value="over12m">More than 1 year</option>
									<option value="undetemined">Undetermined</option>
								</select>
							</div>

							<div class="custom-control d-flex align-items-center mb-2">
								<select	class="custom-select d-block w-100" id="realestateHeatingtype" name='realestateHeatingtype'>
									<option style="display:none;" selected>Heating Type</option>
									<option value="individual">Individual heating</option>
									<option value="central">Central heating</option>
									<option value="district">District heating</option>
								</select>
							</div>

							<div class="custom-control d-flex align-items-center mb-2">
								<select	class="custom-select d-block w-100" id="realestateSize" name='realestateSize'>
									<option style="display:none;" selected>Size of Place</option>
									<option value="under33">~33㎡</option>
									<option value="33to66">33~66㎡</option>
									<option value="66to99">66~99㎡</option>
									<option value="99to132">99~132㎡</option>
									<option value="132to165">132~165㎡</option>
									<option value="165to198">165~198㎡</option>
									<option value="198to231">198~231㎡</option>
									<option value="more231">231㎡~</option>
								</select>
							</div>
						</div>
						<hr>
						<!-- 검색 버튼 -->
						<input type="submit" class='btn alazea-btn' value="Search"></input>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 목록 부분 -->
		<div class="col-12 col-md-8 col-lg-9">
			<div class="shop-products-area">
				<div class="row">
					<c:if test="${pVO.totalCount==0}">
						<div class="col-12">
							<h3>No results found.</h3>
						</div>
					</c:if>
					<c:if test="${pVO.totalCount>0}">
					<c:forEach var="dto" items="${list}">
						<div class="col-12">
							<div class="card flex-md-row mb-4 shadow-sm h-md-250">
								<a href=realestateDetailForm?realestateNumber=${dto.realestateNumber}><img class="card-img-right flex-auto d-none d-lg-block realImage"	src="${realimage}${dto.realestateImg1}" alt=""></a>
								<div class="card-body d-flex flex-column align-items-start">
									<strong class="d-inline-block mb-2 text-warning">
									<c:set var="loca" value="${dto.realestateCategory1}"/>
									<c:choose>
										<c:when test="${loca.equals('seoul')}">
											Seoul (서울)
										</c:when>
										<c:when test="${loca.equals('busan')}">
											Busan (부산)
										</c:when>
										<c:when test="${loca.equals('incheon')}">
											Incheon (인천)
										</c:when>
										<c:when test="${loca.equals('gwangju')}">
											Gwangju (광주)
										</c:when>
										<c:when test="${loca.equals('daejeon')}">
											Daejeon (대전)
										</c:when>
										<c:when test="${loca.equals('sejong')}">
											Sejong (세종)
										</c:when>
										<c:when test="${loca.equals('daegu')}">
											Daegu (대구)
										</c:when>
										<c:when test="${loca.equals('ulsan')}">
											Ulsan (울산)
										</c:when>
										<c:when test="${loca.equals('gyeonggi')}">
											Gyeonggi-do (경기도)
										</c:when>
										<c:when test="${loca.equals('gangwon')}">
											Gangwon-do (강원도)
										</c:when>
										<c:when test="${loca.equals('chungcheongbuk')}">
											Chungcheongbuk-do (충청북도)
										</c:when>
										<c:when test="${loca.equals('chungcheongnam')}">
											Chungcheongnam-do (충청남도)
										</c:when>
										<c:when test="${loca.equals('gyeongsangbuk')}">
											Gyeongsangbuk-do (경상북도)
										</c:when>
										<c:when test="${loca.equals('gyeongsangnam')}">
											Gyeongsangnam-do (경상남도)
										</c:when>
										<c:when test="${loca.equals('jeollabuk')}">
											Jeollabuk-do (전라북도)
										</c:when>
										<c:when test="${loca.equals('jeollanam')}">
											Jeollanam-do (전라남도)
										</c:when>
										<c:when test="${loca.	equals('jeju')}">
											Jeju-do (제주도)
										</c:when>
									</c:choose>
									</strong>
									<a href=realestateDetailForm?realestateNumber=${dto.realestateNumber}><strong class="d-inline-block mb-2 text-success">${dto.realestateSubject}</strong></a>
									<%-- <span class="card-text mb-auto">${dto.realestateContent}</span> --%>
									<div class='iconsArea'>
										<!-- 풀옵션 --><!-- 아이콘 못찾겠다 꾀꼬리  -->
										<c:if test="${dto.realestateOptionCheck.equals('on')}">
										
										</c:if>
										<!-- 흡연 -->
										<c:if test="${dto.realestateTobaccoCheck.equals('on')}">
											<i class="fa fa-cloud">&nbsp </i>
										</c:if>
										<!-- 발코니 --><!-- 아이콘 못찾겠다 꾀꼬리  -->
										<c:if test="${dto.realestateBalcony.equals('on')}">
										
										</c:if>
										<!-- 애완동물 -->
										<c:if test="${dto.realestatePetCheck.equals('on')}">
											 <i class="fa fa-paw">&nbsp </i> 
										</c:if>
										<!-- 엘리베이터 -->
										<c:if test="${dto.realestateTemp1.equals('on')}">
											<i class="fa fa-square">&nbsp </i>
										</c:if>
										<!-- 주차가능 -->
										<c:if test="${dto.realestateCar.equals('on')}">
											<i class="fa fa-car">&nbsp </i> 
										</c:if>
										<!-- 성별 -->
										<c:if test="${dto.realestateGender.equals('female')}">
											<i class="fa fa-female">&nbsp </i>
										</c:if>
										<c:if test="${dto.realestateGender.equals('male')}">
											<i class="fa fa-male">&nbsp </i>
										</c:if>
										<c:if test="${dto.realestateGender.equals('both')}">
											<i class="fa fa-transgender">&nbsp </i>
										</c:if>
										<!-- 방 수 -->
										<i class="fa fa-bed">
										<c:set var="room" value="${dto.realestateRoom}"/>
										<c:choose>
											<c:when test="${room.equals('over3')}">
											3↑&nbsp 
											</c:when>
											<c:when test="${!room.equals('over3')}">
											${dto.realestateRoom}&nbsp 
											</c:when>
										</c:choose>
										</i> 
										<!-- 화장실 수 -->
										<i class="fa fa-bath">
										<c:set var="bath" value="${dto.realestateToilet}"/>
										<c:choose>
											<c:when test="${bath.equals('over3')}">
											3↑&nbsp 
											</c:when>
											<c:when test="${!bath.equals('over3')}">
											${dto.realestateToilet}&nbsp 
											</c:when>
										</c:choose>
										</i>
										<!-- 금액 --> 
										<span class='text-success'>
										<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
										<fmt:setLocale value = "ko_KR"/>
       									<fmt:formatNumber value = "${dto.realestatePrice}" type = "currency"/>			
										</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					</c:if>
				</div>
				
				<!-- 넘어온 검색 조건을 다시 적용  -->
				<c:if test="${param.realestatePrice!=null}">
					<script>$("#realestatePrice").val('${param.realestatePrice}');</script>
				</c:if>
				<c:if test="${param.realestatePriceEnd!=null}">
					<script>$("#realestatePriceEnd").val('${param.realestatePriceEnd}');</script>
				</c:if>
				<c:if test="${param.realestateOptionCheck!=null}">
					<script>$("#realestateOptionCheck").val('${param.realestateOptionCheck}').prop("checked", true);</script>
				</c:if>
				<c:if test="${param.realestateTobaccoCheck!=null}">
					<script>$("#realestateTobaccoCheck").val('${param.realestateTobaccoCheck}').prop("checked", true);</script>
				</c:if>
				<c:if test="${param.realestatePetCheck!=null}">
					<script>$("#realestatePetCheck").val('${param.realestatePetCheck}').prop("checked", true);</script>
				</c:if>
				<c:if test="${param.realestateBalcony!=null}">
					<script>$("#realestateBalcony").val('${param.realestateBalcony}').prop("checked", true);</script>
				</c:if>
				<c:if test="${param.realestateCar!=null}">
					<script>$("#realestateCar").val('${param.realestateCar}').prop("checked", true);</script>
				</c:if>
				<c:if test="${param.realestateTemp1!=null}">
					<script>$("#realestateTemp1").val('${param.realestateTemp1}').prop("checked", true);</script>
				</c:if>
				<c:if test="${param.realestateCategory1!=null}">
					<script>$("#realestateCategory1").val('${param.realestateCategory1}').prop("selected", true);</script>
				</c:if>
				<c:if test="${param.realestateGender!=null}">
					<script>$("#realestateGender").val('${param.realestateGender}').prop("selected", true);</script>
				</c:if>
				<c:if test="${param.realestateType!=null}">
					<script>$("#realestateType").val('${param.realestateType}').prop("selected", true);</script>
				</c:if>
				<c:if test="${param.realestateTerm!=null}">
					<script>$("#realestateTerm").val('${param.realestateTerm}').prop("selected", true);</script>
				</c:if>
				<c:if test="${param.realestateHeatingtype!=null}">
					<script>$("#realestateHeatingtype").val('${param.realestateHeatingtype}').prop("selected", true);</script>
				</c:if>
				<c:if test="${param.realestateSize!=null}">
					<script>$("#realestateSize").val('${param.realestateSize}').prop("selected", true);</script>
				</c:if>
				
				<!-- 페이지 -->
				<c:set var="basicURL" value="realestateBoardList"/>
				<c:set var="linkURL" value="${linkUrl}"/>
				<nav aria-label="Page navigation">
					<ul class="pagination">
					<c:if test="${pVO.totalCount>0}">
						<c:if test="${pVO.startPage>pVO.pageBlock}">
							<li class="page-item"><a class="page-link" href="${basicURL}"><i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
							<li class="page-item"><a class="page-link" href="${basicURL}?pageNum=${(pVO.startPage-pVO.pageBlock)+(pVO.pageBlock-1)}${linkURL}"><i class="fa fa-angle-left"></i></a></li>
						</c:if>
	
						<c:forEach var="i" begin="${pVO.startPage}" end="${pVO.endPage}">
							<c:if test="${i==pVO.currentPage}">
								<li class="page-item"><a class="page-link" style="background-color: #28a745 !important; color:white !important">${i}</a></li>
							</c:if>
							<c:if test="${i!=pVO.currentPage}">
								<li class="page-item"><a class="page-link" href="${basicURL}?pageNum=${i}${linkURL}">${i}</a></li>
							</c:if>
						</c:forEach>
	
						<c:if test="${pVO.pageCount > pVO.endPage }">
							<li class="page-item"><a class="page-link" href="${basicURL}?pageNum=${(pVO.startPage + pVO.pageBlock)}${linkURL}"><i class="fa fa-angle-right"></i></a></li>
							<li class="page-item"><a class="page-link" href="${basicURL}?pageNum=${pVO.pageCount}${linkURL}"><i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>
						</c:if>
					</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>

	
				
<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/realestate.js"></script>
</body>
</html>