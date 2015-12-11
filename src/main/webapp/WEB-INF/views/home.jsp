<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Spring HomePage</title>
<link rel="stylesheet" type="text/css" href="${root}/css/home/home.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>

</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<br/><br/><br/><br/>
	<h3>본문1</h3>
	<hr/>
	<h3>본문2</h3>
	<hr/>
	<h3>본문3</h3>
	<hr/>
	<h3>본문4</h3>
	<br/><br/><br/><br/>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>