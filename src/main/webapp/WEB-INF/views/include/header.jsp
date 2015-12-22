<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="all" href="${root}/css/head/style.css"/>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="${root}/css/boardQna/boardQna.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>

<script type="text/javascript">
//브라우저의 타이틀 변경
	document.title="힐링투어에 오신 것을 환영합니다!";
//브라우저의 아이콘 변경
	var link = document.createElement('link');
    link.rel = 'Shortcut Icon';
    link.href = '${root}/resources/icons/H.ico';
    document.getElementsByTagName('head')[0].appendChild(link);
</script>

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
<div>

	<c:if test="${member_id==null}">
		<div id="loginPage" style="display:none" title="로그인">
			<form action="${root}/member/memberLogin.do" name="memberForm" method="POST" style="margin-top:8px; font-size:  13px;">
				<div>
					아이디 　:&nbsp;<input type="text" name="id"/>
				</div>
				<div style="margin-top: 10px;">
					비밀번호 : <input type="password" name="password"/>
				</div>
				<div align="center" style="margin-top: 10px;">
					<input type="submit" value="로그인">
					<input type="button" id="loginClose" value="취소">
				</div>
			</form>
		</div>
	</c:if>
</div>

<div id = "info">
	<ul>
		<c:if test="${member_id!=null}">
			<li>${member_name} 님 홈페이지방문을 환영합니다!</li>
		</c:if>
		<c:if test="${member_id==null}">
			 <li><a href="${root}/member/memberJoin.do">Join</a></li>
			 <li><a href="#" id="login">Login</a></li>
		 </c:if>
		 <c:if test="${member_id!=null}">
			 <li><a href="${root}/member/memberUpdate.do?member_id=${member_id}&member_number=${member_number}">MyPage</a></li>
			 <li><a href="${root}/member/memberLogout.do">LogOut</a></li>
		</c:if>
			  <li><a href="${root}/boardFaq/list.do">고객센터</a></li>
			 <li><a href="${root}/company/tourInfo.do">회사정보</a></li>
		
		 <li><a href="${root}/main/adminHome.do">(관리자모드)</a></li>
	</ul>
</div>
<div id="header">
  <div class="header_content">
    <div class="logo"><a href="${root}">Healing</a> <span> |　develop tour packages </span></div>
    <div class="menu">
      <ul>
        <li><a href="${root}">home</a></li>
        <li ><a href="${root}/product/productList.do?pc=1">동남아</a></li>
        <li><a href="${root}/product/productList.do?pc=2">중국</a></li>
        <li><a href="${root}/product/productList.do?pc=3">일본</a></li>
        <li><a href="${root}/freeplan/freePlanList.do?member_number=${member_number}">자유여행</a></li>
        <li><a href="${root}/detailSearch/detailSearch.do">간편검색</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="clearBoth"></div>
</body>
</html>