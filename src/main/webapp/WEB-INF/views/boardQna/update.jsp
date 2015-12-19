<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 수정</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/boardQna/boardQna.css"/>
<script type="text/javascript" src=""></script>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$("input[name='chk_pwd']").click(function(){
			if($("input[name='chk_pwd']").is(':checked')==true){
				$(".is-check").css("display", "block");
			}else{
				$(".is-check").css("display", "none");
				$("input[name='qna_password']").val("");	// 체크박스 해제 시 작성했던 비밀번호도 지워짐
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class">
		<jsp:include page="../include/sideMenu.jsp"/>
		<div class="content_class">
			<div>
				<div>
					<img src="http://localhost:8181/main/resources/boardImg/img01.PNG" align="center"> 
					<h2 style="display:inline;"><span style="font-weight: bold;">상품문의 수정</span></h2>
				</div>
			</div>
			<hr style="border:2px solid green; margin-top: 3px;">
			<form class="" action="${root}/boardQna/update.do" method="post" onsubmit="return boardQnaForm(this)">
				
				<input type = "hidden" name = "qna_number" value = "${boardQnaDto.qna_number}"/>
				<input type = "hidden" name = "qna_group_number" value = "${boardQnaDto.qna_group_number}"/>
				<input type = "hidden" name = "qna_sequence_number" value = "${boardQnaDto.qna_sequence_number}"/>
				<input type = "hidden" name = "pageNumber" value = "${pageNumber}"/>
				
				<div class="line" style="margin-top: 20px;">
					<label class="title" style="width:70px">작성자</label>		
					<span class="content">
						<input type="text"  size="20" name="qna_writer" value="${boardQnaDto.qna_writer}"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title" style="width:70px">제목</label>
					<span class="content">
						<input type="text" size="90" name="qna_title" value="${boardQnaDto.qna_title}"/>
					</span>
				</div>

				<!-- 답글이 아닌 경우 비밀번호를 수정할 수 있지만 답변글의 경우 수정글이 필요없다. -->
				<c:if test="${boardQnaDto.qna_sequence_number == 0}">
					<div class="line">
						<div>
							<label class="title" style="width:70px">비공개</label> 
							<span class="content" style="width:150px;"> 
								<input type="checkbox" name="chk_pwd" value="chk_pwd" 
									<c:if test="${boardQnaDto.qna_password != null}">checked="checked"</c:if>/>비공개로 하기
							</span>
						</div>
		
						<div class="is-check">
							<label class="title" style="width:70px">비밀번호</label> 
							<span class="content" > 
								<input type="text" name="qna_password" value="${boardQnaDto.qna_password}" />
							</span>
						</div>
					</div>
				</c:if>
				
				<c:if test="${boardQnaDto.qna_sequence_number != 0}">
					<input type="hidden" name="qna_password"/>
				</c:if>
				
				<div class="line">
					<label class="title" style="width:70px">문의 구분</label>
					<span class="content" style="width:300px">
						<input type="radio" name="qna_sort" value="reservation" <c:if test="${boardQnaDto.qna_sort eq 'reservation'}">checked="checked"</c:if>/>예약
						<input type="radio" name="qna_sort" value="payment" <c:if test="${boardQnaDto.qna_sort eq 'payment'}">checked="checked"</c:if>/>결제
						<input type="radio" name="qna_sort" value="product" <c:if test="${boardQnaDto.qna_sort eq 'product'}">checked="checked"</c:if>/>상품
						<input type="radio" name="qna_sort" value="etc" <c:if test="${boardQnaDto.qna_sort eq 'etc'}">checked="checked"</c:if>/>기타
					</span>
				</div>
				
				<div class="lineContent" style="height:240px;">
					<div style="margin-top:10px;">
						<label class="title" style="height:230px;">내용</label>
						<span class="textContent" style="height:230px;">
							<textarea rows="14" cols="92" name="qna_content">${boardQnaDto.qna_content}</textarea>
						</span>
					</div>
				</div>
				
				<div class="searchDiv">
					<input type="submit" value="수정"/>
					<input type="reset" value="취소"/>
					<input type="button" value="목록보기" 
						onclick="location.href='${root}/boardQna/list.do?pageNumber=${pageNumber}&searchSort=${searchSort}&searchWord=${searchWord}'"/>
				</div>	
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>