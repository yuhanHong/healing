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
<link rel="stylesheet" type="text/css" href="${root}/css/member/memberUpdate.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>
 <script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<jsp:include page="../memberMypage/mypageSide.jsp"/>
<div id="updateTotal">
	<div id="title"><span>회원수정</span></div>
	<form action="${root}/member/memberUpdateOk.do" name="memberForm" method="POST" onsubmit="return joinForm(this)">
		<div id="memberSection">
			<div id="memberOp">
				<div id="subj"><span>아이디</span></div>
				<div id="fieldDiv">
					<input type="text" value="${memberDto.member_id}" disabled="disabled" size="40"/>
					
				</div>
				<input type="hidden" name="member_id" value="${memberDto.member_id}"/>
				<input type="hidden" name="member_number" value="${member_number}"/>
			</div>
			<div id="memberOp">
				<div id="subj"><span>비밀번호</span></div>
				<div id="fieldDiv">
					<input type="password" name="member_password" size="40"/>
				</div>
			</div>
			<div id="memberOp">
				<div id="subj"><span>비밀번호확인</span></div>
				<div id="fieldDiv">
					<input type="password" name="passwordCheck" size="40"/>
				</div>
			</div>
			<div id="memberOp">
				<div id="subj"><span>이름</span></div>
				<div id="fieldDiv">
					<input type="text" name="member_name" value="${memberDto.member_name}" disabled="disabled" size="40"/>
				</div>
			</div>
			<div id="memberOp">
				<div id="subj"><span>전화번호</span></div>
				<div id="fieldDiv">
					<input type="text" name="member_phone" value="${memberDto.member_phone}" size="40" />
					
				</div>
			</div>
			<div id="memberOp">
				<div id="subj"><span>이메일</span></div>
				<div id="fieldDiv">
					<input type="text" name="member_email" value="${memberDto.member_email}" size="40"/>
				</div>
				수신동의&nbsp;
				yes
				<input type="radio" name="member_email_check" value="yes"/>
				no
				<input type="radio" name="member_email_check" value="no" checked="checked"/>
				<script type="text/javascript">
					for(var i=0;i<memberForm.member_email_check.length;i++){
						if(memberForm.member_email_check[i].value=="${memberDto.member_email_check}"){
							memberForm.member_email_check[i].checked=true;
						}
					}
				</script>
			</div>
			<br/>
			<div id="tabs" style="width:500px;">
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
			<c:forEach var="interest" items="${interestList}">
				<script type="text/javascript">
					for(var i=0;i<memberForm.interest_content.length;i++){
						if(memberForm.interest_content[i].value=="${interest.interest_content}"){
							memberForm.interest_content[i].checked=true;
						}
					}
				</script>
			</c:forEach>
			</div>
			<div>
				<input type="submit" value="수정"/>
				<input type="button" onclick="location.href='${root}/'" value="취소"/>
			</div>
		</div>
	</form>
</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>