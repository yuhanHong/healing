<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#map {
   height: 500px;
   width: 500px;
}
</style>
<script type="text/javascript" src="${root}/js/xhr.js"></script>
<script async defer
   src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
<script type="text/javascript">
   function toServer() {
      var addr = document.getElementById("addr").value;
      //alert(addr);
      var url = "https://maps.googleapis.com/maps/api/geocode/json";
      var params = "address=" + addr + "&sensor=true";

      sendRequest("GET", url, fromServer, params);
   }

   function fromServer() {
      if (xhr.readyState == 4 && xhr.status == 200) {
         process();
      }
   }

   function process() {
      // alert("--------------process --------------" + xhr.responseText);
      var obj = JSON.parse(xhr.responseText);
      /* alert("getLat : " +obj.results[0].geometry.location.lat);
      alert("getLng : " +obj.results[0].geometry.location.lng); */
      var getLat = obj.results[0].geometry.location.lat;
      var getLng = obj.results[0].geometry.location.lng;
      //alert("getLat : " + getLat + ", " + "getLng : " + getLng);
      /* alert("getLat : " + getLat " , " + "getLng : " + getLng); */
      /* var getLatLng =new google.maps.LatLng(getLat, getLng); */

      var addTitle = obj.results[0].formatted_address;
      //alert("addTitle : " + addTitle);

      var getLatLng = {lat : getLat, lng : getLng};

      var myOptions = {
         zoom : 19,
         center : getLatLng,
         mapTypeId : google.maps.MapTypeId.ROADMAP
      }
      var geocoder = new google.maps.Geocoder();
      
      map = new google.maps.Map(document.getElementById("map"), myOptions);
      //클릭했을 때 이벤트
         var fullAddress;
         google.maps.event.addListener(map, 'click', function(event) {
            //var location = event.latLng;
            //geocoder를 사용하기 위해 변수를 선언하고 구글 맵 api에서 객체를 얻어 옵니다.
            geocoder.geocode({'latLng' : event.latLng}, function(results, status) {
               if (status == google.maps.GeocoderStatus.OK) {
                  /*
                  좌표를 주소로 변환 시키는 geocoder를 실행합니다.
                  만약 성공적으로 변환이 되었다면, status라는 상태변수가 참이 되어 아래의 코드들이 실행됩니다.
                   */
                  if (results[1]) {
                     fullAddress = results[1].formatted_address;
                     document.getElementById("address").innerHTML =fullAddress;
                     document.getElementById("latLan").innerHTML =event.latLng;
                     //만약 반환된 결과값이 비어있지 않으면 innerHTML을 이용해 결과값을 출력합니다.
                  }
               } else {
                  alert("Geocoder failed due to: " + status);//만약 geocoder가 실패시 알림창을 출력합니다.
               }
            });
            
            placeMarker(event.latLng);
            infowindow.setContent(fullAddress); // 인포윈도우 안에 클릭한 곳위 좌표값을 넣는다.
            infowindow.setPosition(event.latLng); // 인포윈도우의 위치를 클릭한 곳으로 변경한다.
      });
      //클릭 했을때 이벤트 끝
      //인포윈도우의 생성
      var infowindow = new google.maps.InfoWindow({
         content : addTitle,
         size : new google.maps.Size(50, 50),
         position : getLatLng
      });
      infowindow.open(map);
   }

   /* ------------------------------------------------------------------------------------- */
   var marker;
   var map;
   function initialize() {
      var addr = document.getElementById("addr").value;
      if (addr.length != 0) {
         toServer();
      }
      var myLatlng = new google.maps.LatLng(37.564615, 126.98420299999998);
      var myOptions = {
         zoom : 19,
         center : myLatlng,
         mapTypeId : google.maps.MapTypeId.ROADMAP
      }
      var geocoder = new google.maps.Geocoder();
      
      map = new google.maps.Map(document.getElementById("map"), myOptions);
      
      var fullAddress;
      //클릭했을 때 이벤트
      google.maps.event.addListener(map, 'click', function(event) {
         
         //var location = event.latLng;
         //geocoder를 사용하기 위해 변수를 선언하고 구글 맵 api에서 객체를 얻어 옵니다.
         geocoder.geocode({'latLng' : event.latLng}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
               /*
               좌표를 주소로 변환 시키는 geocoder를 실행합니다.
               만약 성공적으로 변환이 되었다면, status라는 상태변수가 참이 되어 아래의 코드들이 실행됩니다.
                */
               if (results[1]) {
                  fullAddress = results[1].formatted_address;
                  //만약 반환된 결과값이 비어있지 않으면 innerHTML을 이용해 결과값을 출력합니다.
                  document.getElementById("address").innerHTML =fullAddress;
                  document.getElementById("latLan").innerHTML =event.latLng;
               }
            } else {
               alert("Geocoder failed due to: " + status);//만약 geocoder가 실패시 알림창을 출력합니다.
            }
         });
         
         placeMarker(event.latLng);
         infowindow.setContent(fullAddress); // 인포윈도우 안에 클릭한 곳위 좌표값을 넣는다.
         infowindow.setPosition(event.latLng); // 인포윈도우의 위치를 클릭한 곳으로 변경한다.
      });
      //클릭 했을때 이벤트 끝
      //인포윈도우의 생성
      var infowindow = new google.maps.InfoWindow(
            {
               content : '<br><b>원하는 위치을 클릭</b>하면 좌표값생성<br> <b>복사하여 좌료값 입력</b>하십시요',
               size : new google.maps.Size(50, 50),
               position : myLatlng
            });
      infowindow.open(map);
   } // function initialize() 함수 끝

   // 마커 생성 합수
   function placeMarker(location) {

      var clickedLocation = new google.maps.LatLng(location);

      marker = new google.maps.Marker({
         position : location,
         map : map
      });
      marker.setMap(null);
      map.setCenter(location);
   }

function freePlanInsertForm(form){
   var wedo=latLan.innerHTML;
//    $("#ex").val(wedo);
   form.ex.value=wedo;
   
}
</script>

</head>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0"
   onload="initialize();">
   <input type="text" id="addr" />
   <input type="button" value="클릭" onclick="toServer()" />
   <form action="${root}/freeplan/freePlanInsertOk.do" method="POST" onsubmit="return freePlanInsertForm(this)" enctype="multipart/form-data">
      <div id="map"></div>
      <div id="address"></div>
      <div id="latLan"></div>
      <input type="hidden" id="ex" name="ex">
      <div>
      <select name="category">
         <option value="hotel">호텔</option>
         <option value="place">관광지</option>
         <option value="rest">음식점</option>
      </select>
         장소이름<input type="text" name="name">
         국가<input type="text" name="country">
         도시<input type="text" name="city">
         설명<input type="text" name="content">
         사진<input type="file" name="file" value="사진">
         <input type="submit" value="등록"/>
      </div>
   </form>
</body>
</html>