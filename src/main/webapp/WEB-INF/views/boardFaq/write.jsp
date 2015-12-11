<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 게시판 글작성</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/boardFaq/boardFaq.css"/>
<script type="text/javascript" src=""></script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="Outline">
			<div>
				<div>
					<img src="http://localhost:8181/main/resources/boardImg/img01.PNG" align="center">
					<span>자주 묵는 질문 작성</span>
				</div>
			</div>
			<hr>
			<form class="" action="${root}/boardFaq/write.do" method="post" onsubmit="return boardFaqForm(this)">
				<input type = "hidden" name = "faq_number" value = "${faq_number}"/>
				
				<div class="line" style="margin-top: 20px;">
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
			
				<div class="lineContent" style="height:240px;">
					<div style="margin-top:10px;">
						<label class="title" style="height:230px;">내용</label>
						<span class="textContent" style="height:230px;">
							<textarea rows="14" cols="93" name="faq_content"></textarea>
						</span>
					</div>
				</div>
				
				<div class="searchDiv">
					<input type="submit" value="등록"/>
					<input type="reset" value="취소"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/boardFaq/list.do'"/>
				</div>		
			</form>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>