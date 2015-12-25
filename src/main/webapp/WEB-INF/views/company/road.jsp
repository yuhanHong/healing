<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>찾아오시는 길</title>
<link rel="stylesheet" type="text/css" href="${root}/css/boardFaq/boardFaq.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/xhr.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?"></script>
<script type="text/javascript" src="${root}/js/company/companyMap.js"></script>
<style type="text/css">
	#map { width: 80%; height: 60%; }
</style>
</head>
<body onload="findRoad()">
	 	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class">
	<jsp:include page="companySide.jsp"/>
	
	<div class="content_class">
		<div>
			<div style="float:left;">
				<img src="${root}/resources/boardImg/img01.PNG" align="center">
				<h2 style="display:inline;"><span style="font-weight: bold; ">찾아오시는 길</span></h2>
			</div>
			
		</div>		
		<hr style="border:2px solid green; margin-top: 36px;">
			<div  style="width: 750px;margin-top: 30px; margin-left: 20px; color: #333; text-align: left" >
				<div id="map" style="width:500px; height: 500px;"></div>
					<div style="margin:20px">
						<h3>[교통편]</h3>
						신분당선 판교역 4번출구 ▶ 마을버스(602-1, 602-2, 71, 73, 75) ▶ H스퀘어(하이펙스) 하차 ▶ 도보로 5~10분 거리
					</div>
			</div>
		</div>
	</div>
	
	<!-- 최근 본 상품 include 된 부분 -->
	<c:import url="../recentProduct/recentProduct.jsp"/>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>