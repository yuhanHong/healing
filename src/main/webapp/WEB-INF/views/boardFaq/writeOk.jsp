<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("FAQ가 등록되었습니다.");
			location.href="${root}/boardFaq/list.do";
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("FAQ가 등록 되지 않았습니다.");
			location.href="${root}/boardFaq/write.do";
		</script>
	</c:if>
</body>
</html>