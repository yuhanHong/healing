
function adminOrderStatsSearch(root){
	var url=root;
	//연도를 선택한 경우
	if($("#select").val()=='year'){
		url+="/adminOrder/adminOrderStatsSearch.do?start_date=0&end_date=0&select="+$("#select").val();
	}
	//연도를 선택하지 않은 경우
	if($("#select").val()!='year'){
		// 날짜가 한칸만 채워져 있는 경우와 시작날짜가 더 빠른 경우 
		if((($("#start_date").val()=="")&&($("#end_date").val()!=""))||(($("#start_date").val()!="")&&($("#end_date").val()==""))||($("#start_date").val()>$("#end_date").val())){
			alert("기간을 정확하게 선택해주세요.");
			return;
		}
				
		//기간을 선택하지 않은 경우
		if(($("#start_date").val()=="")&&($("#end_date").val()=="")){
			alert("기간을 선택해 주세요.");
			return;
		}

		if($("#start_date").val()!=""){
			url+="/adminOrder/adminOrderStatsSearch.do?start_date="+$("#start_date").val()+"&end_date="+$("#end_date").val()+"&select="+$("#select").val();
		}
	}

	location.href=url;
}

$(function() {	
	 $( ".datepicker" ).datepicker({
	      showOn: "button",
	      buttonImage: "http://localhost:8181/main/resources/adminOrder/calendar.JPG",
	      buttonImageOnly: true,
	      dateFormat:"yy/mm/dd",
	      buttonText: "Select date"
   });
		
	$("#start_date").press(function(){
		alert("달력에서 날짜를 선택해주세요.");
		$("#start_date").val("");
	});
});