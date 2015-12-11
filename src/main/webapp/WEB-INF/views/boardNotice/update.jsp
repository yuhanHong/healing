<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/js/boardNotice/boardNoticeWrite.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/boardNotice/boardNotice.css"/>
</head>
<body>
	<jsp:include page="../header.jsp"/>

	<div class="Outline">
		<div>
			<div>
				<img
					src="http://localhost:8181/main/resources/boardImg/img01.PNG"
					align="center"> <span>공지사항</span>
			</div>
		</div>
		<hr>
		<form class="" action="${root}/boardNotice/update.do" method="post"	onsubmit="return boardNoticeForm(this)" enctype="multipart/form-data">
			<input type="hidden" name="notice_number" value="${boardNoticeDto.notice_number}" /> 
			<input type="hidden" name="pageNumber" value="${pageNumber}" />

			<div class="line">
				<label class="title">작성자</label> 
				<span class="content"> 
					<input type="text" size="20" name="notice_writer" value="${boardNoticeDto.notice_writer}" />
				</span>
			</div>

			<div class="line">
				<label class="title">제목</label> 
				<span class="content"> 
					<input type="text"  size="90" name="notice_title" value="${boardNoticeDto.notice_writer}" />
				</span>
			</div>

			<div class="lineContent" style="height: 240px;">
				<div style="margin-top: 10px;">
					<label class="title" style="height: 230px;">내용</label> 
					<span class="textContent" style="height: 230px;"> 
						<textarea rows="14" cols="92" name="notice_content">${boardNoticeDto.notice_content}</textarea>
					</span>
				</div>
			</div>

			<div class="line">
				<label class="title">파일명</label> 
				<span class="content" style="width:600px; text-align: left;">
					${boardNoticeDto.notice_file_name}<input type="file" name="file"/>
				</span>
			</div>

			<div class="searchDiv">
				<input type="submit" value="수정" /> 
				<input type="reset" value="취소" />
				<input type="button" value="목록보기" onclick="location.href='${root}/board/list.do?pageNumber=${currentPage}'" />
			</div>
		</form>
	</div>

	<jsp:include page="../footer.jsp"/>
</body>
</html>