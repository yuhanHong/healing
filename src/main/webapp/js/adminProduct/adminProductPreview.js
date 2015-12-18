// reedit할때 이전값을 임시 저장하는 변수
var tempStr="";

function setDefaultText(){
	var unedited=document.getElementsByClassName("unedited");
	for(var i=0;i<unedited.length;i++){
		unedited[i].innerHTML=unedited[i].title;
	}
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
