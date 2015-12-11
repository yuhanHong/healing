<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>healing</title>
<script type="text/javascript" src="${root}/js/adminHome/adminHome.js"></script>
</head>
<body>
	<jsp:include page="adminHeader.jsp"/>
	<jsp:include page="adminSide.jsp"/>
	
	<form name="adminHome">
		<input type="hidden" name="admin_id">
		<input type="hidden" name="admin_pw">
	<c:if test="${admin.admin_name!=null}">
 		<c:set var="admin_number" value="${admin.admin_number}" scope="session"/>
 		<c:set var="admin_name" value="${admin.admin_name}" scope="session"/>
 		<c:set var="admin_level" value="${admin.admin_level}" scope="session"/>
 	</c:if>
 	
	<br/>
	</form>
 	
 	<c:if test="${admin_number!=null}">
 		<h3>${admin_name}님 ${admin_level}계정으로 로그인하셨습니다.</h3>
 	</c:if>
	<br/><br/>
	<c:if test="${admin_name==null}">
		<form action="${root}/adminMode/adminModeLogin.do" name="adminModeFrom" method="POST" onsubmit="return adminModeFrom(this)">
			<div align="center">
				<div>
					<h3>로그인</h3>
				</div>
				
				<div>
					아이디
					<input type="text" name="admin_id"/>
				</div>
				<div>
					비밀번호
					<input type="password" name="admin_password"/>
				</div>
				<div>
					<input type="submit" value="로그인"/>
					<input type="reset" value="취소"/>
				</div>
			</div>
		</form>
	</c:if>
</body>
</html>