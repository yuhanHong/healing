<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- 일반 사용자 header starts -->

<script type="text/javascript">
	document.title="힐링투어에 오신 것을 환영합니다!";
</script>

<div>
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
	
	<a href="${root}/">초기화면</a> / 
		
	<c:if test="${member_id==null}">
		<a href="${root}/member/memberJoin.do">일반사용자 회원가입</a> / 
		<a href="#" id="login">로그인</a> / 
		<div id="loginPage" style="display:none" title="로그인">
			<form action="${root}/member/memberLogin.do" name="memberForm" method="POST">
				<div>
					아이디 : <input type="text" name="id"/>
				</div>
				<div>
					비밀번호 : <input type="password" name="password"/>
				</div>
				<div>
					<input type="submit" value="로그인">
					<input type="button" id="loginClose" value="취소">
				</div>
			</form>
		</div>
	</c:if>
	
	<c:if test="${member_id != null}">
		<a href="${root}/member/memberUpdate.do?member_id=${member_id}&member_number=${member_number}">회원수정</a> / 
		<a href="${root}/member/memberDelete.do?member_id=${member_id}">회원탈퇴</a> / 
		<a href="${root}/member/memberLogout.do">로그아웃</a> / 
	</c:if>
	
	<c:if test="${memberLevel=='AA'}">
		<a href="${root}/admin/manager.do">관리자모드</a> / 
    </c:if>
    
	<a href="${root}/company/tourInfo.do">회사소개</a> / 
	
	<a href="${root}/order/write.do">예약</a> / 
	<a href="${root}/adminOrder/adminOrder.do">관리자모드-예약관리</a> / 
	
	<a href = "${root}/boardNotice/write.do">Notice 게시판 write</a> / 
	<a href = "${root}/boardNotice/list.do">Notice 게시판 list</a> / 
	<a href = "${root}/boardQna/list.do">Q&A 게시판 list</a> / 

	<div>
		<c:if test="${member_name != null}">
			${member_name}님 환영합니다.
		</c:if>
	</div>
	
	<a href = "${root}/adminHome.do">관리자 시작지점</a>
</div>

<hr/>
일반사용자 헤더2
<hr/>
일반사용자 헤더3
<hr/>

<!-- 일반 사용자 header starts -->
