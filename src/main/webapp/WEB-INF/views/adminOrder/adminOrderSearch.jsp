<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자모드 - 예약관리</title>
<link rel="stylesheet" type="text/css" href="${root }/css/adminOrder/style.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/js/adminOrder/adminOrder.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<form>
		<div id="adminOrderSearch" class="container">
			<h2>예약관리</h2>
			<div id="adminSearchTable" class="well">
				<div class="adminSearchDiv"><label>날짜 선택 : </label> <input type="text" class="datepicker" id="start_date" name="start_date" size="15"/>~<input type="text" class="datepicker" id="end_date" name="end_date" size="15"/></div>
				<div class="adminSearchDiv"><label>검색 조건 : </label> 
						<select id="search_label">
							<option>전체검색</option>
							<option>예약번호</option>
							<option>예약자명</option>
							<option>회원ID</option>
							<option>회원명</option>
							<option>주문자 핸드폰번호</option>
							<option>도시</option>
							<option>비회원</option>
						</select><input type="text" id="search_input" size="30"/></div>
				<div class="adminSearchDiv" style="text-align: center;">
					<input type="button" value="검색" onclick="adminOrderSearch('${root}')"/>
					<input type="reset" value="취소"/>
				</div>
			</div>				
		</div>
		<div id="search_result">
			<table border="1" style="margin: 30px auto" >
				<tr>
					<td width="100">예약 날짜</td>
					<td width="100">예약 번호</td>
					<td width="70">예약자 명</td>
					<td width="100">상품 명</td>
					<td width="70">예약 인원</td>
					<td width="100">결제 금액</td>
					<td width="70">결제 방법</td>
					<td width="70">예약 상태</td>
				</tr>
				<c:forEach var="orderDto" items="${orderList }">
				<tr>
					<td><fmt:formatDate value="${orderDto.order_date}" type="date"/> </td>
					<td>${orderDto.order_number}</td>
					<td>${orderDto.order_name}</td>
					<td>${orderDto.product_name}</td>
					<td>성인 :${orderDto.order_adult}명<br/>아동 :${orderDto.order_child}명<br/>유아 :${orderDto.order_baby}명</td>
					<td><fmt:formatNumber pattern="###,###" value="${orderDto.order_money}"/>원 </td>
					<td>${orderDto.payment_option}</td>
					<td>${orderDto.payment_state}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>