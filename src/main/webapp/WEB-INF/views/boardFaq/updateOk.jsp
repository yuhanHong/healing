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
	<c:set var="faq_sort" value="${faq_sort}"/>
	<c:set var="searchSort" value="${searchSort}"/>
	
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("수정이 완료되었습니다.");
			location.href="${root}/boardFaq/list.do?faq_sort=${faq_sort}&searchWord=${searchWord}";
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("수정이 완료되지 못 했습니다.");
			location.href="${root}/boardFaq/list.do?faq_sort=${faq_sort}&searchWord=${searchWord}";
		</script>
	</c:if>
</body>
</html>