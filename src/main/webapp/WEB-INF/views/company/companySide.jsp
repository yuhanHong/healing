<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/side_menu/style.css" rel="stylesheet">
</head>
<body>
	<div class="side_menu_class">
		<div style="border:0px solid black; width:90px; height:23px; line-height: 23px; margin-top:5px;">
			<h2 style="display:inline;"><span style="font-weight: bold; ">회사 정보</span></h2>
		</div>
		<hr style="border:2px solid #464E60;">
		<div>
			<ul>
				<li><a href="${root}/company/tourInfo.do">회사소개</a></li>
			<li><a href="${root}/company/road.do">찾아오시는길</a></li>
			<li><a href="${root}/company/abroadTour.do">해외여행이용약관</a></li>
			<li><a href="${root}/company/privateInfo.do">개인정보취급방침</a></li>
			</ul>
		</div>
	</div>
</body>
</html>