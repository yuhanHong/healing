<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/adminMember/adminMember.css"/>
<script type="text/javascript" src="${root}/js/adminMember/adminMember.js"></script>
<script type="text/javascript">
$(function(){
	$( "#slider-range" ).slider({
		range: true,
		min: 0,
		max: 10000000,
		step: 1000000,
		slide: function( event, ui ) {
			$( "#amount" ).val( ui.values[ 0 ] +"원" +"~"+ui.values[ 1 ] + "원" );
			var minvalue=ui.values[ 0 ];
			var maxvalue=ui.values[ 1 ];
			$("#slider-range").mouseup(function(){
				var str="${root}";
				str+="/adminMember/adminMemberPrice.do?min=";
				str+=minvalue;
				str+="&max=";
				str+=maxvalue;
				location.href=str;
			});
		}
	});
	$( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 )+"원" +
	"~" + $( "#slider-range" ).slider( "values", 0 ) +"원" );
});

</script>
</head>
<body>
	<jsp:include page="../adminHeader.jsp"/>
	<jsp:include page="../adminSide.jsp"/>
	
<h3>관리자 회원관리</h3>

<div id="adm_main">
	<form action="${root}/adminMember/adminMemberSearch.do" method="POST">
		<div id="adm_firstMenu">
			<ul>
				<li id="adm_firstMenu_option">
					<input type="submit" value="검색"/>
				</li>
				<li id="adm_firstMenu_option">
					<input type="text" size="14" name="search"/>
				</li>
				<li id="adm_firstMenu_option">
					<select name="choose">
						<option value="name">
							이름
						</option>
						<option value="id">
							아이디
						</option>
						<option value="phone">
							전화번호
						</option>
					</select>
				</li>
				<li id="adm_firstMenu_option">회원검색</li>
			</ul>
		</div>
	</form>
	<div id="adm_secondMenu">
		<ul>
			<li class="adm_secondMenu_option" id="adm_arange">
				<select name="sort" onchange="location.href='${root}/adminMember/adminMemberSort.do?value='+(this.options[this.selectedIndex].value)">
					<option value="title">정렬방식</option>
					<option value="id" id="id">아이디</option>
					<option value="name">이름</option>
					<option value="date">가입날짜</option>
					<option value="purchase">구매액</option>					
				</select>
			</li>
			<li class="adm_secondMenu_option" style="width:50px;">
				<input type="button" value="변경"/>
			</li>
			<li class="adm_secondMenu_option" style="width:80px;">
				<select>
					<option>일반회원</option>
					<option>vip</option>
				</select>
			</li>
			<li class="adm_secondMenu_option">
				<input type="text" id="amount" size="15"/>
			</li>
			<li id="slider-range" style="height:10px;" class="adm_secondMenu_option"></li>
		</ul>
	</div>
	<div id="adm_memberMenu">
		<ul>
			<li id="adm_member_name">이름</li>
			<li id="adm_member_id">아이디</li>
			<li id="adm_member_phone">전화번호</li>
			<li id="adm_member_email">이메일</li>
			<li id="adm_member_date">날짜</li>
			<li id="adm_member_purchase">구매금액</li>
			<li id="adm_member_level">등급</li>
		</ul>
	</div>
	
	<c:forEach var="adminMember" items="${adminMemberList}">
		<div id="adm_memberMenu">
			<ul>
				<li id="adm_member_name">${adminMember.member_name}</li>
				<li id="adm_member_id">${adminMember.member_id}</li>
				<li id="adm_member_phone">${adminMember.member_phone}</li>
				<li id="adm_member_email">${adminMember.member_email}</li>
				<li id="adm_member_date">
					<fmt:formatDate value="${adminMember.member_date}" pattern="yyyy/MM/dd"/>
				</li>
				<li id="adm_member_purchase">${adminMember.member_purchase}</li>
				<li id="adm_member_level">${adminMember.member_level}</li>
			</ul>
		</div>
	</c:forEach>
</div>
</body>
</html>