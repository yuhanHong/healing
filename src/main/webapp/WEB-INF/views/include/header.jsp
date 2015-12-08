<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript">
	/* $(function(){
		$("#introduce").accordion({
			active: 0,
			animate: 1000
		});	
	}); */
</script>
<link rel="stylesheet" href="${root}/css/jquery-ui.css" type="text/css">
</head>
<body>
	<div style="border:1px solid red; width:1250px">
		<ul style="list-style-type:none ">
			<li style="float:left">동남아시아여행</li>
			<li style="float:left">인도여행</li>
			<li style="float:left">베이징여행</li>
			<li style="float:left">커뮤니티</li>
			<li style="float:left">커뮤니티</li>
			<li>커뮤니티</li>			
		</ul>
	</div>
	<div style="border:1px solid blue; width:250px; height:800px; float:left">
		<ul id="introduce" style="list-style-type:none;">
			<li><h3>TOUR INFO</h3></li>
			<li><a href="${root}/company/tourInfo.do">회사소개</a></li>
			<li><a href="${root}/company/road.do">찾아오시는길</a></li>
			<li><a href="${root}/company/abroadTour.do">해외여행이용약관</a></li>
			<li><a href="${root}/company/privateInfo.do">개인정보취급방침</a></li>
		</ul>
	</div>
</body>
</html>