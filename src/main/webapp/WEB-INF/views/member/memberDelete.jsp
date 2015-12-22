<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class">
	<jsp:include page="../include/memberMypageSideMenu.jsp"/>
	
	<div class="content_class">
		
		<div style="float:left;">
			<img src="${root}/resources/boardImg/img01.PNG" align="center">
			<h2 style="display:inline;"><span style="font-weight: bold; ">회원 탈퇴</span></h2>
		</div>
			
				
		<hr style="border:2px solid green; margin-top: 36px;">
		<div style="margin-left: 10px;width: 200px;">

			<form action="${root}/member/memberDeleteOk.do" method="POST">
				<div style="width:500px; overflow: hidden; margin-top: 120px; margin-left: 230px;">
	
					<div>
						아이디 &nbsp;&nbsp;&nbsp;
						<input type="text" name="member_id" value="${member_id}" disabled="disabled">
						<input type="hidden" name="member_id" value="${member_id}"/>
					</div>
					<div style="margin-top: 20px;">
						비밀번호
						<input type="password" name="member_password"/>
					</div>
					<div style="margin-top: 20px; margin-left: 80px;">
						<input type="submit" value="탈퇴"/>
						<input type="reset" value="취소"/>			
					</div>
				</div>
			</form>
		</div>	

		</div>
	</div>
	<div style="width:1000px;height: 140px;"></div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>