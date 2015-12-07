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
	<div>
		<form class="form_style" name="productForm" action="${root}/member/register.do" 
			method="post" onsubmit="return registerForm(this)">
			<div>
				상품명: <input type="text" name="product_name"/><br/>
				카테고리: 
				<select name="product_category">
					<option value="동남아">동남아</option>
					<option value="일본">일본</option>
					<option value="중국">중국</option>
				</select><br/>
				나라: <input type="text" name="product_country"/><br/>
				숙박일: <input type="text" name="product_stay_date"/>일<br/>
				성인요금: <input type="text" name="product_price_adult"/>원<br/>
				아동요금: <input type="text" name="product_price_child"/>원<br/>
				유아요금: <input type="text" name="product_price_baby"/>원<br/>
				출발가능 인원수: <input type="text" name="product_price_baby"/>명<br/>
				할인율1: <input type="text" name="product_bargain1_rate"/>%<br/>
				할인율1 시작일: <input type="text" name="product_bargain1_day"/>일 전<br/>
				할인율2: <input type="text" name="product_bargain2_rate"/>%<br/>
				할인율2 시작일: <input type="text" name="product_bargain2_day"/>일 전<br/>
				상품요약: <textarea rows="10" cols="10" name="product_summary"></textarea><br/>
				<input type="submit" value="등록"/>
				<input type="reset" value="취소"/>
			</div>
		</form>
	</div>
</body>
</html>