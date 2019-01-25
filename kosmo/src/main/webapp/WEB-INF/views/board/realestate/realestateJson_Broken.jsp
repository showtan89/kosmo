<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="realimage" value="resources/img/board/realestate/" />
<div class="row">

	<c:forEach var="dto" items="${list}">
		<div class="col-12">
			<div class="card flex-md-row mb-4 shadow-sm h-md-250">
				<a href=realestateView?realestateNumber=${dto.realestateNumber}><img
					class="card-img-right flex-auto d-none d-lg-block realImage"
					src="${realimage}${dto.realestateImg1}" alt=""></a>
				<div class="card-body d-flex flex-column align-items-start">
					<strong class="d-inline-block mb-2 text-warning"> <c:set
							var="loca" value="${dto.realestateCategory1}" /> <c:choose>
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
							<c:when test="${loca.equals('jeju')}">
											Jeju-do (제주도)
										</c:when>
						</c:choose>
					</strong> <strong class="d-inline-block mb-2 text-success">${dto.realestateSubject}</strong>
					<%-- <span class="card-text mb-auto">${dto.realestateContent}</span> --%>
					<div class='iconsArea'>
						<!-- 풀옵션 -->
						<!-- 아이콘 못찾겠다 꾀꼬리  -->
						<c:if test="${dto.realestateOptionCheck.equals('on')}">

						</c:if>
						<!-- 흡연 -->
						<c:if test="${dto.realestateTobaccoCheck.equals('on')}">
							<i class="fa fa-cloud">&nbsp </i>
						</c:if>
						<!-- 발코니 -->
						<!-- 아이콘 못찾겠다 꾀꼬리  -->
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
						<i class="fa fa-bed"> <c:set var="room"
								value="${dto.realestateRoom}" /> <c:choose>
								<c:when test="${room.equals('over3')}">
											3↑&nbsp 
											</c:when>
								<c:when test="${!room.equals('over3')}">
											${dto.realestateRoom}&nbsp 
											</c:when>
							</c:choose>
						</i>
						<!-- 화장실 수 -->
						<i class="fa fa-bath"> <c:set var="bath"
								value="${dto.realestateToilet}" /> <c:choose>
								<c:when test="${bath.equals('over3')}">
											3↑&nbsp 
											</c:when>
								<c:when test="${!bath.equals('over3')}">
											${dto.realestateToilet}&nbsp 
											</c:when>
							</c:choose>
						</i>
						<!-- 금액 -->
						<span class='text-success'> <%@ taglib prefix="fmt"
								uri="http://java.sun.com/jsp/jstl/fmt"%>
							<fmt:setLocale value="ko_KR" /> <fmt:formatNumber
								value="${dto.realestatePrice}" type="currency" />
						</span>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<!-- 페이지 -->
<%-- <c:set var="linkURL" value="${requestScope['javax.servlet.forward.servlet_path']}"/> --%>
<%-- <c:set var="URL1" value="${pageContext.request.requestURL}" />
				<c:set var="URL2" value="${pageContext.request.requestURI}" /> --%>
<c:set var="linkURL" value="realestate" />
<nav aria-label="Page navigation">
	<ul class="pagination">
		<c:if test="${pVO.totalCount>0}">
			<c:if test="${pVO.startPage>pVO.pageBlock}">
				<li class="page-item"><a class="page-link" href="${linkURL}"><i
						class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
				<li class="page-item"><a class="page-link"
					href="${linkURL}?pageNum=${(pVO.startPage-pVO.pageBlock)+(pVO.pageBlock-1)}"><i
						class="fa fa-angle-left"></i></a></li>
			</c:if>

			<c:forEach var="i" begin="${pVO.startPage}" end="${pVO.endPage}">
				<c:if test="${i==pVO.currentPage}">
					<li class="page-item"><a class="page-link"
						style="background-color: #28a745 !important; color: white !important">${i}</a></li>
				</c:if>
				<c:if test="${i!=pVO.currentPage}">
					<li class="page-item"><a class="page-link"
						href="${linkURL}?pageNum=${i}">${i}</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${pVO.pageCount > pVO.endPage }">
				<li class="page-item"><a class="page-link"
					href="${linkURL}?pageNum=${(pVO.startPage + pVO.pageBlock)}"><i
						class="fa fa-angle-right"></i></a></li>
				<li class="page-item"><a class="page-link"
					href="${linkURL}?pageNum=${pVO.pageCount}"><i
						class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>
			</c:if>
		</c:if>
	</ul>
</nav>