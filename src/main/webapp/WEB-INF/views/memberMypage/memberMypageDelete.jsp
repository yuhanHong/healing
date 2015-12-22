<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("자유여행 일정이 삭제되었습니다.");
			location.href="${root}/memberMypage/memberFreeplan.do?member_number="+${member_number}; 
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("자유여행 일정이 삭제되지 않았습니다.");
			location.href="${root}";
		</script>
	</c:if>
</body>
</html>