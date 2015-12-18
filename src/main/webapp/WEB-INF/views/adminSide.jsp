<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- admin sidebar starts -->

<div style="width: 130px; float: left;">
	<a href = "${root}/adminHome.do">관리자 홈</a><br/>
	<hr/>
	<a href = "${root}/adminMode/adminModeCreate.do">관리자 계정생성</a><br/>
	<c:if test="${admin_level=='Master'}">
		<a href = "${root}/adminMode/adminModeUpdate.do">관리자 계정관리</a><br/>
	</c:if>
		<a href = "${root}/adminMember/adminMember.do">관리자 회원관리</a><br/>
	<c:if test="${admin_name!=null}">
		<a href = "${root}/adminMode/adminModeLogout.do?admin_number=${admin_number}">로그아웃</a><br/>
		<a href="javascript:pageMove('${root}', '${admin.admin_id}', '${admin.admin_password}')">관리자모드 - 추천상품등록</a><br/>
	</c:if>
	<hr/>
	<a href="${root}/adminOrder/adminOrder.do">관리자모드-예약관리</a> <br/>
	<a href="${root}/adminOrder/adminOrderStats.do"> - 매출 통계</a>
	<hr/>
	<a href="${root}/adminProduct/adminProductWrite.do">상품 등록</a><br/>
	<a href="${root}/adminProduct/adminProductList.do">상품 관리</a><br/>
	<a href="${root}/adminProduct/adminBargain.do">할인율 설정</a>
	<hr/>
	<a href="${root}/adminPushNotice/adminPushNotice.do?select=all">알림</a>
</div>

<!-- admin sidebar ends -->
