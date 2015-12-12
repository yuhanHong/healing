function dateFormatter(date){
	var dateSplit=date.split(" ");
	var year=dateSplit[5]+"";
	var month=dateSplit[1];
	if(month=="Jan") month="01";
	else if(month=="Feb") month="02";
	else if(month=="Mar") month="03";
	else if(month=="Apr") month="04";
	else if(month=="May") month="05";
	else if(month=="Jun") month="06";
	else if(month=="Jul") month="07";
	else if(month=="Aug") month="08";
	else if(month=="Sep") month="09";
	else if(month=="Oct") month="10";
	else if(month=="Nov") month="11";
	else if(month=="Dec") month="12";
	
	var day=dateSplit[2]+"";
	
	return year + "/" + month + "/" + day;
}

function adminMemberUpdate(root,member_number){
	var url=root+"/adminMember/adminMemberUpdate.do?member_number="+member_number;
	window.open(url,"","width=400,height=400");
}





