<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	html, body { height: 100%; margin: 0; padding: 0; }
	#map { width: 80%; height: 60%; }
</style>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/xhr.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?"></script>
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
	<jsp:include page="../header.jsp"/>
	
	<div id="auto_info" style="border:1px solid orange; margin-left:250px;width:1000px; height:800px">
		<h3 style="margin:20px">찾아오시는 길</h3>
		<div id="map" style="margin:20px"></div>
		<div style="margin:20px">
			<h3>[교통편]</h3>
			신분당선 판교역 4번출구 ▶ 마을버스(602-1, 602-2, 71, 73, 75) ▶ H스퀘어(하이펙스) 하차 ▶ 도보로 5~10분 거리
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>