var root="";
var cityIndex=0;
var flightIndex=0;
var dayIndex=0;
var detailIndex=0;
var form;

/*
 * ajax를 이용하여 productDto를 DB로 보내는 함수
 */
function productWrite(r){
	root=r;
	form=document.getElementById("productForm");
	var url=root+"/adminProduct/adminProductWrite.do";
	
	$.ajax({
		type: "post",
		url: url,
		data: $("#productForm").serialize(),
		dataType:"text",
		success: function(data){
			form.product_number.value=data;
			if(form.product_number.value==0){
//				alert("productDto 삽입 실패");
				return false;
			}else{
//				alert("productDto 삽입 성공");
				cityIndex=1;
				productCityWrite();
			}
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	});
}
	
/*
 * ajax를 이용하여 productCityDto를 DB로 보내는 함수
 */
function productCityWrite(){
	var url = root+"/adminProduct/adminProductCityWrite.do";
	var city=form.product_cities.value.split(",");
	form.product_city.value=city[cityIndex-1].trim();
	var check=0;
	$.ajax({
		type: "post",
		url: url,
		data: $("#productForm").serialize(),
		dataType:"text",
		success: function(data){
			check=parseInt(data);
			
//			if(check>0) alert("productCityDto"+cityIndex+" 삽입 성공");
//			else alert("productCityDto"+cityIndex+" 삽입 실패");
			
			if(cityIndex==city.length){
				flightIndex=1;
				flightWrite();
			}else {
				cityIndex++;
				productCityWrite();
			}
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	});
}

/*
 * ajax를 이용하여 flightDto를 DB로 보내는 함수
 */
function flightWrite(){
	var form=document.getElementById("productForm");
	var url = root+"/adminProduct/adminFlightWrite.do";
	var flightMax=(flights.children.length)/2;

	var flight=document.getElementById("flight"+flightIndex);
	var flightElements=flight.getElementsByTagName("INPUT");

	for(var j=0;j<flightElements.length;j++) flightElements[j].name=flightElements[j].name.substring(0,flightElements[j].name.length-(flightIndex+"").length);
	
	var check=0;
	
	$.ajax({
		type: "post",
		url: url,
		data: $("#productForm").serialize(),
		dataType:"text",
		success: function(data){
			var check=parseInt(data);

//			if(check>0) alert("flightDto"+flightIndex+" 삽입 성공");
//			else alert("flightDto"+flightIndex+" 삽입 실패");
			
			if(flightIndex==flightMax){
				dayIndex=0;
				productDayZeroWrite();
			}else {
				flightIndex++;
				flightWrite();
			}
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	});
	
	for(var j=0;j<flightElements.length;j++) flightElements[j].name=flightElements[j].name+flightIndex;
}

/*
 * ajax를 이용하여 productDayDto(0)를 DB로 보내는 함수
 */
function productDayZeroWrite(){
	var url = root+"/adminProduct/adminProductDayWrite.do";
	
	var productDayDto=productDayDtoElement.getElementsByTagName("INPUT");
	productDayDto[0].value=0;
	
	var check=0;
	
	$.ajax({
		type: "post",
		url: url,
		data: $("#productForm").serialize(),
		dataType:"text",
		success: function(data){
			var product_day_number=parseInt(data);

			if(product_day_number>0) {
//				alert("productDayDto"+dayIndex+" 삽입 성공" + product_day_number);
				form.product_day_number.value=product_day_number;
				detailIndex=1;
				productDetailWrite();
			}else {
//				alert("productDayDto"+dayIndex+" 삽입 실패");
				return false;
			}
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	});
}

/*
 * ajax를 이용하여 productDayDto를 DB로 보내는 함수
 */
function productDayWrite(){
	var url = root+"/adminProduct/adminProductDayWrite.do";

	var productDayDto=productDayDtoElement.getElementsByTagName("INPUT");
	var day=document.getElementById("day"+dayIndex);
	var DayElements=day.getElementsByTagName("INPUT");
	
	for(var i=0;i<productDayDto.length;i++){
		productDayDto[i].value=DayElements[i].value;
	}
	
	$.ajax({
		type: "post",
		url: url,
		data: $("#productForm").serialize(),
		dataType:"text",
		success: function(data){
			var product_day_number=parseInt(data);

			if(product_day_number>0) {
//				alert("productDayDto"+dayIndex+" 삽입 성공");
				form.product_day_number.value=product_day_number;
				detailIndex=1;
				productDetailWrite();
			}else {
//				alert("productDayDto"+dayIndex+" 삽입 실패");
				return false;
			}
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	});
}

/*
 * ajax를 이용하여 productDetailDto를 DB로 보내는 함수
 */
function productDetailWrite(){
	var url = root+"/adminProduct/adminProductDetailWrite.do";
	var details=document.getElementById("details"+dayIndex);
	var detailMax=Math.max(1,(details.children.length-2)/2);
	var dayMax=(days.children.length)/2;
	
	var productDetailDto=productDetailDtoElement.getElementsByTagName("INPUT");
	var detail=document.getElementById("detail"+dayIndex+"-"+detailIndex);
	
	if (dayIndex!=0) {
		productDetailDto[0].value = detail.getElementsByTagName("INPUT")[0].value;
		productDetailDto[1].value = detail.getElementsByTagName("TEXTAREA")[0].value;
	}
	
	$.ajax({
		type: "post",
		url: url,
		data: $("#productForm").serialize(),
		dataType:"text",
		success: function(data){
			var product_detail_number=parseInt(data);

			if(product_detail_number>0) {
//				alert("productDetailDto"+dayIndex+"-"+detailIndex+" 삽입 성공");
				form.product_detail_number.value=product_detail_number;
				if(detailIndex==detailMax){
					if(dayIndex==dayMax){
						dayIndex=0;
						detailIndex=1;
						photoIndex=1;
						productPhotoWrite();
					}else{
						dayIndex++;
						detailIndex=0;
						productDayWrite();
					}
				}else{
					detailIndex++;
					productDetailWrite();
				}
			}else {
//				alert("productDetailDto"+dayIndex+"-"+detailIndex+" 삽입 실패");
				return false;
			}
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	});
}

/*
 * ajax를 이용하여 productPhotoDto를 DB로 보내는 함수
 */
function productPhotoWrite(){
//	alert("사진 등록");
	var url = root+"/adminProduct/adminProductPhotoWrite.do";
	
	var check=0;
	
	var photos=document.getElementsByClassName("photos");
	for(var i=0;i<photos.length;i++){
		if(photos[i].value!=""){
			var photoIndex=photos[i].name.substring(13,photos[i].name.length);
			form.product_photo_index.value=form.product_photo_index.value+""+photoIndex+",";
		}
	}
	
	form.action=url;
	form.submit();
}