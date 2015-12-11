<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src=""></script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="boardContent">
			<div>FAQ 수정</div>
			<hr>
			<form class="" action="${root}/boardFaq/update.do" method="post" onsubmit="return boardFaqForm(this)">
				
				<input type = "hidden" name = "faq_number" value = "${boardFaqDto.faq_number}"/>
				<input type = "hidden" name = "searchWord" value = "${searchWord}"/>
				
				<div class="line">
					<label class="title">분류</label>
					<span class="content">
						<input type="radio" name="faq_sort" <c:if test="${boardFaqDto.faq_sort eq 'package'}">checked="checked"</c:if> value="package"/>패키지여행
						<input type="radio" name="faq_sort" <c:if test="${boardFaqDto.faq_sort eq 'free'}">checked="checked"</c:if> value="free">자유여행
						<input type="radio" name="faq_sort" <c:if test="${boardFaqDto.faq_sort eq 'air'}">checked="checked"</c:if> value="air">항공
						<input type="radio" name="faq_sort" <c:if test="${boardFaqDto.faq_sort eq 'hotel'}">checked="checked"</c:if> value="hotel">호텔
						<input type="radio" name="faq_sort" <c:if test="${boardFaqDto.faq_sort eq 'reservation'}">checked="checked"</c:if> value="reservation">예약/결제
						<input type="radio" name="faq_sort" <c:if test="${boardFaqDto.faq_sort eq 'homepage'}">checked="checked"</c:if> value="homepage">홈페이지
						<input type="radio" name="faq_sort" <c:if test="${boardFaqDto.faq_sort eq 'etc'}">checked="checked"</c:if> value="etc">기타
					</span>
				</div>
				
				<div class="line">
					<label class="title">제목</label>
					<span class="content">
						<input type="text" name="faq_title" value="${boardFaqDto.faq_title}"/>
					</span>
				</div>
			
				<div class="line" style="height:230px;">
					<label class="title" style="height:230px;">내용</label>
					<span class="content" style="height:230px;">
						<textarea rows="14" cols="67" name="faq_content">${boardFaqDto.faq_content}</textarea>
					</span>
				</div>
				
				<div class="line" style="width:598px; border-width:2px; text-align:center;">
					<input type="submit" value="수정"/>
					<input type="reset" value="취소"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/boardFaq/list.do?faq_sort=${faq_sort}&searchWord=${searchWord}'"/>
				</div>	
			</form>
		</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>