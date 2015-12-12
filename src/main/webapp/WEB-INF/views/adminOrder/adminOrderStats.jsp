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
<link rel="stylesheet" type="text/css" href="${root }/css/adminOrder/style.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/js/adminOrder/adminOrder.js"></script>
<script type="text/javascript" src="${root}/js/adminOrder/adminOrderStats.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../adminHeader.jsp"/>
	<jsp:include page="../adminSide.jsp"/>

<div>
	<h2 style="margin-top: 40px;">매출 통계</h2>
	<div class="adminOrderDiv" id="salesTop">
		<ul >
			<li>오늘의 매출</li>
			<li><fmt:formatNumber value="${todaySales }" pattern="###,###"/> 원</li>
			<li>오늘의 결제 금액</li>
			<li><fmt:formatNumber value="${todayPay }" pattern="###,###"/> 원</li>
		</ul>	    
	</div>
	<div id="adminOrderSearch" class="container" style="margin-top: 30px;">
		<div id="adminSearchTable" class="well" style="height: 130px;">
			<div class="adminSearchDiv"><label>날짜 선택 : </label> <input type="text" class="datepicker" id="start_date" name="start_date" size="15"/><b>&nbsp;&nbsp;~&nbsp;&nbsp;</b><input type="text" class="datepicker" id="end_date" name="end_date" size="15"/></div>
			<div class="adminSearchDiv" style="text-align: center;">
				<select id="select">
					<option value="day">일 별</option>
					<option value="month">월 별</option>
					<option value="year">연 별</option>
				</select>	
				<input type="button" value="검색" onclick="adminOrderStatsSearch('${root}')"/>
			</div>
		</div>
		
	</div>
</div>


</body>
</html>