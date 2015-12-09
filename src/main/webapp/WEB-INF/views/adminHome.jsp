<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>healing</title>
</head>
<body>
	<c:if test="${admin.admin_name!=null}">
 		<c:set var="admin_number" value="${admin.admin_number}" scope="session"/>
 		<c:set var="admin_name" value="${admin.admin_name}" scope="session"/>
 		<c:set var="admin_level" value="${admin.admin_level}" scope="session"/>
 	</c:if>
 	
	<a href = "${root}/adminMode/adminModeCreate.do">관리자 계정생성</a>&nbsp;&nbsp;&nbsp;
	<c:if test="${admin_level=='Master'}">
		<a href = "${root}/adminMode/adminModeUpdate.do">관리자 계정관리</a>
	</c:if>
	<c:if test="${admin_name!=null}">
		<a href = "${root}/adminMode/adminModeLogout.do?admin_number=${admin_number}">로그아웃</a>
	</c:if>
	<br/>
	
 	
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