<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring HomePage</title>
<style type="text/css">
body{
   font-size:13px;
}

a:link {
	text-decoration:none;
	color:blue
}

a:visited {
	text-decoration:none;
	color:red
}

a:hover {
	text-decoration:underline;
	color:black
}
</style>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<a href="${root}/">초기화면</a>
	<a href="${root}/board/list.do">게시판</a>
	<a href="${root}/fileBoard/list.do">파일게시판</a>
	<c:if test="${id==null}">
		<a href="${root}/member/register.do">회원가입 입니다</a>
		<a href="${root}/member/login.do">로그인</a>
	</c:if>
	<c:if test="${id!=null}">
		<a href="${root}/member/update.do">회원수정</a>
		<a href="${root}/member/delete.do">회원탈퇴</a>
		<a href="${root}/member/logout.do">로그아웃</a>
	</c:if>
	<c:if test="${memberLevel=='AA'}">
		<a href="${root}/member/manager.do">관리자모드</a>
	</c:if>
	<a href="${root}/guest/write.do">방명록</a>
	<a href="${root}/photoAlbum/list.do">사진첩</a>
	<a href="${root}/chat/chat.do">채팅</a>
</body>
</html>