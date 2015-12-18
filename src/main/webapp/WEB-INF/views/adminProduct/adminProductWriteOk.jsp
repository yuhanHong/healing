<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productWrite</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("상품등록이 완료되었습니다.");
			location.href="${root}/adminProduct/adminProductWrite.do";
		</script>
	</c:if>
	<c:if test="${check==null}">
		<script type="text/javascript">
			alert("상품등록을 완료하지 못하였습니다.");
			location.href="${root}/adminProduct/adminProductWrite.do";
		</script>
	</c:if>
</body>
</html>