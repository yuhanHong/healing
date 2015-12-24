<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }" />
<html>
<head>
<title></title>
<link href="${root}/css/side_menu/style.css" rel="stylesheet">
<script type="text/javascript" src="${root}/js/boardNotice/boardNoticeWrite.js"></script>
</head>
<body>
	<div class="side_menu_class">
		<div style="border:0px solid black; width:90px; height:23px; line-height: 23px; margin-top:5px;">
			<h2 style="display:inline;"><span style="font-weight: bold; ">고객센터</span></h2>
		</div>
		<hr style="border:2px solid #464E60;">
		<div>
			<ul>
				<li><a href="${root}/boardFaq/list.do">자주묻는질문</a></li>
				<li><a href="${root}/boardNotice/list.do">공지사항</a></li>
				<li><a href="${root}/boardQna/list.do">문의사항</a></li>
			</ul>
		</div>
	</div>
</body>
</html>