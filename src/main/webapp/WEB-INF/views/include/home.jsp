<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" media="all" href="${root}/css/head/style.css" />
<%-- <link rel="stylesheet" type="text/css" href="${root}/css/includeHome/includeHome.css" /> --%>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css' />

<link rel="icon" href="${root}/css/body/images/favicon.ico">
<link rel="shortcut icon" href="${root}/css/body/images/favicon.ico" />
<link rel="stylesheet" href="${root}/css/body/booking/css/booking.css">
<link rel="stylesheet" href="${root}/css/body/css/camera.css">
<link rel="stylesheet" href="${root}/css/body/css/owl.carousel.css">
<link rel="stylesheet" href="${root}/css/body/css/style.css">

<link rel="stylesheet" href="${root}/css/includeHome/includeHome.css">

<link href="${root}/css/jquery.bxslider.css" rel="stylesheet" />
<script src="${root}/css/body/js/jquery.js"></script>
<script src="${root}/css/body/js/jquery-migrate-1.2.1.js"></script>
<script src="${root}/css/body/js/script.js"></script>
<script src="${root}/css/body/js/superfish.js"></script>
<script src="${root}/css/body/js/jquery.ui.totop.js"></script>
<script src="${root}/css/body/js/jquery.equalheights.js"></script>
<script src="${root}/css/body/js/jquery.mobilemenu.js"></script>
<script src="${root}/css/body/js/jquery.easing.1.3.js"></script>
<script src="${root}/css/body/js/owl.carousel.js"></script>
<script src="${root}/css/body/js/camera.js"></script>
<!--[if (gt IE 9)|!(IE)]><!-->
<script src="${root}/css/body/js/jquery.mobile.customized.min.js"></script>
<!--<![endif]-->
<script src="${root}/css/body/booking/js/booking.js"></script>
<script src="${root}/jquery/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		jQuery('#camera_wrap').camera({
			loader : false,
			pagination : false,
			minHeight : '444',
			thumbnails : false,
			height : '48.375%',
			caption : true,
			navigation : true,
			fx : 'scrollHorz'
		});
		
		/*carousel*/
		var owl = $("#owl");
		owl.owlCarousel({
			items : 2, //10 items above 1000px browser width
			itemsDesktop : [ 995, 2 ], //5 items between 1000px and 901px
			itemsDesktopSmall : [ 767, 2 ], // betweem 900px and 601px
			itemsTablet : [ 700, 2 ], //2 items between 600 and 0
			itemsMobile : [ 479, 1 ], // itemsMobile disabled - inherit from itemsTablet option
			navigation : true,
			pagination : false
		});
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
	});
</script>

<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.flexslider-min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="slider.jsp"/>
<%-- <jsp:include page="side_menu.jsp"/> --%>
<!-- 최근 본 상품 include 된 부분  -->

	${productDto.product_name}


<%-- <div class="best_main">
	<c:forEach var="productDto" items="${highestCountProductList}">
		<div class="best_content">
			<div class="banner">
				<img src="${root}/css/body/images/page2_img5.jpg" width="200px" height="250px" alt="">
				<div class="label">
					<div class="title">TURKEY</div>
					<div class="price">
						from<span>$ 1.500</span>
					</div>
					<a href="#">LEARN MORE</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
 --%>
 
 <div class="content">
	<div class="container_12">
		<div class="banners">
			<c:forEach var="productDto" items="${highestCountProductList}">
				<div class="grid_4">
					<div class="banner" style="padding-top: 0px;">
						<img src="${root}/resources/productPhoto/${productDto.product_number}/0-1-1.jpg" width="300px" height="350px" alt="">
						<div class="label">
							<div class="title">${productDto.product_name}</div>
							<div class="price" style="clear:both;">
								${productDto.product_summary}<span>${productDto.product_price_adult}</span>
							</div>
							<a href="#">상품보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
	
	
<%--  <c:import url="../recentProduct/recentProduct.jsp"/> --%>
<jsp:include page="footer.jsp"/>
</body>
</html>