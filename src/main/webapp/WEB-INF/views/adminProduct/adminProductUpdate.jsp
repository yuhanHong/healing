<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">

<title>힐링투어에 오신 것을 환영합니다!</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/adminProduct/adminProduct.css"/>

<link rel="Shortcut Icon" href="${root}/resources/icons/H.ico" />

<script type="text/javascript" src="${root}/js/adminProduct/adminProduct.js"></script>
<script type="text/javascript" src="${root}/js/adminProduct/adminProductValidation.js"></script>
<script type="text/javascript" src="${root}/js/adminProduct/adminProductWrite.js"></script>
<script type="text/javascript" src="${root}/js/adminProduct/adminProductPreview.js"></script>
<script type="text/javascript" src="${root}/js/common.js"></script>
<script>
	$(function() {
		$("#product_tabs").tabs();
	});
</script>

</head>
<body onload="updateSetDefault()">
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>

	<form class="form_style" id="productForm" action="${root}/adminProduct/adminProductWrite.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="product_number" value="${productDto.product_number}"/>
		<input type="hidden" name="product_day_number" value="${productDayList[1].product_day_number}"/>
		<input type="hidden" name="product_detail_number" value="${productDetailList[1][0].product_detail_number}"/>
		<div id="productDayDtoElement">
			<input type="hidden" name="product_day_nth_day" value=""/>
			<input type="hidden" name="product_day_breakfast" value=""/>
			<input type="hidden" name="product_day_lunch" value=""/>
			<input type="hidden" name="product_day_dinner" value=""/>
			<input type="hidden" name="product_day_hotel" value=""/>
		</div>
		
		<div id="productDetailDtoElement">
			<input type="hidden" name="product_detail_name" value=""/>
			<input type="hidden" name="product_detail_explain" value=""/>
		</div>
		
		<input type="hidden" name="product_photo_index" value=""/>
			
		<div id="Containerwrap" style="margin-left: 130px;">
			<!--Content Start-->        
			<h2 style="margin-top:40px">상품수정</h2>
			<div align="center" class="content_wrapper" >
				<div>
				
				</div>
				<div id="product_tabs">
					<ul>
						<li><a href="#tabs-1">상품정보 입력</a></li>
						<li><a href="#tabs-2">항공정보 입력</a></li>
						<li><a href="#tabs-3">세부일정 입력</a></li>
					</ul>
	
					<div id="tabs-1" align="left">
						<h4>상품정보</h4>
						<div>
							<div class="title"><label>상품명</label></div>
							<div class="content"><input type="text" name="product_name" value="${productDto.product_name}"/></div>
							<div class="title"><label>상품요약</label></div>
							<div class="content"><input type="text" name="product_summary" value="${productDto.product_summary}"/></div>
							<div class="title"><label>카테고리</label></div>
							<div class="content">
								<select name="product_category" id="product_category">
									<option value=""></option>
									<option value="동남아">동남아</option>
									<option value="중국">중국</option>
									<option value="일본">일본</option>
								</select><br/>
								<c:if test="${productDto.product_category=='동남아'}">
									<script>
										product_category.selectedIndex=0;	
									</script>
								</c:if>
								<c:if test="${productDto.product_category=='중국'}">
									<script>
										product_category.selectedIndex=1;	
									</script>
								</c:if>
								<c:if test="${productDto.product_category=='일본'}">
									<script>
										product_category.selectedIndex=2;	
									</script>
								</c:if>
							</div>
							<div class="title"><label>나라</label></div>
							<div class="content"><input type="text" name="product_country" value="${productDto.product_country}"/></div>
							<div class="title"><label>도시</label></div>
							<div class="content"><input type="hidden" name="product_city"/><input type="text" name="product_cities" value="${product_cities}"/></div>
							<div class="title"><label>숙박일</label></div>
							<div class="content">
							<input type="text" name="product_stay_days" value="${productDto.product_stay_days}" maxlength="2" size="1" oninput="numberOnInput(event)"/>박
							<input type="text" name="product_days" value="${productDto.product_days}" maxlength="2" size="1" oninput="numberOnInput(event)"/>일
							</div>
							<div class="title"><label>성인 요금</label></div>
							<div class="content"><input type="hidden" name="product_price_adult"/><input type="text" name="product_price_adult_string" maxlength="13" oninput="numberOnInput(event)"/>원</div>
							<div class="title"><label>아동 요금</label></div>
							<div class="content"><input type="hidden" name="product_price_child"/><input type="text" name="product_price_child_string" maxlength="13" oninput="numberOnInput(event)"/>원</div>
							<div class="title"><label>유아 요금</label></div>
							<div class="content"><input type="hidden" name="product_price_baby"/><input type="text" name="product_price_baby_string" maxlength="13" oninput="numberOnInput(event)"/>원</div>
							<div class="title"><label>성인 가이드비</label></div>
							<div class="content"><input type="hidden" name="product_guide_adult"/><input type="text" name="product_guide_adult_string" value="$${productDto.product_guide_adult}" maxlength="3" value="$" oninput="dollarOnInput(event)"/></div>
							<div class="title"><label>아동 가이드비</label></div>
							<div class="content"><input type="hidden" name="product_guide_child"/><input type="text" name="product_guide_child_string" value="$${productDto.product_guide_child}" maxlength="3" value="$" oninput="dollarOnInput(event)"/></div>
							<div class="title"><label>유아 가이드비</label></div>
							<div class="content"><input type="hidden" name="product_guide_baby"/><input type="text" name="product_guide_baby_string" value="$${productDto.product_guide_baby}" maxlength="3" value="$" oninput="dollarOnInput(event)"/></div>
							<div class="title"><label>할인율1 시작일</label></div>
							<div class="content"><input type="text" name="product_bargain_day1" value="${productDto.product_bargain_day1}" maxlength="2" oninput="numberOnInput(event)"/>일 전</div>
							<div class="title"><label>할인율1</label></div>
							<div class="content"><input type="text" name="product_bargain_rate1" value="${productDto.product_bargain_rate1}" maxlength="2" oninput="numberOnInput(event)"/>%</div>
							<div class="title"><label>할인율2 시작일</label></div>
							<div class="content"><input type="text" name="product_bargain_day2" value="${productDto.product_bargain_day2}" maxlength="2" oninput="numberOnInput(event)"/>일 전</div>
							<div class="title"><label>할인율2</label></div>
							<div class="content"><input type="text" name="product_bargain_rate2" value="${productDto.product_bargain_rate2}" maxlength="2" oninput="numberOnInput(event)"/>%</div>
							<div id="day0"><div id="details0"><div id="detail0-1">
								<div class="title"><label>사진 등록</label></div>
								<div class="content"><input type="file" name="product_photo0-1-1" class="photos" value=""/></div>
							</div></div></div>
						</div>
					</div>
					<script>
						productForm.product_price_adult_string.value=numberFormatter('${productDto.product_price_adult}');
						productForm.product_price_child_string.value=numberFormatter('${productDto.product_price_child}');
						productForm.product_price_baby_string.value=numberFormatter('${productDto.product_price_baby}');
					</script>
					
<!-- 						항공정보 입력 -->
					<div id="tabs-2">
						<div align="left">
							<div id="flights">
								<c:forEach var="flightDto" items="${flightList}" varStatus="status">
									<h3>항공 정보 ${status.index+1}</h3>
									<div id="flight${status.index+1}" class="flight" style="height: 560px;">
										<h4>예약 가능 인원수</h4>
										<div class="title" ><label>예약 가능 인원</label></div>
										<div class="content"><input type="text" maxlength="2" size="1" name="flight_occupancy${status.index+1}" value="${flightDto.flight_occupancy}" oninput="numberOnInput(event)"/>명</div>
										<h4>출국 비행기 정보</h4>
										<div class="title"><label>이륙 시각(한국 시각)</label></div>
										<div class="content">
										<input type="text" maxlength="4" size="2" name="flight_start_departure_year${status.index+1}" oninput="numberOnInputUnformatted(event)" onchange="datetimeOnChange(event)"/>년
										<input type="text" maxlength="2" size="1" name="flight_start_departure_month${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>월
										<input type="text" maxlength="2" size="1" name="flight_start_departure_day${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>일&nbsp;
										<input type="text" maxlength="2" size="1" name="flight_start_departure_hour${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>시
										<input type="text" maxlength="2" size="1" name="flight_start_departure_minute${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>분
										</div>
										<div class="title"><label>착륙 시각(현지 시각)</label></div>
										<div class="content">
										<input type="text" maxlength="4" size="2" name="flight_start_arrival_year${status.index+1}" oninput="numberOnInputUnformatted(event)" onchange="datetimeOnChange(event)"/>년
										<input type="text" maxlength="2" size="1" name="flight_start_arrival_month${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>월
										<input type="text" maxlength="2" size="1" name="flight_start_arrival_day${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>일&nbsp;
										<input type="text" maxlength="2" size="1" name="flight_start_arrival_hour${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>시
										<input type="text" maxlength="2" size="1" name="flight_start_arrival_minute${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>분
										</div>
										<div class="title"><label>항공사</label></div>
										<div class="content"><input type="text" name="flight_start_airline${status.index+1}" value="${flightDto.flight_start_airline}" onchange="copyOnChange(event,${status.index+1})"/></div>
										<div class="title"><label>이륙 도시</label></div>
										<div class="content"><input type="text" name="flight_start_departure_city${status.index+1}" value="${flightDto.flight_start_departure_city}" onchange="copyOnChange(event,${status.index+1})"/></div>
										<div class="title"><label>착륙 도시</label></div>
										<div class="content"><input type="text" name="flight_start_arrival_city${status.index+1}" value="${flightDto.flight_start_arrival_city}" onchange="copyOnChange(event,${status.index+1})"/></div>
										<h4>귀국 비행기 정보</h4><div class="title"><label>이륙 시각(현지 시각)</label></div>
										<div class="content">
										<input type="text" maxlength="4" size="2" name="flight_end_departure_year${status.index+1}" oninput="numberOnInputUnformatted(event)" onchange="datetimeOnChange(event)"/>년
										<input type="text" maxlength="2" size="1" name="flight_end_departure_month${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>월
										<input type="text" maxlength="2" size="1" name="flight_end_departure_day${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>일&nbsp;
										<input type="text" maxlength="2" size="1" name="flight_end_departure_hour${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>시
										<input type="text" maxlength="2" size="1" name="flight_end_departure_minute${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>분
										</div>
										<div class="title"><label>착륙 시각(한국 시각)</label></div>
										<div class="content">
										<input type="text" maxlength="4" size="2" name="flight_end_arrival_year${status.index+1}" oninput="numberOnInputUnformatted(event)" onchange="datetimeOnChange(event)"/>년
										<input type="text" maxlength="2" size="1" name="flight_end_arrival_month${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>월
										<input type="text" maxlength="2" size="1" name="flight_end_arrival_day${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>일&nbsp;
										<input type="text" maxlength="2" size="1" name="flight_end_arrival_hour${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>시
										<input type="text" maxlength="2" size="1" name="flight_end_arrival_minute${status.index+1}" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>분
										</div>
										<div class="title"><label>항공사</label></div>
										<div class="content"><input type="text" name="flight_end_airline${status.index+1}" value="${flightDto.flight_end_airline}" /></div>
										<div class="title"><label>이륙 도시</label></div>
										<div class="content"><input type="text" name="flight_end_departure_city${status.index+1}" value="${flightDto.flight_end_departure_city}" /></div>
										<div class="title"><label>착륙 도시</label></div>
										<div class="content"><input type="text" name="flight_end_arrival_city${status.index+1}" value="${flightDto.flight_end_arrival_city}" /></div>
									</div>
								</c:forEach>
							</div>
							<a href="javascript:addFlight()">비행기 정보 추가</a>
						</div>
					</div>
					
<!-- 						상품상세일정  입력 -->
					<div id="tabs-3">
						<div align="left">
							<div id="days">
								<c:forEach var="i" begin="1" end="${fn:length(productDayList)-1}" >
									<c:set var="productDayDto" value="${productDayList[i]}" />
									<h3>${i}일차 일정</h3>
									<div id="day${i}" class="day" style="height: 560px;">
										<div class="content"><input type="hidden" name="product_day_nth_day${i}" value="${i}"/></div>
										<div class="title"><label>조식</label></div>
										<div class="content"><input type="text" name="product_day_breakfast${i}" value="${productDayDto.product_day_breakfast}"/></div>
										<div class="title"><label>중식</label></div>
										<div class="content"><input type="text" name="product_day_lunch${i}" value="${productDayDto.product_day_lunch}"/></div>
										<div class="title"><label>석식</label></div>
										<div class="content"><input type="text" name="product_day_dinner${i}" value="${productDayDto.product_day_dinner}"/></div>
										<div class="title"><label>숙소</label></div>
										<div class="content"><input type="text" name="product_day_hotel${i}" value="${productDayDto.product_day_hotel}"/></div>
										<br/>
										
										<div id="details${i}">
											<c:forEach var="j" begin="0" end="${fn:length(productDetailList[i])-1}" >
												<c:set var="productDetailDto" value="${productDetailList[i][j]}" />
												<h5>세부일정${j+1}</h5>
												<div class="title"><label>세부일정 이름</label></div>
												<div class="content"><input type="text" value="${productDetailDto.product_detail_name}" oninput="javascript:addDetail('+dayNumber+')" name="product_detail_name'+dayNumber+'-'+index+'"/></div>
												<div class="title" style="height: 116px;"><label>세부일정 설명</label></div>
												<div class="content" style="height: 116px;"><textarea oninput="javascript:addDetail('+dayNumber+')" style="resize: none;" cols="35" rows="5" name="product_detail_explain'+dayNumber+'-'+index+'">${productDetailDto.product_detail_explain}</textarea></div>
												<c:if test="${productPhotoList[i][j]!=null}">
													<c:forEach var="k" begin="0" end="${fn:length(productPhotoList[i][j])==0?0:fn:length(productPhotoList[i][j])-1}" >
														<c:set var="productPhotoDto" value="${productPhotoList[i][j][k]}" />
														<div class="title"><label>세부일정 사진</label></div>
														<div class="content"><input type="file" onchange="javascript:addDetail('+dayNumber+')" class="photos" name="product_photo'+dayNumber+'-'+index+'-1"/></div>
														<br/><br/>
													</c:forEach>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</c:forEach>
							</div>
							<a href="javascript:addDay()">일정 추가</a>
						</div>
					</div>
					
					<div align="center">
						<input type="button" value="수정" onclick="javascript:productUpdate('${root}')"/>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

	
			