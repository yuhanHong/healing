<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript" src="${root}/js/memberMypage/memberMypageFreeplan.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/memberMypage/memberMypageFreeplan.css"/>
</head>
<body 
	<c:if test="${check > 0}">
		onload="initMemberMypage('${root}','day1','${member_number}')"
	</c:if>
>
	<jsp:include page="../include/header.jsp"/>
	<div class="MyPlanOutline">
		<div class="photoDiv">
			<img src="${root}/resources/freePlanImg/Goreme.jpg"/>
		</div>
		
		<c:if test="${check > 0}">
			<div class="placeDiv">
				<c:set var="k" value="0"/>
				
				<c:forEach var="i" begin="1" end="${fn:length(countList)}">
					<c:set var="n" value="1"/>
					<c:forEach var="j" begin="1" end="${countList[i-1]}">
						<c:if test="${j==1}">
							<div class="dayDiv" id="day${i}">
								<div><h2 style="font-weight: bold; color:#ffffff;">Day${i}</h2></div>
								<div><h2 style="font-weight: bold;">${freeplanList[k].place_city }</h2></div>
							</div>
						</c:if>
						
						<div class="placeListDiv">
							<ul>
								<li class="sch_num">${n}</li>
								<li>
									<%-- <img src="${root}/resources/mapImage/${freeplanList[k].place_file_name}"/> --%>
									<img src="${root}/resources/freePlanImg/Goreme.jpg" style="width:80px; height:80px;"/>
								</li>
								<li>${freeplanList[k].place_name}</li>
								<li>
									<img src="${root}/resources/freePlanImg/map_ico.png" style="margin-top: 25px;"
											onclick="setMarker('${freeplanList[k].place_latitude}','${freeplanList[k].place_longitude}')"/>
								</li>
							</ul>
						</div>
						<c:set var="k" value="${k+1}"/>
						<c:set var="n" value="${n+1}"/>
					</c:forEach>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${check == 0}">
			<div class="placeDiv">
				저장된 자유여행 일정이 존재하지 않습니다.
			</div>
		</c:if>
		
		<c:if test="${check > 0}">
			<div id="mapDiv" >
			</div>
			<div style="margin-left: 570px; margin-top: 360px;">
				<select class="day_num">
					<c:forEach var="i" begin="1" end="${fn:length(countList)}">
						<option value="day${i}">DAY${i}</option>
					</c:forEach>
				</select>
			</div>
			<div style="width:100px; height:50px; border:1px solid #ffffff; margin-left: 570px; margin-top:10px;">
				<input type="button" value="삭제하기" onclick="deletePlan('${root}')"/>
			</div>
		</c:if>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>