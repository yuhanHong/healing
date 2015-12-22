<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class">
	<jsp:include page="../include/memberMypageSideMenu.jsp"/>
	
	<div class="content_class">
		
		<div style="float:left;">
			<img src="${root}/resources/boardImg/img01.PNG" align="center">
			<h2 style="display:inline;"><span style="font-weight: bold; ">관심상품</span></h2>
		</div>
			
				
		<hr style="border:2px solid green; margin-top: 36px;">
				<div style="margin-left: 10px;width: 900px;">

			<div class="productLikeTable">
				<ul id="productLikeTableFirst">
					<li>선택</li>
					<li>상품명</li>
					<li>숙박일</li>
					<li style="line-height: 40px;">상품가</li>
					<li>출발 날짜</li>
					<li>바로가기</li>
				</ul>
			</div>
				<c:forEach var="productDto" items="${productMap }">
				<div class="productLikeTable">
					<ul class="productLikeUl">
						<li><input type="checkbox" style="height: 36px;" class="check" value="${productDto.key}"></li>
						<li>${productDto.value.product_name}</li>
						<li>${productDto.value.product_stay_days}박</li>
						<li style="font-size: 10px;">
							성인:<fmt:formatNumber value="${productDto.value.product_price_adult}" pattern="###,###"/>원<br/>
							아동:<fmt:formatNumber value="${productDto.value.product_price_child}" pattern="###,###"/>원<br/>
							유아:<fmt:formatNumber value="${productDto.value.product_price_baby}" pattern="###,###"/>원
						</li>
						<li style="font-size: 10px;">
							<fmt:formatDate value="${flightMap.get(productDto.key).flight_start_date}" pattern="yyyy년 MM월 dd일"/><br/>
							<fmt:formatDate value="${flightMap.get(productDto.key).flight_start_date}" type="time"/> </li>
	 			<!--		flightMap.get(productDto.key) = flightDto -->
						<li><a href="#"><!--  ${flightMap.get(productDto.key).flight_number}--> 이동</a></li>
					</ul>
					</div>
				</c:forEach>
				<c:if test="${check==0 }">
					<div style="margin:30px auto; margin-left: 280px;margin-bottom: 200px;">
						<h3 style="font-size: 13px;">등록된 관심 상품이 없습니다.</h3>
					</div>
				</c:if>
				<div style="margin-left: 500px; margin-top: 30px;margin-bottom: 200px; ">
					<input type="button" value="전체 선택" id="select" onclick="productSelect()"/>
					<input type="button" value="선택 삭제" onclick="productLikeSelectDel('${root}','${member_number}')"/>
					<input type="button" value="전체 삭제" onclick="location.href='${root}/productLike/productLikeAllDelete.do?member_number=${member_number}'"> 
				</div>
				
				<!-- hidden -->
				<input type="hidden" id="productMap_size" value="${productMapSize}">
			
		</div>	

		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>