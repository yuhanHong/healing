<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>

<link rel="stylesheet" type="text/css" href="${root}/css/detailSearch/detailSearch.css"/>
<script type="text/javascript" src="${root}/js/detailSearch/detailSearch.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
	<div class="outline_class" style="margin-left: 230px; width:900px;">
	<div class="content_class" style="width:900px;  border: 1px solid red;">
	
		<div style="float:left;margin-top:5px;">
			<img src="${root}/resources/boardImg/img01.PNG" align="center">
			<h2 style="display:inline;"><span style="font-weight: bold; ">간편 검색</span></h2>
		</div>
			
				
		<hr style="border:2px solid green; margin-top: 41px; width:100%">
		<div id="dc_main">
		<form name="dc_picker_form">
			<input type="hidden" value="${root}" name="root"/>
			
			<div id="dc_plickers">
				<div id="tabs" class="cityPicker" style="width:580px; margin-left:150px; margin-top:30px; font-size: 13px;">
				  <ul>
				    <li><a href="#tabs-1">동남아</a></li>
				    <li><a href="#tabs-2">중국</a></li>
				    <li><a href="#tabs-3">일본</a></li>
				  </ul>
				  <div id="tabs-1">
				    <p>
				    <input type="checkbox" name="interest_content" value="캄보디아"/>캄보디아 &nbsp;&nbsp;
				    <input type="checkbox" name="interest_content" value="태국"/>태국 &nbsp;&nbsp;
				    <input type="checkbox" name="interest_content" value="푸켓 "/>푸켓 &nbsp;&nbsp;
				    <input type="checkbox" name="interest_content" value="필리핀"/>필리핀 &nbsp;&nbsp;
				    <input type="checkbox" name="interest_content" value="세부"/>세부 &nbsp;&nbsp;
				    <input type="checkbox" name="interest_content" value="보라카이"/>보라카이 &nbsp;&nbsp;
				    <input type="checkbox" name="interest_content" value="베트남"/>베트남 &nbsp;&nbsp;
				    <input type="checkbox" name="interest_content" value="발리"/>발리 &nbsp;&nbsp;
				    <input type="checkbox" name="interest_content" value="몰디브"/>몰디브 &nbsp;&nbsp;
				    </p>
				  </div>
				  <div id="tabs-2">
				    <p>
				    	<input type="checkbox" name="interest_content" value="도쿄"/>북경 &nbsp;&nbsp;
				    	<input type="checkbox" name="interest_content" value="도쿄"/>상해 &nbsp;&nbsp;
				    	<input type="checkbox" name="interest_content" value="도쿄"/>홍콩 &nbsp;&nbsp;
				    	<input type="checkbox" name="interest_content" value="도쿄"/>대만 &nbsp;&nbsp;
				    	<input type="checkbox" name="interest_content" value="도쿄"/>백두산 &nbsp;&nbsp;
				    	<input type="checkbox" name="interest_content" value="도쿄"/>하이난 &nbsp;&nbsp;    
				    </p>
				  </div>
				  <div id="tabs-3">
				    <p>
				    	<input type="checkbox" name="interest_content" value="도쿄"/>도쿄 &nbsp;&nbsp;
				    	<input type="checkbox" name="interest_content" value="오사카"/>오사카 &nbsp;&nbsp;
				    	<input type="checkbox" name="interest_content" value="오키나와"/>오키나와 &nbsp;&nbsp;
					    <input type="checkbox" name="interest_content" value="훗카이도"/>훗카이도 &nbsp;&nbsp;
				   		<input type="checkbox" name="interest_content" value="쿄토"/>쿄토 &nbsp;&nbsp;
				   		<input type="checkbox" name="interest_content" value="쿄토"/>큐슈 &nbsp;&nbsp;
				   		<input type="checkbox" name="interest_content" value="쿄토"/>대마도 &nbsp;&nbsp;
				    </p>
				  	</div>
					</div>
				
					<div id="dc_sl">
						<ul>
							<li id="slider-range" class="" style="width:300px;"></li>
							<li class="">
								<input type="text" id="amount" size="13" disabled="disabled" name="amount"/>
							</li>
						</ul>
					</div>
					
					<div id="dc_imfo">
						<b>(0)개의 상품이 선택되었습니다.</b>
					</div>
				</div>
			</form>
			<div id="dc_product">
				<b id="notice">원하시는 도시와 소요일을 입력해주세요.</b>
				</div>
			</div>
			<div style="height: 400px;">
				<!-- 자리뗴움용 -->
			</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>