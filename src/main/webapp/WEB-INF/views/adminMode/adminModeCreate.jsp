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
	<h3>관리자 계정생성</h3>
	<br/><br/>
	<form action="${root}/adminMode/adminModeCreateOk.do" name="adminModeFrom" method="POST" onsubmit="return adminModeFrom(this)">
		<div>
			<div>
				아이디
				<input type="text" name="admin_id"/>
			</div>
			<div>
				이름
				<input type="text" name="admin_name"/>
			</div>
			<div>
				비밀번호
				<input type="password" name="admin_password"/>
			</div>
			<div>
				비밀번호확인
				<input type="password" name="admin_password_check"/>
			</div>
			<div>
				이메일
				<input type="text" name="admin_email"/>
			</div>
			
			<div>
				사원타입
				<select name="admin_level">
					<option value="게시판관리자">게시판관리자</option>
					<option value="상담사">상담사</option>
				</select>
			</div>
			
			<div>
				<input type="submit" value="생성"/>
				<input type="button" value="취소" onclick="location.href='${root}/adminHome.do'"/>
			</div>
		</div>
	</form>
</body>
</html>