<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/home/home.css"/>
</head>
<body>
	<!-- 최근 본 상품 디자인 첫 부분 -->
	<div class="recentProductTest">
		<h3 style="color:white;">최근 본 상품</h3>
		<input type="button" value="▲">
		<div class="recentCookie">
			<a href="${root}/recentProduct/recentProduct.do"><img src="${root}/resources/banner/banner1.jpg" class="cookieImgSize"></a>
		</div>
		<div class="recentCookieTest">
			<a href="#"><img src="${root}/resources/banner/banner2.jpg" class="cookieImgSize"></a>
		</div>
		<div class="recentCookieTest">
			<a href="#"><img src="${root}/resources/banner/banner3.jpg" class="cookieImgSize"></a>
		</div><br>
		<input type="button" value="▼">
	</div>
	<!-- 최근 본 상품 디자인 마지막 부분 -->
</body>
</html>