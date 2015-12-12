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
<link rel="stylesheet" type="text/css" href="${root}/css/adminMember/adminMemberUpdate.css"/>
<script type="text/javascript" src="${root}/js/adminMember/adminMember.js"></script>
</head>
<body>
	<h3>${memberDto.member_name} 회원님의 정보</h3>
	<a href="">${memberDto.member_name}님의 예약정보</a>
	<form action="${root}/adminMember/adminMemberUpdateOk.do" method="POST">
		<div id="adm_updateForm">
			<div id="adm_update">
			<input type="hidden" name="member_number" value="${memberDto.member_number}"/>
				<ul>
					<li id="adm_content">아이디</li>
					<li id="adm_content"><input type="text" name="member_id" value="${memberDto.member_id}"/></li>
				</ul>
			</div>
			<div id="adm_update">
				<ul>
					<li id="adm_content">전화번호</li>
					<li id="adm_content"><input type="text" name="member_phone" value="${memberDto.member_phone}"/></li>
				</ul>
			</div>
			<div id="adm_update">
				<ul>
					<li id="adm_content">이메일</li>
					<li id="adm_content"><input type="text" name="member_email" value="${memberDto.member_email}"/></li>
				</ul>
			</div>
			<div id="adm_update">
				<ul>
					<li id="adm_content">등급</li>
					<li id="adm_content1">
						<select name="member_level">
							<option value="nomal">일반</option>
							<option value="vip">vip</option>
						</select>
						<script type="text/javascript">
// 							var vel=$("select[name='member_level']");
// 							alert(vel.val);
							
// 							for(var i=0;i<2;i++){		
// 								console.log(vel[i].value);
// 								if(vel[i].value=="${memberDto.member_level}"){
// 									vel[i].selected=true;
// 								}
// 							}
							var sel=adm_content1.children[0];
							
							for(var i=0;i<sel.children.length;i++){	
								if(sel[i].value=="${memberDto.member_level}"){
									sel[i].selected=true;
								}
							}
							
						</script>
					</li>
				</ul>
			</div>
			<div id="adm_update">
				<ul>
					<li id="adm_content"><input type="submit" value="수정"/></li>
					<li id="adm_content"><input type="button" value="닫기" onclick="javascript:self.close()"/></li>
					<li id="adm_content"><input type="button" value="추방"/></li>
				</ul>
			</div>
		</div>
	</form>

</body>
</html>