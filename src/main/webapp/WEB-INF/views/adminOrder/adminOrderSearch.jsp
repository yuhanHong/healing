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
<script src="//canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript" src="${root}/js/adminOrder/adminOrder.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>
	
	<input type="hidden" id="root" value="${root}" />
	<input type="button" id="product_like" value="관심상품 추가"/>
	
	<script type="text/javascript">
		$("#product_like").click(function(){
			
			var url="${root}/productLike/productLikeinsert.do?flight_number=1&member_number=2";
			var check=confirm("관심 상품으로 등록하시겠습니까?");
			if(check==true){
				$.ajax({
					url:url,
					type:"get",
					dataType:"text",
					success:function(data){
						var result=data;
						
						if(result=="1"){
							alert("등록이 되었습니다.");
						}else {
							alert("등록이 실패되었습니다.");
						}	
					},
					error:function(xhr, status, errorMsg){
						alert(xhr+","+status+","+errorMsg);
					}
				});
			}else{
				return;
			}
		});
	</script>
	<form style="width :1300px;">
	<h2>예약관리</h2>
		<div id="adminOrderSearch">
			
			<div id="adminSearchTable">
				<div class="adminSearchDiv"><label>날짜 선택 : </label> <input type="text" class="datepicker" id="start_date" name="start_date" size="15"/><b>&nbsp;&nbsp;~&nbsp;&nbsp;</b><input type="text" class="datepicker" id="end_date" name="end_date" size="15"/></div>
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
			<ul id="table_firstTr">
				<li id="resultArray" style="width:100px;">예약 날짜 ▼</li>
				<li  style="width:100px;">예약 번호</li>
				<li  style="width:70px;">예약자 명</li>
				<li  style="width:150px;">상품 명</li>
				<li  style="width:70px;">예약 인원</li>
				<li  style="width:100px;">결제 금액</li>
				<li  style="width:70px;">결제 방법</li>
				<li  style="width:100px;">예약 상태</li>
			</ul>

			<c:forEach var="orderDto" items="${orderList }">
			<ul>
				<li style="width:100px;"><fmt:formatDate value="${orderDto.order_date}" type="date"/> </li>
				<li style="width:100px;"><a href="javascript:orderAdminRead('${root}','${orderDto.order_number}')" >${orderDto.order_number}</a></li>
				<li style="width:70px;">${orderDto.order_name}</li>
				<li style="width:150px;">${orderDto.product_name}</li>
				<li style="width:70px; line-height: 14px;">성인 :${orderDto.order_adult}명<br/>아동 :${orderDto.order_child}명<br/>유아 :${orderDto.order_baby}명</li>
				<li style="width:100px;"><fmt:formatNumber pattern="###,###" value="${orderDto.order_money}"/>원 </li>
				<li style="width:70px;">${orderDto.payment_option}</li>
				<li style="width:100px;">${orderDto.payment_state}</li>
			</ul>
			</c:forEach>
		
		</div>
	</form>
</body>
</html>