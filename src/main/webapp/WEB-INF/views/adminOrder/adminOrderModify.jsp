<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>관리자모드 - 예약서 페이지</title>
<link rel="stylesheet" type="text/css" href="${root }/css/adminOrder/style.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/js/order/order.js"></script>
<script type="text/javascript" src="${root}/js/adminOrder/adminOrderRead.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
	<form id="orderForm" action="${root}/adminOrder/adminOrderModify.do"  method ="post" onsubmit="return orderCheck(this,'${root}')">
		<div>
			<!-- hidden-->
			<div id="hiddenInfo" >
				<input type="hidden" name="product_number" value="${productDto.product_number}"/>
				<input type="hidden" name="order_price_adult" value="${productDto.product_price_adult}"/>
				<input type="hidden" name="order_price_child" value="${productDto.product_price_child}"/>
				<input type="hidden" name="order_price_baby" value="${productDto.product_price_baby}"/>	
				<input type="hidden" id="order_money" name="order_money" value="${orderDto.order_money }">
				<input type="hidden" id="order_modify_money" name="order_modify_money" value="${orderDto.order_money}">
				<input type="hidden" name="order_number" value="${orderDto.order_number}">
				<input type="hidden" name="payment_state" value="${orderDto.payment_state}">
				<input type="hidden" name="order_pay" value="${orderDto.order_pay}">
				<input type="hidden" name="member_number" value="${memberDto.member_number}">
				<input id="order_adult" type="hidden" name="order_adult" value="0"/>
				<input id="order_child" type="hidden" name="order_child"value="0"/>
				<input id="order_baby" type="hidden" name="order_baby"value="0"/>
				
			</div>
		
			<div class="adminOrderDiv">
				<ul>
					<li>예약 번호</li>
					<li style="width:350px" >${orderDto.order_number}</li>
				</ul>  
			</div>
			<div class="adminOrderDiv">
				<ul>
					<li>회원  ID</li>
					<li>${memberDto.member_id}</li>
					<li>회원  명</li>
					<li style="width:150px">${memberDto.member_name}</li>  
				</ul>
			</div>
			
			<!-- Product Info -->	
			<div class="adminOrderDiv">
				<ul>
					<li>예약 상품</li>  
					<li style="width:350px">${productDto.product_name }</li>
				</ul>
			</div>
			
			<div class="adminOrderDiv">
				<ul>
					<li>예약자 명 </li>
					<li style="width:350px;"><input style="height:20px;"name="order_name" type="text" value="${orderDto.order_name}"/></li>
				</ul>
			</div>
			<div class="adminOrderDiv">
				<ul>
					<li>전화번호 </li>
					<li style="width:350px"><input style="height:20px;" name="order_phone" type="text" value="0${orderDto.order_phone}"/> </li>   
				</ul>
			</div>
			<div class="adminOrderDiv">
				<ul>
					<li>이메일</li>
					<li style="width:350px"><input style="height:20px;" name="order_email" type="text" value="${orderDto.order_email}"/> </li>
				</ul>
			</div>		
			<div class="adminOrderDiv">
				<ul>
					<li>출발 날짜</li>
					<li style="width:350px"><fmt:formatDate value="${orderDto.start_time}" pattern="yyyy년MM월dd일"/> </li>  
				</ul>
			</div>
			<div class="adminOrderDiv">
				<ul>
					<li style="height: 30px;">성인 인원 </li>
					<li style="height: 30px;width:50px"><input style="height:21px;width:40px;" id="adult"  type="number"  value="${orderDto.order_adult}" max="20" min="1" size="1"></li>									
					<li style="height: 30px;">아동 인원 </li>
					<li style="height: 30px;width:50px"><input style="height:21px;width:40px;" id="child" type="number"  value="${orderDto.order_child}" max="20" min="0" size="1"></li>
					<li style="height: 30px;">유아 인원</li>
					<li style="height: 30px;width:50px"><input style="height:21px; width:40px;" id="baby" type="number"  value="${orderDto.order_baby}" max="20" min="0" size="1"></li>
				</ul>
			</div>
	
			<div class="adminOrderDiv" >
				<ul>
					<li>결제 방법</li>
					<li>${orderDto.payment_option}</li>
					<li>예약 상태</li>
					<li style="width:150px">${orderDto.payment_state}</li> 
				</ul>
			</div>
			<div class="adminOrderDiv"style="border:0px; margin-top: 30px; margin-left: 50px;">
				<b>예매 금액 :   
				 <font id="result_money"><fmt:formatNumber value="${orderDto.order_money}" pattern="###,###"/></font>원</b>
				<!-- 부분 환불 금액이나 추가입금 금액이 있는 경우 -->
				<c:if test="${((orderDto.order_money)-(orderDto.order_pay))!=0}">
						<b  style="color:red"> ${orderDto.payment_state} : 
							<fmt:formatNumber value="${(orderDto.order_money)-(orderDto.order_pay)}" pattern="###,###"/>원</b> 
						<input type="button" value="결제확인" style="color: black;"onclick="return payCompl('${root}','${orderDto.order_number}','${memberDto.member_number}','${orderDto.order_pay}','${orderDto.order_money}')"/>
				</c:if>			
			</div>
				
			<div class="adminOrderDiv" style="text-align: right;margin-right: 80px; margin-top: 10px;">
				<input type="button" value="주문취소" onclick="orderCancel('${root}','${orderDto.order_number}','${memberDto.member_number}','${orderDto.order_pay}')"/>
				<input type="submit" value="확인"/>
				<input type="button" value="취소" onclick="javascript:self.close()"/>
			</div>
		</div>
	</form>
</body>
</html>