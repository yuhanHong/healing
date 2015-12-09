
function orderCheck(form,root){
	
	if(form.order_name.value==""){
		alert("이름을 입력하세요.");
		form.order_name.focus();
		return false;
	}
	
	if(form.order_phone.value==""){
		alert("전화번호를 입력하세요.");
		form.order_phone.focus();
		return false;
	}
	

	if(form.order_email.value==""){
		alert("이메일을 입력하세요.");
		form.order_email.focus();
		return false;
	}
	
	var test=false;
	for(var i=0;i<form.payment_option.length;i++){
		if(form.payment_option[i].checked==true) test=true;
	}
	if(test==false){
		alert("결제 방법을 체크하세요.");
		form.payment_option[0].focus();
		return false;
	}
	
	if(form.agree.checked==false){
		alert("동의하지 않으시면 예약이 불가능합니다.");
		return false;
	}
	
	
}

$(function() {
	 $( "#tabs" ).tabs();
	// $( "#time_select" ).selectmenu();
	 
	 var result=0;
	 var adult_money=0;
	 var child_money=0;
	 var baby_money=0;
	 
	 $("#adult").click(function(){
		adult_money=$("#hiddenInfo").children().eq(1).val()*$("#adult").val();
		$("#order_adult").val($("#adult").val());
		resultFun();
	});
	 $("#child").click(function(){
		 child_money=$("#hiddenInfo").children().eq(2).val()*$("#child").val();
		 $("#order_child").val($("#child").val());
		 resultFun();
	});
	 $("#baby").click(function(){
		 baby_money=$("#hiddenInfo").children().eq(3).val()*$("#baby").val();
		 $("#order_baby").val($("#baby").val());
		 resultFun();
	});
	 
	 function resultFun(){
		 result=child_money+adult_money+baby_money;
		 $("#result_money").text(result);
		 $("#order_money").val(result);
	 }
 
 });
