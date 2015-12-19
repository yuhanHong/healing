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

<script type="text/javascript">
//브라우저의 타이틀 변경
	document.title="힐링투어에 오신 것을 환영합니다!";
//브라우저의 아이콘 변경
	var link = document.createElement('link');
    link.rel = 'Shortcut Icon';
    link.href = '${root}/resources/icons/H.ico';
    document.getElementsByTagName('head')[0].appendChild(link);
</script>

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
    <div class="logo"><a href="${root}">Healing</a> <span>| a simple responsive template</span></div>
    <div class="menu">
      <ul>
        <li><a href="${root}">home</a></li>
        <li ><a href="${root}/product/productList.do?pc=1">동남아</a></li>
        <li><a href="${root}/product/productList.do?pc=2">중국</a></li>
        <li><a href="${root}/product/productList.do?pc=3">일본</a></li>
        <li><a href="${root}/freeplan/freePlanList.do">자유여행</a></li>
        <li><a href="#">간편검색</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="clearBoth"></div>
</body>
</html>