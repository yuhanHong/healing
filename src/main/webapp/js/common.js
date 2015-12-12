/**
 * 
 */

// 숫자에 쉼표 찍어주는 함수 (int -> String)
function numberFormatter(num){
	var len=(num+"").length;
	var rest=len%3;
	if (rest==0) rest=3;
	
	for(var i=0;i<len/3-1;i++){
		num=interceptString(num,rest+i*4);
	}
	
	return num;
}
function interceptString(str,index){
	str=str+"";
	return str.substring(0,index)+","+str.substring(index,str.length);
}

// 숫자의 쉼표를 제거해주는 함수
function numberUnFormatter(result){
	return result.replaceAll(",","");
}

// timeStamp를 yy/mm/dd로 바꿔주는 함수 (timeStamp -> date)

// timeStamp를 hh:mm:ss로 바꿔주는 함수 (timeStamp -> time)

// 특수문자 처리하는 함수1 < > & " /

// 특수문자 처리하는 함수2 + &

// replaceAll ( ORiGinal -> DESTination)
String.prototype.replaceAll = function(org, dest) {
    return this.split(org).join(dest);
}

// 숫자만 입력받는 함수
function getNumbersOnly(evt) {
	var e = window.event || evt;
    var charCode = e.which || e.keyCode;
    if (charCode > 47 && charCode < 58 || charCode > 95 && charCode < 106 || charCode == 9 || charCode == 16 || charCode == 17 || charCode == 35 || charCode == 36 || charCode == 116 ){
    	return true;
    }else{
    	if (window.event) window.event.returnValue = false; //IE
        else e.preventDefault(); //Firefox
    }
}

// 숫자만 남기는 함수 (str -> int), 숫자 맨앞 0 허용하지 않음
function deleteNan(str) {
	num="";
	for(var i=0;i<str.length;i++){
		if(str.charAt(i) != " " && str.charAt(i) >=0 && str.charAt(i) <= 9 ) num += "" + str.charAt(i);
	}
	while(num.charAt(0)=="0"){
		num=num.substring(1,num.length);
	}
	return num;
}


//숫자만 남기는 함수 (str -> int), 숫자 맨앞 0 허용
function deleteNanZero(str) {
	num="";
	for(var i=0;i<str.length;i++){
		if(str.charAt(i) != " " && str.charAt(i) >=0 && str.charAt(i) <= 9 ) num += "" + str.charAt(i);
	}
	return num;
}
