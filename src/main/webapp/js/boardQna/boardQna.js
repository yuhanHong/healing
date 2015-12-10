
function deleteFunc(qna_number, qna_sequence_number, pageNumber, searchSort, searchWord, root){	
	var check = confirm("문의 글을 삭제하시겠습니까?");
	if(check){
		var url = root+"/boardQna/delete.do?qna_number="+qna_number+"&qna_sequence_number="+qna_sequence_number
											+"&searchSort="+searchSort
											+"&searchWord="+searchWord+"&pageNumber="+pageNumber;
		location.href = url;
	}else{
		alert("글 삭제가 취소되었습니다.");
	}
}

function updateFunc(qna_number, pageNumber, searchSort, searchWord, root){
	var url = root+"/boardQna/update.do?qna_number="+qna_number+"&searchSort="+searchSort
										+"&searchWord="+searchWord+"&pageNumber="+pageNumber;
	location.href = url;
}

function replyFunc(qna_number, qna_group_number, qna_sequence_number, pageNumber, searchSort, searchWord, root){
	var url = root+"/boardQna/write.do?qna_number="+qna_number+"&qna_group_number="+qna_group_number
	+"&qna_sequence_number="+qna_sequence_number+"&searchSort="
	+searchSort+"&searchWord="+searchWord+"&pageNumber="+pageNumber;
	location.href = url;
}

function readFunc(root, qna_password, qna_number, currentPage, searchSort, searchWord){
	var url = null;
	if(qna_password == ""){
		url = root+"/boardQna/read.do?qna_number="+qna_number+"&pageNumber="+currentPage+"&searchSort="+searchSort+"&searchWord="+searchWord;
	}else{
		var returnValue = prompt("비밀번호를 입력하세요.","");
		if(returnValue == qna_password){
			url = root+"/boardQna/read.do?qna_number="+qna_number+"&pageNumber="+currentPage+"&searchSort="+searchSort+"&searchWord="+searchWord;
		}else{
			alert("비밀번호를 확인하세요.");
			url = root+"/boardQna/list.do?pageNumber="+currentPage+"&searchSort="+searchSort+"&searchWord="+searchWord;
		}
	}
	
	location.href = url;
}

function boardQnaSearch(root){
	var searchWord = $("input[name='search']").val();
	var searchSort = $("select[name='sorting']").val();
	//alert(searchWord+","+searchSort);
	var url = root+"/boardQna/list.do?searchWord="+searchWord+"&searchSort="+searchSort;
	location.href= url;
}