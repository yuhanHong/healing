<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${root}/script/memberScript/memberScript.js "></script>
<title>Insert title here</title>
</head>
<body>
<div>
	<h3>회원가입</h3>
	<form action="${root}/member/memberJoinOk.do" method="POST" onsubmit="return JoinFrom(this)">
		<div align="center">
			<div>
				아이디
				<input type="text" name="member_id"/>
			</div>
			<div>
				비밀번호
				<input type="password" name="member_password"/>
			</div>
			<div>
				비밀번호확인
				<input type="passwordCheck" name="passwordCheck"/>
			</div>
			<div>
				이름
				<input type="text" name="member_name"/>
			</div>
			<div>
				전화번호
				<input type="text" name="member_phone"/>
			</div>
			<div>
				e-mail
				<input type="text" name="member_email"/>
				수신동의&nbsp;
				yes
				<input type="radio" name="member_email_check" value="yes"/>
				no
				<input type="radio" name="member_email_check" value="no"/>
			</div>
			<div>
				<input type="submit" value="가입"/>
				<input type="reset" value="취소"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>