<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Superfresh Bootstrap Template</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<!-- 
Superfresh Template
http://www.templatemo.com/free-website-templates/
-->

<c:set var="root" value="${pageContext.request.contextPath }" />
<!-- header css -->
<link rel="stylesheet" href="${root}/css/header/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${root}/css/header/css/templatemo-style.css">

<!-- slide -->
<link rel="icon" href="${root}/css/body/images/favicon.ico">
<link rel="shortcut icon" href="${root}/css/body/images/favicon.ico" />
<link rel="stylesheet" href="${root}/css/body/booking/css/booking.css">
<link rel="stylesheet" href="${root}/css/body/css/camera.css">
<link rel="stylesheet" href="${root}/css/body/css/owl.carousel.css">
<link rel="stylesheet" href="${root}/css/body/css/style.css">

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
</head>
<body data-spy="scroll" data-target=".navbar-collapse" id="top">
	<!-- navigation -->
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="navbar-menu">
			<ul>
				<li><a href="#home" class="smoothScroll">MyPage</a></li>
				<li><a href="#home" class="smoothScroll">Login</a></li>
			</ul>
		</div>
		
		<%-- <input type="text" value="${list }"> --%>
		<%-- <c:forEach var="i" begin="0" end="3" step="1"> --%>
		<c:forEach var="cookieList" items="${list}">
			${cookieList}
		</c:forEach>

		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon icon-bar"></span> <span class="icon icon-bar"></span>
					<span class="icon icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand">Healing.</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#home" class="smoothScroll">HOME</a></li>
					<li><a href="#service" class="smoothScroll">동남아</a></li>
					<li><a href="#about" class="smoothScroll">중국</a></li>
					<li><a href="#portfolio" class="smoothScroll">일본</a></li>
					<li><a href="#pricing" class="smoothScroll">자유플랜</a></li>
					<li><a href="#pricing" class="smoothScroll">간편검색</a></li>
					<li><a href="#pricing" class="smoothScroll">고객센터</a></li>
				</ul>
			</div>
		</div>

	</div>
	
	<c:if test="${productPhotoList.size() != 0}">
	<div class="slider_wrapper" align="center">
		<div id="camera_wrap" class=""> <!-- style="width:1100px; margin-left:120px;" -->
			<c:forEach var="i" begin="0" end="${listSize-1}" step="1">
				<div data-src="${root}/resources/banner/${productPhotoList.get(i).product_photo_filename}">
					<div class="caption fadeIn">
						<a href="${root}/recentProduct/recentProduct.do?product_number=${productList.get(i).product_number}" style="margin-top:0px;">
							<h2 style="color:white; font-size:60px; line-height:60px;">${productList.get(i).product_name}</h2>
						</a>
						<div class="price">
							FROM <span>${productList.get(i).product_price_adult}</span>
						</div>
						<a href="${root}/recentProduct/recentProduct.do?product_number=${productList.get(i).product_number}" style="background-color:yellow">상품 보러가기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</c:if>
	
	<!-- 최근 본 상품 include 된 부분 -->
	<c:import url="recentProduct.jsp"/>
	
	<!--==============================Content=================================-->
	<div class="content">
		<div class="ic">More Website Templates @ TemplateMonster.com -
			February 10, 2014!</div>
		<div class="container_12">
			<div class="banners">
				<div class="grid_4">
					<div class="banner">
						<img src="${root}/css/body/images/page2_img1.jpg" alt="">
						<div class="label">
							<div class="title">NEW ZEALAND</div>
							<div class="price">
								from<span>$ 1.200</span>
							</div>
							<a href="#">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<img src="${root}/css/body/images/page2_img2.jpg" alt="">
						<div class="label">
							<div class="title">GOA</div>
							<div class="price">
								from<span>$ 1.500</span>
							</div>
							<a href="#">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<img src="${root}/css/body/images/page2_img3.jpg" alt="">
						<div class="label">
							<div class="title">FRANCE</div>
							<div class="price">
								from<span>$ 1.600</span>
							</div>
							<a href="#">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="grid_4">
					<div class="banner">
						<img src="${root}/css/body/images/page2_img4.jpg" alt="">
						<div class="label">
							<div class="title">CANADA</div>
							<div class="price">
								from<span>$ 2000</span>
							</div>
							<a href="#">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<img src="${root}/css/body/images/page2_img5.jpg" alt="">
						<div class="label">
							<div class="title">TURKEY</div>
							<div class="price">
								from<span>$ 1.500</span>
							</div>
							<a href="#">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<img src="${root}/css/body/images/page2_img6.jpg" alt="">
						<div class="label">
							<div class="title">EGYPT</div>
							<div class="price">
								from<span>$ 1.500</span>
							</div>
							<a href="#">LEARN MORE</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!--==============================footer=================================-->
	<footer>
		<div class="container_12">
			<div class="grid_12">
				<div class="socials">
					<a href="#" class="fa fa-facebook"></a> <a href="#"
						class="fa fa-twitter"></a> <a href="#" class="fa fa-google-plus"></a>
				</div>
				<div class="copy">
					Your Trip (c) 2014 | <a href="#">Privacy Policy</a> | Website
					Template Designed by <a href="http://www.templatemonster.com/"
						rel="nofollow">TemplateMonster.com</a>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>