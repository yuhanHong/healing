$(function() {
	
	var minvalue="1";
	var maxvalue="1";
	var root=$("[name='root']").val();
	
    $( "#tabs" ).tabs();
    
    $( "#slider-range" ).slider({
		range: true,
		min: 2,
		max: 30,
		slide: function( event, ui ) {
			$( "#amount" ).val( ui.values[ 0 ] +"일" +"~"+ui.values[ 1 ] + "일" );
			minvalue=ui.values[ 0 ];
			maxvalue=ui.values[ 1 ];
		}
	});
    $( "#amount" ).val( "0" + "일" + " ~ " + "0" +"일" );
    
    $("#slider-range").mouseup(function(){
    	if (maxvalue==undefined) return false;
    	var str="";
    	for(var i=0; i<dc_picker_form.interest_content.length;i++){
    		if(dc_picker_form.interest_content[i].checked==true){
    			str+=dc_picker_form.interest_content[i].value+",";
    		}
    	}
    	// alert(str+","+maxvalue+","+minvalue);
    	result(root,str,minvalue,maxvalue);
    });
    
    $("[name='interest_content']").click(function(){
    	// var city=$("[name='interest_content']").value;
    	var str="";
    	for(var i=0; i<dc_picker_form.interest_content.length;i++){
    		if(dc_picker_form.interest_content[i].checked==true){
    			str+=dc_picker_form.interest_content[i].value+",";
    		}
    	}
    	// alert(str+","+maxvalue+","+minvalue);
    	result(root,str,minvalue,maxvalue);
    });
});

function result(root,str,min,max){
	var url=root;
	url+="/detailSearch/detailSearchSort.do?str=";
	url+=str;
	url+="&min=";
	url+=min;
	url+="&max=";
	url+=max;
	// alert(url);
	
	$.ajax({
		type:"get"		// 포스트방식
		,url:url		// url 주소
		,dataType:"json"
		,success:function(args){
			$("#dc_product").children().remove();
			for(var i=0; i<args.data.length; i++){	
				var form="<div id='dc_product_list'>";
					form+="<div id='dc_pro_img'><img src='"+root+"/resources/productPhoto/"+args.data[i].product_number+"/0-1-1.jpg' width='280px' height='300px;'/></div>";
					form+="<div id='dc_pro_imfo'>";
					form+="<ul>";
					form+="<li>상품명 : "+args.data[i].product_name+"</li>";
					form+="<li>일수 : "+args.data[i].product_stay_days+"</li>";
					form+="<li>가격 : "+args.data[i].product_price_adult+"</li>";
					form+="</ul>";
					form+="</div>";
					form+="</div>";
					$("#dc_product").append(form);
			}
		}
		,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
    	// alert(e.responseText);
		}
	});
}









