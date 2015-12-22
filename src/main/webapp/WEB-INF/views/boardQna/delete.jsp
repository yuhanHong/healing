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
	<c:set var="searchWord" value="${searchWord}"/>
	<c:set var="searchSort" value="${searchSort}"/>
	<c:set var="pageNumber" value="${pageNumber}"/>
	
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("게시물이 삭제되었습니다.");
			location.href="${root}/boardQna/list.do?searchWord=${searchWord}&searchSort=${searchSort}&pageNumber=${pageNumber}";
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("게시물이 삭제되지 않았습니다.");
			location.href="${root}/boardQna/list.do?searchWord=${searchWord}&searchSort=${searchSort}&pageNumber=${pageNumber}";
		</script>
	</c:if>
</body>
</html>