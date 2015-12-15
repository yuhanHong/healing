
function adminOrderStatsSearch(root){
	var url=root;
	//연도를 선택한 경우
	if($("#select").val()=='year'){
		url+="/adminOrder/adminOrderStatsSearch.do?start_date=0&end_date=0&select="+$("#select").val();
	}
	//연도를 선택하지 않은 경우
	if($("#select").val()!='year'){
		// 날짜가 한칸만 채워져 있는 경우와 시작날짜가 더 빠른 경우 
		if((($("#start_date").val()=="")&&($("#end_date").val()!=""))||(($("#start_date").val()!="")&&($("#end_date").val()==""))||($("#start_date").val()>$("#end_date").val())){
			alert("기간을 정확하게 선택해주세요.");
			return;
		}
				
		//기간을 선택하지 않은 경우
		if(($("#start_date").val()=="")&&($("#end_date").val()=="")){
			alert("기간을 선택해 주세요.");
			return;
		}

		if($("#start_date").val()!=""){
			url+="/adminOrder/adminOrderStatsSearch.do?start_date="+$("#start_date").val()+"&end_date="+$("#end_date").val()+"&select="+$("#select").val();
		}
	}

	$.ajax({
		url: url,
		type:"get",
		dataType:"json",
		success:function(data){
			
			$(".statsResult").remove();
			
			//return 값이 있는 경우
			if(data.length!=0){

				var array=new Array();
				
				//결과 테이블 출력
	             for(var i=0; i<data.length; i++){          
	                var form="<div class='statsResult'>";
	                   form+="<ul>";
	                   form+="<li class='result_date"+i+"'>"+data[i].date+"</li>";
	                   form+="<li>"+numberFormatter(data[i].sales)+"원</li>";
	                   form+="<li class='result_pay"+i+"'>"+numberFormatter(data[i].pay)+"원</li>";
	                   form+="<li>"+numberFormatter(data[i].sales-data[i].pay)+"원</li>";
	                   form+="</ul>";
	                   form+="</div>";
	                   $("#adminOrderStatsResult").append(form);  
	                  
	                  if(i<6){ //그래프에는 최신으로 최대6개까지만 
	                	  var pay=parseInt(data[i].pay);
	                	  array.push({ label :data[i].date, y: pay } ); 
	                  } 
	             }
	             
	             array.reverse();
	             $("#chartContainer").css("height","300");
	             
	             //chart
           		var chart = new CanvasJS.Chart("chartContainer", {
           			
           			theme: "theme2",//theme1
           			title:{
           				text: "결제 금액"              
           			},
           			animationEnabled: true,   // change to true
           			data: [              
           			{
           				// Change type to "bar", "area", "spline", "pie",etc.
           				type: "column",
           				dataPoints: array
		
           			}]
           		});
           		chart.render();
           
			}else{
				//return 값이 없는 경우
				 alert("검색 결과 값이 없습니다.");
				
			}
			
	         
		},
		error:function(xhr,status,error){
			alert(message+"/"+status+"/"+error);
		}
	});

}

$(function() {	
	 $( ".datepicker" ).datepicker({
	      showOn: "button",
	      buttonImage: "http://localhost:8181/main/resources/adminOrder/calendar.JPG",
	      buttonImageOnly: true,
	      dateFormat:"yy/mm/dd",
	      buttonText: "Select date"
   });
	  	
});