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
	function toServer(){
		var addr = $("#addr")[0].value;
		//alert(addr);
		
		var url = "https://maps.googleapis.com/maps/api/geocode/json";
		var params = "address="+addr+"&sensor=true";
		
		sendRequest("GET", url, fromServer, params);
	}
	
	function fromServer(){
		if(xhr.readyState == 4 && xhr.status == 200){
			//alert(xhr.responseText);
			processJson();
		}
	}
	
	function processJson(){
		var obj = JSON.parse(xhr.responseText);
		console.log(obj);
		var lat = obj.results[0].geometry.location.lat;		// 위도
		var lng = obj.results[0].geometry.location.lng;		// 경도
		alert(lat + "," + lng);
		
		/*var map = {
			center: new google.maps.LatLng(lat, lng),
			zoom: 14
		};
		new google.maps.Map(document.getElementById("map"), map);*/
		
		var map = 
			new google.maps.Map(document.getElementById('map'), {
			center: {lat: lat, lng: lng},		// lat : 위도, lng : 경도
			zoom: 14,
			mapTypeId: google.maps.MapTypeId.TERRAIN
			//scrollwheel: false
		});
		
		var marker = new google.maps.Marker({
			position: {lat: lat, lng: lng},
			map: map,
			title: obj.results[0].formatted_address
		});
	}
</script>
</head>
<body>
	<c:import url="../include/header.jsp"/>
	
	<div id="auto_info" style="border:1px solid orange; margin-left:250px;width:1000px; height:800px">
		<h3> 찾아오시는길</h3>
		
		<input id="addr" type="text"/>
		<input type="button" value="클릭" onclick="toServer()"/>
		<br/><br/>
		
		<div id="map"></div>
	</div>
</body>
</html>