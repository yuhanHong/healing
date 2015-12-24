<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/adminMember/adminMemberUpdate.css"/>
<script type="text/javascript" src="${root}/js/adminMember/adminMember.js"></script>
<script type="text/javascript">
	function kick(root,member_number){
		// alert(root+","+member_number);
		var check=confirm("정말로 추방하시겠습니까");
		if(check){
			location.href=root+"/adminMember/adminMemberKick.do?member_number="+member_number;
		}
	}
	
	function restore(root,member_number){
		var check=confirm("정말로 복구 하시겠습니까");
		if(check){
			location.href=root+"/adminMember/adminMemberRestore.do?member_number="+member_number;
		}
	}
</script>
</head>
<body>
	<div id="amd_up">
		<ul>
			<li id="amd_up_title"><h3>${memberDto.member_name} 회원님의 정보</h3></li>
			<c:if test="${memberDto.member_delete==1}">
				<li id="amd_up_title" style="color:red;">탈퇴된 회원입니다.</li>
			</c:if>
			
			<c:if test="${memberDto.member_delete==2}">
				<li id="amd_up_title" style="color:red;">추방된 회원입니다.</li>
			</c:if>
		</ul>
	</div>
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
							<option value="normal">일반</option>
							<option value="vip">vip</option>
						</select>
						<script type="text/javascript">
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
					
					<c:if test="${memberDto.member_delete==0 }">
						<li id="adm_content"><input type="button" value="추방" onclick="javascript:kick('${root}','${memberDto.member_number}')"/></li>
					</c:if>
					
					<c:if test="${memberDto.member_delete>0 }">
						<li id="adm_content"><input type="button" value="복구" onclick="javascript:restore('${root}','${memberDto.member_number}')"/></li>
					</c:if>
				</ul>
			</div>
		</div>
	</form>

</body>
</html>