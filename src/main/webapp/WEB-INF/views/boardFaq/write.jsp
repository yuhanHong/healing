<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 게시판 글작성</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href=""/>
<script type="text/javascript" src=""></script>
</head>
<body>
	<div >
		<div class="boardList">
			<div>고객센터</div>
			<hr>
			<div class="boardList_li">
				<ul>
					<li>공지사항</li>
					<li>자주 묻는 질문</li>
					<li>상품문의</li>
				</ul>
			</div>
		</div>
		<div class="boardContent">
			<div>자주 묻는 질문 작성</div>
			<hr>
			<form class="" action="${root}/boardFaq/write.do" method="post" onsubmit="return boardFaqForm(this)">
				<input type = "hidden" name = "faq_number" value = "${faq_number}"/>
				
				<div class="line">
					<label class="title">구분</label>
					<span class="content">
						<input type="radio" name="faq_sort" value="package" checked="checked">패키지여행
						<input type="radio" name="faq_sort" value="free">자유여행
						<input type="radio" name="faq_sort" value="air">항공
						<input type="radio" name="faq_sort" value="hotel">호텔
						<input type="radio" name="faq_sort" value="reservation">예약/결제
						<input type="radio" name="faq_sort" value="homepage">홈페이지
						<input type="radio" name="faq_sort" value="etc">기타
					</span>
				</div>
				
				<div class="line">
					<label class="title">제목</label>
					<span class="content">
						<input type="text" name="faq_title"/>
					</span>
				</div>
			
				<div class="line" style="height:230px;">
					<label class="title" style="height:230px;">내용</label>
					<span class="content" style="height:230px;">
						<textarea rows="14" cols="67" name="faq_content"></textarea>
					</span>
				</div>
				
				<div class="line" style="width:598px; border-width:2px; text-align:center;">
					<input type="submit" value="등록"/>
					<input type="reset" value="취소"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/boardFaq/list.do'"/>
				</div>		
			</form>
		</div>
	</div>
</body>
</html>