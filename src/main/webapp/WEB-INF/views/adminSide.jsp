<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- admin sidebar starts -->

<div style="width: 130px; float: left; border:0px solid blue;">
	
	<a href = "${root}/adminMode/adminModeCreate.do">관리자 계정생성</a><br/>
	<c:if test="${admin_level=='Master'}">
		<a href = "${root}/adminMode/adminModeUpdate.do">관리자 계정관리</a><br/>
	</c:if>
		<a href = "${root}/adminMember/adminMember.do">관리자 회원관리</a><br/>
	<c:if test="${admin_name!=null}">
		<a href = "${root}/adminMode/adminModeLogout.do?admin_number=${admin_number}">로그아웃</a><br/>
		<a href = "${root}/adminBanner/bannerInsert.do">관리자모드 - 추천상품등록</a><br/>
	</c:if>
	<hr/>
	<a href="${root}/adminOrder/adminOrder.do">관리자모드-예약관리</a> <br/>
	<hr/>
	<h3>admin side3</h3>
	<hr/>
	<h3>admin side4</h3>
	<hr/>
	<h3>admin side5</h3>
	<hr/>
	<h3>admin side6</h3>
</div>

<!-- admin sidebar starts -->
