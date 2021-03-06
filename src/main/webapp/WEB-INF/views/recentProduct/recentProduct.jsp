<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품 include 페이지</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/boardFaq/boardFaq.css"/>
<%
	// 쿠키 얻어오기(쿠키 생성은 recentProduct/RecentProductServiceImp 에서 해준다)
	Cookie cookies[] = request.getCookies();		// 쿠키 얻어오는 코드
	int cookiesLength = cookies.length;				// 쿠키 길이
	
	String value = "";
	
	ArrayList<String> list = new ArrayList<String>();
	for(int i=1; i<cookies.length; i++){
		value = cookies[i].getValue();
		list.add(value);
	}

	/* out.print("value값:" + list.get(0) + "<br>");
	out.print("value값:" + list.get(1) + "<br>");
	out.print("사이즈:" + list.size()); */
	String pro_num = "";
	for(int i=0; i<list.size(); i++){
		pro_num += list.get(i) + ",";		// DB에 넘겨주는 product_number(,로 연결함)
	}
	
	String servletPath = request.getServletPath();		// 현재 뜨고 있는 페이지 경로(/WEB-INF/ 부터 시작하는 풀루트)
	String pagePath = servletPath.substring(servletPath.lastIndexOf("/"));		// jsp 페이지 경로
%>

<c:set var="value" value="<%=pro_num %>"/>
<c:set var="cookies" value="<%=cookies %>"/>
<c:set var="cookiesLength" value="<%=cookiesLength %>"/>
<c:set var="pagePath" value="<%=pagePath %>"/>

<script type="text/javascript">
/**
 * @함수 : Jquery 함수
 * @작성일 : 2015. 12. 19.
 * @개발자 : 전현준
 * @함수설명 : 최근 본 상품 쿠키 생성한것을 받아서 ajax로 Service쪽에 보내는 함수
 */
$(function(){
	var url = "${root}" + "/recentProduct/recentProductList.do";	// url : ajax로 넘기는 url
	var value = "${value}";											// value : 쿠키값
	var cookies = "${cookies}";										// cookies : 쿠키list정보
	var cookiesLength = "${cookiesLength}";							// cookiesLength : 쿠키길이
	
	$.ajax({
		type:"get",		// url 요청 방식 : get/post
		url:url,		// url 주소
		data:{value: value, cookies: cookies, cookiesLength: cookiesLength},
		dataType:"json",
		success:function(data){		// 응답이 성공 상태 코드를 반환하면 호출되는 함수
			if(data.productInfo.length==0) recentProductWrap.innerHTML="";		// 상품정보가 없을 경우 최근 본 상품 안뜨게 하는 코드
			for(var i=0; i<data.productInfo.length; i++){
				var div = "<div class='recentCookie'>";
				if(data.productPhotoInfo.length != 0){
					div += "<a href= ${root}/product/flightList.do?pNum="+ data.productInfo[i].product_number +"><img width='120px' height='80px' src=${root}/resources/productPhoto/" + data.productInfo[i].product_number + "/0-1-1.jpg></img></a><br>";	
				}
				div += "<b><a href= ${root}/product/flightList.do?pNum="+ data.productInfo[i].product_number + ">" +data.productInfo[i].product_name+"</a></b>";
				div += "</div>";
				
				/*if(i >= 2){ 
					var space="";
					space="<div style='height:300px;'></div>";
					$("#recProData").append(space);	
				}*/
				
				/*if(i >= 2){	break;	} */		// i값이 증가 될 때마다 2이상을 넘게되면 첨에 봤던 상품은 사라지게 하는 조건 
				
				$("#recProData").prepend(div);		// 최근 본 상품이 위로 올라가게 하는 조건
			}
		},
		error:function(xhr, status, errorMsg){		// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
			alert(status + "," + errorMsg);
		}
	});
});
</script>
<link rel="stylesheet" type="text/css" href="${root}/css/recentProduct/recentProduct.css"/>
</head>
<body>

<div id="recentProductWrap">
	<div class="recentProduct" style="orverflow:hiddden;" align="center">
		<b style="line-height: 30px;"> &gt; 최근 본 상품 &lt; </b><br/>
			<div id="recProData" style="width:130px; height:330px;border:0px solid red; ">
				
			</div>
	</div>
</div>
</body>
</html>