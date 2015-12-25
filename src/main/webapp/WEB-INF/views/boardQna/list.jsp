<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/boardQna/boardQna.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/boardQna/boardQna.js"></script>
<script type = "text/javascript">
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	
	<div class="outline_class">
		<jsp:include page="../include/boardSideMenu.jsp"/>
		<!-- 최근 본 상품 include 된 부분 -->
		<c:import url="../recentProduct/recentProduct.jsp"/>
		
		<div class="content_class">
			<div>
				<div style="float:left;">
					<img src="${root}/resources/boardImg/img01.PNG" align="center">
					<h2 style="display:inline;"><span style="font-weight: bold; ">문의사항</span></h2>
				</div>
				
			
				<div style="margin-left: 640px;">
					<input type="button" onclick="location.href='${root}/boardQna/write.do'" value="문의사항 등록"/>
				</div>
			
			</div>
			
			<hr style="border:2px solid green; margin-top: 15px;">
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
							<li>
								<c:if test="${boardQnaDto.qna_sort eq 'payment'}">
									결제
								</c:if>
								<c:if test="${boardQnaDto.qna_sort eq 'reservation'}">
									예약
								</c:if>
								<c:if test="${boardQnaDto.qna_sort eq 'product'}">
									상품
								</c:if>
								<c:if test="${boardQnaDto.qna_sort eq 'etc'}">
									기타
								</c:if>
							</li>
							<li>
								<a href="javascript:readFunc('${root}', '${boardQnaDto.qna_password}','${boardQnaDto.qna_number}','${currentPage}','${searchSort}','${searchWord}','${admin_name}')">
									${boardQnaDto.qna_title}
									<c:if test="${boardQnaDto.qna_password ne null}">
										<img src="${root}/resources/boardImg/lock.PNG" align="center">
									</c:if>
								</a>
							</li>
							<li>${boardQnaDto.qna_writer}</li>
							<li><fmt:formatDate value="${boardQnaDto.qna_date}" type="date"/></li>
							<c:if test="${boardQnaDto.qna_reply == 1}">
								<li>
									<img src="${root}/resources/boardImg/complete.PNG" align="center">
								</li>
							</c:if>
							
							<c:if test="${boardQnaDto.qna_reply == 0}">
								<li>
									<img src="${root}/resources/boardImg/wait.PNG" align="center">
								</li>
							</c:if>
						</ul>
					</div>
				</c:forEach>
			</c:if>
			
			
			<div align = "center">
				<c:if test="${count>0}">
					<c:set var="pageBlock" value="${3}"/>
					<c:set var="pageCount" value="${count/boardSize + (count%boardSize==0?0:1)}"/>
					
					<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
					<c:set var="startPage" value="${result*pageBlock+1}"/>
					<c:set var="endPage" value="${startPage+pageBlock-1}"/>
					
					<c:if test="${endPage > pageCount}">
						<c:set var="endPage" value="${pageCount}"/>
					</c:if>
					
					<c:if test="${searchWord == null }">
					
						<c:if test="${startPage > pageBlock}">
							<a href="${root}/boardQna/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
						</c:if>
					
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="${root}/boardQna/list.do?pageNumber=${i}">[${i}]</a>
						</c:forEach>
						
						<c:if test="${endPage < pageCount}">
							<a href="${root}/boardQna/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
						</c:if>
					</c:if>
					
					<c:if test="${searchWord != null }">
						<c:if test="${startPage > pageBlock}">
							<a href="${root}/boardQna/list.do?pageNumber=${startPage-pageBlock}&searchWord=${searchWord}&searchSort=${searchSort}">[이전]</a>
						</c:if>
					
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="${root}/boardQna/list.do?pageNumber=${i}&searchWord=${searchWord}&searchSort=${searchSort}">[${i}]</a>
						</c:forEach>
						
						<c:if test="${endPage < pageCount}">
							<a href="${root}/boardQna/list.do?pageNumber=${startPage+pageBlock}&searchWord=${searchWord}&searchSort=${searchSort}">[다음]</a>
						</c:if>
					</c:if>
				</c:if>
			</div>
			
			<div class="searchDiv">
				<select name="sorting">
					<option value="titleSort">제목</option>	
					<option value="contentSort">내용</option>
					<option value="writerSort">작성자</option>
				</select>
				<input type="text" name = "search" />
				<input type="button" name = "btn" value="검색" onclick="javascript:boardQnaSearch('${root}')"/>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>