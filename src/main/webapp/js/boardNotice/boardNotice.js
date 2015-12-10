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