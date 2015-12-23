<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<c:set var="root" value="${pageContext.request.contextPath }" />
	<link rel="stylesheet" href="${root}/css/product/product.css" type="text/css" />
<script type="text/javascript">
var root="";
function bodyOnLoad(r){
	root=r;
}

function productOnClick(product_number,pc,pageNumber){
// 	alert(product_number);
	location.href=root+"/product/flightList.do?pNum="+product_number+"&pc="+pc+"&pageNumber="+pageNumber;
}

function productOnMouseOver(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.border="1px #ff0000 solid";
}

function productOnMouseOut(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.border="1px #ffffff solid";
}
</script>
</head>
<body onload="bodyOnLoad('${root}')">
	<jsp:include page="../include/header.jsp"/>
	
    <div id="Containerwrap">
        <!--Content Start-->        
	    <div id="content">
			<div class="nav"><img src="${root}/resources/icons/product/nav_productList.gif" alt='' class="floatl" onerror="this.style.display='none';"/><ul><li><a href="${root}/">HOME</a></li><li> &nbsp;&gt;&nbsp; <a href="${root}/product/productList.do?pc=${pc}">${product_category}</a></li></ul></div>
			
			<c:if test="${count==0}">
				<div align="center"><h3>등록된 상품이 없습니다.</h3></div>
			</c:if>
			
			<c:if test="${count>0}">
				<div class="productList" >
					<c:forEach var="productDto" items="${productList}" varStatus="status">
						<div class="product_summary" style="">
							<div style="border:1px #ffffff solid; width:100%; height:150px;overflow:hidden;" id="product${productDto.product_number}" class="clearfix on" onmouseover="productOnMouseOver('${productDto.product_number}')" onmouseout="productOnMouseOut('${productDto.product_number}')" onclick="productOnClick('${productDto.product_number}','${pc}','${pageNumber}')">
								<div style="float:left;"><img width="204" height="150" onerror="setNoImg(this,'204x150');" alt="상품이미지" src="${root}/resources/productPhoto/${productDto.product_number}/0-1-1.jpg"></div>
								<div class="details" style="width: 620px; float:left; margin-left: 15px;">
									<h3 style="padding: 0 0 10px 0; ">[ATP${productDto.product_number}] ${productDto.product_name}</h3>
									<h4 style="color: #999; ">${productDto.product_summary}</h4>
									<div class="first" style="margin-left: 15px; font-size:14px;">상품가격 <fmt:formatNumber value="${productDto.product_price_adult}"/>원</div>
									<div style="margin-left: 15px; font-size:14px;">여행기간 ${productDto.product_stay_days}박 ${productDto.product_days}일</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
		
	<c:if test="${count>0}">
		<div class="productListPages">
				<c:if test="${startPage!=1}">
					<a href="list.do?pageNumber=${startPage-1}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i==pageNumber}">
						[${i}]
					</c:if>
					<c:if test="${i!=pageNumber}">
						<a href="list.do?pageNumber=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage < pageCount}">
					<a href="list.do?pageNumber=${endPage+1}">[다음]</a>
				</c:if>
		</div>
	</c:if>
	<c:if  test="${count<2}">
      <div style="height: 150px;">
         <!-- 자리뗴움용 -->
      </div>
   </c:if>
   
   <!-- 최근 본 상품 include 된 부분 -->
   <c:import url="../recentProduct/recentProduct.jsp"/>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>