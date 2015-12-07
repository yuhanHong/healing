<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>healing</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<jsp:include page="../header.jsp"/>
	<div>
		<h3>상품등록</h3>
	</div>
	<div align="center">
		<form class="form_style" name="productForm" action="${root}/adminProduct/productWrite.do" 
			method="post" onsubmit="return registerForm(this)">
			<div>
				<span><label class="title">상품명</label></span>
				<span class="content"><input type="text" name="product_name"/><br/></span>
				<span><label class="title">카테고리</label></span>
				<span class="content"> 
				<select name="product_category">
					<option value="동남아">동남아</option>
					<option value="일본">일본</option>
					<option value="중국">중국</option>
				</select><br/>
				</span>
				<span><label class="title">나라</label></span>
				<span class="content"><input type="text" name="product_country"/><br/></span>
				<span><label class="title">숙박일</label></span>
				<span class="content"><input type="text" name="product_stay_date"/>일<br/></span>
				<span><label class="title">성인요금</label></span>
				<span class="content"><input type="text" name="product_price_adult"/>원<br/></span>
				<span><label class="title">아동요금</label></span>
				<span class="content"><input type="text" name="product_price_child"/>원<br/></span>
				<span><label class="title">유아요금</label></span>
				<span class="content"><input type="text" name="product_price_baby"/>원<br/></span>
				<span><label class="title">출발가능 인원수</label></span>
				<span class="content"><input type="text" name="product_price_baby"/>명<br/></span>
				<span><label class="title">할인율1</label></span>
				<span class="content"><input type="text" name="product_bargain_rate1"/>%<br/></span>
				<span><label class="title">할인율1 시작일</label></span>
				<span class="content"><input type="text" name="product_bargain_day1"/>일 전<br/></span>
				<span><label class="title">할인율2</label></span>
				<span class="content"><input type="text" name="product_bargain_rate2"/>%<br/></span>
				<span><label class="title">할인율2 시작일</label></span>
				<span class="content"><input type="text" name="product_bargain_day2"/>일 전<br/></span>
				<span><label class="title">상품요약</label></span>
				<span class="content"><textarea rows="10" cols="10" name="product_summary"></textarea><br/></span>
				<input type="submit" value="등록"/>
				<input type="reset" value="취소"/>
			</div>
		</form>
	</div>
</body>
</html>