<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- admin header starts -->

<link rel="Shortcut Icon" href="${root}/resources/icons/H.ico" />
<script type="text/javascript">
	//브라우저의 타이틀 변경
	document.title="힐링투어에 오신 것을 환영합니다!";
	
	//브라우저의 아이콘 변경
	var link = document.createElement('link');
	link.rel = 'Shortcut Icon';
	link.href = '${root}/resources/icons/H.ico';
	document.getElementsByTagName('head')[0].appendChild(link);
</script>

<div style="width: 1200px;">
	admin 헤더1
	<hr/>
	admin 헤더2
	<hr/>
	admin 헤더3
	<hr/>
</div>

<!-- admin header ends -->
