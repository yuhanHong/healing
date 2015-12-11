function readFunc(notice_number, currentPage, root, searchSort, searchWord){
	var url = root+"/boardNotice/read.do?notice_number="+notice_number+"&pageNumber="+currentPage+"&searchSort="+searchSort+"&searchWord="+searchWord;
	//alert(url);
	location.href = url;
}

function boardNoticeSearch(root){
	var searchWord = $("input[name='search']").val();
	var searchSort = $("select[name='sorting']").val();
	//alert(searchWord+","+searchSort);
	var url = root+"/boardNotice/list.do?searchWord="+searchWord+"&searchSort="+searchSort;
	location.href= url;
}

function deleteFunc(notice_number, pageNumber, root){
	var check = confirm("공지사항 글을 삭제하시겠습니까?");
	if(check){
		var url = root+"/boardNotice/delete.do?notice_number="+notice_number+"&pageNumber="+pageNumber;
		location.href=url;
	}else{
		alert("글 삭제가 취소되었습니다.");
	}
	
}

function updateFunc(notice_number, pageNumber, root){
	//alert(notice_number + "," + pageNumber + "," + root);
	var url = root+"/boardNotice/update.do?notice_number="+notice_number+"&pageNumber="+pageNumber;
	location.href=url;
}