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
	var minvalue,maxvalue;
	
	$( "#slider-range" ).slider({
		range: true,
		min: 0,
		max: 10000000,
		step: 1000000,
		slide: function( event, ui ) {
			$( "#amount" ).val( ui.values[ 0 ] +"원" +"~"+ui.values[ 1 ] + "원" );
			minvalue=ui.values[ 0 ];
			maxvalue=ui.values[ 1 ];
		}
	});
	$( "#amount" ).val( "0" + "원" + " ~ " + "0" +"원" );
	
	$("html").mouseup(function(){
		if (maxvalue==undefined) return false;
		
		var str="${root}";
		str+="/adminMember/adminMemberPrice.do?min=";
		str+=minvalue;
		str+="&max=";
		str+=maxvalue;
		
		$.ajax({
			type:"get"		// 포스트방식
			,url:str		// url 주소
			,dataType:"json"
			,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
				 $(".adm_list").remove();
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
				 }
			}
		    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
		    	alert(e.responseText);
		    }
		});
		$( "#amount" ).val( minvalue+"원" + " ~ " + maxvalue +"원" );
		$("#maxValue").val(maxvalue);
		$("#minValue").val(minvalue);
	});
});

</script>
</head>
<body>
	<jsp:include page="../adminHeader.jsp"/>
	<jsp:include page="../adminSide.jsp"/>

<div style="width:1400px;">
	<h2 style="margin-top: 40px;">회원 관리</h2>
	<div id="adminMemberFormDiv">
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
		<form action="${root}/adminMember/adminMemberChangeLevel.do" method="POST" >
			<div id="adm_secondMenu">
				<input type="hidden" name="maxValue" id="maxValue"/>
				<input type="hidden" name="minValue" id="minValue"/>
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
					
					<li class="adm_secondMenu_option" id="adm_arange">
						<select name="level_sort" onchange="location.href='${root}/adminMember/adminMemberSort.do?value='+(this.options[this.selectedIndex].value)">
							<option value="title">등급별</option>
							<option value="nomal">일반회원</option>
							<option value="vip">vip회원</option>
							<option value="delete">탈퇴된회원</option>
						</select>
					</li>
					<li class="adm_secondMenu_option" style="width:50px;">
						<input type="submit" value="변경" id="changeButton"/>
					</li>
					<li class="adm_secondMenu_option"  style="width:80px;">
						<select name="memberLevel" id="memberLevel">
							<option value="nomal">일반회원</option>
							<option value="vip">vip</option>
						</select>
					</li>
					<li class="adm_secondMenu_option">
						<input type="text" id="amount" size="15" disabled="disabled" name="amount"/>
					</li>
					<li id="slider-range" class="adm_secondMenu_option"></li>
				</ul>
			</div>
		</form>
		<div id="adm_memberMenu">
			<ul id="adm_member_first">
				<li id="adm_member_name">이름</li>
				<li id="adm_member_id">아이디</li>
				<li id="adm_member_phone">전화번호</li>
				<li id="adm_member_email">이메일</li>
				<li id="adm_member_date">날짜</li>
				<li id="adm_member_purchase">구매금액</li>
				<li id="adm_member_level">등급</li>
			</ul>

			<c:forEach var="adminMember" items="${adminMemberList}">
				<div class="adm_list">
					<ul id="adm_ul">
						<li id="adm_member_name">
							<a href="javascript:adminMemberUpdate('${root}','${adminMember.member_number}')">${adminMember.member_name}</a>
						</li>
						<li id="adm_member_id">${adminMember.member_id}</li>
						<li id="adm_member_phone">${adminMember.member_phone}</li>
						<li id="adm_member_email">${adminMember.member_email}</li>
						<li id="adm_member_date">
							<fmt:formatDate value="${adminMember.member_date}" pattern="yyyy/MM/dd"/>
						</li>
						<li id="adm_member_purchase">${adminMember.member_purchase}</li>
						<c:if test="${adminMember.member_delete==0}">
							<li id="adm_member_level">${adminMember.member_level}</li>
						</c:if>
						
						<c:if test="${adminMember.member_delete>0}">
							<c:if test="${adminMember.member_delete==1}">
								<c:set var="delete" value="탈퇴"/>
							</c:if>
							
							<c:if test="${adminMember.member_delete==2}">
								<c:set var="delete" value="추방"/>
							</c:if>
							<li id="adm_member_level">${delete}</li>
						</c:if>
					</ul>
				</div>
			</c:forEach>
		</div>	
	</div>
</div>
</body>
</html>