<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/adminMode/adminModeCreate.css"/>
</head>
<body>
	<jsp:include page="../adminHeader.jsp"/>
	<jsp:include page="../adminSide.jsp"/>
	<div style="width:1200px;">
		<h2 style="margin-top: 40px;">관리자 계정 생성</h2>
		
		<form id="adc_form" action="${root}/adminMode/adminModeCreateOk.do" name="adminModeFrom" method="POST" onsubmit="return adminModeFrom(this)">
			<div id="adc_content">
				<div>
					<div id="adc_text">
						아이디
					</div>
					<div id="adc_input">
						<input type="text" name="admin_id" size="30"/>
					</div>
				</div>
				<div>
					<div id="adc_text">
						이름
					</div>
					<div id="adc_input">
						<input type="text" name="admin_name" size="30"/>
					</div>
				</div>
				<div>
					<div id="adc_text">
						비밀번호
					</div>
					<div id="adc_input">
						<input type="password" name="admin_password" size="30"/>
					</div>
				</div>
				<div>
					<div id="adc_text">
						비밀번호확인
					</div>
					<div id="adc_input">
						<input type="password" name="admin_password_check" size="30"/>
					</div>
				</div>
				<div>
					<div id="adc_text">
						이메일
					</div>
					<div id="adc_input">
						<input type="text" name="admin_email" size="30"/>
					</div>
				</div>
				
				<div>
					<div id="adc_text">
						사원타입
					</div>
					<div id="adc_input">
						<select name="admin_level">
							<option value="게시판관리자">게시판관리자</option>
							<option value="상담사">상담사</option>
						</select>
					</div>
				</div>
				
				<div align="center">
					<input type="submit" value="생성"/>
					<input type="button" value="취소" onclick="location.href='${root}/adminHome.do'"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>