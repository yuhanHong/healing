<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>


<script src="https://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript" src="${root}/js/freeplan/listFromServer.js"></script>
<script type="text/javascript" src="${root}/js/freeplan/freeplanDrag.js"></script>
<link type="text/css" rel="stylesheet" href="${root}/css/freeplan/freeplanSchedule.css"/>
</head>
	<!-- 페이지가 load될 때 선택된 도시의 장소 marker를 찍는다. -->
<body onload="initSchedule('${root}','${freePlanList[0].place_city}')" style="margin: 0px;"  onresize="resizeShedule()">
	<div id="windowSchedule" style="border:0px solid black; ">
		<form action="${root}/freeplan/freePlanSaveFile.do" method="POST" onsubmit="return ScheduleForm(this)">
			<div id="drop_region">
				<input type="hidden" name="member_number" value="${member_number}"/>
				<input type="hidden" id="plan" name="plan"/>
				<div id="schedule">
					<div id="sj1">
						<div id="plus"class="pulm">일정추가</div>
						<div id="minus"class="pulm">일정삭제</div>
					</div>
					<div id="schedule2">
						<ul id="schedule_ul" class="scedu" style="clear:both;">
							<li class="day" id="firstDay" style="background-color: #22741C;">
								<input type="hidden" value="day1"/>
								DAY1	
							</li>
							
						</ul>
					</div>
				</div>
				<div style="border:1px solid #6ABC64; height:60px; line-height: 60px; text-align: center; background-color: #BCE55C;">
					<input type="submit" value="일정 저장하기"/>
					<input type="button" value="나라선택" onclick="location.href='${root}/freeplan/freePlanList.do?member_number=${member_number}'"/>
					<input type="button" value="홈으로" onclick="location.href='${root}'"/>
				</div>
			</div>
		</form>
		
		<div id="city_dialog">
			<div class="city_change">
				<div>${freePlanList[0].place_city}</div>
				<select id="select_box">
					<option>도시변경</option>
					<c:forEach var="cityName" items="${freePlanCityNameList}">
						<option>${cityName}</option>
					</c:forEach>
				</select>
			</div>
			<div class="city_search">
				<div>
					<input type="text" size="28" id="city_search_text" value="장소 검색" />
					<input type="button" id="city_search_btn" value="검색" onclick="clickSearchBtn('${root}','${freePlanList[0].place_city}','')"/>
				</div>
			</div>
			
			<div class="city_category">
				<img src="${root}/resources/freePlanImg/place_p.png" id="place_btn" onclick="clickCategory(this,'${freePlanList[0].place_city}','${root}')" style="cursor:hand;"/>
				<img src="${root}/resources/freePlanImg/rest_p.png" id="rest_btn" onclick="clickCategory(this,'${freePlanList[0].place_city}','${root}')" style="cursor:hand;"/>
				<img src="${root}/resources/freePlanImg/hotel_p.png" id="hotel_btn" onclick="clickCategory(this,'${freePlanList[0].place_city}','${root}')" style="cursor:hand;"/>
			</div>
			
		 	<div id="city_list" class="city_list">
				<ul id="city_ul">
					<c:forEach var="freePlanDto" items="${freePlanList}">
						<li id="${freePlanDto.place_number}" class="list_li" tabindex="-1">
							<input type="hidden" name="place_number" value="${freePlanDto.place_number}"/>
							<img id="city_list_photo" src="${root}/resources/mapImage/${freePlanDto.place_file_name}" style="width:70px; height:70px;"/>
							<p id="city_list_name">${freePlanDto.place_name}</p>
							<img id="plusImg" class="plusImg" src="${root}/resources/freePlanImg/add.png" style="cursor:hand;"/>
						</li>
					</c:forEach>
				</ul>
			</div> 
		</div>
		<input type="hidden" name="ctrName" value="${ctrName}"/>
		<input type="hidden" name="root" value="${root}"/>
		<div id="map_schedule_canvas"></div>
	</div>
</body>
</html>