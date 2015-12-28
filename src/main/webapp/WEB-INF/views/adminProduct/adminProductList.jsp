<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/adminProduct/adminProductList.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/adminProduct/adminProductList.css"/>
<link rel="stylesheet" href="${root}/css/product/product.css" type="text/css"/>
<script>
var root="${root}";

function productOnClick(product_number){
	location.href=root+"/adminProduct/adminProductUpdate.do?pNum="+product_number;
}

function productOnMouseOver(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.backgroundColor="#f6f6f6";
}

function productOnMouseOut(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.backgroundColor="#ffffff";
}
</script>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>
	<h2 style="margin-top: 40px;">상품 관리</h2>
	<div id="adminProductListWrap">
		<form id="adminProducListSearchForm" action="${root}/adminProduct/adminProductList.do" method="post" onsubmit="return adminProducListSearchCheck(this)">
			<select name="type" id="type">
				<option value="product_number">상품번호</option>
				<option value="product_name">상품명</option>
				<option value="product_country">나라명</option>
			</select>
			<c:if test="${type=='product_number'}">
				<script>
					type.selectedIndex=0;	
				</script>
			</c:if>
			<c:if test="${type=='product_name'}">
				<script>
					type.selectedIndex=1;	
				</script>
			</c:if>
			<c:if test="${type=='product_country'}">
				<script>
					type.selectedIndex=2;	
				</script>
			</c:if>
			
			<input type="text" name="keyword"  value="${keyword}"/>
			<input type="submit" value="상품검색"/>
		
			<div id="adminProducList">
				<div class="adminProducListHead">
					<div class="adminProducListHeadItem1"><input type="checkbox" name="checkAll" onchange='checkAllOnChange()'>체크</div>
					<div class="adminProducListHeadItem1">상품번호</div>
					<div class="adminProducListHeadItem2">상품명</div>
					<div class="adminProducListHeadItem1">나라명</div>
					<div class="adminProducListHeadItem1">숙박일</div>
					<div class="adminProducListHeadItem1">조회수</div>
					<div class="adminProducListHeadItem1">평균평점</div>
					<div class="adminProducListHeadItem1">추천상품여부</div>
				</div>
				<c:forEach var="productDto" items="${productList}">
					<div class="product" id="product${productDto.product_number}" onmouseover="productOnMouseOver('${productDto.product_number}')" onmouseout="productOnMouseOut('${productDto.product_number}')" onclick="productOnClick('${productDto.product_number}')">
						<div class="adminProducListItem1"><input type="checkbox" class="checkBox" name="check${productDto.product_number}"/></div>
						<div class="adminProducListItem1">${productDto.product_number}</div>
						<div class="adminProducListItem2">${productDto.product_name}</div>
						<div class="adminProducListItem1">${productDto.product_country}</div>
						<div class="adminProducListItem1">${productDto.product_stay_days}</div>
						<div class="adminProducListItem1">${productDto.product_readcount}</div>
						<div class="adminProducListItem1">${productDto.product_average_score}</div>
						<div class="adminProducListItem1">${productDto.product_banner}</div>
					</div>
				</c:forEach>
				
				<c:if test="${count>0}">
					<div class="productListPages">
						<c:if test="${startPage!=1}">
							<a href="adminProductList.do?pageNumber=${startPage-1}&type=${type}&keyword=${keyword}">[이전]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==pageNumber}">
								[${i}]
							</c:if>
							<c:if test="${i!=pageNumber}">
								<a href="adminProductList.do?pageNumber=${i}&type=${type}&keyword=${keyword}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${endPage < pageCount}">
							<a href="adminProductList.do?pageNumber=${endPage+1}&type=${type}&keyword=${keyword}">[다음]</a>
						</c:if>
					</div>
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>