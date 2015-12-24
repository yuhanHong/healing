<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
<script type="text/javascript" src="${root}/js/adminOrder/adminOrderRead.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
	<form id="orderForm">
		<div>
		
			<div class="adminOrderDiv">
				<ul>
					<li>예약 번호</li>
					<li style="width:350px">${orderDto.order_number}</li> 
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
					<li>예약자 명</li>
					<li style="width:350px">${orderDto.order_name}</li>
				</ul>
			</div>
			<div class="adminOrderDiv">
				<ul>
					<li>전화번호</li>
					<li style="width:350px">0${orderDto.order_phone}</li>
				</ul>
			</div>
			<div class="adminOrderDiv">
				<ul>
					<li>이메일</li>
					<li style="width:350px">${orderDto.order_email}</li>
				</ul>
			</div>		
			<div class="adminOrderDiv">
				<ul>
					<li>출발 날짜</li>  
					<li style="width:350px"><fmt:formatDate value="${orderDto.start_time}" pattern="yyyy년MM월dd일"/></li>
				</ul>
			</div>
			<div class="adminOrderDiv">
				<ul>
					<li>성인 인원 </li> 
					<li style="width:50px">${orderDto.order_adult} 명 </li>
					<li>아동 인원 </li>
					<li style="width:50px">${orderDto.order_child} 명 </li>
					<li>유아 인원 </li>
					<li style="width:50px">${orderDto.order_baby} 명</li>  
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
			<div class="adminOrderDiv" style="border:0px; margin-top: 30px; margin-left: 50px;">
				<b>예매 금액 : <fmt:formatNumber value="${orderDto.order_money }" pattern="###,###"/>원</b>
				<!-- 부분 환불 금액이나 추가입금 금액이 있는 경우 -->
				<c:if test="${((orderDto.order_money)-(orderDto.order_pay))!=0}">
					<b style="color:red;"> ${orderDto.payment_state} : 
						<fmt:formatNumber value="${(orderDto.order_money)-(orderDto.order_pay)}" pattern="###,###"/>원</b> 
				</c:if>
			</div>		
			<div class="adminOrderDiv" style="text-align: right;margin-right: 30px; border:0px;">
				<c:if test="${orderDto.order_money!=0 }">
					<input type="button" value="수정" onclick="javascript:location.href='${root}/adminOrder/adminOrderModify.do?order_number=${orderDto.order_number}'"/>
				</c:if>
				<input type="button" value="취소" onclick="javascript:self.close()"/>
			</div>
			
		</div>
	</form>
</body>
</html>