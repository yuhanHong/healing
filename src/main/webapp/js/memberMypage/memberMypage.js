
function pushRequest(root,member_number,order_number,flight_number,notice_content){
	var url=root+"/adminPushNotice/adminPushNoticeRequest.do?member_number="+member_number+"&order_number="+order_number+"&flight_number="+flight_number+"&push_content="+notice_content;
	$.ajax({
		url: url,
		type:"get",
		dataType:"text",
		success:function(data){
				  if(data=="1"){
					  alert("신청이 완료되었습니다.");
				  }else{
					  alert("이미 신청이 완료되었습니다.");
				  }
		},
		error:function(xhr,status,error){
			alert("이미 신청이 완료되었습니다.");
		}
	});
	
}