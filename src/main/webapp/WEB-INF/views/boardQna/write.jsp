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
				
				<!-- 만약 회원인 경우 작성자를 자동 입력, 비회원인 경우 직접 입력 -->
				<div class="line">
					<label class="title">작성자</label>		
					<span class="content">
						<input type="text" name="qna_writer"/>
					</span>
				</div>
				
				<div class="line">
					<label class="title">제목</label>
					<span class="content">
						<input type="text" name="qna_title"/>
					</span>
				</div>
				
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
			
				<div class="line">
					<label class="title">문의 구분</label>
					<span class="content">
						<input type="radio" name="qna_sort" value="reservation" checked="checked">예약
						<input type="radio" name="qna_sort" value="payment">결제
						<input type="radio" name="qna_sort" value="product">상품
						<input type="radio" name="qna_sort" value="etc">기타
					</span>
				</div>
			
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