<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/memberMypage/memberMypageRe.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/js/memberMypage/memberMypageRe.js"></script>
<script>
$(function(){
	$( "#myr_reply_text" ).slideUp(0);	
	$( "#reply_button" ).click(function() {
	$( "#myr_reply_text" ).slideToggle( "slow" );
	});
});
	
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class">
	<jsp:include page="../include/memberMypageSideMenu.jsp"/>
	
	<div class="content_class">
		
		<div style="float:left;">
			<img src="${root}/resources/boardImg/img01.PNG" align="center">
			<h2 style="display:inline;"><span style="font-weight: bold; ">${member_name}님이 다녀오신상품</span></h2>
		</div>
				
		<hr style="border:2px solid green; margin-top: 36px;">
		<div style="margin-left: 10px;width: 900px;">

			<div id="myr_main">
	
				<div id="myr_content">
					<div><input type="image" src="${root}/css/images/imsi.jpg" width="150px" height="200px;"/></div>
					<div id="myr_inf">
						<div id="myr_name">
							<ul>
								<li>상품명</li>
								<li>나라</li>
							</ul>
						</div>
						<div id="myr_date">
							<ul>
								<li>출발일: ~</li>
								<li>도착일:</li>
							</ul>
						</div>
						<div id="myr_price">
							<ul>
								<li>가격:</li>
								<li>1,000,000 원</li>
							</ul>
						</div>
						<div id="myr_reply">
							<div id="reply"><input type="image"  style="width: 500px;"id="reply_button" src="${root}/css/images/reply.png" alt="button"/></div>
						</div>
					</div>
					<input type="hidden" value="${root}" name="root"/>
					<div id="myr_reply_text">
					<form action="${root}/memberMypage/memberMypageReply.do" method="POST" onsubmit="return mypageRepl(this)">
						<input type="hidden" name="member_number" value="${member_number}"/>
						<div id="reply_submit">
							<input type="hidden" name="star_number" id="star_number"/>
							<ul id="myr_score">
								<li>평점</li>
								<li class="score_button_li score_button_li_1"><input type="image" class="score_button" src="${root}/css/images/emptyStar.png" alt="button"/></li>
								<li class="score_button_li score_button_li_2"><input type="image" class="score_button" src="${root}/css/images/emptyStar.png" alt="button"/></li>
								<li class="score_button_li score_button_li_3"><input type="image" class="score_button" src="${root}/css/images/emptyStar.png" alt="button"/></li>
								<li class="score_button_li score_button_li_4"><input type="image" class="score_button" src="${root}/css/images/emptyStar.png" alt="button"/></li>
								<li class="score_button_li score_button_li_5"><input type="image" class="score_button" src="${root}/css/images/emptyStar.png" alt="button"/></li>
							</ul>
							<ul id="myr_reply">
								<li>후기작성</li>
								<li><input id="myr_reply_insert" type="text" name="review_content" size="54"/></li>
								<li><input type="submit" value="작성"/></li>
							</ul>
						</div>
					</form>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>