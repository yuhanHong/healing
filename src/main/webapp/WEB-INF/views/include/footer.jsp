<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>

<script type="text/javascript" src="${root}/jquery/jquery.flexslider-min.js"></script>

<%-- <link rel="stylesheet" type="text/css" href="${root}/css/head/style.css" /> --%>

<div class="footer">
  <div class="footer_content">
    <div class="footer_left">
      <ul class="footer_menu" style="font-size: 11px;">
        <li>대왕판교로 유스페이스몰 2 8층 (주)힐링투어</li>
        <li>사업자 등록번호: 000-00-00000</li>
        <li>통신판매업신고번호: 00-0000호</li><br/>
        <li>관광사업자 등록번호: 제 0000-000000호</li>
        <li>대표자: 홍유한</li>
        <li>힐링투어 고객센터: 1588-0000</li>
        <li>FAX: 031-000-0000</li>
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