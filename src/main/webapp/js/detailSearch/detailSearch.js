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
			$("#dc_imfo").children().remove();
			var count="<b>("+args.data.length+")개의 상품이 선택되었습니다.</b>";
			var notice="<b id='notice' style='margin-left:360px;'>선택된 상품이 없습니다.</b>";
				
			$("#dc_product").children().remove();	
			$("#dc_imfo").append(count);
			if(args.data.length==0){
				$("#dc_product").append(notice);
			}
			if(args.data.length>0){
				$("#notice").remove();
			}
			
			for(var i=0; i<args.data.length; i++){	
				var money=args.data[i].product_price_adult;
				
				var form="<div class='dc_product_list' id='product"+args.data[i].product_number+"' onclick=\"productOnClick('"+args.data[i].product_number+"','"+args.data[i].product_category+"')\" onmouseover=\"productOnMouseOver('"+args.data[i].product_number+"')\" onmouseout=\"productOnMouseOut('"+args.data[i].product_number+"')\">";
					form+="<div id='dc_pro_img'><img src='"+root+"/resources/productPhoto/"+args.data[i].product_number+"/0-1-1.jpg' width='240px' height='270px;'/></div>";
					form+="<div id='dc_pro_imfo' style='margin-top:10px'>";
					form+="<ul>";
					form+="<li><b> "+args.data[i].product_name+"</b>  <"+args.data[i].product_stay_days+"일></li>";
					form+="<li>성인기준 : "+numberFormatter(money)+"원</li>";
					form+="</ul>";
					form+="</div>";
					form+="</div>";
					if(i%3==2) form+="<div style='clear: both;'></div>";
					$("#dc_product").append(form);
			}
		}
		,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
    	// alert(e.responseText);
		}
	});
}

function productOnClick(product_number,product_category){
	var root=$("[name='root']").val();
	var pc;
	if(product_category="동남아") pc=1;
	else if(product_category="중국") pc=2;
	else if(product_category="일본") pc=3;
	location.href=root+"/product/flightList.do?pNum=" + product_number + "&pc=" + pc;
}

function productOnMouseOver(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.backgroundColor="#F6F6F6";
}

function productOnMouseOut(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.backgroundColor="#ffffff";
}
