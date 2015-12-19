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

function productOnClick(product_number){
// 	alert(product_number);
	location.href=root+"/product/flightList.do?pNum="+product_number;
}

function productOnMouseOver(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.border="1px red solid";
}

function productOnMouseOut(product_number){
	var li=document.getElementById("product"+product_number);
	li.style.border="0px red solid";
}
</script>
<body onload="bodyOnLoad('${root}')">
<jsp:include page="../include/header.jsp"/>

	<div class="content" style="width: 900px; margin: 0px auto;">
		<c:if test="${count==0}">
			<div align="center">등록된 상품이 없습니다.</div>
		</c:if>
	
		<c:if test="${count>0}">
			<ul class="productList" style="list-style-type: none;">
				<c:forEach var="productDto" items="${productList}" varStatus="status">
					
					<li style="padding-bottom: 20px; margin: 15px 15px 15px 15px; border-bottom: 1px solid #D1D1D1;">
						<div style="width:100%; height:150px;overflow:hidden;" id="product${productDto.product_number}" class="clearfix on" onmouseover="productOnMouseOver('${productDto.product_number}')" onmouseout="productOnMouseOut('${productDto.product_number}')" onclick="productOnClick(${productDto.product_number})">
							<div style="float:left;"><img width="204" height="150" onerror="setNoImg(this,'204x150');" alt="상품이미지" src="${root}/resources/productPhoto/${productDto.product_number}/0-1-1.jpg"></div>
								<div class="details" style="width: 620px; float:left;">
									<dl style="margin-left: 15px;">
										<dt><b>[ATP${productDto.product_number}]</b>${productDto.product_name}</dt>
										<dd style="height:50px;">${productDto.product_summary}</dd>
									</dl>
								<div class="first" style="margin-left: 15px;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/txt_detail1.gif" alt="상품가격"><strong id="Price_ATP${productDto.product_number}">419,000 ~ 2,129,000원</strong></div>
							<div style="margin-left: 15px;"><img src="http://img.modetour.co.kr/mode2010/modetour/product/txt_detail2.gif" alt="여행기간"><span id="DaysText_ATP${productDto.product_number}">5 ~ 6일</span></div>
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
					
				</c:forEach>
			</ul>
		</c:if>
	</div>
		
	<c:if test="${count>0}">
		<div class="productListPages" style="width: 900px; margin: 0px auto;" align="center">
			<c:if test="${startPage!=1}">
				<a href="list.do?pageNumber=${startPage-1}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i==pageNumber}">
					<u><b><font size="6" color="#00f">[${i}]</font></b></u>
				</c:if>
				<c:if test="${i!=pageNumber}">
					<a href="list.do?pageNumber=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage < pageCount}">
				<a href="list.do?pageNumber=${endPage+1}">[다음]</a>
			</c:if>
		</div>
	</c:if>
		
<jsp:include page="../include/footer.jsp"/>
</body>
</html>