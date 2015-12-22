<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>
	
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<a href="${root}/admin/infoInsert.do">회사정보 등록</a>
	<a href="${root}/adminBanner/bannerInsert.do">관리자모드 - 추천상품등록</a>
</body>
</html>