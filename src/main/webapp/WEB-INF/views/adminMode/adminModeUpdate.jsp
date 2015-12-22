<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/adminMode/adminUpdate.css"/>
<script type="text/javascript" src="${root}/js/adminMode/adminModeUpdate.js"></script>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>
	<div style="width:1200px;">
		<h2 style="margin-top: 40px;">관리자 계정 관리</h2>
		
		<div id="adu_nav">
			<div id="adminUpdateMenu">
				<ul id="adminUpdateUl">
					<li >이름</li>
					<li>아이디</li>
					<li>이메일</li>
					<li>관리자타입</li>
					<li>관리자번호</li>
					<li>관리</li>
				</ul>
			</div>
			<br/>
			
			<c:forEach var="admin" items="${adminList}" varStatus="status">
				<form  id="adminUpdateMenu" action="${root}/adminMode/adminModeUpdateOk.do" method="POST" name="adminForm" onsubmit="return adminUpdateForm(this)">
					<ul>
						<li >
							<input type="text" name="admin_name" value="${admin.admin_name}" size="15"/>
							<input type="hidden" name="admin_number" value="${admin.admin_number}"/>
						</li>
						<li>
							<input type="text" name="admin_id" value="${admin.admin_id}" size="15"/>
						</li>
						<li>
							<input type="text" name="admin_email" value="${admin.admin_email}" size="15"/>
						</li>
						<li>
							<c:if test="${admin.admin_level=='Master'}">
								Master
							</c:if>
							
							<c:if test="${admin.admin_level!='Master'}">
								<c:set var="a" value="${status.index}"/>
								
								<select name="admin_level">
									<option value="게시판관리자">게시판관리자</option>
									<option value="상담사">상담사</option>
								</select>
								
								<script type="text/javascript">
									var vel=$("select[name='admin_level']");
									var b='${status.index-1}';
									for(var i=0;i<2;i++){		
										if(vel[b][i].value=="${admin.admin_level}"){
											vel[b][i].selected=true;
										}
									} 
								</script>
							</c:if>
						</li>
						<li>${admin.admin_number}</li>
						<li>
							<input type="submit" value="수정"/>
							<c:if test="${admin.admin_level!='Master'}">
								<input type="button" value="삭제" onclick="location.href='${root}/adminMode/adminModeDelete.do?admin_number=${admin.admin_number}'"/>
							</c:if>
						</li>
					</ul>
				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>