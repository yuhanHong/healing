
function toServer() {
	 	
	var url="/main/adminPushNotice/adminPushCheck.do";
	sendRequest("GET", url, fromServer);
	
	//시간마다 반복
	setTimeout("toServer()",500);
}

toServer();

var xhr=null;

//요청보내기
function sendRequest(method, url, callback){
	
	//createXHR
	if(typeof XMLHttpRequest !== 'undefined') xhr = new XMLHttpRequest();
	else {
		var versions = ["MSXML2.XmlHttp.5.0", 
			 	"MSXML2.XmlHttp.4.0",
			 	"MSXML2.XmlHttp.3.0", 
			 	"MSXML2.XmlHttp.2.0",
			 	"Microsoft.XmlHttp"]

		for(var i = 0, len = versions.length; i < len; i++) {
		try {
			xhr = new ActiveXObject(versions[i]);
			break;
		}
			catch(e){}
		} // end for
	}
		
	xhr.onreadystatechange = ensureReadiness;
		
	function ensureReadiness() {
		if(xhr.readyState < 4) {
			return;
		}
			
		if(xhr.status !== 200) {
			return;
		}

		// all is well	
		if(xhr.readyState === 4) {
			callback(xhr);
		}			
	}
		
	xhr.open(method, url, true);
	xhr.send(null);
	xhr.onreadystatechange=callback;
}

var i=0;

function fromServer(){
 	if(xhr.readyState==4&&xhr.status==200){
 		var check=xhr.responseText;
 		if(check!=0&&i==1){
 			postMessage("<a href='/main/adminPushNotice/adminPushNotice.do?select=no'><img src='/main/img/message.JPG'/></a>");
 			i=0;
 		}else if(check==0 || i==0){
 			postMessage("");
 			i=1;
 		}
	}
 		
 }