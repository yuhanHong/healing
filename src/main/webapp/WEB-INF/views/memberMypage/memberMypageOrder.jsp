<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class">
	<jsp:include page="../include/memberMypageSideMenu.jsp"/>
	
	<div class="content_class" >
		
		<div style="float:left;">
			<img src="${root}/resources/boardImg/img01.PNG" align="center">
			<h2 style="display:inline;"><span style="font-weight: bold; ">${member_name} 님의 예약/결제 내역 페이지 입니다. / 현재 예약중인 상품 () 개</span></h2>
		</div>			
				
		<hr style="border:2px solid green; margin-top: 36px;">
				<div style="margin-left: 10px;width: 900px;">

			<div id="mmo_main">
				<!-- 수정하세요...임의 값 넣은겁니당~~ 채윤 -->
				<input type="hidden" name="member_number" value="${member_number}"/>
				<c:set var="order_number" value="41"/>
				<c:set var="flight_number" value="1"/>
				
				<div id="mmo_content">
					<div class="mmo_line" style="height: 43px;">
						<ul>
							<li  id="mmo_name_tag" style="width: 100px;">상품명</li>	
							<li style="width: 400px;"></li>							
						</ul>
					</div>
					<div class="mmo_line" style="height: 43px;">
						<ul>
							<li  id="mmo_name_tag" style="width: 100px;">예약날짜</li>
							<li style="width: 150px;"></li>
							<li  id="mmo_name_tag" style="width: 70px; margin-left:20px;">성인</li>
							<li style="width: 70px;"></li>
							<li  id="mmo_name_tag" style="width: 70px;">아동</li>
							<li style="width: 70px;"></li>
							<li  id="mmo_name_tag" style="width: 70px;">유아</li>
							<li style="width: 70px;"></li>
						</ul>
					</div>
					<div class="mmo_line" style="height: 43px;">
						<ul>
							<li  id="mmo_name_tag" style="width: 100px;">출발일</li>
							<li style="width: 200px;"></li>
							<li  id="mmo_name_tag" style="width: 100px; margin-left:122px;">도착일</li>
							<li style="width: 200px;"></li>
						</ul>
					</div>
					<div class="mmo_line" style="height: 43px;">
						<ul>
							<li  id="mmo_name_tag" style="width: 100px;">예약금액</li>
							<li style="width: 200px;"></li>
							<li  id="mmo_name_tag" style="width: 90px;">결제방법</li>
							<li style="width: 100px;"></li>
							<li  id="mmo_name_tag" style="width: 90px;">예약상태</li>
							<li style="width: 100px;"></li>
						</ul>
					</div>
					<div class="mmo_line" style="height: 43px; margin-left: 250px;">
						<ul>
							<li style="width: 100px;"><a href="javascript:pushRequest('${root}','${order_number }','${flight_number }','취소')">취소신청</a></li>
							<li style="width: 100px;">
							<a href="javascript:pushRequest('${root}','${member_number}','${order_number }','${flight_number }','입금')">입금확인 신청</a></li>
						</ul>
	
					</div>
				</div>
			</div>
		</div>	

		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>
</body>

</html>