
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
		$("#order_adult").val($("#adult").val());
		resultFun();
	});
	 $("#child").click(function(){		 
		 $("#order_child").val($("#child").val());
		 resultFun();
	});
	 $("#baby").click(function(){		 
		 $("#order_baby").val($("#baby").val());		
		 resultFun();
	});
	 
	 function resultFun(){
		 adult_money=$("#hiddenInfo").children().eq(1).val()*$("#adult").val();
		 child_money=$("#hiddenInfo").children().eq(2).val()*$("#child").val();
		 baby_money=$("#hiddenInfo").children().eq(3).val()*$("#baby").val();
		 result=child_money+adult_money+baby_money;
		 $("#result_money").text(numberFormatter(result));
		 $("#order_money").val(result);
	 }
 
 });

function numberFormatter(result){
	var len=(result+"").length;
	var rest=len%3;
	
	for(var i=0;i<len/3-1;i++){
		result=interceptString(result,rest+i*4);
	}
	
	return result;
}

function interceptString(str,index){
	str=str+"";
	return str.substring(0,index)+","+str.substring(index,str.length);
}