var day=1;

$(function(){
	$("#plus").click(function(){ // 클릭시 데이 1씩 추가
		day=day+1;
		$("#schedule_ul").append("<li id='day"+day+"' class='ui-state-disabled' style='background-color: #0000a0;'><input type='hidden' value='/day"+day+"'/>"+"DAY"+day+"</li>")
	});
	
	$("#minus").click(function(){ // 클릭시 데이 1씩 삭제
		if($("#day"+day).val()!=null){	// 삭제를 계속 눌러도 day가 -로 내려가지않게 막아준다.
			$("#day"+day).remove();
			day=day-1;
		}
	});
	
	dragFunc();
	
});

function dragFunc(){
	var $scj=$("#schedule"),
	$city=$("#city_list");

	$("li",$city).draggable({
		revert: "invalid", // 만약 지정된 위치에 드랍하지 않았을때 처음의 위치로 돌아간다.
		containment: "document", // 드래그 범위 
		helper: "clone",  // 드래그할시 원래것이 남고 복사해서 움직인다.
		cursor: "pointer",	// 커서 모양
	});

	$scj.droppable({
		accept: "#city_ul > li", // 붙일수 있는 아이디값 설정 "#ball > li"
		hoverClass: "ui-state-hover", // 붙이기 가능시 색변경
		drop: function (event, ui) {
			deleteImage( ui.draggable );  // 딜리트 함수 호출
		}
	});
	
	function deleteImage( $item ) {
	 	   copycopy($item);		// 복사 함수 호출
		}
		
		var delImg="<img id='delImg' class='delImg' src='http://localhost:8181/main/resources/freePlanImg/delimg.jpg'/>";
		function copycopy($item){
			 var $list = $( "ul", $scj ).length ?    // ul 길이를 보고 없으면 만들고 있으면 ul 뒤에 붙인다
			          $( "ul", $scj ) :
			          $( "<ul/>" ).appendTo( $scj );
			          
			          var $copy=$("<li></li>");  // 원래 태그를 남기기위해 동일 태그를 하나 카피해준다.
			          $copy.addClass(" list_li ui-draggable ui-draggable-handle").html($item.html());
			          $copy.find( "img.plusImg" ).remove();
			          $copy.append(delImg);
			          
			          $copy.appendTo($list).fadeIn();  // 카피한 테그를 붙여준다
		}
		
		 $( "#schedule_ul").sortable({  // 정렬
			 cancel: ".ui-state-disabled"	// 데이는 움직이지 않는다.
	  	 });
		 
		 $("#schedule_ul li").disableSelection();
		 
		 $(".list_li").click(function(event){	// 리스트쪽 li에 클릭이벤트
			 var $item = $( this ),
		        $target = $( event.target );
			 if($target.is(".plusImg")){		// 클릭이 플러스 이미지 일때
				 deleteImage( $item );			// 딜리트함수 
			 }
			 $("ul.scedu > li").click(function(event){ // 스케쥴쪽 li 클릭이벤트
				 var $item = $( this ),			
				 $target = $( event.target );
				 if($target.is(".delImg")){				// 클릭이 딜리트 이미지 일때
					 ( $item ).remove();				// 선택된것 삭제
				 }
			 });
		 });
}

function ScheduleForm(form){		// 스케줄 정보를 불러와서 합쳐준다
	var number=form.place_number.value;
	var sche=schedule.getElementsByTagName("li");
	var placeNumber=new Array();
	for(var i=0;i<sche.length;i++){
		placeNumber[i]=sche[i].children[0].value;
	}
	
	var plan="";
	for(var i=0;i<sche.length;i++){
		plan+=placeNumber[i]+",";
	}
	$("#plan").val(plan);
	
	
}

