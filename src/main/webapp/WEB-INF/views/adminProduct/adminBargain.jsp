<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/common.js"></script>
<script type="text/javascript" src="${root}/js/adminProduct/adminBargain.js"></script>
<script type="text/javascript" src="${root}/js/adminProduct/adminProduct.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/adminProduct/adminProduct.css"/>

</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>
	<h2 style="margin-top: 40px;">할인율 설정</h2>
	<div class="bargainContent">
		<c:if test="${bargainDto==null}">
			<form method="post" id="bargainForm" action="${root}/adminProduct/adminBargainWrite.do" onsubmit="return bargainFormCheck(this)">
				<div class="title"><label>할인율1 시작일</label></div>
				<div class="content"><input type="text" maxlength="2" size="1" name="bargain_day1" value="0" oninput="numberOnInputUnformattedZero(event)"/>일 전</div>
				<div class="title"><label>할인율1</label></div>
				<div class="content"><input type="text" maxlength="2" size="1" name="bargain_rate1" value="0" oninput="numberOnInputUnformattedZero(event)"/>%</div>
				<div class="title"><label>할인율2 시작일</label></div>
				<div class="content"><input type="text" maxlength="2" size="1" name="bargain_day2" value="0" oninput="numberOnInputUnformattedZero(event)"/>일 전</div>
				<div class="title"><label>할인율2</label></div>
				<div class="content"><input type="text" maxlength="2" size="1" name="bargain_rate2" value="0" oninput="numberOnInputUnformattedZero(event)"/>%</div>
				<div class="bargainSubmit"><input type="submit" value="입력하기"></div>
				<script>
				document.body.onload = function(){
					alert("기본할인율이 설정되지 않았습니다.");bargainForm.bargain_day1.focus();bargainForm.bargain_day1.select();
				}
				</script>
			</form>
		</c:if>

		<c:if test="${bargainDto!=null}">
			<form method="post" id="bargainForm" action="${root}/adminProduct/adminBargain.do" onsubmit="return bargainFormCheck(this)">
				<div class="title"><label>할인율1 적용 시작일</label></div>
				<div class="content"><input type="text" maxlength="2" size="1" name="bargain_day1" value="${bargainDto.bargain_day1}" oninput="numberOnInputUnformattedZero(event)"/>일 전</div>
				<div class="title"><label>할인율1</label></div>
				<div class="content"><input type="text" maxlength="2" size="1" name="bargain_rate1" value="${bargainDto.bargain_rate1}" oninput="numberOnInputUnformattedZero(event)"/>%</div>
				<div class="title"><label>할인율2 적용 시작일</label></div>
				<div class="content"><input type="text" maxlength="2" size="1" name="bargain_day2" value="${bargainDto.bargain_day2}" oninput="numberOnInputUnformattedZero(event)"/>일 전</div>
				<div class="title"><label>할인율2</label></div>
				<div class="content"><input type="text" maxlength="2" size="1" name="bargain_rate2" value="${bargainDto.bargain_rate2}" oninput="numberOnInputUnformattedZero(event)"/>%</div>
				<div class="bargainSubmit"><input type="submit" value="수정하기"></div>
				<script>bargainForm.bargain_day1.select();</script>
			</form>
		</c:if>
		
		<div class="bargainExplain">
			<h4>1. 할인 적용을 하지 않으려면 시작일 또는 할인율에 0을 입력하시면 됩니다.</h4>
			<h4>2. 할인율1 시작일은 반드시 할인율2 시작일보다 커야합니다.</h4>
		</div>
	</div>	
</body>
</html>