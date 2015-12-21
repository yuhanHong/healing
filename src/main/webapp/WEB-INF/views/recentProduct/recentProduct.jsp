<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<%
	Cookie cookies[] = request.getCookies();		// 쿠키 얻어오는 코드
	int cookiesLength = cookies.length;				// 쿠키 길이
	
	String value = "";
	for(int i=1; i<cookies.length; i++){
		/* str += cookies[i].getValue() + ","; */
		//out.print(cookies[i].getName() + "<br>");
		//out.print(cookies[i].getValue() + "<br><br>");
		value = cookies[i].getValue();
	}
%>
<c:set var="value" value="<%=value %>"/>
<c:set var="cookies" value="<%=cookies %>"/>
<c:set var="cookiesLength" value="<%=cookiesLength %>"/>

<script type="text/javascript">
	$(function(){
		var url = "${root}" + "/recentProduct/recentProductList.do";
		var value = "${value}";
		var cookies = "${cookies}";
		var cookiesLength = "${cookiesLength}";
		//alert(product_number);
		
		$.ajax({
			type:"get",		// url 요청 방식 : get/post
			url:url,		// url 주소
			data:{value: value, cookies: cookies, cookiesLength: cookiesLength},
			dataType:"json",
			success:function(data){		// 응답이 성공 상태 코드를 반환하면 호출되는 함수
				console.log(data);
				/* $(".adm_list").remove();
				for(var i=0; i<args.data.length; i++){			 
					var form="<div class='adm_list'>";
						form+="<ul>";
						form+="<li id='adm_member_name'>"+args.data[i].member_name+"</li>";
						form+="<li id='adm_member_id'>"+args.data[i].member_id+"</li>";
						form+="<li id='adm_member_phone'>"+args.data[i].member_phone+"</li>";
						form+="<li id='adm_member_email'>"+args.data[i].member_email+"</li>";
						form+="<li id='adm_member_date'>"+dateFormatter(args.data[i].member_date)+"</li>";
						form+="<li id='adm_member_purchase'>"+args.data[i].member_purchase+"</li>";
						form+="<li id='adm_member_level'>"+args.data[i].member_level+"</li>";
						form+="</ul>";
						form+="</div>";
						$("#adm_memberin").append(form);
				} */
			},
			error:function(xhr, status, errorMsg){	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
				alert(status + "," + errorMsg);
			}
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="${root}/css/home/home.css"/>
</head>
<body>
	<div class="recentProduct" align="center">
		<h3 style="color:white;">최근 본 상품</h3>
		<input type="button" value="▲"/>
			<div class="recentCookie">
				${value}
			</div>
		
		<input type="button" value="▼"/>
	</div>
	<!-- 최근 본 상품 디자인 첫 부분 -->
	<%-- <c:set var="photoSize" value="${productPhotoList.size()}"/>
	<div class="recentProduct" align="center" style="margin-top:-800px; height:600px">
	<input type="text" value="${productPhotoList.size() }"/>
		<h3 style="color:white; font-size:16pt; font-family:휴먼매직체; padding-top:5px;">최근 본 상품</h3>
		<input type="button" value="▲" onclick="location.href='${root}/recentProduct/paging.do?listCount=${photoSize}'">
		<c:forEach var="productDto" items="${product}" varStatus="status">
			<c:set var="st" value="${status.index}"/>
			<div class="recentCookie">
				<a href="${root}/recentProduct/recentProduct.do?product_number=${productDto.product_number}">
					<!-- status.index를 이용해서 if조건을 줌 -->
					<c:if test="${st < 1 }">
						<img src="${root}/resources/banner/${productPhoto[status.index].product_photo_filename}" class="cookieImgSize">
					</c:if>
					<c:if test="${st >= 1 }">
						<img src="${root}/resources/banner/${productPhoto[status.index].product_photo_filename}" class="cookieImgSize2"><br>
					</c:if>
				</a>
				<h6 style="font-family:휴먼매직체; font-size:16pt; color:white; padding-top:10px;">${productDto.product_name}<h6>
			</div>
		</c:forEach>
		<input type="button" value="▼" style="margin-top:60px;" onclick="location.href='${root}/recentProduct/paging.do?listCount=${photoSize}'">
	</div> --%>
	<!-- 최근 본 상품 디자인 마지막 부분 -->
</body>
</html>