<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="${root}/css/adminMode/adminHeader.css"/>
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
	
	//web workers 부분
	var w = new Worker("${root}/js/adminMode/workers.js");
    w.onmessage = function(event) {
       document.getElementById("result").innerHTML = event.data;
	}

</script>

<div style="width: 1200px;">
	<div style="margin-top:20px; width:300px;">
		<h1 style="margin-left: 30px;" id="adminHegerTitle"><a href="${root}/adminHome.do">Healing</a></h1>
		<div class="adminHeaderDiv" style="margin-left: 800px;">
			<c:if  test="${admin_number!=null}">
		 		<ul>
		 			<li style="width:80px; height: 60px;"><output id="result"></output></li>
		 			<li><span style="font-size: 13px;">${admin_name}님 ${admin_level}계정으로 로그인하셨습니다.</span></li>
				</ul>
		 	</c:if>
		</div>
	</div>
</div>
<div style="clear: both;"></div>
<hr/>
<!-- admin header ends -->
