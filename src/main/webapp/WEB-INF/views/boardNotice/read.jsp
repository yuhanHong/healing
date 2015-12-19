<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${root}/css/boardNotice/boardNotice.css" />
<script type="text/javascript" src="${root}/js/boardNotice/boardNotice.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	
	<div class="outline_class">
		<jsp:include page="../include/boardSideMenu.jsp"/>
		<div class="content_class">
			<div>
				<div>
					<img src="${root}/resources/boardImg/img01.PNG" align="center"> 
					<h2 style="display:inline;"><span style="font-weight: bold;">공지사항</span></h2>
				</div>
			</div>
			<hr style="border:2px solid green; margin-top: 3px;">
			<div class="line" style="margin-top:20px;">
				<div class="title" >제목</div> 
				<div class="content" style="width:650px;"> ${boardNoticeDto.notice_title} </div>
			</div>
	
			<div class="line">
				<div class="title">작성자</div> 
				<div class="content" style="margin-right: 310px;">${boardNoticeDto.notice_writer}</div> 
				<div class="title" style="margin-right:10px;">등록일</div>
				<div class="content" style="width:110px;"><fmt:formatDate value="${boardNoticeDto.notice_date}" type="date" /></div> 
				<div class="title">조회수</div> 
				<div class="content" style="width:40px;">${boardNoticeDto.notice_readCount}</div>
			</div>
	
			<div class="lineContent">
				<div class="textContent"> 
					<textarea rows="20" cols="102" readonly="readonly" style="border-color:#ffffff;">${boardNoticeDto.notice_content}</textarea>
				</div>
			</div>
	
			<c:if test="${boardNoticeDto.notice_file_name != null }">
				<div class="line">
					<div class="title">파일</div>
					<div class="content"> 
						<a href="${root}/boardNotice/download.do?notice_number=${boardNoticeDto.notice_number}">${boardNoticeDto.notice_file_name}</a>
					</div>
				</div>
			</c:if>
		
			<div class="line" style="height:40px; line-height:40px; text-align: center;">
				<div style="border:0px solid black;">
					<input type="button" value="글 목록" onclick="location.href='${root}/boardNotice/list.do?pageNumber=${pageNumber}&searchSort=${searchSort}&searchWord=${searchWord}'" />
					<!-- 관리자 기능 -->
					
					<input type="button" value="수정" onclick="updateFunc('${boardNoticeDto.notice_number}',
																		'${pageNumber}',
																		'${root}')" /> 
					<input type="button" value="삭제"	onclick="deleteFunc('${boardNoticeDto.notice_number}',
																		'${pageNumber}',
																		'${root}')" />
				</div>
			</div>
	
			<div class="line">
				<div class="title">이전 글</div> 
				<div class="content"> 
					<c:if test="${boardNoticeDtoPrev ne null}">
						<input type="text" value="${boardNoticeDtoPrev.notice_title}" readonly
							onclick="location.href='${root}/boardNotice/read.do?notice_number=${boardNoticeDtoPrev.notice_number}&pageNumber=${pageNumber}&searchSort=${searchSort}&searchWord=${searchWord}'" />
					</c:if> 
					<c:if test="${boardNoticeDtoPrev == '' || boardNoticeDtoPrev eq null}">
						<input type="text" value="이전글이 존재하지 않습니다." readonly />
					</c:if>
				</div>
			</div>
	
			<div class="line" style="border-bottom-color: #cccccc;">
				<div class="title">다음 글</div> 
				<div class="content"> 
					<c:if test="${boardNoticeDtoNext ne null}">
						<input type="text" value="${boardNoticeDtoNext.notice_title}" readonly
							onclick="location.href='${root}/boardNotice/read.do?notice_number=${boardNoticeDtoNext.notice_number}&pageNumber=${pageNumber}&searchSort=${searchSort}&searchWord=${searchWord}'" />
					</c:if> 
					<c:if test="${boardNoticeDtoNext == '' || boardNoticeDtoNext eq null}">
						<input type="text" value="다음글이 존재하지 않습니다." readonly />
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>