/**
 * @함수이름 : searchForm
 * @함수설명 : 추천상품 검색 페이지를 검색을통해 상품정보를 ajax로 가져오는 함수
 * @개발자 : 전현준
 * @개발날짜 : 2015. 12. 11
 * @수정내용 : 상품(product) 테이블 변경으로 인한 ajax로 받은 데이터 수정
 * @수정날짜 : 2015. 12. 15
 */
function searchForm(root){
	var url = root + "/adminBanner/bannerSearch.do";
	var product = $("#product option:selected").val();		// select box 선택된 값
	var keyword = $("#keyword").val();
	
	if(keyword == ""){
		alert("상품명이나 나라명을 입력해주세요.");
		$("#keyword")[0].focus();
		return;
	}
		
	// type이 post방식일 때 : data(parameter값), contentType 추가
	$.ajax({
		url:url,
		type:"post",
		dataType:"json",					// dataType: text or json ===> json 선택
		data: {product: product, keyword: keyword},
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		success:function(data){
			$(".result4").remove();			// 검색을 한번더 할때 지워주는 remove() 함수 이용
			var result = "";				// result값 초기화
			
			if(data.data.length > 0){	// ajax로 데이터 넘겼을때 길이가 0 이상일 경우
				for(var i=0; i<data.data.length; i++){
					var div = "<div class='result4'>";
					div += "<div class='recommand2'><input type='checkbox' name='check' value="+data.data[i].product_number+"></div>";
					div += "<div class='recommand2'>" + data.data[i].product_number + "</div>";
					div += "<div class='recommand2' style='width:170px'>" + data.data[i].product_name + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_country + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_stay_days + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_readcount + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_average_score + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_banner + "</div>";
					div += "</div>";
					result += div;
				}
				$("#result1").append(result);
			}else if(data.data.length == 0){	// ajax로 데이터 넘겼을때 길이가 0일 경우
				var result2 = "<div class='result4'>조회된 결과가 없습니다.</div>";
				$("#result1").append(result2);
			}
		},
		error:function(xhr, status, errorMsg){
			alert(status + "," + errorMsg);
		}
	});
}

/**
 * @함수 : jquery 함수
 * @함수설명 : select box UI 변경하는 익명함수
 * @개발자 : 전현준
 * @개발날짜 : 2015. 12. 11
 */
$(function(){
	$("#product").selectmenu();
	$(".ui-selectmenu-text").css("background-color", "#7A19B9");
	$(".ui-selectmenu-text .ui-menu-item ui-state-focus").css("background-color", "#7A19B9");
})


/**
 * @함수이름 : productInsert
 * @함수설명 : 추천상품 리스트 테이블에 등록(테이블명 : banner)
 * @개발자 : 전현준
 * @개발날짜 : 2015. 12. 11
 * @수정내용 : 메인배너 추천상품 등록 script단 처리
 * @수정날짜 : 2015. 12. 15
 */

function productInsert(root){
	var check = false;
	var product_number = "";
	var checkValue = $("input[name='check']");
	for(var i=0; i<checkValue.length; i++){
		if(checkValue[i].checked == true){
			product_number += "," + checkValue[i].value;
		}
	}
	var url = root + "/adminBanner/bannerRecommandInsert.do?product_number="+product_number;
	
	if(product_number == ""){
		alert("메인배너에 등록할 상품을 선택해주세요.");
		return false;
	}else if(product_number != ""){
		if(confirm("추천상품을 메인배너에 등록하시겠습니까?")){
			location.href = url;
			alert("추천상품 등록을 완료하였습니다.");
		}else{
			alert("추천상품 등록을 취소합니다.");
			return false;
		}
	}
}

/**
 * @함수이름 : productdelete
 * @함수설명 : 추천상품 리스트 테이블 DB 데이터 삭제(테이블명 banner)
 * @개발자 : 전현준
 * @개발날짜 : 2015. 12. 12
 * @수정내용 : 메인배너 추천상품 삭제 script단 처리
 * @수정날짜 : 2015. 12. 15
 */
function productdelete(root){
	var check = false;
	var product_number = "";
	var checkValue = $("input[name='check2']");
	for(var i=0; i<checkValue.length; i++){
		if(checkValue[i].checked == true){
			product_number += "," + checkValue[i].value;
		}
	}
	
	var url = root + "/adminBanner/bannerRecommandDelete.do?product_number="+product_number;
	
	if(product_number == ""){
		alert("메인배너에서 제거할 상품을 선택해주세요.");
		return false;
	}else if(product_number != ""){
		if(confirm("추천상품을 메인배너에서 제거하시겠습니까?")){
			location.href = url;
			alert("메인배너에서 제거를 완료하였습니다.")
		}else{
			alert("메인배너 제거을 취소합니다.");
			return false;
		}
	}
}