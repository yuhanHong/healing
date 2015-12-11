
function productLikeSelectDel(root,member_number){

	var pms=$("#productMap_size").val();
	var str="";
	
	for(var i=0;i< pms;i++){
		var j=$(".productLikeUl:eq("+i+")").find("input").val();
		if($(".productLikeUl:eq("+i+")").find("input").is(':checked')){	
			str+=","+j;
		}
	}
	if(str==""){
		alert("선택된 상품이 없습니다.");
		return;
	}
	alert("삭제가 완료되었습니다.");
	location.href=root+"/productLike/productLikeSelectDel.do?member_number="+member_number+"&str="+str;
}

function productSelect(){
	var pms=$("#productMap_size").val();
	
	if($("#select").val()=="전체 선택"){
		for(var i=0;i< pms;i++){
			$(".productLikeUl:eq("+i+")").find("input").prop("checked",true);
		}	
		$("#select").val("전체 해제");
	}else{
		for(var i=0;i< pms;i++){
			$(".productLikeUl:eq("+i+")").find("input").prop("checked",false);
		}	
		$("#select").val("전체 선택");
	}
	
}