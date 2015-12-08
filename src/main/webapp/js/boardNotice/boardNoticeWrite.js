
function boardNoticeForm(form){
	//alert("OK");
	if(form.notice_writer.value==""){
		alert("작성자를 입력해주세요.");
		return false;
	}
	
	if(form.notice_title.value==""){
		alert("제목을 입력해주세요.");
		return false;
	}
	
	if(form.notice_content.value==""){
		alert("내용을 입력해주세요");
		return false;
	}
}