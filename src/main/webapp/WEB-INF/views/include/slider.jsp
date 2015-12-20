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
	<!-- 메인 사진 위 이탤릭체 글자부분 -->
	<div class="top_slogan"> Design is not just what it looks like and feels like. Design is how it works. </div>
	<div class="slider">
	<div class="flexslider">
		<ul class="slides">
			<c:forEach var="i" begin="0" end="${listSize-1}" step="1">
				<li>
					<img src="${root}/resources/banner/${productPhotoList.get(i).product_photo_filename}" border="0" width="1000px" height="500px"/>
					<div class="flex-caption">
						<a href="${root}/recentProduct/recentProduct.do?product_number=${productList.get(i).product_number}">
							<h2>${productList.get(i).product_name}</h2>
						</a>
						<p>Ut enim ad minima veniam, quis nostru <strong>exercitationem</strong> ullam corporis laboriosam, nisi ut aliquid ex ea commodi <strong><a href="#">consequatur</a></strong></p>
						<a href="${root}/recentProduct/recentProduct.do?product_number=${productList.get(i).product_number}" class="slider_button">상품 보러가기</a>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	</div>
</div>
<%-- </c:if> --%>
</body>
</html>