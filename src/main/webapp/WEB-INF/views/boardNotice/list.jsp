<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/boardNotice/boardNotice.css"/>
<script type="text/javascript" src="${root}/js/boardNotice/boardNotice.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type = "text/javascript">
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class">
		<jsp:include page="../include/boardSideMenu.jsp"/>
		<!-- 최근 본 상품 include 된 부분 -->
<%-- 		<c:import url="../recentProduct/recentProduct.jsp"/> --%>
		
		<div class="content_class">
			<div>
				<div style="float:left;">
					<img src="${root}/resources/boardImg/img01.PNG" align="center">
					<h2 style="display:inline;"><span style="font-weight: bold; ">공지사항</span></h2>
				</div>
				
				<c:if test="${admin_name != null}">
					<div style="margin-left: 640px;">
						<input type="button" onclick="location.href='${root}/boardNotice/write.do'" value="공지사항 등록"/>
					</div>
				</c:if>
			</div>
			
			<c:if test="${admin_name != null}">
				<hr style="border:2px solid green; margin-top: 13px;">
			</c:if>
			
			<c:if test="${admin_name == null}">
				<hr style="border:2px solid green; margin-top: 33px;">
			</c:if>
			
			<c:if test="${count==0}">
				<div class = "board_title">
					<ul>
						<li style="width:60px;">번호</li>
						<li style="width:430px;">제목</li>
						<li style="width:150px;">등록일</li>
						<li style="width:97px;">조회수</li>
					</ul>
				</div>
				<div align = "center">게시판에 저장된 글이 없습니다.</div>
			</c:if>
			
			<c:if test="${count>0}">
				<div class="board_title">
					<ul>
						<li style="width:60px;">번호</li>
						<li style="width:430px;">제목</li>
						<li style="width:150px;">작성일</li>
						<li style="width:97px;">조회수</li>
					</ul>
				</div>
				
				<c:forEach var="boardNotice" items="${boardNoticeList}">
					<div class = "board" >
						<ul>
							<li style="width:60px;">${boardNotice.notice_number}</li>
							<li style="width:430px;">
								<a href="javascript:readFunc('${boardNotice.notice_number}','${currentPage}','${root}','${searchSort}','${searchWord}')">${boardNotice.notice_title}</a>
							</li>
							<li style="width:150px; text-align: center;"><fmt:formatDate value="${boardNotice.notice_date}" type="date"/></li>
							<li style="width:97px;">${boardNotice.notice_readCount}</li>
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
	
			<div class="searchDiv">
				<div>
					<select name="sorting">
						<option value="titleSort">제목</option>
						<option value="contentSort">내용</option>
					</select> 
					<input type="text" name="search" /> 
					<input type="button" name="btn" value="검색" onclick="javascript:boardNoticeSearch('${root}')" />
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>