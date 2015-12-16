<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>healing</title>
<script type="text/javascript" src="${root}/js/adminHome/adminHome.js"></script>
<style type="text/css">
	#adh_login_main{
		width:300px; overflow:hidden;
		border: 0px solid red;
		margin-left:500px; margin-top:100px;
	}
	#adh_login{
		width:100%; height:35px;
		border: 0px solid blue;
		line-height:35px;
		background-color: #CFCFCF;
		font-weight: bold;
	}
	#adh_id{
		width:100%; height:40px;
		border: 0px solid blue;
		line-height:40px;
	}
	#adh_password{
		width:100%; height:40px;
		border: 0px solid blue;
		line-height:40px;
	}
	
</style>
</head>
<body>
	<c:if test="${admin.admin_name!=null}">
 		<c:set var="admin_number" value="${admin.admin_number}" scope="session"/>
 		<c:set var="admin_name" value="${admin.admin_name}" scope="session"/>
 		<c:set var="admin_level" value="${admin.admin_level}" scope="session"/>
 	</c:if>
 	
	<jsp:include page="adminHeader.jsp"/>
	<jsp:include page="adminSide.jsp"/>
	
	<form name="adminHome">
		<input type="hidden" name="admin_id">
		<input type="hidden" name="admin_pw">
	<br/>
	</form>
 	
	<br/><br/>
	<c:if test="${admin_name==null}">
		<form action="${root}/adminMode/adminModeLogin.do" name="adminModeFrom" method="POST" onsubmit="return adminModeFrom(this)">
			<div id="adh_login_main" align="center">
				<div id="adh_login">
					<span>로그인</span>
				</div>
				
				<div id="adh_id">
					<span>아이디</span>
					<input type="text" name="admin_id"/>
				</div>
				<div id="adh_password">
					<span>비밀번호</span>
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