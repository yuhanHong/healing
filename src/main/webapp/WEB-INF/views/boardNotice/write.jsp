<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice 게시판 글작성</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/boardNotice/boardNotice.css"/>
<script type="text/javascript" src="${root}/js/boardNotice/boardNoticeWrite.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>

	<div class="outline_class">
		<jsp:include page="../include/boardSideMenu.jsp"/>
		<div class="content_class">
			<div>
				<div>
					<img src="http://localhost:8181/main/resources/boardImg/img01.PNG" align="center"> 
					<h2 style="display:inline;"><span style="font-weight: bold;">공지사항 작성</span></h2>
				</div>
			</div>
		
			<hr style="border:2px solid green; margin-top: 3px;">
			<form class="" action="${root}/boardNotice/write.do" method="post" onsubmit="return boardNoticeForm(this)" enctype="multipart/form-data">
				<input type="hidden" name="notice_number" value="${notice_number}" />
	
				<div class="line">
					<div class="title">작성자</div> 
					<div class="content"> 
						<input type="text" size="20" name="notice_writer" />
					</div>
				</div>
	
				<div class="line">
					<div class="title">제목</div> 
					<div class="content"> 
						<input type="text" size="90" name="notice_title" />
					</div>
				</div>
	
				<div class="lineContent" style="height: 240px;">
					<div style="margin-top:10px;">
						<div class="title" style="height: 230px;">내용</div> 
						<div class="textContent" style="height: 230px;"> 
							<textarea rows="14" cols="92"  name="notice_content" ></textarea>
						</div>
					</div>
				</div>
				
				<div class="line">
					<div class="title" >파일명</div> 
					<div class="content" > 
						<input type="file" name="file" />
					</div>
				</div>
				
				<div class="searchDiv" >
					<input type="submit" value="등록" /> <input type="reset" value="취소" />
					<input type="button" value="목록보기" onclick="location.href='${root}/boardNotice/list.do?pageNumber=${currentPage}'" />
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="../footer.jsp"/>
</body>
</html>