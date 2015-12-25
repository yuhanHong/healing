<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<head>
<link rel="stylesheet" type="text/css" href="${root}/css/adminMode/adminHeader.css"/>
<!-- admin header starts -->
<link rel="Shortcut Icon" href="${root}/resources/icons/H.ico" />
<link rel="stylesheet" type="text/css" media="all" href="${root}/css/head/style.css"/>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>
<script type="text/javascript">
	// 브라우저의 타이틀 변경
	document.title="힐링투어에 오신 것을 환영합니다!";
	
	// 브라우저의 아이콘 변경
	var link = document.createElement('link');
	link.rel = 'Shortcut Icon';
	link.href = '${root}/resources/icons/H.ico';
	document.getElementsByTagName('head')[0].appendChild(link);
	
	// web workers 부분
	var w = new Worker("${root}/js/adminMode/workers.js");
    w.onmessage = function(event) {
       document.getElementById("result").innerHTML = event.data;
	}

</script>
</head>
<body>
	<div id = "info" style="border: 0px;">
 		<ul>
 			<c:if  test="${admin_number!=null}">
	 			<li style="width:80px;height: 60px; line-height: -10px;"><output id="result"></output></li>
	 			<li style="margin-left: -50px; line-height: 16px;"><span style="font-size: 13px;" >${admin_name}님 ${admin_level}계정으로 로그인하셨습니다.</span></li>
				<li style="font-size: 13px; line-height: 16px;"><b><a href="${root}/boardFaq/list.do">게시판 관리</a></b></li>
			</c:if>
		</ul>
	</div>	

	<div id="header" style="background-color: #aaaaaa">
	  <div class="header_content">
	    <div class="logo"><a href="${root}"><label  style="color: write;">Healing </label></a> <span> |　develop tour packages </span></div>
	  
	    </div>
	  </div>
	</div>
</body>
<div class="clearBoth"></div>
<!-- admin header ends -->
