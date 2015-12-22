<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }" />
<html>
<head>
<title></title>
<link href="${root}/css/side_menu/style.css" rel="stylesheet">
</head>
<body>
	<div class="side_menu_class">
		<div style="border:0px solid black; width:90px; height:23px; line-height: 23px; margin-top:5px;">
			<h2 style="display:inline ;"><span style="font-weight: bold; ">Mypage</span></h2>
		</div>
		<hr style="border:2px solid #464E60;">
		<div style="margin-reight:50px;">
			<ul style="margin:0px; padding:0px;">
				<li><a href="${root}/member/memberUpdate.do?member_id=${member_id}&member_number=${member_number}"">회원정보수정</a></li>
				<li><a href="${root}/member/memberMypageOrder.do?member_number=${member_number}">예약/결제 내역</a></li>
				<li><a href="${root}/memberMypage/memberMypageRe.do?member_number=${member_number}">갔다온상품/후기</a></li>
				<li><a href="${root}/productLike/productLikeList.do?member_number=2">관심상품정보</a></li>
				<li><a href="${root}/member/memberDelete.do?member_id=${member_id}">회원탈퇴</a></li>
				<li><a href="${root}/boardQna/list.do">자유여행저장소</a></li>
			</ul>
		</div>
	</div>
</body>
</html>