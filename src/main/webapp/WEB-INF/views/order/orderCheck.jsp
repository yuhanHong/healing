<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료page</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root }/css/order/style.css"/>
<script type="text/javascript" src="${root }/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/order/order.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class" style="margin-left: 230px; width:900px;">
		<div class="content_class" style="width:900px;">
		
			<div style="float:left;margin-top:5px;">
				<img src="${root}/resources/boardImg/img01.PNG" align="center">
				<h3 style="display:inline;"><span style="font-weight: bold; ">예약 완료</span></h3>
			</div>
				
					
			<hr style="border:2px solid green; margin-top: 36px; width:100%; ">
			
			<div id="dc_main" style="margin-top: 50px;">			
			<form id="orderForm" action="${root}/order/write.do"  method ="post" onsubmit="return orderCheck(this,'${root}')">
				<div id="orderPage">
					<!-- Product Info -->		
					<div class="product_summary" style="font-weight: bolid; margin-left: 100px; width: 670px; padding-top: 20px; padding-bottom:20px; border-top: 1px solid gray; border-bottom: 1px solid gray;">
							<div style="border:1px #ffffff solid; width:100%; height:150px;overflow:hidden;" id="product${productDto.product_number}" class="clearfix on" onmouseover="productOnMouseOver('${productDto.product_number}')" onmouseout="productOnMouseOut('${productDto.product_number}')" onclick="productOnClick('${productDto.product_number}','${pc}','${pageNumber}')">
								<div style="float:left;"><img width="204" style="margin-left: 20px;" height= "150" onerror="setNoImg(this,'204x150');" alt="상품이미지" src="${root}/resources/productPhoto/${productDto.product_number}/0-1-1.jpg"></div>
								<div class="details" style="width: 380px; float:left; margin-left: 15px;">
									<h3 style="padding: 0 0 10px 0; ">[ATP${productDto.product_number}] ${productDto.product_name}</h3>
									<h4 style="color: #999; ">${productDto.product_summary}</h4>
									<div class="first" style=" font-size:14px;">상품가격 <fmt:formatNumber value="${productDto.product_price_adult}"/>원</div>
									<div style=" font-size:14px;">여행기간 ${productDto.product_stay_days}박 ${productDto.product_days}일</div>
								</div>
							</div>
						</div>
					<div id="orderCheckCover" style="margin-left: 70px; margin-top: 30px; ">
						<div class="orderDiv">
							<label>주문 번호 : ${orderDto.order_number}</label>  
						</div>
						<div class="orderDiv">
							<label>출발 날짜 : 	<fmt:formatDate value="${orderDto.start_time}" type="date"/>
											<fmt:formatDate value="${orderDto.start_time}" type="time"/>  </label>  
						</div>
						<div class="orderDiv">
							<label>성인 인원 : ${orderDto.order_adult}  명 /  아동 인원 : ${orderDto.order_child} 명 /  유아 인원 : ${orderDto.order_baby}  명</label>  
						</div>
				
						<div class="orderDiv" >
							<label>결제 방법 : ${orderDto.payment_option} / (${orderDto.payment_state})</label> 
							<c:if test="${orderDto.payment_option=='cash' }">
								<label>국민은행 00000-04-000000</label>
							</c:if>
						</div>
						<div class="orderDiv">
							<b>최종 결제 금액 : ${orderDto.order_money}&nbsp;&nbsp;원</b>
						</div>
						
						<div class="orderDiv">
							<h4 style="color:red;font-weight: bold;" >여행자의 여권 복사본과 개인 연락처를 QnA 게시판에 올려주시기 바랍니다.</h4>
						</div>
						<div class="orderDiv" style="margin-left: 310px">
							<input type="button" value="마이페이지로" onclick="location.href='${root}/member/memberUpdate.do?member_id=${member_id}&member_number=${member_number}'"/>
						</div>
					</div>
				</div>
			</form>
	</div></div></div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>