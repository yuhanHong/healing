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
<link rel="stylesheet" type="text/css" href="${root}/css/adminMode/adminUpdate.css"/>
<script type="text/javascript" src="${root}/js/adminMode/adminModeUpdate.js"></script>
</head>
<body>
	<div>
		<h3>관리자 계정관리</h3>
	</div>
	<div>
		<ul>
			<li id="adminUpdateMenu">이름</li>
			<li id="adminUpdateMenu">아이디</li>
			<li id="adminUpdateMenu">이메일</li>
			<li id="adminUpdateMenu">관리자타입</li>
			<li id="adminUpdateMenu">관리자번호</li>
		</ul>
		<br/>
		
		<c:forEach var="admin" items="${adminList}">
			<form action="${root}/adminMode/adminModeUpdateOk.do" method="POST" name="adminForm" onsubmit="return adminUpdateForm(this)">
				<ul>
					<li id="adminList">
						<input type="text" name="admin_name" value="${admin.admin_name}" size="15"/>
						<input type="hidden" name="admin_number" value="${admin.admin_number}"/>
					</li>
					<li id="adminList">
						<input type="text" name="admin_id" value="${admin.admin_id}" size="15"/>
					</li>
					<li id="adminList">
						<input type="text" name="admin_email" value="${admin.admin_email}" size="15"/>
					</li>
					<li id="adminList">
						<c:if test="${admin.admin_level=='Master'}">
							Master
						</c:if>
						
						<c:if test="${admin.admin_level!='Master'}">
							<select name="level">
								<option value="게시판관리자">게시판관리자</option>
								<option value="상담사">상담사</option>
							</select>
							<script type="text/javascript">
								// console.log($("select[name='level']").length);
								var vel=$("select[name='level']");
								//console.log(vel[0][0]);
								console.log(vel.length);
								//console.log(vel[0][1]);
								for(var i=0;i<vel.length;i++){				
									if(vel[0][i].value=="${admin.admin_level}"){
										// console.log(vel[0][i]);
										// console.log('${admin.admin_level}');
										vel[0][i].selected=true;
									}
								} 
							</script>
						</c:if>
					<%-- 	<input type="text" value="${admin.admin_level}" size="15"/> --%>
					</li>
					<li id="adminList">${admin.admin_number}</li>
					<li id="adminList">
						<input type="submit" value="수정"/>
						<c:if test="${admin.admin_level!='Master'}">
							<input type="button" value="삭제"/>
						</c:if>
					</li>
				</ul>

				<br/><br/>
			</form>
		</c:forEach>
	</div>
</body>
</html>