/**
 * 
 */

// 숫자에 쉼표 찍어주는 함수 (int -> String)
function numberFormatter(result){
	var len=(result+"").length;
	var rest=len%3;
	
	for(var i=0;i<len/3-1;i++){
		result=interceptString(result,rest+i*4);
	}
	
	return result;
}

function interceptString(str,index){
	str=str+"";
	return str.substring(0,index)+","+str.substring(index,str.length);
}

// timeStamp를 yy-mm-dd로 바꿔주는 함수 (timeStamp -> date)

// timeStamp를 hh:mm:ss로 바꿔주는 함수 (timeStamp -> time)

// 특수문자 처리하는 함수1 < > & " /

// 특수문자 처리하는 함수2 + &
