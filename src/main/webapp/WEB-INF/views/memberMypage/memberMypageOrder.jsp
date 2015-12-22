<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/memberMypage/memberMypage.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/memberMypage/memberMypageOrder.css"/>
<%-- <script type="text/javascript" src="${root}/js/memberMypage/memberMypageOrder.js"></script> --%>


<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class">
	<jsp:include page="../include/memberMypageSideMenu.jsp"/>
	
	<div class="content_class" >
		<div style="float:left;">
			<img src="${root}/resources/boardImg/img01.PNG" align="center">
			<h2 style="display:inline;"><span style="font-weight: bold; ">예약/결제 내역</span></h2>
		</div>			
				
		<hr style="border:2px solid green; margin-top: 36px;">
				<div style="margin-left: 10px;width: 900px;">

			<div id="mmo_main">
				<input type="hidden" name="member_number" value="${member_number}"/>
				
				<c:forEach var="mypageList" items="${mypageDto}">
					<div style="width:900px; height: 40px"><!-- 공간 정렬을 위한 DIV --></div>
					<div style="width:210px; float: left; margin-top: 7px;" >
						<img src="${root}/resources/productPhoto/${mypageList.product_number}/0-1-1.jpg" width="204px;" height="150px;"/>
					</div>
					<div id="myoTop" >
					
						<div class="mmo_line" style="height: 43px;background-color: write;">
						
								<ul>
									<li  id="mmo_name_tag" style="width: 100px; ">주문 번호</li>
									<li  style="width: 150px;">${mypageList.order_number }</li>	
									<li  id="mmo_name_tag" style="width: 100px;">예약날짜</li>		
									<li style="width: 150px;">
										<fmt:formatDate value="${mypageList.order_date}" pattern="yyyy년 MM월dd일"/>
									</li>		
									
								</ul> 
						</div>
						<div class="mmo_line" style="height: 43px;">					
							<ul>
								
								<li  id="mmo_name_tag" style="width: 360px;">상품명</li>	
								<li  id="mmo_name_tag" style="width: 160px;">예약금액</li>						
							</ul>
						</div>
						<div class="mmo_line" style="height: 43px;">
							<ul>								
								<li style="width: 360px;">
									<a href="">${mypageList.product_name}</a></li>	

								<li style="width: 170px;">				
									<fmt:formatNumber value="${mypageList.order_money}" pattern="###,###"/>원
								</li>
							</ul>
						</div>
						</div>
						<div class="mmo_line" style="height: 43px;">
							<ul>
								
								<li  id="mmo_name_tag" style="width: 150px;">성인</li>								
								<li  id="mmo_name_tag" style="width: 150px;">아동</li>								
								<li  id="mmo_name_tag" style="width: 150px;">유아</li>
								<li  id="mmo_name_tag" style="width: 150px;">결제수단</li>								
								<li  id="mmo_name_tag" style="width: 150px;">결제현황</li>
								
							</ul>
						</div>
						<div class="mmo_line" style="height: 43px;">
							<ul>
								
								
								<li style="width: 150px;">${mypageList.order_adult}명</li>								
								<li style="width: 150px;">${mypageList.order_child}명</li>								
								<li style="width: 150px;">${mypageList.order_baby}명</li>
								<li style="width: 150px;">${mypageList.payment_option}</li>
								<li style="width: 150px;">${mypageList.payment_state}</li>
							</ul>
						</div>
						<div class="mmo_line" style="height: 43px;">
							<ul>
								<li  id="mmo_name_tag" style="width: 100px;">출발일</li>
								<li style="width: 255px;">
									<fmt:formatDate value="${mypageList.flight_start_date}" pattern="yyyy년 MM월dd일"/>
									<fmt:formatDate value="${mypageList.flight_start_date}" type="time"/>
								</li>
								<li  id="mmo_name_tag" style="width: 100px; ">도착일</li>
								<li style="width: 255px;">
									<fmt:formatDate value="${mypageList.flight_end_date}" pattern="yyyy년MM월dd일"/>
									<fmt:formatDate value="${mypageList.flight_end_date}" type="time"/>
								</li>
							</ul>
						</div>
						<div class="mmo_line" style="height: 43px;background-color: write;">
							<input type="hidden" name="member_number"value="${member_number }"/>
								<ul>
									 <b>
										<c:if test="${mypageList.payment_state=='입금전'}">
											<li style="width: 100px; margin-left: 270px;">
											<a href="javascript:pushRequest('${root}','${member_number}','${mypageList.order_number }','${mypageList.flight_number }','입금')">입금확인 신청</a></li>
										
											<li style="width: 138px ;"><a href="javascript:pushRequest('${root}','${member_number }','${mypageList.order_number }','${mypageList.flight_number }','취소')">취소신청</a></li>
										</c:if>
										<c:if test="${mypageList.payment_state!='입금전'}">
											<li style="width: 100px ;margin-left: 320px;"><a href="javascript:pushRequest('${root}','${mypageList.order_number }','${mypageList.flight_number }','취소')">취소신청</a></li>
										</c:if>
									</b>
								</ul> 
						</div>
					
					<hr style="border:2px solid green; margin-top: 40px;">
				</c:forEach>
			</div>
		</div>	
	</div>
</div>

<jsp:include page="../include/footer.jsp"/>
</body>

</html>