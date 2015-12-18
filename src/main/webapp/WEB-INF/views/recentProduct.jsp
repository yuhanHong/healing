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
	<div class="recentProduct" align="center" style="margin-top:-500px; height:480px">
		<h3 style="color:white; font-size:16pt; font-family:휴먼매직체; padding-top:5px;">최근 본 상품</h3>
		<input type="button" value="▲">
		<c:forEach var="i" begin="0" end="${listSize-1}" step="1">
			<div class="recentCookie">
				<a href="${root}/recentProduct/recentProduct.do?product_number=${productList.get(i).product_number}"><img src="${root}/resources/banner/${productPhotoList.get(i).product_photo_filename}" class="cookieImgSize"></a>
			</div>
		</c:forEach>
		<input type="button" value="▼">
	</div>
	<!-- 최근 본 상품 디자인 마지막 부분 -->
</body>
</html>