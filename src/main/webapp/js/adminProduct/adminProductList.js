
function adminProducListSearchCheck(form){
	if(form.keyword.value=="") {
		form.keyword.focus();
		alert("검색어를 입력해주십시요.");
		return false;
	}
	form.keyword.name=form.type.value;
}

function checkAllOnChange(){
	var checks = document.getElementsByClassName('checkBox');
	
	for(var i=0;i<checks.length;i++){
		checks[i].checked = adminProducListSearchForm.checkAll.checked;
	}
}