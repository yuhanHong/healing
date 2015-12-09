<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript">
	function searchForm(root){
		var url = root + "/adminBanner/bannerSearch.do";
		var product = $("#product option:selected").val();		// select box 선택된 값
		var keyword = $("#keyword").val();
		
		// type이 post방식일 때 : data(parameter값), contentType 추가
		$.ajax({
			url:url,
			type:"post",
			dataType:"text",
			data: {product: product, keyword: keyword},
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			success:function(data){
				//alert(data);
				$("#result").text(data);
			},
			error:function(xhr, status, errorMsg){
				alert(status + "," + errorMsg);
			}
		});
	}		
</script>
</head>
<body>
	<div style="border:1px solid red; width:1250px">
		<c:import url="../home.jsp"/>
	</div>
	<div style="border:1px solid blue; width:250px; height:800px; float:left">
		<div align="center"><h3>[관리자모드 - 추천상품]</h3></div>
		<ul style="list-style-type: none">
			<li><a href="${root}/adminBanner/bannerInsert.do">추천상품등록</a></li>
		</ul>
	</div>
	<div id="auto_info" style="border:1px solid orange; margin-left:250px;width:1000px; height:800px">
		<h3 style="margin:10px">추천상품검색</h3>
		<br>
		
		<h4 style="margin:10px">상품을 검색해주세요.</h4>
		
		<select id="product" name="product" style="margin:10px">
			<option value="product_name">상품명</option>
			<option value="product_country">나라명</option>
		</select>
		
		<input type="text" name="keyword" id="keyword">
		<input type="button" value="상품검색" onclick="return searchForm('${root}')">
		
		<div id="result"></div>
	</div>
</body>
</html>