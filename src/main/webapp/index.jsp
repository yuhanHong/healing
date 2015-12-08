<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }"/>
</head>
<body>
	<h3>Notice 게시판</h3>
	<a href = "${root}/boardNotice/write.do">Notice 게시판 write</a>
	<a href = "${root}/boardNotice/list.do">Notice 게시판 list</a>
</body>
</html>