<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="all" href="${root}/css/head/style.css" />
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css' />

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.flexslider-min.js"></script>
<script type="text/javascript" charset="utf-8">
var $ = jQuery.noConflict();
$(window).load(function () {
    $('.flexslider').flexslider({
        animation: "slide"
    });
});
</script>
</head>
<body>
<div id="wrap">
  <div class="top_slogan"> Design is not just what it looks like and feels like. Design is how it works. </div>
  <div class="slider">
    <div class="flexslider">
      <ul class="slides">
        <li><a href="page.html"><img src="${root}/resources/slider/slider-image1.jpg" alt="" border="0"/></a>
          <div class="flex-caption">
            <h2>Caption title</h2>
            <p>Ut enim ad minima veniam, quis nostru <strong>exercitationem</strong> ullam corporis laboriosam, nisi ut aliquid ex ea commodi <strong><a href="#">consequatur</a></strong></p>
            <a href="#" class="slider_button">View Portfolio</a> </div>
        </li>
        <li><a href="page.html"><img src="${root}/resources/slider/slider-image2.jpg" alt="" border="0"/></a>
          <div class="flex-caption">
            <h2>Caption title</h2>
            <p>Ut enim ad minima veniam, quis nostru <strong>exercitationem</strong> ullam corporis laboriosam, nisi ut aliquid ex ea commodi <strong><a href="#">consequatur</a></strong></p>
            <a href="#" class="slider_button">View Portfolio</a> </div>
        </li>
        <li><a href="page.html"><img src="${root}/resources/slider/slider-image3.jpg" alt="" border="0"/></a>
          <div class="flex-caption">
            <h2>Caption title</h2>
            <p>Ut enim ad minima veniam, quis nostru <strong>exercitationem</strong> ullam corporis laboriosam, nisi ut aliquid ex ea commodi <strong><a href="#">consequatur</a></strong></p>
            <a href="#" class="slider_button">View Portfolio</a> </div>
        </li>
      </ul>
    </div>
  </div>
 </div>
</body>
</html>