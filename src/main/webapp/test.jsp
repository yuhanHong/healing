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
<script type="text/javascript" src="${root}/jquery/jquery.ulslide.js"></script>
	<script type="text/javascript">
            $(function() {
                $('#main_bn').ulslide({
                    //statusbar: true,	
                    width: 450,			// 슬라이드 배너의 가로크기 조절
                    height: 338,		// 슬라이드 배너의 세로크기 조절
                    affect: 'fade',	// fade로 변경시 서서히 사라지고 나타나는 형태로 바뀜(fade, slide)
                    axis: 'x', 			// y로 변경시 세로슬라이드로 바뀜
                    mousewheel: true,	// 마우스 휠 사용여부 (true, false)
                    navigator: '#main_bn_btn a',
                    duration: 100,		// 배너 바뀌는 속도
					autoslide: 500		// 배너 바뀌는 딜레이 조절
                });
            });
        </script>

        <style type="text/css">

			#wrap{position:relative; width:100%;}
			
			#main_bn {
				margin:0 auto;
				width:450px;
				height:338px;
			}
			
			#main_bn img {
				width:100%;
				height:auto;
			}
			
            #main_bn_btn {
                list-style-type:none;
				position:absolute;
				bottom:5px; left:5px;
            }
            
            #main_bn_btn li {
                float: left; padding:0px 2px; margin-right:5px; 
            }
            
			a, a:hover, a:visited { text-decoration:none; }
			ul li { list-style : none; }

        </style>
</head>
<body>
	<div id="wrap">
        <div id="main_bn">
			<li>
			    <img src="./img/image_1.jpg" alt="" />
			</li>
			<li>
			    <img src="./img/image_2.jpg" alt="" />
			</li>
			<li>
			    <img src="./img/image_3.jpg" alt="" />		<!-- li 한묶음을 추가하면 배너 이미지가 추가됨 -->
			</li>
            <div id="main_bn_btn">
                <li><a href="#"><img src="./img/blt.png"></a></li>
                <li><a href="#"><img src="./img/blt.png"></a></li>
                <li><a href="#"><img src="./img/blt.png"></a></li>		<!-- li 한묶음을 추가하면 배너 이미지가 추가됨 -->
            </div>
        </div>
	</div>
</body>
</html>