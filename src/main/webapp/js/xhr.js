/**
 *  @함수이름 : createXHR
 *  @작성일 : 2015. 12. 8.
 *  @개발자 : 전현준
 *  @함수설명 : 요청된 XMLHttpRequest 객체가 지니고 있는 버전에 따른 try/catch 처리
 */

var xhr = null;

function createXHR(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else if(window.ActiveXObject){
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e1){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e2){
				return null;
			}
		}
	}else{
		return null;
	}
}

/** @함수이름 : sendRequest
 *  @작성일 : 2015. 12. 8.
 *  @개발자 : 전현준
 *  @함수설명 : ajax 이용하기 위한 함수(method : get/post, url : 요청한 페이지 url, callback : callback함수, params : parameter)
 */
function sendRequest(method, url, callback, params){
	//debugger;
	xhr = createXHR();
	var httpMethod = method;
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	
	var httpUrl = url;
	var httpParams = (params==null || params=="") ? null : params;
	if(httpMethod == "GET" && httpParams != null){
		httpUrl += "?" + httpParams;
	}
	
	xhr.open(httpMethod, httpUrl, true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");		// post 방식일 때 필요함
	xhr.send(httpMethod=="POST" ? httpParams : null);
	xhr.onreadystatechange = callback;
}