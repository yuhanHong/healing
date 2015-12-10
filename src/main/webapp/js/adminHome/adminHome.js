/**
 * @함수이름 : pageMove
 * @날짜 : 2015. 12. 10
 * @개발자 : 전현준
 * @함수내용 : <a> 태그 post 방식으로 넘기는 함수
 */
function pageMove(root, id, pw){
	var f = document.adminHome;
	var page = root + "/adminBanner/bannerInsert.do";

 	f.admin_id.value = id;
	f.admin_pw.value = pw;
	f.action = page;
	f.method = "post";
	f.submit();
}