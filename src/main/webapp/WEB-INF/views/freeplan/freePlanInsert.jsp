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
<script type="text/javascript" src="${root}/js/freeplan/freeplanInsert.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
<link type="text/css" rel="stylesheet" href="${root}/css/freeplan/freeplanInsert.css"/>
</head>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" onload="initialize();">

	<div>
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
   </div>
</body>
</html>