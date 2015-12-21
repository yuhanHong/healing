<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center" style="width:1000px; height:650px; border:1px solid red;">
		<c:forEach var="productList" items="${recentProductList}">
			<h3>여행 상품</h3>
			상품명 : ${productList.product_name}<br>
			나라명 : ${productList.product_country}<br>
			숙박일 : ${productList.product_stay_days}<br>
			상품요약정보 : ${productList.product_summary}<br>
			성인요금 : ${productList.product_price_adult}<br>
			어린이요금 : ${productList.product_price_child}<br>
			유아요금 : ${productList.product_price_baby}<br>
		</c:forEach>
		<c:forEach var="flightList" items="${flightList}">
			<h3>여행 시작</h3>
			날짜 : <fmt:formatDate value="${flightList.flight_start_departure}" pattern="yyyy-MM-dd" type="date"/><br>
			비행기 이륙시간 : <fmt:formatDate value="${flightList.flight_start_departure}" type="time"/><br>
			비행기 착륙시간 : <fmt:formatDate value="${flightList.flight_start_arrival}" type="time"/><br>
			출발 항공사 : ${flightList.flight_start_airline}<br>
			출발 도시 : ${flightList.flight_start_departure_city}<br>
			도착 도시 : ${flightList.flight_start_arrival_city }<br>
			
			<h3>여행 종료</h3>
			날짜 : <fmt:formatDate value="${flightList.flight_end_departure}" pattern="yyyy-MM-dd" type="date"/><br>
			비행기 이륙시간 : <fmt:formatDate value="${flightList.flight_end_departure}" type="time"/><br>
			비행기 착륙시간 : <fmt:formatDate value="${flightList.flight_end_arrival}" type="time"/><br>
			출발 항공사 : ${flightList.flight_end_airline}<br>
			출발 도시 : ${flightList.flight_end_departure_city}<br>
			도착 도시 : ${flightList.flight_end_arrival_city}<br><br>
			
			<input type="button" value="목록으로" onclick="location.href='${root}'">
			
		</c:forEach>
		<!-- 최근 본 상품 include 된 부분 -->
		<c:import url="../recentProduct/recentProduct.jsp"/>
	</div>
	
</body>
</html>