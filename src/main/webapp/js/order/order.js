
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
	 
	 var result=0;
	 
	 $("#order_adult").click(function(){
		 var adult_money=$("#hiddenInfo").children().eq(2).val()*$("#order_adult").val();
		result=result+adult_money;
		 $("#result_money").text(result);
		 $("#order_money").val(result);
	});
	 $("#order_child").click(function(){
		 var child_money=$("#hiddenInfo").children().eq(3).val()*$("#order_child").val();
		 result=result+child_money;
		 $("#result_money").text(result);
		 $("#order_money").val(result);
	});
	 $("#order_baby").click(function(){
		 var baby_money=$("#hiddenInfo").children().eq(4).val()*$("#order_baby").val();
		result=result+baby_money;
		 $("#result_money").text(result);
		 $("#order_money").val(result);
	});
	 
 });