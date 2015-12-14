 /**
 * 
 */
var tempStr="";

function writeSetDefault(){
	var inputText=document.getElementsByTagName("input");
	for(var i=0;i<inputText.length;i++){
		inputText[i].onfocus=function(){writeFocus(event);};
		inputText[i].onblur=function(){writeBlur(event);};
	}
	var select=document.getElementsByTagName("select");
	for(var i=0;i<select.length;i++){
		select[i].onfocus=function(){writeFocus(event);};
		select[i].onblur=function(){writeBlur(event);};
	}
	addFlight();
	addDetail();
}

function writeFocus(e){
//	if(e.target.name.indexOf("price") > 0 ) numberOnFocus(e);
//	if(e.target.name.indexOf("guide") > 0 ) dollarOnFocus(e);
	
//	e.target.style.backgroundColor="yellow";
//	e.target.parentElement.style.backgroundColor="yellow";
//	e.target.parentElement.previousElementSibling.style.backgroundColor="yellow";
	
	if(e.target.tagName!="SELECT") e.target.select();
}

function writeBlur(e){
	if(e.target.name.indexOf("price") > 0 ) numberOnBlur(e);
	if(e.target.name.indexOf("guide") > 0 ) dollarOnBlur(e);
	
//	e.target.style.backgroundColor="white";
//	e.target.parentElement.style.backgroundColor="white";
//	e.target.parentElement.previousElementSibling.style.backgroundColor="white";
}

function setDefaultText(){
	var unedited=document.getElementsByClassName("unedited");
	for(var i=0;i<unedited.length;i++){
		unedited[i].innerHTML=unedited[i].title;
	}
}

function numberOnFocus(e){
	e.target.value=numberUnFormatter(e.target.value);
}

function numberOnBlur(e){
	e.target.previousElementSibling.value=numberUnFormatter(e.target.value);
}

function numberOnInput(e){
	e.target.value=deleteNan(e.target.value);
	e.target.value=numberFormatter(e.target.value);
}
function numberOnInputUnformatted(e){
	e.target.value=deleteNan(e.target.value);
}

function dollarOnFocus(e){
	e.target.value=e.target.value.substring(1,e.target.value.length);
}

function dollarOnBlur(e){
	e.target.previousElementSibling.value=e.target.value.substring(1,e.target.value.length);
}

function dollarOnInput(e){
	e.target.value=deleteNan(e.target.value);
	e.target.value="$" + e.target.value;
}

function addFlight(){
	if(!validationFlight()) return false;
	
	var index=flights.children.length/2 + 1;
	var title=document.createElement("h3");
	title.innerHTML="비행기 정보 " + index;
	title.id="flight"+(index);
	var content=document.createElement("div");
	content.style="height: 560px;";
	content.innerHTML='<h4>예약 가능 인원수</h4><div class="title" ><label>예약 가능 인원</label></div><div class="content"><input type="text" maxlength="2" size="1" name="flight_occupancy'+index+'" oninput="numberOnInputUnformatted(event)"/>명</div><h4>출국 비행기 정보</h4><div class="title"><label>이륙 시각(한국 시각)</label></div><div class="content"><input type="text" maxlength="4" size="2" name="flight_start_date_year'+index+'" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_month'+index+'" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_day'+index+'" oninput="numberOnInput(event)"/><input type="text" maxlength="2" size="1" name="flight_start_departure_hour'+index+'" oninput="numberOnInput(event)"/>시<input type="text" maxlength="2" size="1" name="flight_start_departure_minute'+index+'" oninput="numberOnInput(event)"/>분</div><div class="title"><label>착륙 시각(현지 시각)</label></div><div class="content"><input type="text" maxlength="4" size="2" name="flight_start_date_year'+index+'" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_month'+index+'" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_day'+index+'" oninput="numberOnInput(event)"/><input type="text" maxlength="2" size="1" name="flight_start_arrival_hour'+index+'" oninput="numberOnInput(event)"/>시<input type="text" maxlength="2" size="1" name="flight_start_arrival_minute'+index+'" oninput="numberOnInput(event)"/>분</div><div class="title"><label>항공사</label></div><div class="content"><input type="text" name="flight_start_airline"/></div><div class="title"><label>이륙 도시</label></div><div class="content"><input type="text" name="flight_start_departure_city"/></div><div class="title"><label>착륙 도시</label></div><div class="content"><input type="text" name="flight_start_arrival_city"/></div><h4>귀국 비행기 정보</h4><div class="title"><label>이륙 시각(현지 시각)</label></div><div class="content"><input type="text" maxlength="4" size="2" name="flight_end_date_year'+index+'" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_month'+index+'" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_day'+index+'" oninput="numberOnInput(event)"/><input type="text" maxlength="2" size="1" name="flight_end_departure_hour'+index+'" oninput="numberOnInput(event)"/>시<input type="text" maxlength="2" size="1" name="flight_end_departure_minute'+index+'" oninput="numberOnInput(event)"/>분</div><div class="title"><label>착륙 시각(한국 시각)</label></div><div class="content"><input type="text" maxlength="4" size="2" name="flight_end_date_year'+index+'" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_month'+index+'" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_day'+index+'" oninput="numberOnInput(event)"/><input type="text" maxlength="2" size="1" name="flight_end_arrival_hour'+index+'" oninput="numberOnInput(event)"/>시<input type="text" maxlength="2" size="1" name="flight_end_arrival_minute'+index+'" oninput="numberOnInput(event)"/>분</div><div class="title"><label>항공사</label></div><div class="content"><input type="text" name="flight_end_airline'+index+'"/></div><div class="title"><label>이륙 도시</label></div><div class="content"><input type="text" name="flight_end_departure_city'+index+'"/></div><div class="title"><label>착륙 도시</label></div><div class="content"><input type="text" name="flight_end_arrival_city'+index+'"/></div>';
	flights.appendChild(title);
	flights.appendChild(content);
	
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
	flights.children[flights.children.length-1].children[2].children[0].focus();
	flights.children[flights.children.length-1].children[2].children[0].select();
	return false;
}

function validationFlight(){
	for(var i=0;i<flights.children.length;i++){
		for(var j=0;j<flights.children[i].children.length;j++){
			for(var k=0;k<flights.children[i].children[j].children.length;k++){
				if (flights.children[i].children[j].children[k].tagName=="INPUT" && flights.children[i].children[j].children[k].name.indexOf("flight")==0 && flights.children[i].children[j].children[k].value==""){
					$('#flights').accordion('destroy').accordion({collapsible: true, active:(1+i)/2-1});
					location.href="#flight"+((1+i)/2);
					flights.children[i].children[j].children[k].focus();
//					alert("필드가 비어있습니다.");
//					return false;
				} 
			}
		}
	}
	return true;
}

function addDetail(){
	if(!validationDetail()) return false;
	
	var index=details.children.length/2 + 1;
	var title=document.createElement("h3");
	title.innerHTML=index + "일차 일정";
	title.id="detail"+(index);
	var content=document.createElement("div");
	content.style="height: 560px;";
	content.innerHTML='<h4>예약 가능 인원수</h4><div class="title" ><label>예약 가능 인원</label></div><div class="content"><input type="text" maxlength="2" size="1" name="flight_occupancy'+index+'" oninput="numberOnInputUnformatted(event)"/>명</div><h4>출국 비행기 정보</h4><div class="title"><label>이륙 시각(한국 시각)</label></div><div class="content"><input type="text" maxlength="4" size="2" name="flight_start_date_year'+index+'" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_month'+index+'" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_day'+index+'" oninput="numberOnInput(event)"/><input type="text" maxlength="2" size="1" name="flight_start_departure_hour'+index+'" oninput="numberOnInput(event)"/>시<input type="text" maxlength="2" size="1" name="flight_start_departure_minute'+index+'" oninput="numberOnInput(event)"/>분</div><div class="title"><label>착륙 시각(현지 시각)</label></div><div class="content"><input type="text" maxlength="4" size="2" name="flight_start_date_year'+index+'" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_month'+index+'" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_start_date_day'+index+'" oninput="numberOnInput(event)"/><input type="text" maxlength="2" size="1" name="flight_start_arrival_hour'+index+'" oninput="numberOnInput(event)"/>시<input type="text" maxlength="2" size="1" name="flight_start_arrival_minute'+index+'" oninput="numberOnInput(event)"/>분</div><div class="title"><label>항공사</label></div><div class="content"><input type="text" name="flight_start_airline"/></div><div class="title"><label>이륙 도시</label></div><div class="content"><input type="text" name="flight_start_departure_city"/></div><div class="title"><label>착륙 도시</label></div><div class="content"><input type="text" name="flight_start_arrival_city"/></div><h4>귀국 비행기 정보</h4><div class="title"><label>이륙 시각(현지 시각)</label></div><div class="content"><input type="text" maxlength="4" size="2" name="flight_end_date_year'+index+'" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_month'+index+'" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_day'+index+'" oninput="numberOnInput(event)"/><input type="text" maxlength="2" size="1" name="flight_end_departure_hour'+index+'" oninput="numberOnInput(event)"/>시<input type="text" maxlength="2" size="1" name="flight_end_departure_minute'+index+'" oninput="numberOnInput(event)"/>분</div><div class="title"><label>착륙 시각(한국 시각)</label></div><div class="content"><input type="text" maxlength="4" size="2" name="flight_end_date_year'+index+'" oninput="numberOnInputUnformatted(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_month'+index+'" oninput="numberOnInput(event)"/>-<input type="text" maxlength="2" size="1" name="flight_end_date_day'+index+'" oninput="numberOnInput(event)"/><input type="text" maxlength="2" size="1" name="flight_end_arrival_hour'+index+'" oninput="numberOnInput(event)"/>시<input type="text" maxlength="2" size="1" name="flight_end_arrival_minute'+index+'" oninput="numberOnInput(event)"/>분</div><div class="title"><label>항공사</label></div><div class="content"><input type="text" name="flight_end_airline'+index+'"/></div><div class="title"><label>이륙 도시</label></div><div class="content"><input type="text" name="flight_end_departure_city'+index+'"/></div><div class="title"><label>착륙 도시</label></div><div class="content"><input type="text" name="flight_end_arrival_city'+index+'"/></div>';
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
	
	window.location.href="#detail"+(index);
	details.children[details.children.length-1].children[2].children[0].focus();
	details.children[details.children.length-1].children[2].children[0].select();
	return false;
}

function validationDetail(){
	for(var i=0;i<details.children.length;i++){
		for(var j=0;j<details.children[i].children.length;j++){
			for(var k=0;k<details.children[i].children[j].children.length;k++){
				if (details.children[i].children[j].children[k].tagName=="INPUT" && details.children[i].children[j].children[k].name.indexOf("detail")==0 && details.children[i].children[j].children[k].value==""){
					$('#details').accordion('destroy').accordion({collapsible: true, active:(1+i)/2-1});
					location.href="#detail"+((1+i)/2);
					details.children[i].children[j].children[k].focus();
					alert("필드가 비어있습니다.");
					return false;
				} 
			}
		}
	}
	return true;
}

function edit(e){
	if(e.target.className=='unedited'){
		tempStr="";
		e.target.className='editing';
		e.target.innerHTML='<input type="text" size="10" onblur="loseFocus(event)" />';
		e.target.children[0].focus();
		return false;
	}else if(e.target.className=='edited'){
		tempStr=e.target.innerHTML;
		e.target.className='editing';
		e.target.innerHTML='<input type="text" size="10" onblur="loseFocus(event)" value="' + e.target.innerHTML + '"/>';
		e.target.children[0].focus();
		e.target.children[0].select();
		return false;
	}
}

function loseFocus(e){
	if(e.target.value.trim()==""){
		if(tempStr!=""){
			e.target.parentElement.className="edited";
			e.target.parentElement.innerHTML=tempStr;
			tempStr="";
		}else{
			e.target.parentElement.className="unedited";
			e.target.parentElement.innerHTML=e.target.parentElement.title;
		}
	}else{
		e.target.parentElement.className="edited";
		e.target.parentElement.innerHTML=e.target.value;
	}
}

