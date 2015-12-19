<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의 읽기</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/boardQna/boardQna.css"/>
<script type="text/javascript" src="${root}/js/boardQna/boardQna.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	
	<div class="outline_class">
		<jsp:include page="../include/boardSideMenu.jsp"/>
		<div class="content_class">
			<div>
				<div>
					<img src="http://localhost:8181/main/resources/boardImg/img01.PNG" align="center"> 
					<h2 style="display:inline;"><span style="font-weight: bold;">상품문의</span></h2>
				</div>
			</div>
			<hr style="border:2px solid green; margin-top: 3px;">
			<div class="line" style="margin-top: 20px;">
				<div class="title">제목</div>
				<div class="content" style="width:650px; text-align: left;">
					${boardQnaList[0].qna_title}
				</div>
			</div>
			
			<div class="line">
				<div>
					<div class="title">작성자</div>
					<div class="content" style="margin-right: 315px;">
						${boardQnaList[0].qna_writer}
					</div>
				</div>
					
				<div>
					<div class="title">등록일</div>
					<div class="content"  style="width:110px;">
						<fmt:formatDate value="${boardQnaList[0].qna_date}" type="date"/>
					</div>
				</div>
				
				<div>
					<div class="title">조회수</div>
					<div class="content" style="width:40px;">
						${boardQnaList[0].qna_readCount}
					</div>
				</div>
			</div>
			
			<div class="line">
				<div>
					<div class="title">구분</div>
					<div class="content">
						${boardQnaList[0].qna_sort}
					</div>
				</div>
				
				<div>
					<div class="title" style="width:80px;">답변여부</div>
					<c:if test="${boardQnaList[1] != null}">
						<div class="content">
							<img src="http://localhost:8181/main/resources/boardImg/complete.PNG" align="center">
						</div>
					</c:if>
					
					<c:if test="${boardQnaList[1] == null}">
						<div class="content">
							<img src="http://localhost:8181/main/resources/boardImg/wait.PNG" align="center">
						</div>
					</c:if>
				</div>
			</div>
			
			<div class="lineContent" style="height:230px;">
				<span class="textContent" style="height:230px;">
					<textarea rows="15" cols="102" readonly style="border-color:#ffffff;">${boardQnaList[0].qna_content}</textarea>
				</span>
			</div>
			
			<div class="searchDiv" style="height:40px; line-height: 40px; text-align: center;">
				<input type="button" value="목록" 
				onclick="location.href='${root}/boardQna/list.do?pageNumber=${pageNumber}&searchSort=${searchSort}&searchWord=${searchWord}'"/>
				<!-- 답변 작성은 관리자 전용 버튼, 답변이 이미 작성되있으면 '답변작성' 버튼 출력 않고
					 답변이 없거나 답변을 삭제 시에 '답변작성' 버튼을 출력한다. -->
				<c:if test="${boardQnaList[1] == null}">
					<input type="button" value="답변작성" onclick="replyFunc('${boardQnaList[0].qna_number}',
																		  '${boardQnaList[0].qna_group_number}',
																		  '${boardQnaList[0].qna_sequence_number}',		
																						 '${pageNumber}',
																						 '${searchSort}',
																						 '${searchWord}',
																						 '${root}')"/>
				</c:if>
				<input type="button" value="수정" onclick="updateFunc('${boardQnaList[0].qna_number}',
																	 '${pageNumber}',
																	 '${searchSort}',
																	 '${searchWord}',
																	 '${root}')"/>
				<!-- 삭제는 관리자만 가능하며 답변글이 존재하면 삭제할 수 없다. -->
				<c:if test="${boardQnaList[1] == null}">
					<input type="button" value="삭제" onclick="deleteFunc('${boardQnaList[0].qna_number}',
																		 '${boardQnaList[1].qna_sequence_number}',	
																		 '${pageNumber}',
																		 '${searchSort}',
																	 	 '${searchWord}',
																		 '${root}')"/>
				</c:if>
			</div>
			
			<hr/>
			
			<c:if test="${boardQnaList[1] != null}">
				<div style="margin-top: 40px;">
					<div class="line">
						<label class="title">제목</label>
						<span class="content" style="width:650px; text-align: left;">
							[답변]${boardQnaList[1].qna_title}
						</span>
					</div>
					
					<div class="lineContent" style="height:230px;">
						<span class="textContent" style="height:230px;">
							<textarea rows="15" cols="102" readonly style="border-color:#ffffff; background-color: #dcf1cd;">${boardQnaList[1].qna_content}</textarea>
						</span>
					</div>
					
					<!-- '수정','삭제' 버튼은 관리자 전용 -->
					<div class="searchDiv" style="height:40px; line-height: 40px; text-align: center;">
						<input type="button" value="수정" onclick="updateFunc('${boardQnaList[1].qna_number}',
																	 '${pageNumber}',
																	 '${searchSort}',
																	 '${searchWord}',
																	 '${root}')"/>
						<!-- 답변글 삭제의 경우 삭제하기 전에 부모글 필드 qna_reply를 0으로 변경해야 한다.  -->
						<input type="button" value="삭제" onclick="deleteFunc('${boardQnaList[1].qna_number}',
																		 '${boardQnaList[1].qna_sequence_number}',	
																		 '${pageNumber}',
																		 '${searchSort}',
																	 	 '${searchWord}',
																		 '${root}')"/>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>