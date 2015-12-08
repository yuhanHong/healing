<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
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
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>
<script type="text/javascript">
$(function(){
	$("#loginPage").dialog({
		autoOpen:false
	});
	
	$("#login").on("click",function(){
		$("#loginPage").dialog("open");
	});
	
	$("#loginClose").on("click",function(){
		$("#loginPage").dialog("close");
	});
});
</script>
</head>
<body>
	<c:if test="${memberDto.member_delete==0}">
		<c:set var="member_id" value="${memberDto.member_id}" scope="session"/>
		<c:set var="member_level" value="${memberDto.member_level}" scope="session"/>
		<c:set var="member_name" value="${memberDto.member_name}" scope="session"/>
		<c:set var="member_number" value="${memberDto.member_number}" scope="session"/>
	</c:if>
	<c:if test="${memberDto.member_delete==1}">
		<script type="text/javascript">
			alert("탈퇴된 아이디 입니다.");
		</script>
	</c:if>
	
	<a href="${root}/">초기화면</a>
	<a href="${root}/board/list.do">게시판입니다</a>
	<a href="${root}/fileBoard/list.do">파일게시판</a>
	<c:if test="${memberDto.member_id==null}">
		<a href="${root}/member/memberJoin.do">회원가입 입니다</a>
		<a href="#" id="login">로그인</a>
		<div id="loginPage" style="display:none" title="로그인">
			<form action="${root}/member/memberLogin.do" name="memberForm" method="POST">
				<div>
					아이디<input type="text" name="id"/>
				</div>
				<div>
					비밀번호<input type="password" name="password"/>
				</div>
				<div>
					<input type="submit" value="로그인">
					<input type="button" id="loginClose" value="취소">
				</div>
			</form>
		</div>
	</c:if>
	<c:if test="${member_id!=null}">
		<a href="${root}/member/memberUpdate.do?member_id=${member_id}&member_number=${member_number}">회원수정</a>
		<a href="${root}/member/memberDelete.do?member_id=${member_id}">회원탈퇴</a>
		<a href="${root}/member/memberLogout.do">로그아웃</a>
	</c:if>
	<c:if test="${memberLevel=='AA'}">
		<a href="${root}/member/manager.do">관리자모드</a>
	</c:if>
	<a href="${root}/guest/write.do">방명록</a>
	<a href="${root}/photoAlbum/list.do">사진첩</a>
	<a href="${root}/chat/chat.do">채팅</a>
	<a href="${root}/order/write.do">예약</a>
	<a href="${root}/adminOrder/adminOrder.do">관리자모드-예약관리.</a>
	<a href="${root}/company/tourInfo.do">회사소개</a>
	<div>
		${member_name}님 환영합니다.
	</div>
</body>
</html>