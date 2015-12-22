var member_number = null;
var map;
var infoWindow;
var myOptions;
var root;
function initMemberMypage(roots, day, memberNumber){
	//alert(root+","+day+","+member_number);
	member_number = memberNumber;
	root = roots;
	var url = root+"/memberMypage/memberMypagePrintMarker.do?member_number="+member_number+"&day="+day;

	$.ajax({
		url:url,
		type:"get",
		dataType:"json",
		success:function(args){
			
			var latlng = new google.maps.LatLng(args.data[0].place_latitude,args.data[0].place_longitude);
			
			myOptions = {
					zoom:12,
					center:latlng,
					mapTypeId:google.maps.MapTypeId.ROADMAP
			};
			setMarkerInMyPage(args, myOptions);
			
		},
		error:function(xhr, status, error){
			alert(status+","+error);
		}
	});
}

function setMarkerInMyPage(args, myOptions){
	map=new google.maps.Map(document.getElementById("mapDiv"),myOptions);
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
		});
	}
	
	$(function(){
		// combo box 선택했을 때 이벤트
		$(".day_num").change(function(){
			var day_num = $(".day_num option:selected").val();				
			initMemberMypage(root, day_num, member_number);
		});
	});
}

function setMarker(lat, lng){
	var latlng = new google.maps.LatLng(lat,lng);
	
	// marker 이미지 클릭 시 해당 place의 marker로 지도 이동
	map.setCenter(latlng);
	
}

// '삭제하기' 버튼 클릭 시 자유여행 플랜 삭제.
function deletePlan(root){
	//alert(root+","+member_number);
	var url=root+"/memberMypage/memberMypageDeletePlan.do?member_number="+member_number;
	location.href=url;
}