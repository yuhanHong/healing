<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${root}/css/jquery.bxslider.css" rel="stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="${root}/jquery/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	$('.bxslider').bxSlider({
		mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
		speed:1000, //default:500 이미지변환 속도
		auto: true, //default:false 자동 시작
		captions: true, // 이미지의 title 속성이 노출된다.
		autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
	});
</script>
</head>
<body>
	<ul class="bxslider">
	  <li><img src="${root}/img/image_1.jpg" title="caption value pic1"/></li>
	  <li><img src="${root}/img/image_2.jpg" title="caption value pic2"/></li>
	  <li><img src="${root}/img/image_3.jpg" title="caption value pic3"/></li>
	</ul>
</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
    <meta charset="utf-8">
    <title>bxSlider</title>
    <link href="${root}/css/jquery.bxslider.css" rel="stylesheet" />
    <script type="text/javascript" src="${root}/jquery/jquery.js"></script>
    <script src="${root}/jquery/jquery.bxslider.min.js"></script>
    <script>
        $(function () {
            var mySlider = $( '#slide_banner' ).bxSlider( {
                mode: 'horizontal',// 가로 방향 수평 슬라이드
                speed: 500,        // 이동 속도를 설정
                pager: false,      // 현재 위치 페이징 표시 여부 설정
                moveSlides: 1,     // 슬라이드 이동시 개수
                slideWidth: 800,   // 슬라이드 너비
                minSlides: 1,      // 최소 노출 개수
                maxSlides: 1,      // 최대 노출 개수
                slideMargin: 5,    // 슬라이드간의 간격
                auto: true,        // 자동 실행 여부
                autoHover: true,   // 마우스 호버시 정지 여부
                controls: false    // 이전 다음 버튼 노출 여부
            } );

           //이전 버튼을 클릭하면 이전 슬라이드로 전환
            $("#prevBtn").on("click", function () {
                mySlider.goToPrevSlide();  //이전 슬라이드 배너로 이동
                return false;              //<a>에 링크 차단
            } );

           //다음 버튼을 클릭하면 다음 슬라이드로 전환
            $("#nextBtn").on("click", function () {
                mySlider.goToNextSlide();  //다음 슬라이드 배너로 이동
                return false;
            } );
        } );
    </script>
    <style>
        * { margin: 0; padding: 0; }
        #banner_wrap { position: relative; width: 500px; margin: 0 auto; }
        #prevBtn { position: absolute; left: 0; top: 220px; }
        #nextBtn { position: absolute; right: 0; top: 220px; }
    </style>
</head>

<body>
    <div id="banner_wrap">
        <ul id="slide_banner">
            <li>
                <a href="#">
                    <img src="${root}/img/image_1.jpg" width="500px" height="400px">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="${root}/img/image_2.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="${root}/img/image_3.jpg" alt="">
                </a>
            </li>     
        </ul>
		<!-- 버튼 jquery 부분 -->
        <p>
            <a href="#" id="prevBtn">
                <img src="images/prev_btn.png" alt="이전">
            </a>
        </p>
        <p>
            <a href="#" id="nextBtn">
                <img src="images/next_btn.png" alt="다음">
            </a>
        </p>
    </div>
</body>
</html>