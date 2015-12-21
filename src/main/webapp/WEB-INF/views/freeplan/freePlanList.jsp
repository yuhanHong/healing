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
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript" src="${root}/js/freeplan/listFromServer.js"></script>
<link type="text/css" rel="stylesheet" href="${root}/css/freeplan/freeplanList.css"/>

<script type="text/javascript">
	$(function(){
		// 국가명을 클릭하면 해당 국가의 도시 list를 출력한다.
		$("#continentDiv ul li").click(function(){
			var countryName = $(this).html();
			var url = "${root}/freeplan/freePlanCityList.do";
			var sendData = "country="+countryName;
			
			$.ajax({
				url:url+"?"+sendData,
				type:"get",
				dataType:"json",
				success:function(args){
					var ctrNameDiv = "<div>"+countryName+"</div>";
					var cityListDiv="<div>"
									+"<ul>";		
					for(var i = 0; i < args.data.length; i++){
						// city 리스트를 출력할 때 같은 도시이면 출력하지 않는다. 
						flag = 0;
						for(var j = 0; j < i; j++){
							if(args.data[i].place_city == args.data[j].place_city){
								flag++;
							}
						}
						if(flag == 0){
							cityListDiv += "<li class='city'>"+args.data[i].place_city+"</li>";	
						}						
					}
					// listFromServer.js 파일로 이동 : 클릭된 국가의 모든 marker 출력
					freePlanSelectCountry("${root}", args, countryName);
					
					cityListDiv +="</ul>"+"</div>";
					
					$(".#countryDiv div").remove();
					
					// 클릭된 국가의 도시를 countryDiv class의 자식으로 붙여준다.
					$("#countryDiv").append(ctrNameDiv).append(cityListDiv);
					
					// - 도시명을 클릭하면 해당 도시로 map이 이동된다.
					// - dialog를 이용해서 검색창, marker 리스트를 생성한다.
					// - DAY1, DAY2.. DAY 추가
					// - marker 리스트를 drag해서 drop할 공간 생성(div 이용)
					$(".city").click(function(){
						var cityName = $(this).html();
						var ctrName = $("#countryDiv div:nth-child(1)").html();
						
						// listFromServer.js 파일로 이동 : 도시 선택 시 freePlanSchedule.jsp로 이동
						// 국가 이름을 같이 넘겨주는 이유는 freePlanSchedule.jsp에 해당 국가의 도시 콤보박스 생성 위해 전달.
						printSelectCity("${root}", cityName, ctrName);
					});
					
				},
				error:function(status, error){
					alert(status+","+error);
				}
			});
		});
	});
</script>
</head>
<body onload="init('${root}')" style="margin: 0px;"  onresize="resize()">
<!-- 	<div id="window" style="width:1260px; height:707px; border:1px solid black; "> -->
	<div id="windows" style="border:0px solid black; ">
		<div id="continentDiv">
			<ul>
				<c:forEach var="countryName" items="${countryList}">
					<li>${countryName}</li>
				</c:forEach>
			</ul>
		</div>
		
		<div id="countryDiv">
			<div>국가명</div>
			<div>
				<ul>
					<li>도시명</li>
				</ul>
			</div>
		</div>
		
		<div id="map_canvas"></div>
	</div>
</body>
</html>