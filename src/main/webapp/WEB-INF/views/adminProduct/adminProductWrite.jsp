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
<body onload="writeSetDefault()">
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>

	<form class="form_style" id="productForm" action="${root}/adminProduct/adminProductWrite.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="product_number" value="0"/>
		<input type="hidden" name="product_day_number" value="0"/>
		<input type="hidden" name="product_detail_number" value="0"/>
		
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
			<h2 style="margin-top:40px">상품등록</h2>
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
							<div class="content"><input type="hidden" name="product_city"/><input type="text" name="product_cities"/></div>
							<div class="title"><label>숙박일</label></div>
							<div class="content"><input type="text" name="product_stay_days" maxlength="2" oninput="numberOnInput(event)"/>박</div>
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
							<div class="title"><label>할인율1 시작일</label></div>
							<div class="content"><input type="text" name="product_bargain_day1" maxlength="2" oninput="numberOnInput(event)"/>일 전</div>
							<div class="title"><label>할인율1</label></div>
							<div class="content"><input type="text" name="product_bargain_rate1" maxlength="2" oninput="numberOnInput(event)"/>%</div>
							<div class="title"><label>할인율2 시작일</label></div>
							<div class="content"><input type="text" name="product_bargain_day2" maxlength="2" oninput="numberOnInput(event)"/>일 전</div>
							<div class="title"><label>할인율2</label></div>
							<div class="content"><input type="text" name="product_bargain_rate2" maxlength="2" oninput="numberOnInput(event)"/>%</div>
							
							<div id="day0"><div id="details0"><div id="detail0-1">
								<div class="title"><label>사진 등록</label></div>
								<div class="content"><input type="file" name="product_photo0-1-1" class="photos"/></div>
							</div></div></div>
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
							<div id="days"></div>
							<a href="javascript:addDay()">일정 추가</a>
						</div>
					</div>
					
					<div align="center">
						<a href="javascript:productWrite('${root}')">등록?!</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

	
			