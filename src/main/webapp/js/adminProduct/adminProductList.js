
function productOnClick(product_number,e){
	if(e.target.type=="button") return false;
	if(e.target.type=="checkbox") return false;
	location.href=root+"/adminProduct/adminProductUpdate.do?pNum="+product_number;
}

function productOnMouseOver(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.backgroundColor="#f6f6f6";
}

function productOnMouseOut(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.backgroundColor="#ffffff";
}

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

function deleteProduct(product_number){
	if (confirm(product_number + "번 상품을 삭제하시겠습니까?")){
		location.href=root+"/adminProduct/adminProductDelete.do?pNum="+product_number;
	}
}

