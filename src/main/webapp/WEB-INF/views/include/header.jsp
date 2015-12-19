<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="all" href="${root}/css/head/style.css" />
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css' />
</head>
<body>
<div id = "info">
	<ul>
		 <li><a href="/">Join</a></li>
		 <li><a href="/">Login</a></li>
		 <li><a href="/">MyPage</a></li>
		 <li><a href="${root}/boardFaq/list.do">고객센터</a></li>
		 <li><a href="${root}/company/tourInfo.do">회사정보</a></li>
		 <li><a href="${root}/main/adminHome.do">(관리자모드)</a></li>
	</ul>
</div>
<div id="header">
  <div class="header_content">
    <div class="logo"><a href="">Healing</a> <span>| a simple responsive template</span></div>
    <div class="menu">
      <ul>
        <li><a href="/">home</a></li>
        <li ><a href="${root}/boardNotice/write.do">동남아</a></li>
        <li><a href="#">중국</a></li>
        <li><a href="#">일본</a></li>
        <li><a href="#">자유플랜</a></li>
        <li><a href="#">간편검색</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="clearBoth"></div>
</body>
</html>