<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자모드 - 예약서 페이지</title>
<link rel="stylesheet" type="text/css" href="${root }/css/adminOrder/style.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/js/adminOrder/adminOrder.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
	<form id="orderForm">
		<div>
		
			<div class="orderDiv">
				<label>예약 번호 : ${orderDto.order_number}</label>  
			</div>
			<div class="orderDiv">
				<label>회원  ID : ${memberDto.member_id} / 회원  명 : ${memberDto.member_name}</label>  
			</div>
			<!-- Product Info -->	
			<div class="orderDiv">
				<label>예약 상품:</label>  
			</div>	
			<div class="orderDiv" id="productInfo">
				<label>${productDto.product_name }</label><br/>
				<label>${productDto.product_summary }</label>
			</div>
			<div class="orderDiv">
				<label>예약자 명 : ${orderDto.order_name}</label>  
			</div>
			<div class="orderDiv">
				<label>예약자 전화번호 : ${orderDto.order_phone}</label>  
			</div>
			<div class="orderDiv">
				<label>이메일 : ${orderDto.order_email}</label>  
			</div>		
			<div class="orderDiv">
				<label>출발 날짜 :
				<fmt:formatDate value="${orderDto.start_time}" pattern="yyyy년MM월dd일"/> 	 </label>  
			</div>
			<div class="orderDiv">
				<label>성인 인원 : ${orderDto.order_adult}  명 /  아동 인원 : ${orderDto.order_child} 명 /  유아 인원 : ${orderDto.order_baby}  명</label>  
			</div>
	
			<div class="orderDiv" >
				<label>결제 방법 : ${orderDto.payment_option} / 예약 상태 : ${orderDto.payment_state}</label> 
			</div>
			<div class="orderDiv">
				<b>최종 결제 금액 : <fmt:formatNumber value="${orderDto.order_money }" pattern="###,###"/>원</b>
			</div>
			<div class="orderDiv" style="text-align: right;margin-right: 80px">
				<input type="button" value="수정"/>
				<input type="button" value="취소" onclick="javascript:self.close()"/>
			</div>
			
		</div>
	</form>
</body>
</html>