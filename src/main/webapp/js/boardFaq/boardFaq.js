
function readFunc(notice_number, currentPage, root, searchSort, searchWord){
	var url = root+"/boardNotice/read.do?notice_number="+notice_number+"&pageNumber="+currentPage+"&searchSort="+searchSort+"&searchWord="+searchWord;
	
	location.href = url;
}

// 자주 묻는 질문 검색 시 실행
function boardFaqSearch(root){
	var searchWord = $("input[name='searchWord']").val();
	//alert(searchWord+","+searchSort);
	var url = root+"/boardFaq/list.do?searchWord="+searchWord;
	location.href=url;
}

// 자주 묻는 질문 글 삭제 시 실행
function deleteFunc(faq_number,root, faq_sort, searchWord){
	var check = confirm("글을 삭제하시겠습니까?");
	if(check){
		var url = root+"/boardFaq/delete.do?faq_number="+faq_number+"&faq_sort="+faq_sort+"&searchWord="+searchWord;
		location.href=url;
	}else{
		alert("글 삭제가 취소되었습니다.");
	}
}

// 자주 묻는 질문 글 수정 시 실행
function updateFunc(faq_number,root, faq_sort, searchWord){
	//alert(notice_number + "," + pageNumber + "," + root);
	var url = root+"/boardFaq/update.do?faq_number="+faq_number+"&faq_sort="+faq_sort+"&searchWord="+searchWord;
	location.href=url;
}


/**
 * @함수이름 : boardNoticeForm
 * @날짜 : 2015. 12. 24.
 * @개발자 : 전현준
 * @설명 : 문의사항 작성할 때 유효성 검사
 */
function boardFaqForm(form){
	/*var faq_sort = $("input:radio[name='faq_sort']");
	for(i=0; i<faq_sort.length; i++){
		if(faq_sort[i].checked == false){
			alert("구분을 선택해주세요.");
			faq_sort[0].focus();
			return false;
		}
	}*/
	
	if(form.faq_title.value == ""){
		alert("제목를 입력하세요.");
		form.faq_title.focus();
		return false;
	}
	
	if(form.faq_content.value == ""){
		alert("내용을 입력하세요.");
		form.faq_content.focus();
		return false;
	}
}