<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("탈퇴가 정상적으로 진행되었습니다.");
			location.href="${root}/";
		</script>
		<c:remove var="member_id" scope="session"/>
		<c:remove var="member_level" scope="session"/>
		<c:remove var="member_name" scope="session"/>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("탈퇴가 정상적으로 진행되지 않았습니다.");
			location.href="${root}/";
		</script>
	</c:if>
</body>
</html>