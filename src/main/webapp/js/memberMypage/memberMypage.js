
function pushRequest(root,member_number,order_number,flight_number,notice_content){
	var url=root+"/adminPushNotice/adminPushNoticeRequest.do?&order_number="+order_number+"&flight_number="+flight_number+"&push_content="+notice_content+"&member_number="+member_number;

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
			alert("서버 오류입니다. 관리자에게 직접 문의하세요.");
		}
	});
	
}