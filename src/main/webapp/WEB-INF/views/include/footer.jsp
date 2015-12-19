<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>

<script type="text/javascript" src="${root}/jquery/jquery.flexslider-min.js"></script>

<link rel="stylesheet" type="text/css" media="all" href="${root}/css/head/style.css" />
</head>
<body>
<div class="footer">
  <div class="footer_content">
    <div class="footer_left">
      <p>Website Template by <a target="_blank" href="http://csstemplatesmarket.com">CSS Templates Market</a></p>
      <ul class="footer_menu">
        <li><a href="index.html">home</a></li>
        <li><a href="page.html">page</a></li>
        <li><a href="#">blog</a></li>
        <li><a href="#">porfolio</a></li>
        <li><a href="#">contact</a></li>
      </ul>
    </div>
    <div class="footer_right">
      <ul class="social_icons">
        <li><a href="#"><img src="${root}/resources/footer/icon_rss.png" alt="" /></a></li>
        <li><a href="#"><img src="${root}/resources/footer/icon_facebook.png" alt="" /></a></li>
        <li><a href="#"><img src="${root}/resources/footer/icon_twitter.png" alt="" /></a></li>
        <li><a href="#"><img src="${root}/resources/footer/icon_dribbble.png" alt="" /></a></li>
      </ul>
    </div>
    <div class="clear"></div>
  </div>
</div>
</body>
</html>