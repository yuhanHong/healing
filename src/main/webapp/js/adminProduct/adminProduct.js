
// 초기설정
/*
 * productWrite.jsp가 onload에서 호출
 * addFlight가 호출
 * addDay가 호출
 * input 태그의 onfocus 이벤트 정의
*/
function writeSetDefault(){
	var inputText=document.getElementsByTagName("input");
	for(var i=0;i<inputText.length;i++){
		inputText[i].onfocus=function(){writeFocus(event);};
	}
	
	if(flights.children.length==0){
		addFlight();
		addDay();
	}
}

/*
 * productUpdate.jsp가 onload에서 호출
*/
function updateSetDefault(){
	var flightCount = flights.children.length/2 + 1;
	var dayCount = days.children.length/2 + 1;
	$('#flights').accordion({collapsible: true});
	$('#days').accordion({collapsible: true});
}

/*
 * writeSetDefault가 호출
 * input 태그의 onfocus 이벤트 정의 (
*/
function writeFocus(e){
	if(e.target.tagName=="INPUT" && e.target.type=="text") e.target.select();
}



/*
 * 숫자만 입력받도록 하는 숫자 필드의 oninput이벤트 호출 함수 (formatted)
 */
function numberOnInput(e){
	e.target.value=deleteNan(e.target.value);
	if (e.target.name.indexOf('string')>0) {
		e.target.previousElementSibling.value = e.target.value;
	}
	e.target.value=numberFormatter(e.target.value);
}
/*
 * 숫자만 입력받도록 하는 숫자 필드의 oninput이벤트 호출 함수 (unformatted)
 */
function numberOnInputUnformatted(e){
	e.target.value=(deleteNan(e.target.value));
}
/*
 * 숫자만 입력받도록 하는 숫자 필드의 oninput이벤트 호출 함수 (unformatted,0허용)
 */
function numberOnInputUnformattedZero(e){
	e.target.value=deleteNanZero(e.target.value);
}
/*
 * 숫자만 입력받도록 하는 숫자 필드의 oninput이벤트 호출 함수 (dollar)
 */
function dollarOnInput(e){
	e.target.value=deleteNan(e.target.value);
	if (e.target.name.indexOf('string')>0) {
		e.target.previousElementSibling.value = parseInt(e.target.value);
	}
	e.target.value="$" + e.target.value;
}
/*
 * 날짜만 입력받도록 하는 날짜 필드의 onchange이벤트 호출 함수
 */
function datetimeOnChange(e){
	var parentTag = e.target.parentElement;
	
	//year month day hour minute 최솟값 최댓값 설정
	if(parentTag.children[0].value != "" && parentTag.children[0].value < 1970) parentTag.children[0].value = 1970;
	if(parentTag.children[1].value != "" && parentTag.children[1].value == 0) parentTag.children[1].value = "01";
	if(parentTag.children[2].value != "" && parentTag.children[2].value == 0) parentTag.children[2].value = "01";
	if(parentTag.children[1].value > 0 && parentTag.children[1].value < 10 && (parentTag.children[1].value + "").length == 1) parentTag.children[1].value = "0" + parentTag.children[1].value;
	if(parentTag.children[2].value > 0 && parentTag.children[2].value < 10 && (parentTag.children[2].value + "").length == 1) parentTag.children[2].value = "0" + parentTag.children[2].value;
	if(parentTag.children[3].value != "" && parentTag.children[3].value >= 0 && parentTag.children[3].value < 10 && (parentTag.children[3].value + "").length == 1) parentTag.children[3].value = "0" + parentTag.children[3].value;
	if(parentTag.children[4].value != "" && parentTag.children[4].value >= 0 && parentTag.children[4].value < 10 && (parentTag.children[4].value + "").length == 1) parentTag.children[4].value = "0" + parentTag.children[4].value;
	if(parentTag.children[1].value > 12) parentTag.children[1].value = 12;
	if(parentTag.children[2].value > 31) parentTag.children[2].value = 31;
	if(parentTag.children[3].value > 23) parentTag.children[3].value = 23;
	if(parentTag.children[4].value > 59) parentTag.children[4].value = 59;
	
	//날짜,윤년검사
	if (parentTag.children[1].value != "" && parentTag.children[2].value != "" && parentTag.children[1].value != "") {
		var dayMax=31;

		switch (parentTag.children[1].value) {
		case "04":
		case "06":
		case "09":
		case "11":
			dayMax=30;
			break;
		case "02":
			dayMax=28;
			if (parentTag.children[0].value != "" && parentTag.children[0].value%4==0) dayMax=29;
			if (parentTag.children[0].value != "" && parentTag.children[0].value%100==0) dayMax=28;
			if (parentTag.children[0].value != "" && parentTag.children[0].value%400==0) dayMax=29;
			break;
		}
		if(parentTag.children[2].value > dayMax) parentTag.children[2].value = dayMax;
	}
	
	for(var i=0;i<parentTag.children.length;i++){
		if(parentTag.children[i].value=="") return;
	}
}
/*
 * 항공정보 중복되는 value 복사
 */
function copyOnChange(e,index){
	var inputName=e.target.name;
	if(inputName=="flight_start_airline"+index && document.getElementsByName("flight_end_airline"+index)[0].value=="") document.getElementsByName("flight_end_airline"+index)[0].value=e.target.value;
	else if(inputName=="flight_start_departure_city"+index && document.getElementsByName("flight_end_arrival_city"+index)[0].value=="") document.getElementsByName("flight_end_arrival_city"+index)[0].value=e.target.value;
	else if(inputName=="flight_start_arrival_city"+index && document.getElementsByName("flight_end_departure_city"+index)[0].value=="") document.getElementsByName("flight_end_departure_city"+index)[0].value=e.target.value;
}

// 항목 추가,삭제
/*
 * #flights에 항공정보 입력 element 추가
 */
function addFlight(){
	//유효성 검사 후 빈 칸있으면 return
//	if(!validationFlight()) return;
	
	//index = 몇번째 항공정보인지 나타내는 인덱스
	var index=flights.children.length/2 + 1;
	
	//#flights에 elements 추가
	var title=document.createElement("h3");
	title.innerHTML="항공 정보 " + index;
	
	var content=document.createElement("div");
	content.style="height: 560px;";
	content.id="flight"+(index);
	content.innerHTML=''
//		+'<a href="javascript:removeElement(\''+title.id+'\')">삭제</a><br/>'
					+ '<h4>예약 가능 인원수</h4>'
					+ '<div class="title" ><label>예약 가능 인원</label></div>'
					+ '<div class="content"><input type="text" maxlength="2" size="1" name="flight_occupancy'+index+'" oninput="numberOnInput(event)"/>명</div>'
					+ '<h4>출국 비행기 정보</h4>'
					+ '<div class="title"><label>이륙 시각(한국 시각)</label></div>'
					+ '<div class="content">'
					+ '<input type="text" maxlength="4" size="2" name="flight_start_departure_year'+index+'" oninput="numberOnInputUnformatted(event)" onchange="datetimeOnChange(event)"/>년'
					+ '<input type="text" maxlength="2" size="1" name="flight_start_departure_month'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>월'
					+ '<input type="text" maxlength="2" size="1" name="flight_start_departure_day'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>일&nbsp;'
					+ '<input type="text" maxlength="2" size="1" name="flight_start_departure_hour'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>시'
					+ '<input type="text" maxlength="2" size="1" name="flight_start_departure_minute'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>분'
					+ '</div>'
					+ '<div class="title"><label>착륙 시각(현지 시각)</label></div>'
					+ '<div class="content">'
					+ '<input type="text" maxlength="4" size="2" name="flight_start_arrival_year'+index+'" oninput="numberOnInputUnformatted(event)" onchange="datetimeOnChange(event)"/>년'
					+ '<input type="text" maxlength="2" size="1" name="flight_start_arrival_month'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>월'
					+ '<input type="text" maxlength="2" size="1" name="flight_start_arrival_day'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>일&nbsp;'
					+ '<input type="text" maxlength="2" size="1" name="flight_start_arrival_hour'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>시'
					+ '<input type="text" maxlength="2" size="1" name="flight_start_arrival_minute'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>분'
					+ '</div>'
					+ '<div class="title"><label>항공사</label></div>'
					+ '<div class="content"><input type="text" name="flight_start_airline'+index+'" onchange="copyOnChange(event,'+index+')"/></div>'
					+ '<div class="title"><label>이륙 도시</label></div>'
					+ '<div class="content"><input type="text" name="flight_start_departure_city'+index+'" onchange="copyOnChange(event,'+index+')"/></div>'
					+ '<div class="title"><label>착륙 도시</label></div>'
					+ '<div class="content"><input type="text" name="flight_start_arrival_city'+index+'" onchange="copyOnChange(event,'+index+')"/></div>'
					+ '<h4>귀국 비행기 정보</h4><div class="title"><label>이륙 시각(현지 시각)</label></div>'
					+ '<div class="content">'
					+ '<input type="text" maxlength="4" size="2" name="flight_end_departure_year'+index+'" oninput="numberOnInputUnformatted(event)" onchange="datetimeOnChange(event)"/>년'
					+ '<input type="text" maxlength="2" size="1" name="flight_end_departure_month'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>월'
					+ '<input type="text" maxlength="2" size="1" name="flight_end_departure_day'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>일&nbsp;'
					+ '<input type="text" maxlength="2" size="1" name="flight_end_departure_hour'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>시'
					+ '<input type="text" maxlength="2" size="1" name="flight_end_departure_minute'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>분'
					+ '</div>'
					+ '<div class="title"><label>착륙 시각(한국 시각)</label></div>'
					+ '<div class="content">'
					+ '<input type="text" maxlength="4" size="2" name="flight_end_arrival_year'+index+'" oninput="numberOnInputUnformatted(event)" onchange="datetimeOnChange(event)"/>년'
					+ '<input type="text" maxlength="2" size="1" name="flight_end_arrival_month'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>월'
					+ '<input type="text" maxlength="2" size="1" name="flight_end_arrival_day'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>일&nbsp;'
					+ '<input type="text" maxlength="2" size="1" name="flight_end_arrival_hour'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>시'
					+ '<input type="text" maxlength="2" size="1" name="flight_end_arrival_minute'+index+'" oninput="numberOnInputUnformattedZero(event)" onchange="datetimeOnChange(event)"/>분'
					+ '</div>'
					+ '<div class="title"><label>항공사</label></div>'
					+ '<div class="content"><input type="text" name="flight_end_airline'+index+'"/></div>'
					+ '<div class="title"><label>이륙 도시</label></div>'
					+ '<div class="content"><input type="text" name="flight_end_departure_city'+index+'"/></div>'
					+ '<div class="title"><label>착륙 도시</label></div>'
					+ '<div class="content"><input type="text" name="flight_end_arrival_city'+index+'"/></div>'
	flights.appendChild(title);
	flights.appendChild(content);
	
	//input항목에 onfocus, onblur이벤트 추가
	writeSetDefault();
	
	//jQuery accordion을 실행하고, 두번째 항공정보부터는 이전의 항공정보를 복사해서 붙여넣음
	if(index>1){
		$('#flights').accordion('destroy').accordion({collapsible: true, active:index-1});
		for(var j=0;j<flights.children[flights.children.length-1].children.length;j++){
			for(var k=0;k<flights.children[flights.children.length-1].children[j].children.length;k++){
				if (flights.children[flights.children.length-1].children[j].children[k].tagName=="INPUT" && flights.children[flights.children.length-1].children[j].children[k].name.indexOf("flight")==0){
					flights.children[flights.children.length-1].children[j].children[k].value=flights.children[flights.children.length-3].children[j].children[k].value;
				} 
			}
		}
	}else{
		$('#flights').accordion({heightStyle: "content",collapsible: true, active:index-1});
	}
	
	window.location.href="#flight"+(index);
	return false;
}

/*
 * #days에 일정정보 입력 element 추가
 */
function addDay(){
	if(!validationDays()) return;
	
	var index=days.children.length/2 + 1;
	var title=document.createElement("h3");
	title.innerHTML=index + "일차 일정";
	var content=document.createElement("div");
	content.id="day"+(index);
	content.style="height: 560px;";
	content.innerHTML=''
//		+'<a href="javascript:removeElement(\''+title.id+'\')">삭제</a><br/>'
					+ '<div class="content"><input type="hidden" name="product_day_nth_day'+index+'" value="'+index+'"/></div>'
					+ '<div class="title"><label>조식</label></div>'
					+ '<div class="content"><input type="text" name="product_day_breakfast'+index+'"/></div>'
					+ '<div class="title"><label>중식</label></div>'
					+ '<div class="content"><input type="text" name="product_day_lunch'+index+'"/></div>'
					+ '<div class="title"><label>석식</label></div>'
					+ '<div class="content"><input type="text" name="product_day_dinner'+index+'"/></div>'
					+ '<div class="title"><label>숙소</label></div>'
					+ '<div class="content"><input type="text" name="product_day_hotel'+index+'"/></div>'
					+ '<br/>'
					+ '<div id="details'+index+'"></div>';
	
	days.appendChild(title);
	days.appendChild(content);
	addDetail(index);
	
	writeSetDefault();
	
	if(index>1){
		$('#days').accordion('destroy').accordion({collapsible: true, active:index-1});
		for(var j=0;j<days.children[days.children.length-1].children.length;j++){
			for(var k=0;k<days.children[days.children.length-1].children[j].children.length;k++){
				if (days.children[days.children.length-1].children[j].children[k].tagName=="INPUT" && days.children[days.children.length-1].children[j].children[k].name.indexOf("day")==0){
					days.children[days.children.length-1].children[j].children[k].value=days.children[days.children.length-3].children[j].children[k].value;
				} 
			}
		}
	}else{
		$('#days').accordion({heightStyle: "content",collapsible: true, active:index-1});
	}
	
	window.location.href="#day"+(index);
	days.children[days.children.length-1].children[2].children[0].focus();
	
	return false;
}

/*
 * #day'n'에 세부일정정보 입력 element 추가
 */
function addDetail(dayNumber){
	var details=document.getElementById("details"+dayNumber);
	
	if(!validationDetails(details)) return;
	
	var index=details.children.length/2 + 1;
	var title=document.createElement("h5");
	title.innerHTML="세부일정" + index;
	var content=document.createElement("div");
	content.style="height: 560px;";
	content.id="detail"+ dayNumber + "-" + (index);
	content.innerHTML=''
//		+'<a href="javascript:removeElement(\''+title.id+'\')">삭제</a><br/>'
					+ '<div class="title"><label>세부일정 이름</label></div>'
					+ '<div class="content"><input type="text" oninput="javascript:addDetail('+dayNumber+')" name="product_detail_name'+dayNumber+'-'+index+'"/></div>'
					+ '<div class="title" style="height: 116px;"><label>세부일정 설명</label></div>'
					+ '<div class="content" style="height: 116px;"><textarea oninput="javascript:addDetail('+dayNumber+')" style="resize: none;" cols="35" rows="5" name="product_detail_explain'+dayNumber+'-'+index+'"></textarea></div>'
					+ '<div class="title"><label>세부일정 사진</label></div>'
					+ '<div class="content"><input type="file" onchange="javascript:addDetail('+dayNumber+')" class="photos" name="product_photo'+dayNumber+'-'+index+'-1"/></div>';
	
	details.appendChild(title);
	details.appendChild(content);
	
	if(index>1){
		$('#details').accordion('destroy').accordion({collapsible: true, active:index-1});
		for(var j=0;j<details.children[details.children.length-1].children.length;j++){
			for(var k=0;k<details.children[details.children.length-1].children[j].children.length;k++){
				if (details.children[details.children.length-1].children[j].children[k].tagName=="INPUT" && details.children[details.children.length-1].children[j].children[k].name.indexOf("detail")==0){
					details.children[details.children.length-1].children[j].children[k].value=details.children[details.children.length-3].children[j].children[k].value;
				} 
			}
		}
	}else{
		$('#details').accordion({heightStyle: "content",collapsible: true, active:index-1});
	}
	
	if(index>1){
		window.location.href="#detail"+(index);
		details.children[details.children.length-1].children[2].children[0].focus();
	}
	
	return false;
}

/*
 * 추가된 항목을 삭제하는 함수
 */
function removeElement(titleId){
	var title=document.getElementById(titleId);
	var content=title.nextElementSibling;
	var parentTag=title.parentElement;
	
	if (title.parentElement.children.length==2){
		alert("삭제할 수 없습니다.");
		return false;
	}
	if(confirm("삭제하시겠습니까?")==true){
		title.remove();
		content.remove();
		renumber(parentTag);
	};
	
	return false;
}

/*
 * 항목이 삭제되거나 위치가 바뀌었을때 index를 새로 부여하는 함수
 */
function renumber(title){
	if(title.id=="flights"){
		alert("flights");
	}else if(title.id=="days"){
		alert("days");
	}else if(title.id=="details"){
		alert("details");
	}
}
