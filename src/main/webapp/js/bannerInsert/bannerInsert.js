/**
 * @함수이름 : searchForm
 * @함수설명 : 추천상품 검색 페이지를 검색을통해 상품정보를 ajax로 가져오는 함수
 * @개발자 : 전현준
 * @개발날짜 : 2015. 12. 11
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
			$(".result3").remove();			// 검색을 한번더 할때 지워주는 remove() 함수 이용
			var result = "";				// result값 초기화
			
			if(data.data.length > 0){	// ajax로 데이터 넘겼을때 길이가 0 이상일 경우
				for(var i=0; i<data.data.length; i++){
					var div = "<div class='result3'>";
					div += "<div class='recommand2'><input type='checkbox' name='check' value="+data.data[i].product_number+"></div>";
					div += "<div class='recommand2'>" + data.data[i].product_number + "</div>";
					div += "<div class='recommand2_1'>" + data.data[i].product_name + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_country + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_stay_date + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_size + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_readcount + "</div>";
					div += "<div class='recommand2'>" + data.data[i].product_average_score + "</div>";
					div += "</div>";
					result += div;
				}
				$("#result1").append(result);
			}else if(data.data.length == 0){	// ajax로 데이터 넘겼을때 길이가 0일 경우
				var result2 = "<div class='result3'>조회된 결과가 없습니다.</div>";
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
 * @함수 : jquery 함수
 * @함수설명 : 추천상품 리스트 테이블에 등록(테이블명 : adminBanner)
 * @개발자 : 전현준
 * @개발날짜 : 2015. 12. 11
 */

function productInsert(root){
	var check = false;
	var str = "";
	var checkValue = $("input[name='check']");
	for(var i=0; i<checkValue.length; i++){
		if(checkValue[i].checked == true){
			str += "," + checkValue[i].value;
		}
	}
	var url = root + "/adminBanner/bannerRecommandInsert.do?str="+str;
	
	location.href = url;
}