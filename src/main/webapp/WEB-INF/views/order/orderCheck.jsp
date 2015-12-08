<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 완료page</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root }/css/order/style.css"/>
<script type="text/javascript" src="${root }/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/order/order.js"></script>
</head>
<body>
	<form id="orderForm" action="${root}/order/write.do"  method ="post" onsubmit="return orderCheck(this,'${root}')">
		<div class="orderDiv">
			<label>${productDto.product_name }</label><br/>
			<label>${productDto.product_summary }</label>
		</div>
		
		<div class="orderDiv">
			<label>주문 번호 : ${orderDto.order_number}</label>  
		</div>
		<div class="orderDiv">
			<label>출발 날짜 : ${orderDto.start_time}</label>  
		</div>
		<div class="orderDiv">
			<label>성인 인원 : ${orderDto.order_adult}  /  아동 인원 : ${orderDto.order_child}  /  유아 인원 : ${orderDto.order_baby}  /  </label>  
		</div>

		<div class="orderDiv" >
			<label>결제 방법 : ${orderDto.payment_option} / (${orderDto.payment_state})</label> 
			<c:if test="${orderDto.payment_option=='cash' }">
				<label>국민은행 00000-04-000000</label>
			</c:if>
		</div>
		<div class="orderDiv">
			<b>최종 결제 금액 : ${orderDto.order_money }</b>
		</div>
		
		<div class="orderDiv">
			<h4 style="color:red">여행자의 여권 복사본과 개인 연락처를 QnA 게시판에 올려주시기 바랍니다.</h4>
		</div>
		<div class="orderDiv">
			<input type="button" value="마이페이지로" onclick=""/>
		</div>
	</form>
</body>
</html>