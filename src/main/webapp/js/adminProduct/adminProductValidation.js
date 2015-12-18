/*
 * #flight 항공정보의 유효성 검사
 * - 빈칸이 있는지 검사
 */
function validationFlight(){
	for(var i=0;i<flights.children.length;i++){
		for(var j=0;j<flights.children[i].children.length;j++){
			for(var k=0;k<flights.children[i].children[j].children.length;k++){
				if (flights.children[i].children[j].children[k].tagName=="INPUT" && flights.children[i].children[j].children[k].name.indexOf("flight")==0 && flights.children[i].children[j].children[k].value==""){
					$('#flights').accordion('destroy').accordion({collapsible: true, active:(1+i)/2-1});
					location.href="#flight"+((1+i)/2);
					flights.children[i].children[j].children[k].focus();
					alert("필드가 비어있습니다.");
					return false;
				} 
			}
		}
	}
	return true;
}

/*
 * #detail 세부일정의 유효성 검사
 * - 빈칸이 있는지 검사
 */
function validationDays(){
	for(var i=0;i<days.children.length;i++){
		for(var j=0;j<days.children[i].children.length;j++){
			for(var k=0;k<days.children[i].children[j].children.length;k++){
				if (days.children[i].children[j].children[k].tagName=="INPUT" && days.children[i].children[j].children[k].name.indexOf("day")==0 && days.children[i].children[j].children[k].value==""){
					$('#days').accordion('destroy').accordion({collapsible: true, active:(1+i)/2-1});
					location.href="#day"+((1+i)/2);
					days.children[i].children[j].children[k].focus();
					alert("필드가 비어있습니다.");
					return false;
				} 
			}
		}
	}
	return true;
}

/*
 * #detail 세부일정의 유효성 검사
 * - 빈칸이 있는지 검사
 */
function validationDetails(details){
	for(var i=0;i<details.children.length;i++){
		for(var j=0;j<details.children[i].children.length;j++){
			for(var k=0;k<details.children[i].children[j].children.length;k++){
				if (details.children[i].children[j].children[k].tagName=="INPUT" && details.children[i].children[j].children[k].value==""){
					return false;
				} 
			}
		}
	}
	return true;
}

