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
<link rel="stylesheet" type="text/css" href="${root}/css/member/memberJoin.css"/>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>
 <script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
<div id="joinTotal">
	
	<div id="minititle">member Join</div>
	<div id="title">Healing 회원가입</div>
	<form action="${root}/member/memberJoinOk.do" name="memberForm" method="POST" onsubmit="return joinForm(this)">
		<div>
			<div id="memberSection">
				<div id="memberId">
					<div id="subj">아이디</div>
					<div id="fieldDiv">
						<input type="text" size="50" id="field" name="member_id" size="20" maxlength="10" onkeypress="idCheck(memberForm,'${root}')" onkeyup="idCheck(memberForm,'${root}')"/>
					</div>
					<div id="exFieldi">&nbsp;</div>
				</div>
				
				<div>
					<div id="subj">비밀번호</div>
					<div id="fieldDiv">
						<input type="password" size="50" id="field" name="member_password"/>
					</div>
					<div id="exField">&nbsp;</div>
				</div>
				<div>
					<div id="subj">비밀번호확인</div>
					<div id="fieldDiv">
						<input type="password" size="50" id="field" name="passwordCheck"/>
					</div>
					<div id="exField">&nbsp;</div>
				</div>
				<div>
					<div id="subj">이름</div>
					<div id="fieldDiv">
						<input type="text" size="50" id="field" name="member_name"/>
					</div>
					<div id="exField">&nbsp;</div>
				</div>
				<div>
					<div id="subj">전화번호</div>
					<div id="fieldDiv">
						<input type="text" size="50" id="field" name="member_phone"/>
					</div>
					<div id="exField">&nbsp;</div>
				</div>
				<div>
					<div id="subj">이메일</div>
					<div id="fieldDiv">
						<input type="text" size="50" id="field" name="member_email"/>
					</div>
					<div id="exField">
						수신동의&nbsp;
						yes
						<input type="radio" name="member_email_check" value="yes"/>
						no
						<input type="radio" name="member_email_check" value="no" checked="checked"/>
					</div>
				</div>
			</div>
			<br/>
			<div id="tabs" style="width:800px;">
			  <ul>
			    <li><a href="#tabs-1">동남아</a></li>
			    <li><a href="#tabs-2">중국</a></li>
			    <li><a href="#tabs-3">일본</a></li>
			  </ul>
			  <div id="tabs-1">
			    <p>
			    <input type="checkbox" name="interest_content" value="캄보디아"/>캄보디아 &nbsp;&nbsp;
			    <input type="checkbox" name="interest_content" value="태국"/>태국 &nbsp;&nbsp;
			    
			    </p>
			  </div>
			  <div id="tabs-2">
			    <p></p>
			  </div>
			  <div id="tabs-3">
			    <p>
			    	<input type="checkbox" name="interest_content" value="도쿄"/>도쿄 &nbsp;&nbsp;
			    	<input type="checkbox" name="interest_content" value="오사카"/>오사카 &nbsp;&nbsp;
			    	<input type="checkbox" name="interest_content" value="오키나와"/>오키나와 &nbsp;&nbsp;
				    <input type="checkbox" name="interest_content" value="훗카이도"/>훗카이도 &nbsp;&nbsp;
			   		<input type="checkbox" name="interest_content" value="쿄토"/>쿄토 &nbsp;&nbsp;
			    </p>
			  </div>
			</div>
			<div>
				<input type="submit" value="가입"/>
				<input type="reset" value="취소"/>
			</div>
		</div>
	</form>
</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>