
function adminOrderStatsSearch(root){
	
	// 날짜가 한칸만 채워져 있는 경우와 시작날짜가 더 빠른 경우 
	if((($("#start_date").val()=="")&&($("#end_date").val()!=""))||(($("#start_date").val()!="")&&($("#end_date").val()==""))||($("#start_date").val()>$("#end_date").val())){
		alert("기간을 정확하게 선택해주세요.");
		return;
	}
	var url=root;
	
	if($("#start_date").val()!=""){
		url+="/adminOrder/adminOrderStatsSearch.do?start_date="+$("#start_date").val()+"&end_date="+$("#end_date").val()+"&select="+$("#select").val();
	}

	location.href=url;
}