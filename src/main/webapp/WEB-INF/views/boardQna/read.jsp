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
<script type="text/javascript" src="${root}/js/boardQna/boardQna.js"></script>
</head>
<body>
	<div>
		<div>상품문의</div>
		<hr/>
		<div>
			<label>제목</label>
			<span>
				${boardQnaList[0].qna_title}
			</span>
		</div>
		
		<div>
			<div>
				<label>작성자</label>
				<span>
					${boardQnaList[0].qna_writer}
				</span>
			</div>
				
			<div>
				<label>등록일</label>
				<span>
					<fmt:formatDate value="${boardQnaList[0].qna_date}" type="date"/>
				</span>
			</div>
			
			<div>
				<label>조회</label>
				<span>
					${boardQnaList[0].qna_readCount}
				</span>
			</div>
		</div>
		
		<div>
			<div>
				<label>구분</label>
				<span>
					${boardQnaList[0].qna_sort}
				</span>
			</div>
			
			<div>
				<label>답변여부</label>
				<c:if test="${boardQnaList[1] != null}">
					<span>
						답변완료
					</span>
				</c:if>
				
				<c:if test="${boardQnaList[1] == null}">
					<span>
						답변미완료
					</span>
				</c:if>
			</div>
		</div>
		
		<div class="line" style="height:230px;">
			<label class="title" style="height:230px;">내용</label>
			<span class="content" style="height:230px;">
				<textarea rows="14" cols="67">${boardQnaList[0].qna_content}</textarea>
			</span>
		</div>
		
		<div>
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
			<div>
				<div>
					<label>제목</label>
					<span>
						[답변]${boardQnaList[1].qna_title}
					</span>
				</div>
				
				<div class="line" style="height:230px;">
					<label class="title" style="height:230px;">내용</label>
					<span class="content" style="height:230px;">
						<textarea rows="14" cols="67">${boardQnaList[1].qna_content}</textarea>
					</span>
				</div>
				
				<!-- '수정','삭제' 버튼은 관리자 전용 -->
				<div>
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
</body>
</html>