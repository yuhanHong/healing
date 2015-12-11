<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/bannerInsert/bannerInsert.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${root}/css/bannerInsert/bannerInsert.css">
</head>
<body>
	<jsp:include page="../adminHeader.jsp"/>
	<jsp:include page="../adminSide.jsp"/>
	
	<div id="auto_info">
		<h3>추천상품검색</h3>
		<br>
		
		<h4>상품을 검색해주세요.</h4>
		
		<select id="product" name="product">
			<option value="product_name">상품명</option>
			<option value="product_country">나라명</option>
		</select>
		
		<input type="text" name="keyword" id="keyword">
		<input type="button" value="상품검색" onclick="return searchForm('${root}')">
		
		<div id="result1">
			<div class="result2">
				<div class="recommand1">체크</div>
				<div class="recommand1">상품번호</div>
				<div class="recommand1_1">상품명</div>
				<div class="recommand1">나라명</div>
				<div class="recommand1">숙박일</div>
				<div class="recommand1">출발가능인원수</div>
				<div class="recommand1">조회수</div>
				<div class="recommand1">평균평점</div>
			</div>
		</div>
		
		<br>
		<div style="width:350px;" align="center">
			<input type="button" value="등록" onclick="productInsert('${root}')">
		</div>
		
		<h3>추천상품리스트</h3>
		<div id="result2">
		
		</div>
		
		<div style="width:350px;" align="center">
			<input type="button" value="등록">
			<input type="button" value="삭제">
		</div>
	</div>
</body>
</html>