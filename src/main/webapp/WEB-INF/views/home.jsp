<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Spring HomePage</title>
<link rel="stylesheet" type="text/css" href="${root}/css/home/home.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript">
  	$(function(){
 	 	$('.bxslider').bxSlider({
 			mode:'horizontal',		// default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
			speed: 500,				// default:500 이미지변환 속도
			pager: true,			// 현재 위치 페이징 표시 여부 설정
			slideWidth: 900,		// 슬라이드 너비
			//slideMargin: 5,    	// 슬라이드간의 간격
 			auto: true,				// default:false 자동 시작
			captions: false,		// 이미지의 title 속성이 노출된다.
			autoHover: true,		// 마우스 호버시 정지 여부
			autoControls: true,		// default:false 정지,시작 콘트롤 노출, css 수정이 필요
 	 	});
 	 	$(".bx-wrapper .bx-caption").css("background", "rgba(49, 187, 33, 0.75)");
 	 	//$(".bx-wrapper .bx-pager.bx-default-pager a:hover").css("background", "#7A09CE");
 	 	//$(".bx-wrapper .bx-pager.bx-default-pager a.active").css("background", "#7A09CE")
 	 	//$(".bx-wrapper .bx-pager.bx-default-pager a:hover, .bx-wrapper .bx-pager.bx-default-pager a.active")
 	 	//$(".bx-pager-link").css("background", "#AA70E8");
 	 	//$(".bx-pager-link active").css("background", "#7A09CE");
 	 	
 	 	//$(".bx-wrapper .bx-pager.bx-default-pager a").css("background", "#AA70E8");
 	 	//$(".bx-pager-link active").css("background", "#7A09CE");
 	 	//$(".bx-wrapper .bx-pager.bx-default-pager a:hover, .bx-wrapper .bx-pager.bx-default-pager a.active").css("background", "#7A09CE");
  	});
</script>
<style>
	.bx-wrapper, .bx-viewport {
    	height: 300px !important; 	/* bx Slider 세로 크기 줄이는 방법 */
	}
</style>
</head>
<%-- <body onload="javascript:location.href='${root}/healingHome/healingHome.do'"> --%>
<body>
	<jsp:include page="header.jsp"/>
	
	<h3>본문1</h3>
	<div align="center" id="banner_wrap">
		<ul class="bxslider">
			<li>
				<a href="#"><img src="${root}/resources/banner/banner1.jpg" width="900px" height="350px" title="caption value pic1"/></a>
			</li>
			<li>
				<a href="#"><img src="${root}/resources/banner/banner2.jpg" width="900px" height="300px" title="caption value pic2"/></a>
			</li>
			<li>
				<a href="#"><img src="${root}/resources/banner/banner3.jpg" width="900px" height="300px" title="caption value pic3"/></a>
			</li>
		</ul>
	</div>
	<hr/>
	<h3>본문2</h3>
	<hr/>
	<h3>본문3</h3>
	<hr/>
	<h3>본문4</h3>
	<br/><br/><br/><br/>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>