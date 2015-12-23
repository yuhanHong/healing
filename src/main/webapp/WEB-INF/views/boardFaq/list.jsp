<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		$(".is-open").click(function(){				// 클릭 했을 때 id 값을 가져와 class를 생성, 제거를 반복한다.
			var id = $(this).attr("id");
			$("#"+id).toggleClass("is-open");
		});
		
	});
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<!-- 최근 본 상품 include 된 부분 -->
	<c:import url="../recentProduct/recentProduct.jsp"/>
	
	<div class="outline_class">
		<jsp:include page="../include/boardSideMenu.jsp"/>
		
		<div class="content_class">
			<div>
				<div style="float:left;">
					<img src="${root}/resources/boardImg/img01.PNG" align="center">
					<h2 style="display:inline;"><span style="font-weight: bold; ">자주 묻는 질문</span></h2>
				</div>
				
				<c:if test="${admin_name != null}">
					<div style="margin-left: 640px;">
						<input type="button" onclick="location.href='${root}/boardFaq/write.do'" value="FAQ 등록"/>
					</div>
				</c:if>
			</div>		
			
			<c:if test="${admin_name != null}">
				<hr style="border:2px solid green; margin-top: 15px;">
			</c:if>
			
			<c:if test="${admin_name == null}">
				<hr style="border:2px solid green; margin-top: 35px;">
			</c:if>
			
			
			<div class="searchDiv">
				<label>자주 묻는 질문 검색</label>
				<span>
					<input type="text" name="searchWord" style="height:24px;"/>
					<input type="button" value="검색" onclick="javascript:boardFaqSearch('${root}')"/>
				</span>
			</div>
			
			<div class="sortBtn">
				<a href="${root}/boardFaq/list.do?faq_sort=package"><input type="button" name="btn_package" value="패키지여행" 
																		onMouseOver="this.style.backgroundColor='#47C83E'"
																		onMouseOut="this.style.backgroundColor='#8C8C8C'" /></a>
				<a href="${root}/boardFaq/list.do?faq_sort=free"><input type="button" name="btn_free" value="자유여행"
																		onMouseOver="this.style.backgroundColor='#47C83E'"
																		onMouseOut="this.style.backgroundColor='#8C8C8C'" /></a>
				<a href="${root}/boardFaq/list.do?faq_sort=air"><input type="button" name="btn_air" value="항공"
																		onMouseOver="this.style.backgroundColor='#47C83E'"
																		onMouseOut="this.style.backgroundColor='#8C8C8C'" /></a>
				<a href="${root}/boardFaq/list.do?faq_sort=hotel"><input type="button" name="btn_hotel" value="호텔"
																		onMouseOver="this.style.backgroundColor='#47C83E'"
																		onMouseOut="this.style.backgroundColor='#8C8C8C'" /></a>
				<a href="${root}/boardFaq/list.do?faq_sort=reservation"><input type="button" name="btn_reservation" value="예약/결제"
																		onMouseOver="this.style.backgroundColor='#47C83E'"
																		onMouseOut="this.style.backgroundColor='#8C8C8C'" /></a>
				<a href="${root}/boardFaq/list.do?faq_sort=homepage"><input type="button" name="btn_homepage" value="홈페이지"	
																		onMouseOver="this.style.backgroundColor='#47C83E'"
																		onMouseOut="this.style.backgroundColor='#8C8C8C'" /></a>
				<a href="${root}/boardFaq/list.do?faq_sort=etc"><input type="button" name="btn_etc" value="기타"
																		onMouseOver="this.style.backgroundColor='#47C83E'"
																		onMouseOut="this.style.backgroundColor='#8C8C8C'" /></a>
			</div>
			
			<c:if test="${count==0}">
				<div align="center">
					등록된 글이 없습니다.
				</div>
			</c:if>
			
			<c:if test="${count>0}">
				<div style="margin-top: 20px;">
					<c:forEach var="boardFaqDto" items="${boardFaqList}">
						<div class = "line" >
							<ul>
								<li class ="is-open" id="${boardFaqDto.faq_number}">
									<div>
										<div>
											<div class="title" style="border:0px solid black; background-color: #ffffff;">Q.</div>
											<div class="content" style="border:0px solid black; width:680px; background-color: #ffffff;">${boardFaqDto.faq_title}</div>
										</div>
										
										<div class="answer">
											<div class="title" style="border:0px solid black; background-color: #F6F6F6; ">A.</div>						
											<div class="content" style="border:0px solid black; background-color: #F6F6F6; width:680px;">${boardFaqDto.faq_content}</div>
											<c:if test="${admin_name != null}">
												<div>
													<input type="button" value="수정" onclick = "javascript:updateFunc('${boardFaqDto.faq_number}','${root}','${faq_sort}','${searchWord}')"/>
													<input type="button" value="삭제" onclick = "javascript:deleteFunc('${boardFaqDto.faq_number}','${root}','${faq_sort}','${searchWord}')"/>
												</div>
											</c:if>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>