<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" media="all" href="${root}/css/head/style.css" />
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css' />

<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.flexslider-min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="slider.jsp"/>
<%-- <jsp:include page="side_menu.jsp"/> --%>
<!-- 최근 본 상품 include 된 부분  -->
 <c:import url="../recentProduct/recentProduct.jsp"/>
<jsp:include page="footer.jsp"/>
</body>
</html>