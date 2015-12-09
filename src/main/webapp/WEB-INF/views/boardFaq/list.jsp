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
<link rel="stylesheet" type="text/css" href="${root}/css/boardFaq/boardFaq.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/boardFaq/boardFaq.js"></script>
<script type="text/javascript">
	
	$(function(){	
		
		$("li").click(function(){				// 클릭 했을 때 id 값을 가져와 class를 생성, 제거를 반복한다.
			var id = $(this).attr("id");
			$("#"+id).toggleClass("is-open");
		});
		
	});
</script>
</head>
<body>
	<div>
		<div>
			<a href="">
				<input type="button" value="문의하기" name="btn_qna"/>
			</a>문의하기
		</div>
		
		<div>
			<label>자주 묻는 질문 검색</label>
			<span>
				<input type="text" name="searchWord"/>
				<input type="button" value="검색" onclick="javascript:boardFaqSearch('${root}')"/>
			</span>
		</div>
		
		<div>
			<a href="${root}/boardFaq/list.do?faq_sort=package"><input type="button" name="btn_package" value="패키지여행"/></a>
			<a href="${root}/boardFaq/list.do?faq_sort=free"><input type="button" name="btn_free" value="자유여행"/></a>
			<a href="${root}/boardFaq/list.do?faq_sort=air"><input type="button" name="btn_air" value="항공"/></a>
			<a href="${root}/boardFaq/list.do?faq_sort=hotel"><input type="button" name="btn_hotel" value="호텔"/></a>
			<a href="${root}/boardFaq/list.do?faq_sort=reservation"><input type="button" name="btn_reservation" value="예약/결제"/></a>
			<a href="${root}/boardFaq/list.do?faq_sort=homepage"><input type="button" name="btn_homepage" value="홈페이지"/></a>
			<a href="${root}/boardFaq/list.do?faq_sort=etc"><input type="button" name="btn_etc" value="기타"/></a>
		</div>
		
		<c:if test="${count==0}">
			<div align="center">
				등록된 글이 없습니다.
			</div>
		</c:if>
		
		<c:if test="${count>0}">
			<div>
				<c:forEach var="boardFaqDto" items="${boardFaqList}">
					<div class = "" >
						<ul>
							<li class ="is-open" id="${boardFaqDto.faq_number}">
								<dl>
									<dt>
										<i></i>
										${boardFaqDto.faq_title}
										<i></i>
									</dt>
									
									<dd>
										<i></i>									
										<p>${boardFaqDto.faq_content}</p>
									</dd>
								</dl>
							</li>
						</ul>
						<div>
							<input type="button" value="수정" onclick = "javascript:updateFunc('${boardFaqDto.faq_number}','${root}','${faq_sort}','${searchWord}')"/>
							<input type="button" value="삭제" onclick = "javascript:deleteFunc('${boardFaqDto.faq_number}','${root}','${faq_sort}','${searchWord}')"/>
						</div>
				<!--  	<c:if test="${memberLevel=='AA'}"> -->
						
				<!--	</c:if> 	-->
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>