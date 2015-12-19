<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#ms_main{
	width:170px; overflow:hidden;
	 margin-top:0px; margin-left:0px;
	border: 0px solid red;
	float: left;
}
#ms_title{
	width:100%; height:50px;
	border: 0px solid green;
	text-align: center;
	line-height:50px;
	font-size:20px;
	background-color:#74D36D;
}

#ms_menu{
	width:100%; overflow:hidden;
	border: 0px solid blue;
}

#ms_menu_detail{
	margin-left:0px;
	width:100%; height:40px;
	line-height:40px;
	border-bottom: 1px solid gray;
	text-align: center;
}

</style>
</head>
<body>
	<div id="ms_main">
		<div id="ms_title"><h3>마이페이지</h3></div>
		<div id="ms_menu">
			<div id="ms_menu_detail"><a href="${root}/member/memberUpdate.do?member_id=${member_id}&member_number=${member_number}">회원정보수정</a></div>
			<div id="ms_menu_detail"><a href="${root}/member/memberMypageOrder.do?member_number=${member_number}">예약/결제 내역</a></div>
			<div id="ms_menu_detail"><a href="${root}/memberMypage/memberMypageRe.do">갔다온상품/후기</a></div>
			<div id="ms_menu_detail"><a href="${root}/productLike/productLikeList.do?member_number=2">관심상품정보</a> </div>
			<div id="ms_menu_detail"><a href="${root}/member/memberDelete.do?member_id=${member_id}">회원탈퇴</a></div>
		</div>
	</div>
</body>
</html>