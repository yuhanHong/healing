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
<link rel="stylesheet" type="text/css" href=""/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type = "text/javascript">
function readFunc(notice_number, currentPage, root, searchSort, searchWord){
	var url = root+"/boardNotice/read.do?notice_number="+notice_number+"&pageNumber="+currentPage+"&searchSort="+searchSort+"&searchWord="+searchWord;
	//alert(url);
	location.href = url;
}

function boardNoticeSearch(root){
	var searchWord = $("input[name='search']").val();
	var searchSort = $("select[name='sorting']").val();
	//alert(searchWord+","+searchSort);
	var url = root+"/boardNotice/list.do?searchWord="+searchWord+"&searchSort="+searchSort;
	location.href= url;
}
</script>
</head>
<body>
	<div>
		<div><a href="${root}/boardQna/write.do">문의하기</a></div>
		<div>상품문의</div>
		<c:if test="${count==0}">
			<div class = "board_title">
				<ul>
					<li>번호</li>
					<li>구분</li>
					<li>제목</li>
					<li>작성자</li>
					<li>등록일</li>
					<li>답변유무</li>
				</ul>
			</div>
			<div align = "center">게시판에 등록된 글이 없습니다.</div>
		</c:if>
		
		<c:if test="${count>0}">
			<div class="board_title">
				<ul>
					<li>번호</li>
					<li>구분</li>
					<li>제목</li>
					<li>작성자</li>
					<li>등록일</li>
					<li>답변유무</li>
				</ul>
			</div>
			
			<c:forEach var="boardQnaDto" items="${boardQnaList}">
				<div class = "board" >
					<ul>
						<li>${boardQnaDto.qna_number}</li>
						<li>${boardQnaDto.qna_sort}</li>
						<li>
							<a href="javascript:readFunc('${boardQnaDto.qna_number}','${currentPage}','${root}','${searchSort}','${searchWord}')">
								${boardQnaDto.qna_title}
							</a>
						</li>
						<li>${boardQnaDto.qna_writer}</li>
						<li><fmt:formatDate value="${boardQnaDto.qna_date}" type="date"/></li>
						<c:if test="">
							<li></li>
						</c:if>
						
					</ul>
				</div>
			</c:forEach>
		</c:if>
		
		
		<div align = "center">
			<c:if test="${searchWord == null }">
				<c:if test="${count>0}">
					<c:set var="pageBlock" value="${3}"/>
					<c:set var="pageCount" value="${count/boardSize + (count%boardSize==0?0:1)}"/>
				
					<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
					<c:set var="startPage" value="${result*pageBlock+1}"/>
					<c:set var="endPage" value="${startPage+pageBlock-1}"/>
				
					<c:if test="${endPage > pageCount}">
						<c:set var="endPage" value="${pageCount}"/>
					</c:if>
				
					<c:if test="${startPage > pageBlock}">
						<a href="${root}/boardNotice/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
					</c:if>
				
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${root}/boardNotice/list.do?pageNumber=${i}">[${i}]</a>
					</c:forEach>
					
					<c:if test="${endPage < pageCount}">
						<a href="${root}/boardNotice/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
					</c:if>
				</c:if>
			</c:if>
			
			<c:if test="${searchWord != null }">
				<c:if test="${count>0}">
					<c:set var="pageBlock" value="${3}"/>
					<c:set var="pageCount" value="${count/boardSize + (count%boardSize==0?0:1)}"/>
				
					<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
					<c:set var="startPage" value="${result*pageBlock+1}"/>
					<c:set var="endPage" value="${startPage+pageBlock-1}"/>
				
					<c:if test="${endPage > pageCount}">
						<c:set var="endPage" value="${pageCount}"/>
					</c:if>
				
					<c:if test="${startPage > pageBlock}">
						<a href="${root}/boardNotice/list.do?pageNumber=${startPage-pageBlock}&searchWord=${searchWord}&searchSort=${searchSort}">[이전]</a>
					</c:if>
				
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${root}/boardNotice/list.do?pageNumber=${i}&searchWord=${searchWord}&searchSort=${searchSort}">[${i}]</a>
					</c:forEach>
					
					<c:if test="${endPage < pageCount}">
						<a href="${root}/boardNotice/list.do?pageNumber=${startPage+pageBlock}&searchWord=${searchWord}&searchSort=${searchSort}">[다음]</a>
					</c:if>
				</c:if>
			</c:if>
		</div>
		
		<div>
			<select name="sorting">
				<option value="titleSort">제목</option>	
				<option value="contentSort">내용</option>
			</select>
			<input type="text" name = "search" />
			<input type="button" name = "btn" value="검색" onclick="javascript:boardNoticeSearch('${root}')"/>
		</div>
	</div>
</body>
</html>