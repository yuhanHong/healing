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
	<jsp:include page="../include/header.jsp"/>
	<jsp:include page="../include/memberMypageSideMenu.jsp"/>
	
	<form action="${root}/member/memberDeleteOk.do" method="POST">
		<div style="width:500px; overflow: hidden;">
			<div style="margin-left:100px;">
				<h3>회원탈퇴</h3>
			</div>
		
			<div>
				아이디
				<input type="text" name="member_id" value="${member_id}" disabled="disabled">
				<input type="hidden" name="member_id" value="${member_id}"/>
			</div>
			<div>
				비밀번호
				<input type="password" name="member_password"/>
			</div>
			<div>
				<input type="submit" value="탈퇴"/>
				<input type="reset" value="취소"/>			
			</div>
		</div>
	</form>
	
<jsp:include page="../include/footer.jsp"/>
</body>
</html>