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
	<jsp:include page="../include/memberMypageSideMenu.jsp"/>
<div id="mmo_main">
	<div id="mmo_title">
		<h1>${member_name} 님의 예약/결제 내역 페이지 입니다.</h1>
	</div>
	
	<div id="mmo_subTitle">
		<h2>현재 예약중인 상품 () 개</h2>
	</div>
	
	<!-- 수정하세요...임의 값 넣은겁니당~~ 채윤 -->
	<input type="hidden" name="member_number" value="${member_number}"/>
	<c:set var="order_number" value="41"/>
	<c:set var="flight_number" value="1"/>
	
	<div id="mmo_content">
		<div class="mmo_line" style="height: 43px;">
			<ul>
				<li style="width: 100px;">상품명</li>	
				<li style="width: 700px;"></li>
				<li style="width: 100px; float:right;">
					<a href="javascript:pushRequest('${root}','${order_number }','${flight_number }','취소')">취소신청</a></li>
			</ul>
		</div>
		<div class="mmo_line" style="height: 43px;">
			<ul>
				<li style="width: 100px;">예약날짜</li>
				<li style="width: 150px;"></li>
				<li style="width: 100px; margin-left:173px;">성인</li>
				<li style="width: 70px;"></li>
				<li style="width: 100px;">아동</li>
				<li style="width: 70px;"></li>
				<li style="width: 100px;">유아</li>
				<li style="width: 70px;"></li>
			</ul>
		</div>
		<div class="mmo_line" style="height: 43px;">
			<ul>
				<li style="width: 100px;">출발일</li>
				<li style="width: 200px;"></li>
				<li style="width: 100px; margin-left:122px;">도착일</li>
				<li style="width: 200px;"></li>
			</ul>
		</div>
		<div class="mmo_line" style="height: 43px;">
			<ul>
				<li style="width: 100px;">예약금액</li>
				<li style="width: 300px;"></li>
				<li style="width: 100px;">결제방법</li>
				<li style="width: 100px;"></li>
				<li style="width: 100px;">예약상태</li>
				<li style="width: 100px;"></li>
				<li style="width: 100px;">
				<a href="javascript:pushRequest('${root}','${member_number}','${order_number }','${flight_number }','입금')">입금확인 신청</a></li>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>