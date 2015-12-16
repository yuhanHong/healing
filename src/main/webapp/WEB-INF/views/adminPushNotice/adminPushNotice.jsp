<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자모드 - 알림</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/adminPushNotice/adminPushNotice.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root }/css/adminPushNotice/adminPushNotice.css"/>
</head>
<body>
	<jsp:include page="../adminHeader.jsp"/>
	<jsp:include page="../adminSide.jsp"/>
	
	<!-- hidden -->
	<input type="hidden" value="${root}" id="root"/>
	<div id="pushResult" style="width:1200px;">
		<h2 style="margin-top: 40px;">알림 현황</h2>
		<div class="pushDiv" style="margin-left:50px; margin-bottom: 30px;">
			<label>검색 조건 :</label> 
			<select id="select">
				<option value="nothing"></option>
				<option value="all">전체 알림</option>
				<option value="no">미확인 알림</option>
				<option value="yes">확인 알림</option>
			</select>	
		</div>
		<div class="pushResultDiv">
			<ul id="pushResultfirst">
				<li style="width:50px;">No.</li>
				<li>회원 번호</li>
				<li>회원 이름</li>
				<li>예약 번호</li>
				<li style="width:150px;">내용</li>
				<li style="width:150px;">보낸 날짜</li>
				<li>확인 여부</li>
			</ul>
			
			<c:forEach var="i" begin="0" end="${listSize-1}" step="1">
				<ul id="readcheckUl${i}">
					<li style="width:50px;">${pushList.get(i).push_number }</li>
					<li>${pushList.get(i).member_number }</li>
					<li>${memberList.get(i).member_name }</li>
					<li><a href="javascript:pushOrderRead('${root}','${pushList.get(i).push_number }','${pushList.get(i).order_number }','${pushList.get(i).push_readcheck }','${i}')">${pushList.get(i).order_number }</a></li>
					<li style="width:150px;">
						<c:if test="${pushList.get(i).push_content=='취소' }">
							취소 신청입니다.
						</c:if>
						<c:if test="${pushList.get(i).push_content=='입금' }">
							입금 확인 신청입니다.
						</c:if>
						
					</li>
					<li style="width:150px; line-height: 15px;"><fmt:formatDate value="${pushList.get(i).push_date }" type="date"/><br/>
						<fmt:formatDate value="${pushList.get(i).push_date }" type="time"/>
					</li>
					<li id="readcheck${i}" >${pushList.get(i).push_readcheck }</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</body>
</html>