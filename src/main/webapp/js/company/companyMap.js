/**
 * 
 * @함수이름 : findRoad
 * @작성일 : 2015. 12. 8.
 * @개발자 : 전현준
 * @함수설명 : 회사정보 - 찾아오시는 길 부분(google 맵 지도 파싱)
 */
function findRoad(){
	// 1. 지도 로드하기(사용자 DomDocument에 지도 로딩)
	var myLatlng = new google.maps.LatLng(37.402332, 127.107040);	 // 위도, 경도
	var options = {
			zoom: 15,
			center: myLatlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP,		// 기본 - 로드맵 설정
			//mapTypeId: google.maps.MapTypeId.TERRAIN,		// 지도 - 지형 체크설정
			//scrollwheel: false							// 마우스 휠 사용 - true/false
	}
	var map = new google.maps.Map(document.getElementById("map"), options);
	
	// 2. 마커 사용하기(마커 생성)
	var marker = new google.maps.Marker({
		position: myLatlng,	 //{lat: 37.402332, lng: 127.107040} ===> lat : 위도, lng : 경도
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