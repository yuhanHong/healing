<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관심상품</title>
<script type="text/javascript" src="${root}/js/productLike/productLike.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root }/css/productLike/style.css"/>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<jsp:include page="../footer.jsp"/>
	<div style="border:1px solid red; width: 900px;">
		<h3>관심상품</h3>
		<div class="productLikeTable">
			<ul class="productLikeTableFirst">
				<li>선택</li>
				<li>상품명</li>
				<li>숙박일</li>
				<li style="line-height: 40px; background-color: lightgray;">상품가</li>
				<li>출발 날짜</li>
				<li>바로가기</li>
			</ul>
		</div>
			<c:forEach var="productDto" items="${productMap }">
			<div class="productLikeTable">
				<ul class="productLikeUl">
					<li><input type="checkbox" style="height: 36px;" class="check" value="${productDto.key}"></li>
					<li>${productDto.value.product_name}</li>
					<li>${productDto.value.product_stay_date}박</li>
					<li style="font-size: 10px;">
						성인:<fmt:formatNumber value="${productDto.value.product_price_adult}" pattern="###,###"/>원<br/>
						아동:<fmt:formatNumber value="${productDto.value.product_price_child}" pattern="###,###"/>원<br/>
						유아:<fmt:formatNumber value="${productDto.value.product_price_baby}" pattern="###,###"/>원
					</li>
					<li>항공정보 들어감</li>
					<li><a href="#">이동</a></li>
				</ul>
				</div>
			</c:forEach>
			<c:if test="${check==0 }">
				<div style="margin:30px auto; margin-left: 280px;">
					<h3>등록된 관심 상품이 없습니다.</h3>
				</div>
			</c:if>
			<div style="margin-left: 600px; margin-top: 30px;">
				<input type="button" value="전체 선택" id="select" onclick="productSelect()"/>
				<input type="button" value="선택 삭제" onclick="productLikeSelectDel('${root}','${member_number}')"/>
				<input type="button" value="전체 삭제" onclick="location.href='${root}/productLike/productLikeAllDelete.do?member_number=${member_number}'"> 
			</div>
			
			<!-- hidden -->
			<input type="hidden" id="productMap_size" value="${productMapSize}">
	</div>
</body>
</html>