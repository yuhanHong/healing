
function pushOrderRead(root,push_number,order_number,push_readcheck,i){
	var url=root;
	
	if(push_readcheck=="X"){
		$("#readcheck"+i).remove();
		url+="/adminOrder/adminPushNoticeReadCheckUpdate.do?order_number="+order_number+"&push_number="+push_number;
		
		var form="<li id='readcheck${i}'>O</li>"
		$("#readcheckUl"+i).append(form);
		
	}else{
		url+="/adminOrder/adminOrderRead.do?order_number="+order_number;
	}
	
	var myWindow = window.open(url, "", "width=550, height=400, resizable=0");
	
}

$(function() {	
	$("#select").change(function(){
		var url=$("#root").val();
		url+="/adminPushNotice/adminPushNotice.do?select="+$("select").val();
		location.href=url;
	});
	
});