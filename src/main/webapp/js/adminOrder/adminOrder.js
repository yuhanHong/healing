
function adminOrderSearch(root){
	
	var url=root;

	//select 값을 비회원, 전체 검색으로 선택한 경우
	if(($("#search_label").val()=="비회원")||($("#search_label").val()=="전체검색")){
		$("#search_input").val("　");
	}
	
	// 날짜가 한칸만 채워져 있는 경우와 시작날짜가 더 빠른 경우 
	if((($("#start_date").val()=="")&&($("#end_date").val()!=""))||(($("#start_date").val()!="")&&($("#end_date").val()==""))||($("#start_date").val()>$("#end_date").val())){
		alert("기간을 정확하게 선택해주세요.");
		return;
	}
	
	// 검색어가 있는 경우
	if($("#search_input").val()!=""){
		var select_num=0;
		
		if($("#search_label").val()=="전체검색"){
			select_num="1";
		}else if($("#search_label").val()=="예약번호"){
			select_num="2";
		}else if($("#search_label").val()=="예약자명"){
			select_num="3";
		}else if($("#search_label").val()=="회원ID"){
			select_num="4";
		}else if($("#search_label").val()=="회원명"){
			select_num="5";
		}else if($("#search_label").val()=="주문자 핸드폰번호"){
			select_num="6";
		}else if($("#search_label").val()=="도시"){
			select_num="7";
		}else if($("#search_label").val()=="비회원"){
			select_num="8";
		}

		//날짜를 선택하지 않았을 때	
		if($("#start_date").val()==""){
			url+="/adminOrder/adminOrderSearchOne.do?search_label="+select_num+"&search_input="+$("#search_input").val();
		}
		
		//날짜도 선택했을 때
		if($("#start_date").val()!=""){
			url+="/adminOrder/adminOrderSearchMulti.do?search_label="+select_num+"&search_input="+$("#search_input").val()+"&start_date="+$("#start_date").val()+"&end_date="+$("#end_date").val();
		}
		
		location.href=url;
	}
}




$(function() {	
	 $( ".datepicker" ).datepicker({
	      showOn: "button",
	      buttonImage: "images/calendar.gif",
	      buttonImageOnly: true,
	      dateFormat:"yy/mm/dd",
	      buttonText: "Select date"
    });



	// $( "#time_select" ).selectmenu();
	 
	 var result=0;
	 var adult_money=0;
	 var child_money=0;
	 var baby_money=0;
	 
	 $("#adult").click(function(){
		adult_money=$("#hiddenInfo").children().eq(2).val()*$("#adult").val();
		$("#order_adult").val($("#adult").val());
		resultFun();
	});
	 $("#child").click(function(){
		 child_money=$("#hiddenInfo").children().eq(3).val()*$("#child").val();
		 $("#order_child").val($("#child").val());
		 resultFun();
	});
	 $("#baby").click(function(){
		 baby_money=$("#hiddenInfo").children().eq(4).val()*$("#baby").val();
		 $("#order_baby").val($("#baby").val());
		 resultFun();
	});
	 
	 function resultFun(){
		 result=child_money+adult_money+baby_money;
		 $("#result_money").text(result);
		 $("#order_money").val(result);
	 }
	 
 });
