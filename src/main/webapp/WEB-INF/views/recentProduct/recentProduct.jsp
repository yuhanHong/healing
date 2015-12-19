<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var url = "${root}" + "/recentProduct/recentProductReadList.do";
		//alert(product_number);
		
		$.ajax({
			url:url,
			type:"get",
			dataType:"json",					// dataType: text or json ===> json 선택
			//data: {product: product, keyword: keyword},
			success:function(data){
				//alert(data);
			},error:function(xhr, status, errorMsg){
				//alert(status + "," + errorMsg);
			}
		});
	})
</script>
<link rel="stylesheet" type="text/css" href="${root}/css/home/home.css"/>
</head>
<body>
	<!-- 최근 본 상품 디자인 첫 부분 -->
	<c:set var="photoSize" value="${productPhotoList.size()}"/>
	<div class="recentProduct" align="center" style="margin-top:-800px; height:600px">
	<input type="text" value="${productPhotoList.size() }"/>
		<h3 style="color:white; font-size:16pt; font-family:휴먼매직체; padding-top:5px;">최근 본 상품</h3>
		<input type="button" value="▲" onclick="location.href='${root}/recentProduct/paging.do?listCount=${photoSize}'">
		<c:forEach var="productDto" items="${product}" varStatus="status">
			<c:set var="st" value="${status.index}"/>
			<div class="recentCookie">
				<a href="${root}/recentProduct/recentProduct.do?product_number=${productDto.product_number}">
					<!-- status.index를 이용해서 if조건을 줌 -->
					<c:if test="${st < 1 }">
						<img src="${root}/resources/banner/${productPhoto[status.index].product_photo_filename}" class="cookieImgSize">
					</c:if>
					<c:if test="${st >= 1 }">
						<img src="${root}/resources/banner/${productPhoto[status.index].product_photo_filename}" class="cookieImgSize2"><br>
					</c:if>
				</a>
				<h6 style="font-family:휴먼매직체; font-size:16pt; color:white; padding-top:10px;">${productDto.product_name}<h6>
			</div>
		</c:forEach>
		<input type="button" value="▼" style="margin-top:60px;" onclick="location.href='${root}/recentProduct/paging.do?listCount=${photoSize}'">
	</div>
	<!-- 최근 본 상품 디자인 마지막 부분 -->
</body>
</html>