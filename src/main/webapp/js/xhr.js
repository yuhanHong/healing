/**
 * 
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
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(httpMethod=="POST" ? httpParams : null);
	xhr.onreadystatechange = callback;
}