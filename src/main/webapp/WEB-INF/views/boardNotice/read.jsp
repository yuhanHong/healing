<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	function deleteFunc(notice_number, pageNumber, root){
		var check = confirm("공지사항 글을 삭제하시겠습니까?");
		if(check){
			var url = root+"/boardNotice/delete.do?notice_number="+notice_number+"&pageNumber="+pageNumber;
			location.href=url;
		}else{
			alert("글 삭제가 취소되었습니다.");
		}
		
	}
	
	function updateFunc(notice_number, pageNumber, root){
		//alert(notice_number + "," + pageNumber + "," + root);
		var url = root+"/boardNotice/update.do?notice_number="+notice_number+"&pageNumber="+pageNumber;
		location.href=url;
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div>공지사항</div>
	<hr>
	<div>
		<div>
			<label>제목</label>	
			<span>
				${boardNoticeDto.notice_title}
			</span>
		</div>
		
		<div>
			<label>작성자</label>
			<span>${boardNoticeDto.notice_writer}</span>
			
			<label>등록일</label>
			<span><fmt:formatDate value="${boardNoticeDto.notice_date}" type="date"/></span>
			
			<label>조회</label>
			<span>${boardNoticeDto.notice_readCount}</span>
		</div>
		
		<div>
			<label>내용</label>
			<span>
				<textarea rows="14" cols="67" style="overflow:hidden">${boardNoticeDto.notice_content}</textarea>
			</span>
		</div>
		
		<c:if test="${boardNoticeDto.notice_file_name != null }">
			<label>파일</label>
			<span>
				<a href="${root}/boardNotice/download.do?notice_number=${boardNoticeDto.notice_number}">${boardNoticeDto.notice_file_name}</a>
			</span>
		</c:if>
		
		<div>
			<input type="button" value="글 목록" onclick = "location.href='${root}/boardNotice/list.do?pageNumber=${pageNumber}&searchSort=${searchSort}&searchWord=${searchWord}'"/>
			<!-- 관리자 기능 -->
			<input type="button" value="수정" onclick = "updateFunc('${boardNoticeDto.notice_number}',
																	'${pageNumber}',
																	'${root}')"/>
			<input type="button" value="삭제" onclick = "deleteFunc('${boardNoticeDto.notice_number}',
																	'${pageNumber}',
																	'${root}')"/>
		</div>
		<hr/>
		<div>
			<label>이전 글</label>
			<span>
				<c:if test="${boardNoticeDtoPrev ne null}">
					<input type="text" value="${boardNoticeDtoPrev.notice_title}"
					onclick="location.href='${root}/boardNotice/read.do?notice_number=${boardNoticeDtoPrev.notice_number}&pageNumber=${pageNumber}&searchSort=${searchSort}&searchWord=${searchWord}'"/>
				</c:if>
				
				<c:if test="${boardNoticeDtoPrev == '' || boardNoticeDtoPrev eq null}">
					<input type="text" value="이전글이 존재하지 않습니다." disabled="disabled"/>
				</c:if>
			</span>
		</div>
		
		<div>
			<label>다음 글</label>
			<span>
				<c:if test="${boardNoticeDtoNext ne null}">
					<input type="text" value="${boardNoticeDtoNext.notice_title}" 
						onclick="location.href='${root}/boardNotice/read.do?notice_number=${boardNoticeDtoNext.notice_number}&pageNumber=${pageNumber}&searchSort=${searchSort}&searchWord=${searchWord}'"/>
				</c:if>
				
				<c:if test="${boardNoticeDtoNext == '' || boardNoticeDtoNext eq null}">
					<input type="text" value="다음글이 존재하지 않습니다." disabled="disabled"/>
				</c:if>
			</span>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>