<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/adminMode/adminSide.css"/> 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
 <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script>
 $(function() {
   $( "#menu" ).menu({
     items: "> :not(.ui-widget-header)"
   });
 });
 </script>
 <style>
 .ui-menu { width: 200px; }
 .ui-widget-header { padding: 0.2em; }
 </style>
</head>
<!-- admin sidebar starts -->

<div id="adminSide" style="width: 200px; float: left;">
	<ul id="menu" style="border: 0px;">
	
		<li><a href = "${root}/adminMode/adminModeCreate.do">관리자 계정생성</a></li>
		
			<li>
				<a href = "${root}/adminMode/adminModeUpdate.do">관리자 계정관리</a>
			</li>
		<!--<c:if test="${admin_level=='Master'}"> </c:if>-->
		
		<li><a href = "${root}/adminMember/adminMember.do">회원관리</a></li>
		
		<li><a href="${root}/adminBanner/bannerInsert.do">배너 상품 관리</a></li>	
		<li><a href="${root}/adminOrder/adminOrder.do">예약관리</a> </li>
		<li><a href="${root}/adminOrder/adminOrderStats.do">매출 통계</a></li>
		<li><a href="${root}/adminProduct/adminProductWrite.do">상품 등록</a></li>
		<li><a href="${root}/adminProduct/adminProductList.do">상품 관리</a></li>
		<li><a href="${root}/adminProduct/adminBargain.do">할인율 설정</a></li>
		<li><a href="${root}/adminPushNotice/adminPushNotice.do?select=all">알림</a></li>
		<c:if test="${admin_name!=null}">
			<li>
				<a href = "${root}/adminMode/adminModeLogout.do?admin_number=${admin_number}">로그아웃</a>
			</li>
		</c:if>

	</ul>
</div>

<!-- admin sidebar ends -->
