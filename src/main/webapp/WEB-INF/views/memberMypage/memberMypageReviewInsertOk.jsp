<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
</head>
<body>
	<input type="hidden" value="${member_number}" id="member_number"/>
	<c:if test="${check>0}">
		<script type="text/javascript">
			var member_number=document.getElementById("member_number").value;
			alert("후기를 작성해주셔서 감사합니다.");
			location.href="${root}/memberMypage/memberMypageRe.do?member_number="+member_number;
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("후기가 정삭적으로 작성되지 않았습니다.");
			location.href="${root}/memberMypage/memberMypageRe.do?member_number="+member_number;
		</script>
	</c:if>

</body>
</html>