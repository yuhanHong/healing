<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/bannerInsert/bannerInsert.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/bannerInsert/bannerInsert.css">
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>
	<h2 style="margin-top: 40px;">배너상품 관리</h2>
	<div style="width: 1400px;">
		

		<div id="bannerInsertDiv">	
			<h3>상품을 검색해주세요.</h3>
			
			<select name="product" id="bannerProduct">
				<option value="product_name">상품명</option>
				<option value="product_country">나라명</option>
			</select>
			
			<input type="text" name="keyword" id="keyword">
			<input type="button" value="상품검색" onclick="return searchForm('${root}')">
			
			<div id="result1">
				<div class="result2">
					<div class="recommand1">체크</div>
					<div class="recommand1">상품번호</div>
					<div class="recommand1" style="width:170px">상품명</div>
					<div class="recommand1">나라명</div>
					<div class="recommand1">숙박일</div>
					<div class="recommand1">조회수</div>
					<div class="recommand1">평균평점</div>
					<div class="recommand1">추천상품여부</div>
				</div>
			</div>
			
			<br>
			<div style="width:1077px; margin-top: 15px;" align="right">
				<input type="button" value="배너등록" onclick="productInsert('${root}')">
			</div>
			
			<h3>배너리스트</h3>

			<div id="result2">
				<div class="result2">
					<div class="recommand1">체크</div>
					<div class="recommand1">상품번호</div>
					<div class="recommand1" style="width:170px">상품명</div>
					<div class="recommand1">나라명</div>
					<div class="recommand1">숙박일</div>
					<div class="recommand1">조회수</div>
					<div class="recommand1">평균평점</div>
					<div class="recommand1">추천상품여부</div>
				</div>
				<c:forEach var="product" items="${productDto}">
					<div class="result3">
						<div class="recommand2"><input type="checkbox" name="check2" value="${product.product_number}"></div>
						<div class="recommand2">${product.product_number}</div>
						<div class="recommand2" style="width:170px">${product.product_name}</div>
						<div class="recommand2">${product.product_country}</div>
						<div class="recommand2">${product.product_stay_days}</div>
						<div class="recommand2">${product.product_readcount}</div>
						<div class="recommand2">${product.product_average_score}</div>
						<div class="recommand2">${product.product_banner}</div>
					</div>
				</c:forEach>
			</div>
			
			<div style="width:1077px; margin-top: 15px;" align="right">
				<input type="button" value="배너제거" onclick="productdelete('${root}')">
			</div>
		</div>
	</div>	
</body>
</html>