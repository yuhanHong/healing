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
			alert("회원이 정상적으로 복구되었습니다.");
			location.href="${root}/adminMember/adminMemberUpdate.do?member_number=${member_number}";
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("회원이 정상적으로 복구되지 않았습니다.");
			location.href="${root}/adminMember/adminMemberUpdate.do?member_number=${member_number}";
		</script>
	</c:if>
</body>
</html>