<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="${root}/js/common.js"></script>
<script>
	$(function() {
		$("#product_tabs").tabs();
// 		$("#flights").accordion({
// 			collapsible: true,
// 			heightStyle: "content",
// 			activate: function(event, ui) {
// 			var index=parseInt(ui.newHeader.text().substring(ui.newHeader.text().length-1));
// 			$("#flights:nth-child(1):nth-child(2):nth-child(0)").focus();
// 			$("#flights:nth-child(index*2-1):nth-child(2):nth-child(0)").select();
// 		}});
// 		$("#details").accordion({
// 			collapsible: true,
// 			heightStyle: "content",
// 			activate: function(event, ui) {
// 			var index=parseInt(ui.newHeader.text().substring(ui.newHeader.text().length-1));
// 			$("#details:nth-child(1):nth-child(2):nth-child(0)").focus();
// 			$("#details:nth-child(index*2-1):nth-child(2):nth-child(0)").select();
// 		}});
	});
</script>

</head>
<body onload="writeSetDefault()">
	<jsp:include page="../adminHeader.jsp"/>
	<jsp:include page="../adminSide.jsp"/>

	<form class="form_style" name="productForm" action="${root}/adminProduct/productWrite.do" method="post" onsubmit="return registerForm(this)">
		<div id="Containerwrap" style="margin-left: 130px;">
			<!--Content Start-->        
		
			<div style="margin: 0px auto;" align="center" class="content_wrapper" >
				<div>
					<h3>상품등록</h3>
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
							<div class="content"><input type="text" name="product_name"/></div>
							<div class="title"><label>상품요약</label></div>
							<div class="content"><input type="text" name="product_summary"/></div>
							<div class="title"><label>카테고리</label></div>
							<div class="content"><select name="product_category">
								<option value=""></option>
								<option value="동남아">동남아</option>
								<option value="일본">일본</option>
								<option value="중국">중국</option>
							</select><br/>
							</div>
							<div class="title"><label>나라</label></div>
							<div class="content"><input type="text" name="product_country"/></div>
							<div class="title"><label>도시</label></div>
							<div class="content"><input type="text" name="product_cities"/></div>
							<div class="title"><label>숙박일</label></div>
							<div class="content"><input type="text" name="product_stay_date" maxlength="2" oninput="numberOnInput(event)"/>박</div>
							<div class="title"><label>성인 요금</label></div>
							<div class="content"><input type="hidden" name="product_price_adult"/><input type="text" name="product_price_adult_string" maxlength="13" oninput="numberOnInput(event)"/>원</div>
							<div class="title"><label>아동 요금</label></div>
							<div class="content"><input type="hidden" name="product_price_child"/><input type="text" name="product_price_child_string" maxlength="13" oninput="numberOnInput(event)"/>원</div>
							<div class="title"><label>유아 요금</label></div>
							<div class="content"><input type="hidden" name="product_price_baby"/><input type="text" name="product_price_baby_string" maxlength="13" oninput="numberOnInput(event)"/>원</div>
							<div class="title"><label>성인 가이드비</label></div>
							<div class="content"><input type="hidden" name="product_guide_adult"/><input type="text" name="product_guide_adult_string" maxlength="3" value="$" oninput="dollarOnInput(event)"/></div>
							<div class="title"><label>아동 가이드비</label></div>
							<div class="content"><input type="hidden" name="product_guide_child"/><input type="text" name="product_guide_child_string" maxlength="3" value="$" oninput="dollarOnInput(event)"/></div>
							<div class="title"><label>유아 가이드비</label></div>
							<div class="content"><input type="hidden" name="product_guide_baby"/><input type="text" name="product_guide_baby_string" maxlength="3" value="$" oninput="dollarOnInput(event)"/></div>
							<div class="title"><label>할인율1</label></div>
							<div class="content"><input type="text" name="product_bargain_rate1" maxlength="2" oninput="numberOnInput(event)"/>%</div>
							<div class="title"><label>할인율1 시작일</label></div>
							<div class="content"><input type="text" name="product_bargain_day1" maxlength="2" oninput="numberOnInput(event)"/>일 전</div>
							<div class="title"><label>할인율2</label></div>
							<div class="content"><input type="text" name="product_bargain_rate2" maxlength="2" oninput="numberOnInput(event)"/>%</div>
							<div class="title"><label>할인율2 시작일</label></div>
							<div class="content"><input type="text" name="product_bargain_day2" maxlength="2" oninput="numberOnInput(event)"/>일 전</div>
							<div class="title"><label>사진 등록</label></div>
							<div class="content" style="width: 400px;"><input type="file" name="product_photo"/></div>
						</div>
					</div>
				
<!-- 						항공정보 입력 -->
					<div id="tabs-2">
						<div align="left">
							<div id="flights"></div>
							<a href="javascript:addFlight()">비행기 정보 추가</a>
						</div>
					</div>
					
<!-- 						상품상세일정  입력 -->
					<div id="tabs-3">
						<div align="left">
							<div id="details">
<!-- 								<h3 id="detail1">1일차 일정</h3> -->
<!-- 								<div> -->
<!-- 									<h4>예약 가능 인원수</h4> -->
<!-- 									<div class="title"><label>예약 가능 인원</label></div> -->
<!-- 									<div class="content"> -->
<!-- 										<input type="text" maxlength="2" size="1" name="flight_occupancy1" oninput="numberOnInputUnformatted(event)"/>명 -->
<!-- 									</div> -->
									
<!-- 									<h4>출국 비행기 정보</h4> -->
<!-- 									<div class="title"><label>이륙 시각(한국 시각)</label></div> -->
<!-- 									<div class="content"> -->
<!-- 										<input type="text" maxlength="4" size="2" name="flight_start_date_year1" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_month1" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_day1" oninput="numberOnInput(event)"/> -->
<!-- 										<input type="text" maxlength="2" size="1" name="flight_start_departure_hour1" oninput="numberOnInput(event)"/>시 -->
<!-- 										<input type="text" maxlength="2" size="1" name="flight_start_departure_minute1" oninput="numberOnInput(event)"/>분 -->
<!-- 									</div> -->
<!-- 									<div class="title"><label>착륙 시각(현지 시각)</label></div> -->
<!-- 									<div class="content"> -->
<!-- 										<input type="text" maxlength="4" size="2" name="flight_start_date_year1" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_month1" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_day1" oninput="numberOnInput(event)"/> -->
<!-- 										<input type="text" maxlength="2" size="1" name="flight_start_arrival_hour1" oninput="numberOnInput(event)"/>시 -->
<!-- 										<input type="text" maxlength="2" size="1" name="flight_start_arrival_minute1" oninput="numberOnInput(event)"/>분 -->
<!-- 									</div> -->
<!-- 									<div class="title"><label>항공사</label></div> -->
<!-- 									<div class="content"><input type="text" name="flight_start_airline"/></div> -->
<!-- 									<div class="title"><label>이륙 도시</label></div> -->
<!-- 									<div class="content"><input type="text" name="flight_start_departure_city"/></div> -->
<!-- 									<div class="title"><label>착륙 도시</label></div> -->
<!-- 									<div class="content"><input type="text" name="flight_start_arrival_city"/></div> -->

<!-- 									<h4>귀국 비행기 정보</h4> -->
<!-- 									<div class="title"><label>이륙 시각(현지 시각)</label></div> -->
<!-- 									<div class="content"> -->
<!-- 										<input type="text" maxlength="4" size="2" name="flight_end_date_year1" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_month1" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_day1" oninput="numberOnInput(event)"/> -->
<!-- 										<input type="text" maxlength="2" size="1" name="flight_end_departure_hour1" oninput="numberOnInput(event)"/>시 -->
<!-- 										<input type="text" maxlength="2" size="1" name="flight_end_departure_minute1" oninput="numberOnInput(event)"/>분 -->
<!-- 									</div> -->
<!-- 									<div class="title"><label>착륙 시각(한국 시각)</label></div> -->
<!-- 									<div class="content"> -->
<!-- 										<input type="text" maxlength="4" size="2" name="flight_end_date_year1" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_month1" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_day1" oninput="numberOnInput(event)"/> -->
<!-- 										<input type="text" maxlength="2" size="1" name="flight_end_arrival_hour1" oninput="numberOnInput(event)"/>시 -->
<!-- 										<input type="text" maxlength="2" size="1" name="flight_end_arrival_minute1" oninput="numberOnInput(event)"/>분 -->
<!-- 									</div> -->
<!-- 									<div class="title"><label>항공사</label></div> -->
<!-- 									<div class="content"><input type="text" name="flight_end_airline1"/></div> -->
<!-- 									<div class="title"><label>이륙 도시</label></div> -->
<!-- 									<div class="content"><input type="text" name="flight_end_departure_city1"/></div> -->
<!-- 									<div class="title"><label>착륙 도시</label></div> -->
<!-- 									<div class="content"><input type="text" name="flight_end_arrival_city1"/></div> -->
<!-- 								</div> -->
							</div>
							<a href="javascript:addDetail()">일정 추가</a>
						</div>
					</div>
					
					<div align="center">
						<input type="submit" value="등록"/>
						<input type="reset" value="취소"/>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

	
			