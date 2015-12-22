<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   margin-top: 30px;
   float: left;
}
#adminFreePlanList{
	list-style: none;
	line-height: 30px;
}
#adminFreePlanList li{
	
	width:100px;
}
</style>
<script type="text/javascript" src="${root}/js/xhr.js"></script>
<script type="text/javascript" src="${root}/js/freeplan/freeplanInsert.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
<link type="text/css" rel="stylesheet" href="${root}/css/freeplan/freeplanInsert.css"/>
</head>
<body onload="initialize();">
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>
	<h2 style="margin-top: 40px;">자유여행 장소추가</h2>
	<div style="font-size: 13px; width:1000px; " >
	
		<label>위치 검색 : </label>
	   <input type="text" id="addr" />
	   <input type="button" value="검색" onclick="toServer()" />
	   <form action="${root}/freeplan/freePlanInsertOk.do" method="POST" onsubmit="return freePlanInsertForm(this)" enctype="multipart/form-data">
	      <div id="map"></div>
	      <div id="address"></div>
	      <div id="latLan"></div>
	      <input type="hidden" id="ex" name="ex">
	      <div style="width: 600px;margin-left: 720px;">
		      <ul id="adminFreePlanList">
		     		 <li style="height: 100px;"></li>
			    	 <li>카테고리 ▼<select name="category" >
			        			<option value="hotel">호텔</option>
			      		   		<option value="place">관광지</option>
			    	     		<option value="rest">음식점</option>
			   		   		</select>
			   		  </li>
				    <li>장소이름 ▼<input type="text" name="name"></li>
				    <li>국가 ▼<input type="text" name="country"></li>
				    <li>도시 ▼<input type="text" name="city"></li>
				    <li>설명 ▼<input type="text" name="content"></li>
				    <li> 사진  ▼<input type="file" name="file" value="사진"></li>
			        <li style="text-align:right"><input type="submit" value="등록"/></li>
		      	</ul>
	      </div>
	   </form>
   </div>
</body>
</html>