<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" charset="utf-8">
var $ = jQuery.noConflict();
$(window).load(function () {
    $('.flexslider').flexslider({
        animation: "slide"
    });
});
</script>
</head>
<body>

<!-- 메인 슬라이드 부분 -->
<%-- <c:if test="${productPhotoList.size() != 0}"> --%>
<div id="wrap">
	<!-- 메인 사진 위 이탤릭체 글자부분
		<div class="top_slogan"> Design is not just what it looks like and feels like. Design is how it works. </div> -->

	<div class="slider" style="margin-top: 30px;">
	<div class="flexslider" >
		<ul class="slides">
			<c:forEach var="i" begin="0" end="${listSize-1}" step="1">
				<li>
					<a href="${root}/product/flightList.do?pNum=${productList.get(i).product_number}">
					<img src="${root}/resources/productPhoto/${productList.get(i).product_number}/0-1-1.jpg" border="0" width="1000px" height="500px"/>
					<div class="flex-caption">
						
							<h2>${productList.get(i).product_name}</h2>
						
						<p>${productList.get(i).product_summary} </p>
						상품 보러가기
					</div>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	</div>
</div>
<%-- </c:if> --%>
</body>
</html>