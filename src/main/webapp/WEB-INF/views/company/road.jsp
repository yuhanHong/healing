<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/boardFaq/boardFaq.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/xhr.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?"></script>
<style type="text/css"> #map { width: 80%; height: 60%; } </style>
<script type="text/javascript">
function findRoad(){
	// 1. 지도 로드하기(사용자 DomDocument에 지도 로딩)
	var myLatlng = new google.maps.LatLng(37.402332, 127.107040);	 // 위도, 경도
	var options = {
			zoom: 15,
			center: myLatlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP,		// 기본 - 로드맵 설정
			//mapTypeId: google.maps.MapTypeId.TERRAIN,		// 지도 - 지형 체크설정
			//scrollwheel: false
	}
	var map = new google.maps.Map(document.getElementById("map"), options);
	
	// 2. 마커 사용하기(마커 생성)
	var marker = new google.maps.Marker({
		position: myLatlng,	 //{lat: 37.402332, lng: 127.107040},
		map: map,
		title: "힐링투어(Healing Tour)"
	});
	
	// 정보창에 들어갈 텍스트 내용
	var contentString = "<div>"
						+ "<span>여행사 이름 : </span><span style='width:150px'>힐링투어</span>"
						+"</div><div>"
						+ "<span>여행사 주소 : </span><span>경기도 성남시 분당구 삼평동 대왕판교로 670길 유스페이스2 B동 8층</span>"
						+ "</div><div>"
						+ "<span>전화번호 : </span><span>TEL. 070-5039-5802 ~ 10</span>"
						+ "</div>";
	
	// 3. 정보창 사용하기(정보창 생성)
	var infowindow = new google.maps.InfoWindow({
		content: contentString
	});
	
	// 4. 이벤트 사용하기(마커 클릭 시 정보창 활성화 이벤트 등록)
	google.maps.event.addListener(marker, 'click', function(){
		infowindow.open(map, marker);
	});
}
</script>
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
			<div  style="width: 750px;margin-top: 30px;margin-left: 20px; color: #333; text-align: left" >
				<div id="map" style="width:500px; height: 500px;"></div>
					<div style="margin:20px">
						<h3>[교통편]</h3>
						신분당선 판교역 4번출구 ▶ 마을버스(602-1, 602-2, 71, 73, 75) ▶ H스퀘어(하이펙스) 하차 ▶ 도보로 5~10분 거리
					</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>