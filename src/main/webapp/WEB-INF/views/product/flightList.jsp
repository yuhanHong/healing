<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<c:set var="root" value="${pageContext.request.contextPath }" />
</head>
<link rel="stylesheet" href="${root}/css/product/product.css" type="text/css" />
<script type="text/javascript">
var root="";
function bodyOnLoad(r){
	root=r;
}

function flightOnClick(flight_number,product_number,pc,pageNumber){
		location.href=root+"/product/productRead.do?fNum="+flight_number+"&pNum="+product_number+"&pc="+pc+"&pageNumber="+pageNumber;
}

function flightOnMouseOver(flight_number){
	var li=document.getElementById("flight"+flight_number);
	li.style.backgroundColor="#f6f6f6";
}

function flightOnMouseOut(flight_number){
	var li=document.getElementById("flight"+flight_number);
	li.style.backgroundColor="#ffffff";
	li.style.borderBottom="1px #dddddd solid";
}
</script>
<body onload="bodyOnLoad('${root}')">
	<jsp:include page="../include/header.jsp"/>
	<div id="Containerwrap">
        <!--Content Start-->        
	    <div id="content">
			<div class="nav"><img src="${root}/resources/boardImg/img01.PNG" align="center">
				<h2 style="display:inline;"><span style="font-weight: bold; ">항공권 선택</span></h2><ul><li><a href="${root}/">HOME</a></li><li> &nbsp;&gt;&nbsp; <a href="${root}/product/productList.do?pc=${pc}">${product_category}</a></li><c:if test="${product_category!=productDto.product_country}"><li> &nbsp;&gt;&nbsp; <a href="${root}/product/productList.do?pc=${pc}">${productDto.product_country}</a></li></c:if><li>&nbsp;&gt;&nbsp; <a href="${root}/product/productList.do?pc=${pc}">${product_city}</a></li></ul></div>
			
			<div class="productSummary1" >
					<div class="product_summary">
						<div class="productPhoto"><img width="204" height="150" alt="상품이미지" src="${root}/resources/productPhoto/${productDto.product_number}/0-1-1.jpg"></div>
						<div class="details" style="width: 620px; float:left; margin-left: 15px;">
								<h3 style="padding: 0 0 10px 0; ">[ATP${productDto.product_number}] ${productDto.product_name}</h3>
								<h4 style="color: #999; ">${productDto.product_summary}</h4>
							<div class="first" style="margin-left: 15px; font-size:14px;">상품가격 <fmt:formatNumber value="${productDto.product_price_adult}"/>원</div>
									<div style="margin-left: 15px; font-size:14px;">여행기간 ${productDto.product_stay_days}박 ${productDto.product_days}일</div>
						</div>
					</div>
			</div>
					
			<c:if test="${flightCount==0}">
				<div align="center">등록된 항공정보가 없습니다.</div>
			</c:if>
			
			<c:if test="${flightCount>0}">
		        <div class="flightListWrap" id="flightListWrap" style="display: block;">
        			<div class="flightListHeadWrap">
	        			<span class="flightListHead departure">출발정보</span><span class="flightListHead arrival">도착정보</span><span class="flightListHead airline">항공사</span><span class="flightListHead price">여행요금</span><span class="flightListHead occupancy">예약상태</span>
        			</div>
        			
		        	<div >
		        		<c:forEach var="flightDto" items="${flightList}" varStatus="status">
			        		<div class="flightList" id="flight${flightDto.flight_number}" onclick="flightOnClick('${flightDto.flight_number}','${productDto.product_number}','${pc}','${pageNumber}')" onmouseover="flightOnMouseOver('${flightDto.flight_number}')" onmouseout="flightOnMouseOut('${flightDto.flight_number}')">
		        				<span class="flightListElement departure"><fmt:formatDate pattern="yyyy-MM-dd(E) HH시 mm분" value="${flightDto.flight_start_departure}"/></span>
		        				<span class="flightListElement arrival"><fmt:formatDate pattern="yyyy-MM-dd(E) HH시 mm분" value="${flightDto.flight_end_arrival}" /></span>
		        				<span class="flightListElement airline" onmouseover="ToolTip(this,0);" onmouseout="ToolTip(this,1);"><img onerror="this.style.display='none';" src="${root}/resources/icons/airline/airline_${flightDto.flight_start_airline}.gif"></span>
			        			<span class="flightListElement price"><fmt:formatNumber value="${productDto.product_price_adult}"/>원</span>
			        			<span class="flightListElement occupancy">${flightOrderedList[status.index]}명 / ${flightDto.flight_occupancy}명</span>
			        		</div>
		        		</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<!-- 최근 본 상품 include 된 부분  -->
	<c:import url="../recentProduct/recentProduct.jsp"/>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>