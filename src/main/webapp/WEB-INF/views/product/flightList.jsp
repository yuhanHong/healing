<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<c:set var="root" value="${pageContext.request.contextPath }" />
</head>
<script type="text/javascript">
var root="";
function bodyOnLoad(r){
	root=r;
}

function flightOnClick(flight_number,product_number,pc,pageNumber){
// 	alert(product_number);
		location.href=root+"/product/productRead.do?fNum="+flight_number+"&pNum="+product_number+"&pc="+pc+"&pageNumber="+pageNumber;
}

function flightOnMouseOver(flight_number){
	var li=document.getElementById("flight"+flight_number);
	li.style.border="1px #ff0000 solid";
}

function flightOnMouseOut(flight_number){
	var li=document.getElementById("flight"+flight_number);
	li.style.border="1px #ffffff solid";
}
</script>
<body onload="bodyOnLoad('${root}')">
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class" style="margin-left: 290px;">
		<div class="content_class">
		
			<div style="float:left;margin-top:5px;">
				<img src="${root}/resources/boardImg/img01.PNG" align="center">
				<h2 style="display:inline;"><span style="font-weight: bold; ">${productDto.product_name}</span></h2>
			</div>
			<hr style="border:2px solid green; margin-top: 41px;">
			
			<div class="content" style="align: center; width: 900px; margin: 0px auto;">
				<ul class="productList" style="list-style-type: none;">
					<li style="padding-bottom: 20px; margin: 15px 15px 15px 15px; border-bottom: 1px solid #D1D1D1;">
						<div style="border:1px #ffffff solid; width:100%; height:150px;overflow:hidden;" id="product${productDto.product_number}" class="clearfix on">
							<div style="float:left;"><img width="204" height="150" alt="상품이미지" src="${root}/resources/productPhoto/${productDto.product_number}/0-1-1.jpg"></div>
							<div class="details" style="width: 620px; float:left;">
								<dl style="margin-left: 15px;">
									<dt><b>[ATP${productDto.product_number}]</b>${productDto.product_name}</dt>
									<dd style="height:50px;">${productDto.product_summary}</dd>
								</dl>
								<div class="first" style="margin-left: 15px;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/txt_detail1.gif" alt="상품가격"><strong id="Price_ATP${productDto.product_number}"><fmt:formatNumber value="${productDto.product_price_adult}"/>원</strong></div>
								<div style="margin-left: 15px;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/txt_detail2.gif" alt="여행기간"><span id="DaysText_ATP${productDto.product_number}">${productDto.product_stay_days}박 ${productDto.product_days}일</span></div>
								<div class="date" style="margin-left: 15px;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/txt_detail4.gif" alt="출발요일"><span id="WeekText_ATP${productDto.product_number}">　</span></div>
							</div>
						</div>
						
						<div class="product_tab_wrap" style="position:relative;" id="TabViewATP${productDto.product_number}">
							<div class="schedule_tab" style="display:none;" id="MonthTabATP${productDto.product_number}"><a title="이전달" tabindex="1" onclick="ItemMonthChange(this,-1);" class="arrowBTN" href="#MonthTabATP${productDto.product_number}"><img src="http://img.modetour.co.kr/mode2010/modetour/product/tab_month/back.gif" alt="이전달"></a><a title="다음달" onclick="ItemMonthChange(this,1);" class="arrowBTN" href="#MonthTabATP${productDto.product_number}"><img src="http://img.modetour.co.kr/mode2010/modetour/product/tab_month/front.gif" alt="다음달"></a></div>
							
							<div class="schedule_picker">
								<div class="daily">
									<ol id="MonthDayList_ATP${productDto.product_number}"></ol>
								</div>
							</div>
							
							<div class="schedule_manual">
							  - 출발날짜를 선택 하시면 해당 날짜에 출발 가능한 상품을 리스트에서 확인 하실 수 있습니다.<br>
							  - 성인 1인기준 기본 상품판매가 +유류할증료, 제세공과금을 더한 총 여행요금입니다.
							</div>
							
							<div class="schedule_list" id="ProductATP${productDto.product_number}"></div>
						
							<div class="schedule_btn clearfix">
								<p class="status_txt"><span class="red"><img src="http://img.modetour.co.kr/mode2010/modetour/product/icon_reserv_ok.gif" alt="출발가능"> 출발가능
									</span><span class="blue"><img src="http://img.modetour.co.kr/mode2010/modetour/product/icon_reserv_ing_120919.gif" alt="예약가능"> 예약가능
									</span><span class="green"><img src="http://img.modetour.co.kr/mode2010/modetour/product/icon_reserv_wait.gif" alt="대기예약"> 대기예약
									</span><span class="gray"><img src="http://img.modetour.co.kr/mode2010/modetour/product/icon_reserv_end.gif" alt="예약마감"> 예약마감
								</span><span style="position:relative;z-index:10;"><input type="image" src="http://img.modetour.co.kr/mode2010/modetour/etc/package/icon_questionmark.gif" alt="출발가능, 예약가능, 대기예약, 예약마감 설명보기" onmouseover="StateToolTip(this,'V');" onmouseout="StateToolTip(this,'H');" onfocus="StateToolTip(this,'V');" onblur="StateToolTip(this,'H');"><input type="image" src="http://img.modetour.co.kr/mode2010/modetour/etc/package/guide_reserve.gif" alt="출발가능:, 예약가능:, 대기예약:여유 좌석이 없거나 출발이 임박하여 담당자의 확인이 필요한 상황, 예약마감:판매가 종료된 상품" style="display:none; position:absolute; left:-28px; top:12px;" onmouseover="StateToolTip(this,'v');" onmouseout="StateToolTip(this,'h');" onfocus="StateToolTip(this,'v');" onblur="StateToolTip(this,'h');"></span></p>
								<p class="close"><a href="#close" title="닫기" onclick="ProductClose('');return false;">
								  ▲ 닫기
								</a></p>
							</div>
							<div class="schedule_func" style="position:absolute; right:0; top:-5px; "><a title="출발일로 보기" href="#TabView" onclick="Get_ProductName('');return false;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/button_departure.gif" alt="출발일로 보기" style="margin-right:3px;" id="ViewIconN"></a><a title="달력으로 보기" href="#TabView" onclick="Get_Product('');return false;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/button_calendar.gif" alt="달력으로 보기" id="ViewIconS"></a><input type="hidden" value="N" id="ViewType_"><input type="hidden" value="N" id="FirstView_"></div>
						</div>
					</li>
				</ul>
				
				<c:if test="${flightCount==0}">
					<div align="center">등록된 상품이 없습니다.</div>
				</c:if>
				
				<c:if test="${flightCount>0}">
					<div class="schedule_manual" style="display: block;">
			          - 출발날짜를 선택 하시면 해당 날짜에 출발 가능한 상품을 리스트에서 확인 하실 수 있습니다.<br>
			          - 성인 1인기준 기본 상품판매가 +유류할증료, 제세공과금을 더한 총 여행요금입니다.
			        </div>
			        
			        <div class="schedule_list" id="flightList${productDto.product_number}" style="display: block;">
			        	<div class="table_inner">
			        			<a onclick="changeSort(this,'S'); return false; " href="#ProductATE101"><img src="http://img.modetour.co.kr/mode2010/modetour/product/moproduct/th_package_list_departure.gif" alt="출발정보"></a><a onclick="changeSort(this,'A'); return false; " href="#ProductATE101"><img src="http://img.modetour.co.kr/mode2010/modetour/product/moproduct/th_package_list_arrival.gif" alt="도착정보"></a></th><th class="col_2"><a onclick="changeSort(this,'F'); return false; " href="#ProductATE101"><img src="http://img.modetour.co.kr/mode2010/modetour/product/moproduct/th_package_list_aircraft.gif" alt="항공사"></a></th><th class="col_3"><img src="http://img.modetour.co.kr/mode2010/modetour/product/moproduct/th_package_list_date.gif" alt="여행기간"></th><th class="col_4"><a onclick="changeSort(this,'P'); return false; " href="#ProductATE101"><img src="http://img.modetour.co.kr/mode2010/modetour/product/moproduct/th_package_list_price.gif" alt="여행요금"></a></th><th class="col_5"><a href="#SortBTNATE101" onclick="MoaFramePop('trip_levelguide','29174788'); return false;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/moproduct/th_package_list_class.gif" alt="상품등급"></a></th><th class="col_6"><img src="http://img.modetour.co.kr/mode2010/modetour/product/moproduct/th_package_list_name.gif" alt="상품명"></th><th class="col_7"><a onclick="MoaFramePop('booking_stateinfo','');return false; " href="#SortBTNATE101"><img src="http://img.modetour.co.kr/mode2010/modetour/product/moproduct/th_package_list_status.gif" alt="예약상태"></a><img src="http://img.modetour.co.kr/mode2010/modetour/product/moproduct/th_package_list_schedule.gif" alt="간편일정">
			        				
					        	<ul class="flightList" style="list-style-type: none;">
					        		<c:forEach var="flightDto" items="${flightList}" varStatus="status">
						        		<li id="flight${flightDto.flight_number}" onclick="flightOnClick('${flightDto.flight_number}','${productDto.product_number}','${pc}','${pageNumber}')" onmouseover="flightOnMouseOver('${flightDto.flight_number}')" onmouseout="flightOnMouseOut('${flightDto.flight_number}')">
					        				<p class="departure">${flightDto.flight_start_departure}</p>
					        				<p class="arrival">${flightDto.flight_end_arrival}</p>
					        				<div class="tooltip" onmouseover="ToolTip(this,0);" onmouseout="ToolTip(this,1);">
					        				<img onerror="this.style.display='none';" src="${root}/resources/icons/airline/airline_${flightDto.flight_start_airline}.gif"></div>
						        			${productDto.product_stay_days}박 ${productDto.product_days}일
						        			<b><fmt:formatNumber value="${productDto.product_price_adult}"/>원</b>
						        			<img src="http://img.modetour.co.kr/mode2010/modetour/product/schedule/icon_level_2.gif" alt="실속">
						        			<a href="#" onclick="NextPage1('29174788');return false;">${productDto.product_name}</a>
						        			<a href="#" onclick="NextPage1('29174788');return false;"><img src="http://img.modetour.co.kr/mode2010/modetour/search/btn_reservewait.gif" alt="대기예약" title="여유 죄석이 없거나 출발이 임박하여 예약가능 시간이 지나 담당자와의 확인이 필요한 상황입니다."></a><a href="#brifing" title="여행일정표를 간편하게 확인하실 수 있습니다.(새창)" alt="◆홈쇼핑따라잡기/스마트타이◆ 방콕 초특급/파타야 특급 3박5일" onclick="getPopupBriefing(29174788,this);"><img src="http://img.modetour.co.kr/mode2010/modetour/search/btn_planview.gif" alt="간편일정"></a>
						        		</li>
					        		</c:forEach>
								</ul>
						</div>
					</div>
					
					<div class="schedule_btn clearfix" style="display: block;">
						<p class="status_txt"><span class="red"><img src="http://img.modetour.co.kr/mode2010/modetour/product/icon_reserv_ok.gif" alt="출발가능"> 출발가능
						</span><span class="blue"><img src="http://img.modetour.co.kr/mode2010/modetour/product/icon_reserv_ing_120919.gif" alt="예약가능"> 예약가능
						</span><span class="green"><img src="http://img.modetour.co.kr/mode2010/modetour/product/icon_reserv_wait.gif" alt="대기예약"> 대기예약
						</span><span class="gray"><img src="http://img.modetour.co.kr/mode2010/modetour/product/icon_reserv_end.gif" alt="예약마감"> 예약마감
						</span><span style="position:relative;z-index:10;"><input type="image" src="http://img.modetour.co.kr/mode2010/modetour/etc/package/icon_questionmark.gif" alt="출발가능, 예약가능, 대기예약, 예약마감 설명보기" onmouseover="StateToolTip(this,'V');" onmouseout="StateToolTip(this,'H');" onfocus="StateToolTip(this,'V');" onblur="StateToolTip(this,'H');"><input type="image" src="http://img.modetour.co.kr/mode2010/modetour/etc/package/guide_reserve.gif" alt="출발가능:, 예약가능:, 대기예약:여유 좌석이 없거나 출발이 임박하여 담당자의 확인이 필요한 상황, 예약마감:판매가 종료된 상품" style="display:none; position:absolute; left:-28px; top:12px;" onmouseover="StateToolTip(this,'v');" onmouseout="StateToolTip(this,'h');" onfocus="StateToolTip(this,'v');" onblur="StateToolTip(this,'h');"></span></p>
						<p class="close"><a href="#close" title="닫기" onclick="ProductClose('ATE101');return false;">▲ 닫기</a></p>
					</div>
				</c:if>
				
			</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>