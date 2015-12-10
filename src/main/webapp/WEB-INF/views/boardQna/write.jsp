<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice 게시판 글작성</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/boardQna/boardQna.css"/>
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
	<div >
		<div class="">
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
			<div>나의 문의 내역</div>
			<hr>
			<form class="" action="${root}/boardQna/write.do" method="post" onsubmit="return boardQnaForm(this)">
				<input type = "hidden" name = "qna_number" value = "${qna_number}"/>
				<input type = "hidden" name = "qna_group_number" value = "${qna_group_number}"/>
				<input type = "hidden" name = "qna_sequence_number" value = "${qna_sequence_number}"/>
				<input type = "hidden" name = "pageNumber" value = "${currentPage}"/>
				
				<div class="line">
					<label class="title">작성자</label>		
					<span class="content">
						<input type="text" name="qna_writer"
						<c:if test="${qna_number>0}">value="관리자" disabled="disabled"</c:if>/>
						<c:if test="${qna_number>0}"> 
							<input type="hidden" name="qna_writer" value="관리자"/>
						</c:if>
					</span>
				</div>
				
				<div class="line">
					<label class="title">제목</label>
					<span class="content">
						<input type="text" name="qna_title"
						<c:if test="${qna_number>0}">value="[답글]${boardQnaDto.qna_title}" disabled="disabled"</c:if>  />
						<c:if test="${qna_number>0}"> 
							<input type="hidden" name="qna_title" value="${boardQnaDto.qna_title}"/>
						</c:if>
					</span>
				</div>
				
				<c:if test="${qna_number==0}">		<!-- 답변글이 아닌 경우만 비밀번호 입력 받을 수 있음 -->
					<div class="line">
						<div>
							<label class="title">비공개 여부</label>
							<span class="content">
								<input type="checkbox" name="chk_pwd" value="chk_pwd"/> 비공개로 하기
							</span>
						</div>
						
						<div class="is-check">
							<label class="title">비밀번호</label>
							<span class="content">
								<input type="text" name="qna_password"/>
							</span>
						</div>
					</div>
				</c:if>
				
				<!-- 답변글일 경우 비밀번호를 null 값으로 자동 전달한다. -->
				<c:if test="${qna_number>0}">
					<input type="hidden" name="qna_password"/>
				</c:if>
				
				<c:if test="${qna_number==0}">
					<div class="line">
						<label class="title">문의 구분</label>
						<span class="content">
							<input type="radio" name="qna_sort" value="reservation" checked="checked">예약
							<input type="radio" name="qna_sort" value="payment">결제
							<input type="radio" name="qna_sort" value="product">상품
							<input type="radio" name="qna_sort" value="etc">기타
						</span>
					</div>
				</c:if>
				
				<c:if test="${qna_number>0}">
					<div class="line">
						<label class="title">문의 구분</label>
						<span class="content">
							<input type="radio" name="qna_sort" value="reservation" <c:if test="${boardQnaDto.qna_sort eq 'reservation'}">checked="checked"</c:if>>예약
							<input type="radio" name="qna_sort" value="payment" <c:if test="${boardQnaDto.qna_sort eq 'payment'}">checked="checked"</c:if>>결제 
							<input type="radio" name="qna_sort" value="product" <c:if test="${boardQnaDto.qna_sort eq 'product'}">checked="checked"</c:if>>상품
							<input type="radio" name="qna_sort" value="etc" <c:if test="${boardQnaDto.qna_sort eq 'etc'}">checked="checked"</c:if>>기타
						</span>
					</div>
				</c:if>
				
				<div class="line" style="height:230px;">
					<label class="title" style="height:230px;">내용</label>
					<span class="content" style="height:230px;">
						<textarea rows="14" cols="67" name="qna_content"></textarea>
					</span>
				</div>
				
				<div class="line" style="width:598px; border-width:2px; text-align:center;">
					<input type="submit" value="등록"/>
					<input type="reset" value="취소"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/boardQna/list.do?pageNumber=${currentPage}'"/>
				</div>		
			</form>
		</div>
	</div>
</body>
</html>