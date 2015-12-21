<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${memberDto.member_delete==0}">
		<c:set var="member_id" value="${memberDto.member_id}" scope="session"/>
		<c:set var="member_level" value="${memberDto.member_level}" scope="session"/>
		<c:set var="member_name" value="${memberDto.member_name}" scope="session"/>
		<c:set var="member_number" value="${memberDto.member_number}" scope="session"/>
		<script type="text/javascript">
			alert("로그인 되었습니다.");
			location.href="${root}/main";
		</script>
	</c:if>
	<c:if test="${memberDto.member_delete>0}">
		<script type="text/javascript">
			alert("탈퇴된 아이디 입니다.");
			location.href="${root}/main";
		</script>
	</c:if>
	
</body>
</html>