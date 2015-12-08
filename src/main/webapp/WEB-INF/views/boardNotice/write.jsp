<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice 게시판 글작성</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/boardNotice/board.css"/>
<script type="text/javascript" src="${root}/js/boardNotice/boardNoticeWrite.js"></script>
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
			<div>공지사항 작성</div>
			<hr>
			<form class="" action="${root}/boardNotice/write.do" method="post" onsubmit="return boardNoticeForm(this)" enctype="multipart/form-data">
				<input type = "hidden" name = "notice_number" value = "${notice_number}"/>
				
				<div class="line">
					<label class="title">작성자</label>
					<span class="content">
						<input type="text" name="notice_writer"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">제목</label>
					<span class="content">
						<input type="text" name="notice_title"/>
					</span>
				</div>
			
				<div class="line" style="height:230px;">
					<label class="title" style="height:230px;">내용</label>
					<span class="content" style="height:230px;">
						<textarea rows="14" cols="67" name="notice_content"></textarea>
					</span>
				</div>
				
				<div class="line">
					<label class="title">파일명</label>
					<span class="content">
						<input type="file" name="file"/>
					</span>
				</div>
				
				<div class="line" style="width:598px; border-width:2px; text-align:center;">
					<input type="submit" value="등록"/>
					<input type="reset" value="취소"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/board/list.do?pageNumber=${currentPage}'"/>
				</div>		
			</form>
		</div>
	</div>
</body>
</html>