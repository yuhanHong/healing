/**
 * 
 */

var map;
var infoWindow;
var myOptions;

$(function(){
	// 도시를 변경했을 때 해당 도시의 장소 출력 page로 이동
	$("#select_box").change(function(){
		var cityName = $("#select_box option:selected").text();
		var ctrName = $("input[name='ctrName']").val();
		var root = $("input[name='root']").val();
		printSelectCity(root, cityName, ctrName);
	});
	
	clickEvent();
	
	// 검색창 클릭 시 text를 null로 변경
	$("#city_search_text").click(function(){
		$("#city_search_text").val("");
	});
	
	//
	
	
});

function resize(){
	//구글맵 사이즈 조정
	var w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName('body')[0],
    x = w.innerWidth || e.clientWidth || g.clientWidth,
    y = w.innerHeight|| e.clientHeight|| g.clientHeight;

	var wid = x - 330;
	var hei = y;
	
	map_canvas.style.width = wid+"px";
	map_canvas.style.height = hei+"px";
	map_canvas.style.margin = "0px 0px 0px 330px";
	continentDiv.style.height = hei+"px";
	countryDiv.style.height = (hei)+"px";
	continentDiv.children[0].style.height = (hei-50)+"px";
	countryDiv.children[1].style.height = (hei-130)+"px";
}

function init(root){	
	resize();
	
	var url = root+"/freeplan/freePlanPrintMarker.do";
	$.ajax({
		url:url,
		type:"get",
		dataType:"json",
		success:function(args){
			// 동남아, 중국, 일본의 중앙 지점인 필리핀 루손섬 좌표 설정
			var latlng = new google.maps.LatLng(16.5662318,121.2626366);
			myOptions = {
					zoom:4,
					center:latlng,
					mapTypeId:google.maps.MapTypeId.ROADMAP
			};
			
			setMarkerInList(args, myOptions);
		},
		
		error:function(xhr, status, error){
			alert(status+","+error);
		}
	});
}

function freePlanSelectCountry(root, args, countryName){
	
	var latlng = null;
	if(countryName=="일본"){
		latlng = new google.maps.LatLng(36.204824,138.252924);
	}else if(countryName=="중국"){
		latlng = new google.maps.LatLng(29.96711809,112.34443188);
	}else if(countryName=="필리핀"){
		latlng = new google.maps.LatLng(12.879721,121.774017);
	}else if(countryName=="태국"){
		latlng = new google.maps.LatLng(15.54769022,101.05488203);
	}else if(countryName=="캄보디아"){
		latlng = new google.maps.LatLng(12.565679,104.990963);
	}else if(countryName=="싱가포르"){
		latlng = new google.maps.LatLng(1.352083,103.819836);
	}else if(countryName=="라오스"){
		latlng = new google.maps.LatLng(19.85627,102.495496);
	}else if(countryName=="말레이시아"){
		latlng = new google.maps.LatLng(4.210484,101.975766);
	}else if(countryName=="베트남"){
		latlng = new google.maps.LatLng(14.058324,108.277199);
	}

	myOptions = {
			zoom:5,
			center:latlng,
			mapTypeId:google.maps.MapTypeId.ROADMAP
	};
	setMarkerInList(args, myOptions);
}

function printSelectCity(root, cityName, ctrName){
	// 도시 클릭 시 일정 추가 page로 이동
	var url=root+"/freeplan/freePlanSchedule.do?cityName="+cityName+"&ctrName="+ctrName;
	location.href=url;
}

// freePlanList.jsp 페이지에 marker 찍는 함수
function setMarkerInList(args, myOptions){
	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	
	for(var i = 0; i < args.data.length; i++){
		var myLat = args.data[i].place_latitude;
		var myLng = args.data[i].place_longitude;
		
		var info = "<div>"+
		"<h2>"+args.data[i].place_name+"</h2>"+
		"<p>"+args.data[i].place_explain+"</p>"+
		"</div>";
		
		var name = args.data[i].place_name;
		
		addMarker(myLat, myLng, name, info);
	}


	function addMarker(myLat, myLng, name, info){				
		var marker = new google.maps.Marker({
			position:new google.maps.LatLng(myLat, myLng),
			map:map,
			title:name
		});
		
		var contentString = info;
		var infowindow = new google.maps.InfoWindow({ content: contentString, maxWidth:150});
		
		google.maps.event.addListener(marker, "click", function(){
			
			infowindow.open(map, marker);
			
		});
	}
}

function resizeShedule(){
	// 구글 맵 resize
	var w = window,
	d = document,
	e = d.documentElement,
	g = d.getElementsByTagName('body')[0],
	x = w.innerWidth || e.clientWidth || g.clientWidth,
	y = w.innerHeight || e.clientHeight || g.clientHeight;
	
	// x, y는 브라우저 창의 크기
	// map의 width는 x(브라우저 창의 폭)-600(drop_region폭+city_dialog폭)
	var wid = x - 605;
	var hei = y;
	
	map_schedule_canvas.style.width = wid+"px";
	map_schedule_canvas.style.height = hei+"px";
	map_schedule_canvas.style.margin = "0px 0px 0px 605px";
	
	drop_region.style.height = hei+"px";
	city_dialog.style.height = hei+"px";
	
	drop_region.children[2].style.height = (hei-62)+"px";
	city_dialog.children[3].style.height = (hei-140)+"px";
}

// freePlanSchedule.jsp 페이지 onload 시 호출되는 함수(선택한 도시 marker 찍기)
function initSchedule(root, cityName){
	// 브라우저 창 크기에 맞게 resize
	resizeShedule();
	
	var url = root+"/freeplan/freePlanSelectCity.do?cityName="+cityName;
	$.ajax({
		url:url,
		type:"get",
		dataType:"json",
		success:function(args){
			// 도시 선택 시 해당 도시 list의 첫번째 인덱스 장소로 map이 이동된다.
			var latlng = new google.maps.LatLng(args.data[0].place_latitude,args.data[0].place_longitude);
			myOptions = {
					zoom:12,
					center:latlng,
					mapTypeId:google.maps.MapTypeId.ROADMAP
			};
			setMarkerInSchedule(args, myOptions);
			
			
		},
		error:function(status, error){
			alert(status+","+error);
		}
	});
}

// freePlanSchedule.jsp 페이지에 marker 찍는 함수
function setMarkerInSchedule(args, myOptions){
	map = new google.maps.Map(document.getElementById("map_schedule_canvas"), myOptions);
	
	for(var i = 0; i < args.data.length; i++){
		var myLat = args.data[i].place_latitude;
		var myLng = args.data[i].place_longitude;
		
		var info = "<div>"+
		"<h2>"+args.data[i].place_name+"</h2>"+
		"<p>"+args.data[i].place_explain+"</p>"+
		"</div>";
		
		var name = args.data[i].place_name;
		var zIndex = args.data[i].place_number;
		
		addMarker(myLat, myLng, name, info, zIndex);
	}


	function addMarker(myLat, myLng, name, info, zIndex){				
		var marker = new google.maps.Marker({
			position:new google.maps.LatLng(myLat, myLng),
			map:map,
			title:name,
			zIndex:zIndex	// place_number로 구분하기 위해 zIndex에 place_number 입력
		});
		
		var contentString = info;
		var infowindow = new google.maps.InfoWindow({ content: contentString});
		
		google.maps.event.addListener(marker, "click", function(){
			infowindow.open(map, marker);
			
			// marker 클릭 시 city_list의 존재하는 marker 정보로 이동 및 배경색 변경 
			// 이전에 변경된 배경색을 모두 흰색으로 초기화
			$(".city_list ul li").css({'background-color':'#ffffff'});
			
			var place_number = marker.getZIndex();
			var id = "#"+place_number;
			
			$(".city_list"+" "+id).css({'background-color':'#EAEAEA'});
			var position = $(".city_list ul"+" "+id).offset();
			$(".city_list").animate({scrollTop:position.top},1000);
		});
	}
}

// #city_search_btn 버튼 클릭 시 검색어에 맞는 cityName의 장소 출력
function clickSearchBtn(root, cityName){
	var word = $("#city_search_text").val();

	var url=root+"/freeplan/freePlanSelectCity.do?cityName="+cityName+"&searchWord="+word;
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"json",
		success:function(args){
			// 도시 선택 시 해당 도시 list의 첫번째 인덱스 장소로 map이 이동된다.
			
			if(args.data.length==0)
				alert("검색 장소가 없습니다.");
			
			var latlng = new google.maps.LatLng(args.data[0].place_latitude,args.data[0].place_longitude);
			myOptions = {
					zoom:12,
					center:latlng,
					mapTypeId:google.maps.MapTypeId.ROADMAP
			};
			// marker 찍기
			setMarkerInSchedule(args, myOptions);
			
			// 비동기로 list 넣기
			$(".city_list ul li").remove();
			
			var result="";
			for(var i = 0; i < args.data.length; i++){
				var city_list_child="<li id='"+args.data[i].place_number+"' class='list_li' tabindex='-1'>";
				city_list_child+="<img id='city_list_photo' src='http://localhost:8181/main/resources/mapImage/"+args.data[i].place_file_name+"'style='width:70px; height:70px;'/>";
				city_list_child+="<p id='city_list_name'>"+args.data[i].place_name+"</p>";
				city_list_child+="<img id='plusImg' class='plusImg' src='http://localhost:8181/main/resources/freePlanImg/add.png' style='cursor:hand;'/>";
				city_list_child+="</li>";
				result+=city_list_child;
			}
			$(".city_list ul").append(result);
			
			clickEvent();
			dragFunc();
		},
		error:function(status, error){
			alert(status+","+error);
		}
	});
}

// .city_category 버튼 클릭 시 cityName의 관광지, 호텔, 음식점 중 category의 marker, list만 출력
function clickCategory(img, cityName, root){
	var place_category = null;
	// 클릭된 버튼에 따라 category 값을 지정
	if(img.id == "place_btn"){
		place_category="place";
	}else if(img.id == "rest_btn"){
		place_category="rest";
	}else if(img.id == "hotel_btn"){
		place_category="hotel";
	}
	
	var url = root+"/freeplan/freePlanSelectCity.do?cityName="+cityName+"&place_category="+place_category;
	$.ajax({
		url:url,
		type:"get",
		dataType:"json",
		success:function(args){
			
			if(args.data.length==0){
				alert("장소가 존재하지 않습니다.");
			}else{
				// category 버튼 클릭 이벤트 ( 클릭 시 버튼 색 변경 ) 
				if(place_category=="place"){
					$(".city_category #rest_btn").attr("src",root+"/resources/freePlanImg/rest_p.png");
					$(".city_category #hotel_btn").attr("src",root+"/resources/freePlanImg/hotel_p.png");
					
					img.src=root+"/resources/freePlanImg/place.png";
				}else if(place_category=="rest"){
					$(".city_category #place_btn").attr("src",root+"/resources/freePlanImg/place_p.png");
					$(".city_category #hotel_btn").attr("src",root+"/resources/freePlanImg/hotel_p.png");
					
					img.src=root+"/resources/freePlanImg/rest.png";
				}else{
					$(".city_category #rest_btn").attr("src",root+"/resources/freePlanImg/rest_p.png");
					$(".city_category #place_btn").attr("src",root+"/resources/freePlanImg/place_p.png");
					
					img.src=root+"/resources/freePlanImg/hotel.png";
				}
			}
			
			// 도시 선택 시 해당 도시 list의 첫번째 인덱스 장소로 map이 이동된다.
			var latlng = new google.maps.LatLng(args.data[0].place_latitude,args.data[0].place_longitude);
			myOptions = {
					zoom:12,
					center:latlng,
					mapTypeId:google.maps.MapTypeId.ROADMAP
			};
			// marker 찍기
			setMarkerInSchedule(args, myOptions);
			
			// 비동기로 list 넣기
			$(".city_list ul li").remove();
			
			var result="";
			for(var i = 0; i < args.data.length; i++){
				var city_list_child="<li id='"+args.data[i].place_number+"' class='list_li' tabindex='-1'>";
				city_list_child+="<img id='city_list_photo' src='http://localhost:8181/main/resources/mapImage/"+args.data[i].place_file_name+"'style='width:70px; height:70px;'/>";
				city_list_child+="<p id='city_list_name'>"+args.data[i].place_name+"</p>";
				city_list_child+="<img id='plusImg' class='plusImg' src='http://localhost:8181/main/resources/freePlanImg/add.png' style='cursor:hand;'/>";
				city_list_child+="</li>";
				result+=city_list_child;
			}
			$(".city_list ul").append(result);
			
			clickEvent();
			dragFunc();
		},
		error:function(status, error){
			alert(status+","+error);
		}
	});
}

//list의 장소 선택 시 배경색 변경
function clickEvent(){
	$(".city_list ul li").click(function(){
		var id = $(this).attr("id");
		$(".city_list ul li").css({'background-color':'#ffffff'});
		$(this).css({'background-color':'#EAEAEA'});
	});
}

