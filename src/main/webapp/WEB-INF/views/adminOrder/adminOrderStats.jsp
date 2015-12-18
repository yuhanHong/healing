<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자모드 - 통계</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="${root}/css/adminOrder/style.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- Script -->
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/adminOrder/adminOrder.js"></script>
<script type="text/javascript" src="${root}/js/adminOrder/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${root}/js/adminOrder/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/adminOrder/jquery.canvasjs.min.js"></script>
<script type="text/javascript" src="${root}/js/adminOrder/d3.js"></script>
<script type="text/javascript" src="${root}/js/order/order.js"></script>
<script type="text/javascript" src="${root}/js/adminOrder/adminOrderStats.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../adminHeader.jsp"/>
	<jsp:include page="../adminSide.jsp"/>
	
	<input type="hidden" id="root" value="${root}" />
	
	<div style="width:1200px;">
		<h2 style="margin-top: 40px;">매출 통계</h2>
		<div class="adminOrderDiv" id="salesTop">
			<ul >
				<li>오늘의 예약 금액</li>
				<li><fmt:formatNumber value="${todaySales }" pattern="###,###"/> 원</li>
				<li>오늘의 매출 금액</li>
				<li><fmt:formatNumber value="${todayPay }" pattern="###,###"/> 원</li>
			</ul>	    
		</div>
		<div id="adminOrderSearch" class="container" style="margin-top: 30px; height: 150px;">
			<div id="adminSearchTable" class="well" style="height: 130px;">
				<div class="adminSearchDiv"><label>날짜 선택 : </label> <input type="text" class="datepicker" id="start_date" name="start_date" size="15"/><b>&nbsp;&nbsp;~&nbsp;&nbsp;</b><input type="text" class="datepicker" id="end_date" name="end_date" size="15"/></div>
				<div class="adminSearchDiv" style="text-align: center;">
					<select id="select">
						<option value="day">일 별</option>
						<option value="month">월 별</option>
						<option value="year">연도 별</option>
					</select>	
					<input type="button" value="검색" onclick="adminOrderStatsSearch('${root}')"/>
				</div>
			</div>
		</div>	
		
		<!-- 결과 -->
		<div id="adminOrderStatsResult" style="margin-bottom: 300px;">
			<!-- 그래프 -->
			<div id="chartContainer" style=" width: 100%;"></div>
			<div class="adminOrderStatsResultFirst">
				<ul>
					<li>날짜</li>
					<li>예약 금액</li>
					<li>결제 금액</li>
					<li>미결제 금액</li>
				</ul>
				<br/>
				<div class="statsResult">
					<h3 style="margin-top: 30px;margin-left: 220px;">검색 결과가 없습니다.</h3>
				</div>
			</div>
		</div>
	</div>
</body>
</html>