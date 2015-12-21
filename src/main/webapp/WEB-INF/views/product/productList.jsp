<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<c:set var="root" value="${pageContext.request.contextPath }" />
<!-- 	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/Include/js/swfobject.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/Include/js/Modetour/etcs.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/Include/js/Modetour/popup.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/include/js/plugin/jquery.cycle2.min.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/include/js/plugin/jquery.cycle2.scrollVert.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/include/js/plugin/effect.min.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/include/js/plugin/jquery.mousewheel.min.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/include/js/plugin/jquery.mCustomScrollbar.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/include/js/modetour/selectbox.min.js"></script> -->
<!-- 	<script type="text/javascript" src="//www.modetour.com/include/js/modetour/Common_Top.min.js"></script> -->
	
<!-- 	<link rel="stylesheet" href="http://www.modetour.com/Include/css/Modetour/common/popup.css" type="text/css" /> -->
	<link rel="stylesheet" href="http://www.modetour.com/Include/css/Modetour/product/product.css" type="text/css" />
<!-- 	<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> -->
</head>
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
	li.style.border="1px red solid";
}

function productOnMouseOut(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.border="0px red solid";
}
</script>
<body onload="bodyOnLoad('${root}')">
<jsp:include page="../include/header.jsp"/>

	<div class="content" style="width: 900px; margin: 0px auto;">
		<c:if test="${count==0}">
			<div align="center">등록된 상품이 없습니다.</div>
		</c:if>
	
		<c:if test="${count>0}">
			<ul class="productList" style="list-style-type: none;">
				<c:forEach var="productDto" items="${productList}" varStatus="status">
					<li style="padding-bottom: 20px; margin: 15px 15px 15px 15px; border-bottom: 1px solid #D1D1D1;">
						<div style="width:100%; height:150px;overflow:hidden;" id="product${productDto.product_number}" class="clearfix on" onmouseover="productOnMouseOver('${productDto.product_number}')" onmouseout="productOnMouseOut('${productDto.product_number}')" onclick="productOnClick('${productDto.product_number}','${pc}','${pageNumber}')">
							<div style="float:left;"><img width="204" height="150" onerror="setNoImg(this,'204x150');" alt="상품이미지" src="${root}/resources/productPhoto/${productDto.product_number}/0-1-1.jpg"></div>
							<div class="details" style="width: 620px; float:left;">
								<dl style="margin-left: 15px;">
									<dt><b>[ATP${productDto.product_number}]</b>${productDto.product_name}</dt>
									<dd style="height:50px;">${productDto.product_summary}</dd>
								</dl>
								<div class="first" style="margin-left: 15px;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/txt_detail1.gif" alt="상품가격"><strong id="Price_ATP${productDto.product_number}"><fmt:formatNumber value="${productDto.product_price_adult}"/>원</strong></div>
								<div style="margin-left: 15px;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/txt_detail2.gif" alt="여행기간"><span id="DaysText_ATP${productDto.product_number}">${productDto.product_stay_days}박 ${productDto.product_days}일</span></div>
								<div class="date" style="margin-left: 15px;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/txt_detail4.gif" alt="출발요일"><span id="WeekText_ATP${productDto.product_number}">　</span></div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
		
	<c:if test="${count>0}">
		<div class="productListPages" style="width: 900px; margin: 0px auto;" align="center">
			<c:if test="${startPage!=1}">
				<a href="list.do?pageNumber=${startPage-1}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i==pageNumber}">
					<u><b><font size="6" color="#00f">[${i}]</font></b></u>
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
		
<jsp:include page="../include/footer.jsp"/>
</body>
</html>