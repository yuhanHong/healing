<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">

<title>힐링투어에 오신 것을 환영합니다!</title>
<link rel="stylesheet" type="text/css"
	href="${root}/css/product/product.css" />
<link rel="Shortcut Icon" href="${root}/resources/icons/H.ico" />
<link rel="stylesheet"
	href="http://www.modetour.com/Include/Css/Modetour/product/Itinerary.css?ver=20151222"
	type="text/css">
<link rel="stylesheet"
	href="http://www.modetour.com/Include/css/warp.css" type="text/css">
<link rel="stylesheet"
	href="http://www.modetour.com/Include/css/Modetour/product/product.css"
	type="text/css" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.cycle2.min.js"></script>
<script type="text/javascript"
	src="${root}/jquery/jquery.cycle2.scrollVert.js"></script>
<script type="text/javascript" src="${root}/jquery/effect.min.js"></script>
<script type="text/javascript"
	src="${root}/jquery/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="${root}/jquery/jquery.mCustomScrollbar.js"></script>

<script type="text/javascript"
	src="http://modetour.com/include/js/modetour/selectbox.min.js"></script>
<script type="text/javascript"
	src="http://modetour.com/include/js/modetour/Common_Top.min.js"></script>
<script type="text/javascript"
	src="http://modetour.com/Include/js/swfobject.js"></script>
<script type="text/javascript"
	src="http://modetour.com/Include/js/Modetour/etcs.js"></script>
<script type="text/javascript"
	src="http://modetour.com/Include/js/Modetour/popup.js"></script>

<script type="text/javascript"
	src="http://modetour.com/Include/Js/Cookie.js"></script>
<script type="text/javascript"
	src="http://modetour.com/Include/Js/Package/ZimSelect.js"></script>
<script type="text/javascript"
	src="http://modetour.com/Include/JS/GoSocialNetWorking.js"></script>
<script type="text/javascript"
	src="http://modetour.com/Include/Js/XmlObject.JS"></script>
<script type="text/javascript"
	src="http://modetour.com/include/js/plugin/jquery.cycle2.carousel.js"></script>
<script type="text/javascript"
	src="http://js.modetour.com/Jquery/jquery.tmpl.js"></script>
<script type="text/javascript"
	src="http://js.modetour.com/Package/Itinerary.js?ver=20151222"></script>
<script type="text/javascript"
	src="http://js.modetour.com/Board/Tnote_v2.js?ver=20151222"></script>

<script type="text/javascript"
	src="http://modetour.com/include/js/plugin/jquery.cycle2.carousel.js"></script>
<script type="text/javascript"
	src="http://js.modetour.com/Jquery/jquery.tmpl.js"></script>
<script type="text/javascript"
	src="http://js.modetour.com/jquery/jquery-ajaxq.js"></script>
<script type="text/javascript"
	src="http://js.modetour.com/Json/json2.js"></script>


</head>
<body>
	
	<jsp:include page="../include/header.jsp" />

	<div id="Containerwrap">
		<!--Content Start-->

		<div id="content">
			<div class="nav">
				<img src="${root}/resources/icons/product/nav_productRead.gif"
					alt='' class="floatl" onerror="this.style.display='none';" />
				<ul>
					<li><a href="${root}/">HOME</a></li>
					<li>&nbsp;&gt;&nbsp; <a
						href="${root}/product/productList.do?pc=${pc}">${product_category}</a></li>
					<c:if test="${product_category!=productDto.product_country}">
						<li>&nbsp;&gt;&nbsp; <a
							href="${root}/product/productList.do?pc=${pc}">${productDto.product_country}</a></li>
					</c:if>
					<li>&nbsp;&gt;&nbsp; <a
						href="${root}/product/productList.do?pc=${pc}">${product_city}</a></li>
				</ul>
			</div>

			<div id="ItineraryTable" class="itinerary_table">
				<div class="schedule_info clearfix" style="height: 300px;">
					<div style="float: left; height: 300px;">
						<a href="#top" onclick="product_photo_view(); return false;"><img
							src="${root}/resources/productPhoto/${productDto.product_number}/0-1-1.jpg"
							width="410" height="278" /></a>
<%-- 				<c:forEach var="productPhotoListList" items="${productPhotoList}" varStatus="status1"> --%>
<%-- 					<c:forEach var="productPhotoListListList" items="${productPhotoListList}" varStatus="status2"> --%>
<%-- 						<c:forEach var="productPhotoDto" items="${productPhotoListListList}" varStatus="status3"> --%>
<%-- 							<img src="${root}/resources/productPhoto/${productDto.product_number}/${productPhotoDto.product_photo_filename}" width="100px"/> --%>
<%-- 							<img src="${root}/resources/productPhoto/${productDto.product_number}/${productPhotoList[1][0][0].product_photo_filename}" width="100px"/> --%>
<%-- 						</c:forEach> --%>
<%-- 					</c:forEach> --%>
<%-- 				</c:forEach> --%>
					</div>
					<div style="float: left; width: 450px; height: 300px; margin: 0px 20px;">
						<div class="code_wrap"
							style="padding: 10px 0px; border-bottom: 1px solid #666666;">
							<span class="code_title">상품코드</span> | <span class="code_num">ATP${productDto.product_number}${flightDto.flight_start_airline}${flightDto.flight_number}</span>
						</div>
						<div class="product_name" style="padding: 10px 0px;">${productDto.product_name}</div>
						<div class="product_summary" style="padding: 10px 0px;">${productDto.product_summary}</div>
					</div>
				</div>

				<div class="itinerary_info">
					<div class="iti_contents">
						<div class="itinerary">
							
							<!-- 최근 본 상품 include 된 부분 -->
							<c:import url="../recentProduct/recentProduct.jsp"/>
							
							<div class="summary_table" style="z-index: 2;">
								
								<table summary="상품 요약 정보">
									<tbody>
										<tr>
											<th>여행도시</th>
											<td>${product_cities}</td>
										</tr>
										<tr>
											<th>교통편</th>
											<td><img
												src="${root}/resources/icons/airline/airline_${flightDto.flight_start_airline}.gif"
												style="width: 22px;" onerror="this.style.display='none';" />
												${flightDto.flight_start_airline}</td>
										</tr>
										<tr>
											<th>여행기간</th>
											<td>
												<div class="terms">${productDto.product_stay_days}박
													${productDto.product_days}일 [기내
													${productDto.product_days-1-productDto.product_stay_days}일숙박]</div>
												<ul class="period_list">
													<li><span ><b class="hidden">한국출발&nbsp;</b></span><span
														class="text"><strong><fmt:formatDate
																	value="${flightDto.flight_start_departure}" type="both"
																	pattern="yyyy년 M월 d일 (E) HH:mm" /></strong></span></li>
													<li><span ><b
															class="text">현지도착&nbsp;</b></span><span class="text"><fmt:formatDate
																value="${flightDto.flight_start_arrival}" type="both"
																pattern="yyyy년 M월 d일 (E) HH:mm" /></span></li>
													<!-- 현지도착 -->
													<li><span ><b
															class="text">현지출발&nbsp;</b></span><span class="text"><fmt:formatDate
																value="${flightDto.flight_end_departure}" type="both"
																pattern="yyyy년 M월 d일 (E) HH:mm" /></span></li>
													<!-- 현지출발 -->
													<li><span ><b class="hidden">한국도착&nbsp;</b></span><span
														class="text"><strong><fmt:formatDate
																	value="${flightDto.flight_end_arrival}" type="both"
																	pattern="yyyy년 M월 d일 (E) HH:mm" /></strong></span></li>
												</ul>
												<div class="average"></div>
											</td>
										</tr>
										<tr>
											<th>예약인원</th>
											<td style="position: relative;">현재 성인 ${flight_ordered}명 (여유 좌석 ${flightDto.flight_occupancy-flight_ordered}명)</td>
										</tr>
										<tr>
											<th>인솔자</th>
											<td>
												<div class="guide_info">
													<div class="name">인솔자는 동반하지 않습니다.</div>
												</div>
											</td>
										</tr>

										<tr id="ContentMain_ContentPlaceHolder_Pnl_MeetBox">
											<th>모이는 장소</th>
											<td>
												<div class="meeting">
													<!--<p></p>-->
													<strong><fmt:formatDate
															value="${flightDto.flight_start_departure}"
															timeZone="GMT+07" type="both" pattern="HH:mm" /></strong> 인천국제공항
													3층 출국장 <br />F와G 카운터 사이 중앙엘리베이터 옆 힐링투어 1번~8번 전용테이블 앞
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>


							<div class="cost_info">
								<div class="tabs">
									<div class="list">
										<ul>
											<li><a href="#cost_price" class="item_0 active"><span>상품가격</span></a></li>
											<li><a href="#card_benefit" class="item_1"
												onclick="Get_InterestFree(); return false;"><span>카드혜택</span></a></li>
										</ul>
									</div>
									<div id="cost_price" class="contents">
										<div style="clear: both;"></div>
										<div class="section">
											<div class="tables">
												<table>
													<caption>여행경비 총액</caption>
													<colgroup>
														<col width="110" />
														<col width="110" />
														<col width="120" />
														<col width="120" />
														<col width="120" />
														<col width="120" />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" colspan="2"><div class="b_wrap">구분</div></th>
															<th class="pii_adult" scope="col">
																<div class="b_wrap">
																	성인<br />
																	<span>(만 12세이상)</span>
																</div>
															</th>
															<th class="pii_child1" scope="col">
																<div class="b_wrap">
																	아동 No Bed<br />
																	<span>(만 12세미만)</span>
																</div>
															</th>
															<th class="pii_child2" scope="col">
																<div class="b_wrap">
																	아동 Extr Bed<br />
																	<span>(만 12세미만)</span>
																</div>
															</th>
															<th class="pii_infant" scope="col">
																<div class="b_wrap">
																	유아 No Bed<br />
																	<span>(만 2세미만)</span>
																</div>
															</th>
														</tr>
													</thead>
													<tbody>
														<tr>
<!-- 상품가격 ${productDto.product_price_adult}, ${productDto.product_price_child}, ${productDto.product_price_baby} -->
															<th rowspan="4" scope="row"><div class="b_wrap">상품가격</div></th>
															<th scope="row" class="txt_l"><div class="b_wrap">기본상품가격</div></th>
															<td class="pii_adult"><div class="b_wrap">799,000원</div></td>
															<td class="pii_child1"><div class="b_wrap">639,200원</div></td>
															<td class="pii_child2"><div class="b_wrap"></div></td>
															<td class="pii_infant"><div class="b_wrap">150,000원</div></td>
														</tr>
														<tr>
															<th scope="row" class="txt_l"><div class="b_wrap">유류할증료</div>
															</th>
															<td class="pii_adult"><div class="b_wrap"></div></td>
															<td class="pii_child1"><div class="b_wrap"></div></td>
															<td class="pii_child2"><div class="b_wrap"></div></td>
															<td class="pii_infant"><div class="b_wrap"></div></td>
														</tr>
														<tr>
															<th scope="row" class="txt_l"><div class="b_wrap">제세공과금</div>
															</th>
															<td class="pii_adult"><div class="b_wrap"></div></td>
															<td class="pii_child1"><div class="b_wrap"></div></td>
															<td class="pii_child2"><div class="b_wrap"></div></td>
															<td class="pii_infant"><div class="b_wrap"></div></td>
														</tr>
														<tr>
															<th scope="row" class="txt_l"><div class="b_wrap">소계</div></th>
															<td class="pii_adult">
																<div class="b_wrap">
																	<strong>799,000원</strong>
																</div>
															</td>
															<td class="pii_child1">
																<div class="b_wrap">
																	<strong>639,200원</strong>
																</div>
															</td>
															<td class="pii_child2">
																<div class="b_wrap">
																	<strong>0원</strong>
																</div>
															</td>
															<td class="pii_infant">
																<div class="b_wrap">
																	<strong>150,000원</strong>
																</div>
															</td>
														</tr>
														<tr class="ess">
															<th rowspan="2" scope="row" class="cost_must"><div
																	class="b_wrap">
																	<i></i><br />현지 필수 경비
																</div></th>
															<th scope="row" class="txt_l"><div class="b_wrap">현지필수경비</div></th>
	<!-- 가이드비 ${productDto.product_guide_adult}, ${productDto.product_guide_child}, ${productDto.product_guide_baby} -->
															<td class="pii_adult"><div class="b_wrap adult">없음</div></td>
															<td class="pii_child1"><div class="b_wrap child1">없음</div></td>
															<td class="pii_child2"><div class="b_wrap child2">없음</div></td>
															<td class="pii_infant"><div class="b_wrap infant">없음</div></td>
														</tr>
														<tr class="ess">
															<th scope="row" class="txt_l"><div class="b_wrap">소계</div></th>
															<td class="pii_adult">
																<div class="b_wrap">
																	<strong class="adult">없음</strong>
																</div>
															</td>
															<td class="pii_child1">
																<div class="b_wrap">
																	<strong class="child1">없음</strong>
																</div>
															</td>
															<td class="pii_child2">
																<div class="b_wrap">
																	<strong class="child2">없음</strong>
																</div>
															</td>
															<td class="pii_infant">
																<div class="b_wrap">
																	<strong class="infant">없음</strong>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="notify">
											<p class="change_info">* 현지필수경비란? 현지에서 별도로 지불해야 하는 필수 경비
												입니다. 하단의 불포함 사항 내역을 확인해주시기 바랍니다.</p>
											<p class="change_info">* 상기 여행 요금 및 유류할증료, 제세공과금은 유가와 환율에
												따라 인상 또는 인하 될 수 있습니다.</p>
											<p></p>


											<div id="newTourJoin" class="notify_layer"
												style="top: 39px; left: 24.015625px; display: none;">
												<i class="i_arr"></i>
												<div class="container">
													<div class="conts">
														<h5>현지투어 조인이란?</h5>
														<p>해외에서 여행오거나 항공권이 있는 경우</p>
														<p>항공권을 뺀 현지 행사만 함께 진행하는 요금</p>
													</div>
												</div>
											</div>
											<div id="useRoom" class="notify_layer"
												style="top: 39px; left: 206.53125px; display: none;">
												<i class="i_arr"></i>
												<div class="container">
													<div class="conts">
														<h5>객실 1인 사용료란?</h5>
														<p>객실 1인 사용료는 전일정동안 호텔객실을 성인 1인이</p>
														<p>사용할 경우, 상품가 이외에 추가로 발생하는 금액입니다.</p>
													</div>
												</div>
											</div>
											<br /> * 가격은 성인기준으로 2인 1실입니다.<br />아동, 유아요금은 성인과 한방 사용
											기준입니다.<br />
											<br />상품 특성상 추가 경비가 있을 수 있으니, 아래 불포함 사항을 확인해 주시기 바랍니다.[예약금
											규정]예약 후 3일 이내에 여행경비의 10% 이상을 결제하셔야 합니다.<br />* 위 예약금은 특별약관 및
											항공, 호텔, 현지 사정 등에 의하여 예약금 납입 시한이 단축되거나 인상될 수 있습니다.

										</div>
									</div>
									<div id="card_benefit" class="contents" style="margin-top: 0px; display: block;">
                                    <div class="card_benefit tables" style="border-top-width:0;">
									    <table>
										    <caption>무이자 할부 안내</caption>
										    <colgroup>
											    <col width="111">
											    <col width="140">
											    <col width="119">
											    <col width="330">
										    </colgroup>
										    <thead>
											    <tr>
												    <th scope="col">
													    <div>카드사</div>
												    </th>
												    <th scope="col">
													    <div>기간</div>
												    </th>
												    <th scope="col">
													    <div>무이자할부</div>
												    </th>
												    <th scope="col">
													    <div>부문 무이자</div>
												    </th>
											    </tr>
										    </thead>
										    <tbody><tr>    <th scope="row"><div><img alt="현대카드" src="//img.modetour.co.kr/modetour/2014/itinerary/logo/card_32.png"></div></th>    <td><div>~ 2015년 12월 31일</div></td>    <td><div>2~5개월 무이자</div></td>    <td><div>6개월(1회차), 10개월(1~2회차) 고객부담 부분무이자</div></td></tr><tr>    <th scope="row"><div><img alt="국민카드 " src="//img.modetour.co.kr/modetour/2014/itinerary/logo/card_35.png"></div></th>    <td><div>~ 2015년 12월 31일</div></td>    <td><div>2~5개월 무이자</div></td>    <td><div>6개월(1회차), 10개월(1~2회차) 고객부담 부분무이자</div></td></tr><tr>    <th scope="row"><div><img alt="롯데카드" src="//img.modetour.co.kr/modetour/2014/itinerary/logo/card_31.png"></div></th>    <td><div>~ 2015년 12월 31일</div></td>    <td><div>2~5개월 무이자</div></td>    <td><div>6개월(1회차), 10개월(1~2회차) 고객부담 부분무이자</div></td></tr><tr>    <th scope="row"><div><img alt="삼성카드" src="//img.modetour.co.kr/modetour/2014/itinerary/logo/card_88.png"></div></th>    <td><div>~ 2015년 12월 31일</div></td>    <td><div>2~5개월 무이자</div></td>    <td><div>부분무이자 X</div></td></tr></tbody>
									    </table>
									</div>
								</div>
								</div>
							</div>
							<div class="marketing_ad">
								<div class="long_ad">
									<a href="#	top"
										onclick="window.open('/Popup/Discount/DiscountBookingCheck.aspx?flag=K&Choice=748&Gubun=1&gubun2=5&pw=0&ph=0&url=/Popup/Discount/DiscountLink/LotteOnline.aspx&sd=2014.01.07&ed=2015.12.31','LotteEvent',''); return false;"
										title="새창"> 
									</a>
								</div>
								<div style="margin-top: 5px;">
									<ul class="sort_ad">
										<li class="left"><a
											href="http://www.modetour.com/Board/Support/NoticeView.aspx?mloc=1701&idx=8126"
											target="_blank"></a>
										</li>
										<li class="right"><a
											href="http://shopping.modetour.co.kr/dc/" target="_blank"></a>
										</li>
									</ul>
								</div>
							</div>
							<div id="privilege" class="privilege">
								<div class="inclusive clearfix">
									<div class="include">
										<h3>
											<img
												src="http://img.modetour.co.kr/modetour/2014/itinerary/hn_include.png"
												alt="포함사항" />
										</h3>
										<div class="contents">
											<div id="ContentMain_ContentPlaceHolder_Pnl_Inclusion">

												①왕복항공권<br />②인천공항세,관광진흥개발기금,현지공항세,전쟁보험료<br />③숙박비,
												식사비(일정표참고), 차량비<br />④1억원 여행자 보험<br />⑤한국인 가이드와 함께 미팅/센딩
												서비스<br />
												<br />
												<br />※ 여행자보험 담당 : [동부화재] 원부미(보험관련문의만가능) <br />
												Tel)02-728-8006 Fax)02-2021-7800 <br />- 단 15세 미만의 사망보험금 및
												만 79세 6개월 이상의 질병사망에 대해서는 보험 약관에 따라 보험금이 지급되지 않습니다. <br />-
												자세한 세부사항은 홈페이지 하단 여행보험을 참조 바랍니다.

											</div>
										</div>
									</div>
									<div class="exclude">
										<h3>
											<img
												src="http://img.modetour.co.kr/modetour/2014/itinerary/hn_exclude.png"
												alt="불포함사항" />
										</h3>
										<div class="contents">
											<div id="ContentMain_ContentPlaceHolder_Pnl_NonInclusion">

												&nbsp;<br />① (현지가이드/기사경비)는 전일정 30$/1인(3박), 40$/1인당(4박)
												(아동동일)을 현지에서 지불해야 합니다.<br />② 일정표내 명시된 불포함 식사<br />③ 기타
												개인경비<br />&nbsp;<br />&nbsp;<br />
												<br />

											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="clearBoth">
							</div>
							<div id="itineraryDetail" class="detail_info">
								<div class="tabs">
									<div id="tripDetail" class="list">

										<ul class="tabs5">
											<li><a href="#detail_0" class="item_0 active"><span>일정표</span></a></li>
											<li><a href="#detail_1" class="item_1"><span>핵심정보</span></a></li>
											<li data-code="5"><a href="#detail_2" class="item_2"><span>관광정보</span></a></li>
											<li><a href="#detail_3" class="item_3"><span>여행
														참고사항</span></a></li>
											<li data-code="10"><a href="#detail_4"
												onclick="_tnInfo.travelNotice();" class="item_4"><span>해외여행
														안전정보</span></a></li>
										</ul>


									</div>


<!-- 	for문, List<Product_detailDto> detailList[i] -->


									<div id="detail_0" class="contents">

										<div class="daily_routine">

											<div class="itinerary">
												<div class="day">
													<span class="days"><b>1일</b></span> <span class="date">12월
														12일 토요일</span>
													</table>
													<!--<b>1일</b> 12월 5일 수요일-->
												</div>
												<div class="plan">
													<div class="tour">
														<div class="region">코타키나발루</div>
														<div class="timeline">
															<strong>OZ757 한국출발시간 : 2015년 12월 12일 (토) 20:00
																현지도착시간 : 2015년 12월 13일 (일) 00:20</strong><br />▶인천국제공항 출발(소요시간 약
															5시간) <br />▶코타키나발루 도착 후 <br />▶
															<힐링투어> 피켓을 든 한국인 가이드와 미팅 후 호텔로 이동 <br />
															▶호텔 CHECK-IN ☞ 리조트내 한국인 직원 상주 ☜ <br />
															<br />
															HOTEL: 마젤란 수트라하버 가든뷰(MAGELLAN SUTERA HARBOUR)<span
																style="display: none;">마젤란 수트라하버 리조트</span>
															<span style="display: none;">수트라하버 부대시설 이용 안내</span>
														</div>
													</div>

													<!-- 플레이스 정보 하이라이트+기본템플릿 시작 -->
													<div
														id="ContentMain_ContentPlaceHolder_Rpt_itiSchedule_Pnl_PlaceTemplace_0"
														class="wrapper">
														<div class="local">
															<div class="s_name">코타키나발루</div>
															<div class="s_cnt">
																<ul class="visit_info">
																	<li dataPlid="26090" class="type_b1"
																		onclick="PlaceDetail('H', '1', '26090'); return false;"><span
																		class="popular"><b class="blind">인기</b></span>
																		<div class="comment">
																			<b><i>[호텔]</i> 마젤란 수트라하버 리조트</b>
																			<ul>
																				<li><img
																					src="http://img.modetour.co.kr/eagle/photoimg/26090/sfile/Sutera Harbour Resort.jpg"
																					width="179" height="129" alt="마젤란 수트라하버 리조트"
																					onerror="setNoImg(this,'140x105');" /></li>
																				<li><img
																					src="http://img.modetour.co.kr/eagle/photoimg/26090/sfile/TMS Deluxe Sea View.jpg"
																					width="179" height="129" alt="마젤란 수트라하버 리조트"
																					onerror="setNoImg(this,'140x105');" /></li>
																				<li><img
																					src="http://img.modetour.co.kr/eagle/photoimg/26090/sfile/SHMGCC Berth View.jpg"
																					width="179" height="129" alt="마젤란 수트라하버 리조트"
																					onerror="setNoImg(this,'140x105');" /></li>
																			</ul>
																			<div class="coment">
																				동남아시아에서&nbsp;가장&nbsp;높은&nbsp;키나바루산(4101m)을&nbsp;배경으로&nbsp;남지나해와&nbsp;아름다운&nbsp;열대섬들이&nbsp;바라다&nbsp;보이는&nbsp;384에이커의&nbsp;거대한&nbsp;부지위에&nbsp;자리한&nbsp;수트라하버&nbsp;리조트는&nbsp;마젤란윙과&nbsp;퍼시픽윙으로&nbsp;구성된&nbsp;956개의&nbsp;객실,&nbsp;27홀의&nbsp;챔피언쉽&nbsp;골프코스,&nbsp;여러가지&nbsp;레크레이션이&nbsp;가능한&nbsp;마리나센타,&nbsp;세계적으로&nbsp;잘&nbsp;알려진&nbsp;만다라스파&nbsp;등&nbsp;다양한&nbsp;시설로&nbsp;이루어져&nbsp;있습니다.공항에서&nbsp;10분,&nbsp;시내중심에서&nbsp;5분&nbsp;거리에&nbsp;있는&nbsp;이&nbsp;리조트는&nbsp;일본시장에서도&nbsp;보기&nbsp;드믈게&nbsp;6성급으로&nbsp;판매되고&nbsp;있는&nbsp;슈퍼디럭스&nbsp;리조트이며,&nbsp;국내에서도&nbsp;2006-2007&nbsp;문화관광부와&nbsp;KATA&nbsp;주최&nbsp;해외&nbsp;우수여행&nbsp;상품&nbsp;인증리조트로&nbsp;선정되기도&nbsp;하였습니다.&nbsp;<br />
																				<br />부대시설로는&nbsp;야외수영장,마리나스포츠센터,테니스코트,볼링장,영화관,스쿼시장,게임룸,쇼핑아케이드,가라오케,뷰티싸롱&nbsp;등이&nbsp;있으며&nbsp;마리나스포츠센터에서는&nbsp;패러세일링,카냑,제트스키,워터스키,바나나보트,원드서핑&nbsp;등을&nbsp;즐기&nbsp;실수&nbsp;있습니다.&nbsp;객실마다&nbsp;개별발코니,&nbsp;위성TV&amp;영화채널,&nbsp;IDD전화,&nbsp;미니바,&nbsp;커피&amp;티메이이커,안전금고등의&nbsp;시설이&nbsp;갖추어져&nbsp;있습니다.&nbsp;&nbsp;&nbsp;<br />
																				<br />&lt;리조트&nbsp;상세정보&gt;<br />1.&nbsp;뷰와&nbsp;해변<br />퍼시픽:&nbsp;총&nbsp;500&nbsp;여개의&nbsp;객실이&nbsp;있으면&nbsp;골프뷰,&nbsp;씨뷰&nbsp;객실이&nbsp;있습니다.&nbsp;<br />마젤란:&nbsp;총&nbsp;456&nbsp;개의&nbsp;객실을&nbsp;보유하고&nbsp;있으며&nbsp;가든뷰,&nbsp;씨뷰&nbsp;객실이&nbsp;있습니다.<br />수트라하버&nbsp;리조트는아주&nbsp;작은&nbsp;인공&nbsp;비치만을&nbsp;가지고&nbsp;있으며&nbsp;&nbsp;호텔&nbsp;앞에는&nbsp;선착장이&nbsp;있어&nbsp;섬투어를&nbsp;나가시기엔&nbsp;매우&nbsp;편리합니다.<br />
																				<br />2.&nbsp;위치:&nbsp;공항에서는&nbsp;차량으로&nbsp;10분,&nbsp;시내중심에서는&nbsp;5분&nbsp;거리에&nbsp;위치합니다.<br />
																				<br />3.&nbsp;기본&nbsp;룸&nbsp;타입:&nbsp;싱글침대&nbsp;두&nbsp;개&nbsp;있는&nbsp;트윈&nbsp;또는&nbsp;더블&nbsp;침대&nbsp;한개&nbsp;(트리플&nbsp;룸은&nbsp;없으며&nbsp;엑스트라&nbsp;베드&nbsp;추가가&nbsp;가능합니다.)&nbsp;커넥팅&nbsp;룸&nbsp;요청시&nbsp;컨펌은&nbsp;불가능하며&nbsp;호텔&nbsp;체크인시&nbsp;확인이&nbsp;가능합니다.<br />
																				<br />4.&nbsp;특이사항&nbsp;<br />①&nbsp;퍼시픽윙과&nbsp;마젤란윙의&nbsp;차이점<br />퍼시픽&nbsp;윙은&nbsp;고층&nbsp;빌딩형식이며&nbsp;마젤란윙은&nbsp;전형적인&nbsp;리조트&nbsp;스타일입니다.&nbsp;퍼시픽윙의&nbsp;객실은&nbsp;발코니가&nbsp;없고&nbsp;통유리인&nbsp;반면,&nbsp;마젤란윙의&nbsp;객실은&nbsp;모두&nbsp;발코니가&nbsp;있습니다.&nbsp;두&nbsp;윙의&nbsp;부대시설이용에는&nbsp;차이가&nbsp;없습니다.&nbsp;<br />②&nbsp;부대시설&nbsp;:&nbsp;5개의&nbsp;수영장,&nbsp;15개의&nbsp;식당과&nbsp;바,&nbsp;나이트골프까지&nbsp;가능한&nbsp;아시아&nbsp;최고의&nbsp;27홀&nbsp;골프장,&nbsp;올림픽&nbsp;규격&nbsp;수영장,&nbsp;극장&nbsp;,가라오케,&nbsp;헬스클럽,&nbsp;볼링,&nbsp;당구장,&nbsp;배드민턴,&nbsp;스쿼시,야간&nbsp;테니스,&nbsp;탁구장&nbsp;2개의&nbsp;그랜드볼룸(2500명을&nbsp;수용할&nbsp;수&nbsp;있는&nbsp;대연회장)과&nbsp;28개의&nbsp;미팅룸,&nbsp;저그스&nbsp;클럽(JUG&#39;s&nbsp;Club)&nbsp;등<br />③&nbsp;키즈클럽&nbsp;&lt;유료-사용요금은&nbsp;변동&nbsp;가능성&nbsp;있습니다.&gt;<br />키디스클럽&nbsp;(14:00-22:00/마리나&amp;컨트리&nbsp;클럽에&nbsp;위치)&nbsp;:&nbsp;13RM/시간당<br />리틀&nbsp;마젤란클럽&nbsp;(09:00-22:00/마젤란윙&nbsp;1층에&nbsp;위치)&nbsp;:&nbsp;6시간&nbsp;이하&nbsp;23RM,&nbsp;6시간&nbsp;이후&nbsp;45.25RM<br />④&nbsp;객실&nbsp;내&nbsp;유선&nbsp;인터넷&nbsp;사용&nbsp;가능합니다.&nbsp;&lt;무료&gt;
																			</div>
																		</div>
																		<div class="detaillink_right">
																			<a href="#top" class="mode-layer"
																				onclick="PlaceDetail('H', '1', '26090'); return false;">자세히
																				보기 &gt;</a>
																		</div></li>
																	<li dataPlid="26633" class="type_b1"
																		onclick="PlaceDetail('T', '1', '26633'); return false;">
																		<div class="comment">
																			<b>※수트라하버 부대시설 이용 안내※</b>
																			<ul>
																				<li><img
																					src="http://img.modetour.co.kr/eagle/photoimg/26633/sfile/20.jpg"
																					width="179" height="129" alt="※수트라하버 부대시설 이용 안내※"
																					onerror="setNoImg(this,'140x105');" /></li>
																				<li><img
																					src="http://img.modetour.co.kr/eagle/photoimg/26633/sfile/21.jpg"
																					width="179" height="129" alt="※수트라하버 부대시설 이용 안내※"
																					onerror="setNoImg(this,'140x105');" /></li>
																				<li><img
																					src="http://img.modetour.co.kr/eagle/photoimg/26633/sfile/22.jpg"
																					width="179" height="129" alt="※수트라하버 부대시설 이용 안내※"
																					onerror="setNoImg(this,'140x105');" /></li>
																			</ul>
																			<div class="coment">
																				(※&nbsp;1RM링깃=약&nbsp;390원)<br />
																				<br />▦&nbsp;키즈클럽<br />①&nbsp;키디스클럽-14:00-22:00&nbsp;마리나&amp;컨트리&nbsp;클럽에&nbsp;위치&nbsp;::&nbsp;이용료&nbsp;::&nbsp;RM&nbsp;13/시간당&nbsp;<br />②&nbsp;리틀&nbsp;마젤란클럽-09:00-22:00&nbsp;마젤란윙&nbsp;1층에&nbsp;위치&nbsp;::&nbsp;이용료&nbsp;::&nbsp;6시간&nbsp;이용에&nbsp;RM23<br />
																				<br />▦&nbsp;휘트니스센터(06:00~22:00&nbsp;)&nbsp;-&nbsp;무료<br />▦&nbsp;볼링(10:00~23:000)&nbsp;-&nbsp;12레인지,&nbsp;이용료&nbsp;RM15/게임당<br />▦&nbsp;수영장(07:00~21:00)&nbsp;-&nbsp;무료<br />▦&nbsp;당구장(주중-15:00-23:00,&nbsp;주말-11:00~23:00)&nbsp;-&nbsp;RM30<br />▦&nbsp;배드민턴(06:00-22:00)&nbsp;-&nbsp;3개&nbsp;코트&nbsp;-&nbsp;오전&nbsp;RM12/시간당,&nbsp;오후&nbsp;RM30/시간당<br />▦&nbsp;스쿼시(06:00-22:00)&nbsp;-&nbsp;2개&nbsp;코트&nbsp;-&nbsp;RM12/시간당(단,&nbsp;PM5:00-PM10는&nbsp;RM20/시간당)<br />▦&nbsp;테니스&nbsp;(06:00-22:00)&nbsp;-&nbsp;실내&nbsp;3개,실외&nbsp;6개.&nbsp;RM10~RM50&nbsp;/&nbsp;시간당<br />▦&nbsp;탁구장&nbsp;(06:00-22:00)&nbsp;-&nbsp;2개&nbsp;-&nbsp;RM46/시간<br />▦&nbsp;영화관&nbsp;(주중:20:00,주말:16:00,20:00)&nbsp;-&nbsp;110석&nbsp;규모,&nbsp;세미나&nbsp;장비&nbsp;완비,팝콘&nbsp;무료&nbsp;-&nbsp;RM10/편당<br />
																				<br />※&nbsp;주의&nbsp;:&nbsp;상기&nbsp;사항은&nbsp;호텔측&nbsp;사정으로&nbsp;다소&nbsp;변경될&nbsp;수&nbsp;있습니다.
																			</div>
																		</div>
																		<div class="detaillink_right">
																			<a href="#top" class="mode-layer"
																				onclick="PlaceDetail('T', '1', '26633'); return false;">자세히
																				보기 &gt;</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</div>
													<!-- 플레이스 정보 하이라이트+기본템플릿 끝 -->

													<ul class="add_info">

														<li id="ContentMain_ContentPlaceHolder_Rpt_itiSchedule_Pnl_Hotel_0">
															<div class="hotel">
																<div class="s_name">호텔</div>
																<ul class="s_cnt">
																	<li><a href="#Tab"
																		onclick="PlaceDetail('H', '1','26090');"
																		title='마젤란 수트라하버 리조트'>① [코타키나발루] 마젤란 수트라하버 리조트 <img
																			src="http://img.modetour.co.kr/modetour/2014/itinerary/ico_star1.png"
																			alt="" /><img
																			src="http://img.modetour.co.kr/modetour/2014/itinerary/ico_star1.png"
																			alt="" /><img
																			src="http://img.modetour.co.kr/modetour/2014/itinerary/ico_star1.png"
																			alt="" /><img
																			src="http://img.modetour.co.kr/modetour/2014/itinerary/ico_star1.png"
																			alt="" /><img
																			src="http://img.modetour.co.kr/modetour/2014/itinerary/ico_star1.png"
																			alt="" /> [초특급] TEL : (+60) 88/318-888 [예정]
																	</a></li>
																</ul>
															</div>
														</li>
														<li
															id="ContentMain_ContentPlaceHolder_Rpt_itiSchedule_Pnl_Meal_0">
															<div class="meal">
																<div class="s_name">식사</div>
																<ul class="s_cnt">
																	<b>[조식]</b> 기내식
																</ul>
															</div>
														</li>
													</ul>
													<!-- 플레이스 정보 고정템플릿 끝 -->
												</div>
											</div>

											<div class="itinerary">
												<div class="day">
													<span class="days"><b>2일</b></span> <span class="date">12월
														13일 일요일</span>
													</table>
													<!--<b>1일</b> 12월 5일 수요일-->
												</div>
												<div class="plan">
													<div class="tour">
														<div class="region">코타키나발루</div>
														<div class="timeline">
															<strong></strong>▶ 호텔 조식 <br />▶ 전일 리조트 내 부대시설 이용 및
															자유시간, 또는 선택관광 <br />(부대시설은 여느 리조트와 마찬가지로 풀장이나 헬스클럽 외에는
															대부분 유료 이용입니다.) <br /> <br /> ♥Enjoy Today With 힐링선택관광♥
															<br />아일랜드 호핑투어:70$(어린이60$)/ (BBQ중식)
														</div>
													</div>

													<!-- 플레이스 정보 하이라이트+기본템플릿 시작 -->

													<!-- 플레이스 정보 하이라이트+기본템플릿 끝 -->

													<ul class="add_info">


														<li
															id="ContentMain_ContentPlaceHolder_Rpt_itiSchedule_Pnl_Meal_1">
															<div class="meal">
																<div class="s_name">식사</div>
																<ul class="s_cnt">
																	<b>[조식]</b> 호텔식
																	<b>[중식]</b> 불포함
																	<b>[석식]</b> 불포함
																</ul>
															</div>
														</li>
													</ul>
													<!-- 플레이스 정보 고정템플릿 끝 -->
												</div>
											</div>

											<div class="itinerary">
												<div class="day">
													<span class="days"><b>3일</b></span> <span class="date">12월
														14일 월요일</span>
													</table>
													<!--<b>1일</b> 12월 5일 수요일-->
												</div>
												<div class="plan">
													<div class="tour">
														<div class="region">코타키나발루</div>
														<div class="timeline">
															<strong></strong>▶ 호텔 조식 <br />▶ 전일 리조트 내 부대시설 이용 및
															자유시간, 또는 선택관광 <br />(부대시설은 여느 리조트와 마찬가지로 풀장이나 헬스클럽 외에는
															대부분 유료 이용입니다.) <br />▶ 석식 후 휴식 <br /> <br />♥Enjoy
															Today With 힐링선택관광♥ <br />클리아스리버크루즈(=반딧불투어):90$(어린이80$)/(현지식
															저녁포함) <br />맹글로브투어(=켈리베이투어):80$(어린이70$)/(현지식 중식포함) <br />발맛사지
															1시간:30$ /전신맛사지 1시간:40$
														</div>
													</div>

													<!-- 플레이스 정보 하이라이트+기본템플릿 시작 -->

													<!-- 플레이스 정보 하이라이트+기본템플릿 끝 -->

													<ul class="add_info">


														<li
															id="ContentMain_ContentPlaceHolder_Rpt_itiSchedule_Pnl_Meal_2">
															<div class="meal">
																<div class="s_name">식사</div>
																<ul class="s_cnt">
																	<b>[조식]</b> 호텔식
																	<b>[중식]</b> 불포함
																	<b>[석식]</b> 호텔식
																</ul>
															</div>
														</li>
													</ul>
													<!-- 플레이스 정보 고정템플릿 끝 -->
												</div>
											</div>

											<div class="itinerary">
												<div class="day">
													<span class="days"><b>4일</b></span> <span class="date">12월
														15일 화요일</span>
													</table>
													<!--<b>1일</b> 12월 5일 수요일-->
												</div>
												<div class="plan">
													<div class="tour">
														<div class="region">코타키나발루</div>
														<div class="timeline">
															<strong></strong>▶리조트 조식 후 자유 시간 및 호텔 부대시설 이용 <br />▶12시
															호텔 체크아웃 및 가이드 미팅 <br /> <br />▶코타키나발루 시내관광 <br />
															(가야스트릿-제셜턴포인트-사바주청사-사바국립대학교-이슬람사원-쵸콜렛만들기 체험) <br />※ 일정상
															시간 여유가 있어 시내관광 도중 자유시간이 배정 될 수 있습니다 <br /> <br />▶ 공항
															이동 중에 잡화점/기념품샵 방문<span style="display: none;">시티투어</span>
														</div>
													</div>

													<!-- 플레이스 정보 하이라이트+기본템플릿 시작 -->
													<div
														id="ContentMain_ContentPlaceHolder_Rpt_itiSchedule_Pnl_PlaceTemplace_3"
														class="wrapper">
														<div class="local">
															<div class="s_name">코타키나발루</div>
															<div class="s_cnt">
																<ul class="visit_info">
																	<li dataPlid="31033" class="type"
																		onclick="PlaceDetail('T', '4', '31033'); return false;"><div
																			class="thumb">
																			<img
																				src="http://img.modetour.co.kr/eagle/photoimg/31033/sfile/1.jpg"
																				width="125" height="95" alt="시티투어"
																				onerror="setNoImg(this,'140x105');" /><img
																				style='display: none;'
																				src="http://img.modetour.co.kr/eagle/photoimg/31033/sfile/15.jpg"
																				width="125" height="95" alt="시티투어"
																				onerror="setNoImg(this,'140x105');" /><img
																				style='display: none;'
																				src="http://img.modetour.co.kr/eagle/photoimg/31033/sfile/IMG_2715.JPG"
																				width="125" height="95" alt="시티투어"
																				onerror="setNoImg(this,'140x105');" />
																		</div>
																		<div class="comment">
																			<b>시티투어</b>▶코타키나발루&nbsp;시내관광
																			-가야스트릿&nbsp;광장과&nbsp;최초의&nbsp;영국&nbsp;상륙지인&nbsp;제셜턴포인트에서&nbsp;사진&nbsp;한컷!
																			-72개&nbsp;면의&nbsp;유리로&nbsp;장식된&nbsp;30층&nbsp;규모의&nbsp;사바주청사
																			-독특한&nbsp;분위기의&nbsp;사바국립대학교&nbsp;관람
																			-세계&nbsp;3대&nbsp;사원&nbsp;중의&nbsp;하나로&nbsp;유명한&nbsp;지붕의&nbsp;원형을&nbsp;정육각형의&nbsp;순금판으로&nbsp;치장한&nbsp;&lt;이슬람사원&gt;
																		</div>
																		<div class="detaillink_right">
																			<a href="#top" class="mode-layer"
																				onclick="PlaceDetail('T', '4', '31033'); return false;">자세히
																				보기 &gt;</a>
																		</div></li>
																</ul>
															</div>
														</div>
													</div>
													<!-- 플레이스 정보 하이라이트+기본템플릿 끝 -->

													<ul class="add_info">


														<li
															id="ContentMain_ContentPlaceHolder_Rpt_itiSchedule_Pnl_Meal_3">
															<div class="meal">
																<div class="s_name">식사</div>
																<ul class="s_cnt">
																	<b>[조식]</b> 호텔식
																	<b>[중식]</b> 불포함
																	<b>[석식]</b> 불포함
																</ul>
															</div>
														</li>
													</ul>
													<!-- 플레이스 정보 고정템플릿 끝 -->
												</div>
											</div>

											<div class="itinerary">
												<div class="day">
													<span class="days"><b>5일</b></span> <span class="date">12월
														16일 수요일</span>
													</table>
													<!--<b>1일</b> 12월 5일 수요일-->
												</div>
												<div class="plan">
													<div class="tour">
														<div class="region">코타키나발루</div>
														<div class="timeline">
															<strong>OZ758 현지출발시간 : 2015년 12월 16일 (수) 01:30
																한국도착시간 : 2015년 12월 16일 (수) 07:30</strong><br />▶ 코타키나발루 출발 <br />▶
															인천국제공항 도착 후 해산<span style="display: none;">선택관광리스트</span>
														</div>
													</div>

													<!-- 플레이스 정보 하이라이트+기본템플릿 시작 -->
													<div
														id="ContentMain_ContentPlaceHolder_Rpt_itiSchedule_Pnl_PlaceTemplace_4"
														class="wrapper">
														<div class="local">
															<div class="s_name">코타키나발루</div>
															<div class="s_cnt">
																<ul class="visit_info">
																	<li dataPlid="47634" class="type_b1"
																		onclick="PlaceDetail('T', '5', '47634'); return false;">
																		<div class="comment">
																			<b>선택관광리스트</b>
																			<ul>
																				<li><img
																					src="http://img.modetour.co.kr/eagle/photoimg/47634/sfile/28.jpg"
																					width="179" height="129" alt="선택관광리스트"
																					onerror="setNoImg(this,'140x105');" /></li>
																				<li><img
																					src="http://img.modetour.co.kr/eagle/photoimg/47634/sfile/21.jpg"
																					width="179" height="129" alt="선택관광리스트"
																					onerror="setNoImg(this,'140x105');" /></li>
																				<li><img
																					src="http://img.modetour.co.kr/eagle/photoimg/47634/sfile/25.jpg"
																					width="179" height="129" alt="선택관광리스트"
																					onerror="setNoImg(this,'140x105');" /></li>
																			</ul>
																			<div class="coment">
																				△▲△▲△▲&nbsp;△▲△▲△▲△&nbsp;&nbsp;Enjoy&nbsp;With&nbsp;힐링&nbsp;선택관광&nbsp;&nbsp;△▲△▲△▲&nbsp;△▲△▲△▲&nbsp;<br />
																				<br />★60$이상의&nbsp;선택관광&nbsp;사전포함&nbsp;결제시&nbsp;10$씩&nbsp;할인특전!!(단,&nbsp;해양스포츠는&nbsp;제외)<br />
																				<br />◈아일랜드&nbsp;호핑투어:70$&nbsp;(어린이60$)/(BBQ중식)<br />&lt;호핑투어시&nbsp;추가가능&nbsp;선택관광&gt;<br />-씨워킹:80$(어린이70$)&nbsp;(사진&nbsp;및&nbsp;동영상&nbsp;CD&nbsp;제공)<br />-페러세일링:&nbsp;35$&nbsp;(2인1조)<br />-플라이&nbsp;피쉬:35$<br />-바나나보트:30$<br />-제트스키:50$&nbsp;(2인1조)<br />
																				<br />*스쿠버&nbsp;다이빙&nbsp;체험&nbsp;(호핑투어시&nbsp;진행가능/사전포함&nbsp;할인특전&nbsp;제외)*<br />-툰구압둘라만&nbsp;해양국립공원:&nbsp;아일랜드호핑투어&nbsp;포함&nbsp;상품인&nbsp;경우&nbsp;110$/&nbsp;불포함&nbsp;상품인&nbsp;경우&nbsp;140$추가<br />
																				<br />-만따나니섬:&nbsp;만따나니&nbsp;호핑투어+스쿠버다이빙체험&nbsp;240$&nbsp;추가<br />
																				<br />◈반딧불투어(클리아스&nbsp;또는&nbsp;나나문):90$(어린이80$)+현지식석식<br />
																				<br />◈맹글로브투어(켈리베이투어):80$(어린이70$)+현지식중식<br />
																				<br />◈멍카봉&nbsp;선셋투어:90$(어린이80$)+한식석식<br />
																				<br />◈라군파크워터월드:90$(어린이&nbsp;70$)+현지식중식<br />-맹그로브&nbsp;크루즈&amp;체험낚시,&nbsp;워터월드&nbsp;놀이시설,&nbsp;카약,&nbsp;바이퍼,&nbsp;패들보드,&nbsp;스노클링,&nbsp;<br />바틱&nbsp;페인팅,&nbsp;독침쏘기&nbsp;체험/&nbsp;맹글로브&nbsp;크루즈,바이퍼&nbsp;제외시&nbsp;성인70$(어린이50$)<br />
																				<br />◈라군팍선셋반딧불투어:100$(어린이&nbsp;80$)+현지식석식<br />라군파크워터월드+선셋감상(보트를타고&nbsp;바다와&nbsp;강이&nbsp;만나는&nbsp;해변에서)+반딧불이&nbsp;감상<br />
																				<br />◈민속마을투어(보르네오&nbsp;또는&nbsp;마리마리&nbsp;컬쳐럴&nbsp;빌리지)&nbsp;:60$(어린이50$)+현지식중식<br />
																				<br />◈나이트투어:60$(어린이50$)+씨푸드&nbsp;석식<br />-선셋감상&nbsp;및&nbsp;코코넛음료+야시장투어+분수공원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
																				<br />◈키울루&nbsp;또는&nbsp;카이두안&nbsp;래프팅:80$(어린이70$)/초급자코스+현지식&nbsp;중식<br />
																				<br />▼최소&nbsp;4인이상&nbsp;출발&nbsp;가능한&nbsp;투어▼&nbsp;<br />◈바다낚시투어:140$(어린이100$)+중식<br />
																				<br />◈만따나니섬&nbsp;호핑투어:130$(어린이120$)+BBQ중식&nbsp;<br />
																				<br />◈키나발루&nbsp;국립공원:&nbsp;80$(어린이70$)+현지식중식&nbsp;또는&nbsp;스팀봇<br />
																				<br />▼최소&nbsp;6인이상&nbsp;출발&nbsp;가능한&nbsp;투어▼<br />◈선셋&nbsp;디너&nbsp;크루즈:&nbsp;90$(어린이80$)+선상디너<br />
																				<br />◈썬셋크루즈:70$(어린이60$)+음료1잔&nbsp;포함<br />
																				<br />※&nbsp;선택관광&nbsp;예약시&nbsp;주의&nbsp;사항&nbsp;※<br />①&nbsp;출발&nbsp;당일&nbsp;취소시&nbsp;취소료&nbsp;100%가&nbsp;부과됩니다.<br />②&nbsp;현지상황에&nbsp;따라&nbsp;날짜변동&nbsp;될&nbsp;수&nbsp;있으며,&nbsp;최소인원부족&nbsp;및&nbsp;천재지변에&nbsp;의하여&nbsp;진행&nbsp;불가&nbsp;시&nbsp;전액&nbsp;현지에서&nbsp;환불해&nbsp;드립니다.&nbsp;<br />③&nbsp;선택관광은&nbsp;최소출발인원&nbsp;때문에,&nbsp;현지에서&nbsp;다른&nbsp;팀과&nbsp;조인&nbsp;행사&nbsp;하실&nbsp;수&nbsp;있습니다.<br />
																				<br />△▲△▲△▲&nbsp;△▲△▲△▲△▲△▲△&nbsp;&nbsp;골프&nbsp;라운딩&nbsp;비용&nbsp;&nbsp;&nbsp;△▲△▲△▲&nbsp;△▲△▲△▲&nbsp;△▲△▲△▲△<br />
																				<br />◈넥서스(가람부나이CC)&nbsp;:투숙객&nbsp;주중$130,&nbsp;주말$140/&nbsp;타투숙객&nbsp;주중$150,&nbsp;주말$160&nbsp;<br />◈라사리아(달릿베이CC)&nbsp;:투숙객&nbsp;주중$130,&nbsp;주말$140/&nbsp;타투숙객&nbsp;주중$150,&nbsp;주말$160<br />◈수트라(수트라&nbsp;CC)&nbsp;:투숙객&nbsp;주중$140,&nbsp;주말$160/&nbsp;타투숙객&nbsp;주중$160,&nbsp;주말$180(야간라운딩&nbsp;각각&nbsp;20불&nbsp;추가)&nbsp;<br />
																				<br />*골프&nbsp;티옵요청은&nbsp;출발&nbsp;7일&nbsp;전&nbsp;선입금시만&nbsp;요청&nbsp;받습니다.&nbsp;그&nbsp;외에는&nbsp;현지에서&nbsp;가이드&nbsp;또는&nbsp;호텔측에&nbsp;직접&nbsp;요청하셔야합니다..&nbsp;<br />*포함내역:그린피,카트&nbsp;2인1대,&nbsp;TAX,&nbsp;보험,방문객일&nbsp;경우&nbsp;차량제공<br />*클럽랜탈&nbsp;비용&nbsp;별도:약35$~55$<br />
																				<br />※&nbsp;골프&nbsp;예약시&nbsp;주의&nbsp;사항&nbsp;※<br />①상기&nbsp;요금에는&nbsp;예약수수료와&nbsp;가이드&nbsp;봉사료가&nbsp;포함되어&nbsp;있습니다.<br />②&nbsp;수트라CC와&nbsp;가람부나이CC는&nbsp;골프장&nbsp;내&nbsp;캐디가&nbsp;있으나&nbsp;사전예약&nbsp;불가합니다(현지에서&nbsp;요청,&nbsp;20$/1인당,&nbsp;2인1캐디조건),달릿베이CC는&nbsp;골프장&nbsp;내&nbsp;캐디가&nbsp;없습니다.&nbsp;외부캐디는&nbsp;30$/1인당(2인1캐디,&nbsp;18홀기준)이며&nbsp;사전요청&nbsp;해야합니다.(단,&nbsp;가람부나이CC와&nbsp;달릿베이CC는&nbsp;4인=2캐디&nbsp;이상&nbsp;되어야&nbsp;신청가능합니다)<br />③상기&nbsp;호텔투숙객이&nbsp;아닐&nbsp;경우도&nbsp;골프&nbsp;라운딩은&nbsp;가능합니다.<br />④부킹&nbsp;후&nbsp;캔슬시&nbsp;10%의&nbsp;취소료를&nbsp;부과하고&nbsp;있습니다.<br />⑤티옵&nbsp;배정은&nbsp;골프장&nbsp;측에서&nbsp;보통&nbsp;3일전&nbsp;정리가&nbsp;됩니다.
																			</div>
																		</div>
																		<div class="detaillink_right">
																			<a href="#top" class="mode-layer"
																				onclick="PlaceDetail('T', '5', '47634'); return false;">자세히
																				보기 &gt;</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</div>
													<!-- 플레이스 정보 하이라이트+기본템플릿 끝 -->

													<ul class="add_info">


														<li
															id="ContentMain_ContentPlaceHolder_Rpt_itiSchedule_Pnl_Meal_4">
															<div class="meal">
																<div class="s_name">식사</div>
																<ul class="s_cnt">
																	<b>[조식]</b> 기내식
																</ul>
															</div>
														</li>
													</ul>
													<!-- 플레이스 정보 고정템플릿 끝 -->
												</div>
											</div>

										</div>
										<!-- 일정끝 -->


										<!-- 물놀이 안전수칙 -->
										<div
											id="ContentMain_ContentPlaceHolder_pn_itisafety_precaution_info">
											<img
												src="http://img.modetour.co.kr/modetour/2014/itinerary/150622_water_img.jpg"
												alt="물놀이 안전수칙"
												longdesc="#swimming_safety_precaution_hideinfo" />
											<p id="swimming_safety_precaution_hideinfo"
												style="display: none;">물놀이 주의 안전수칙 공통사항 해수욕장 이용시 안전구역
												내에서만 이용한다. 높은 파도와 해파리 등 해양생물을 조심한다. 해변에 가깝고 사람이 많은 곳에서만
												이용한다. 수영장, 워터파크 이용시 미끄러지지 않는 신발을 착용하고, 뛰지 않도록 한다. 바닥의 배수구에
												손이나 발이 걸리지 않게 주의한다. 위험한 다이빙은 하지 않는다. 수상레포츠 이용시. 구명조끼 등 안전장비를
												꼭 착용하도록 한다. 장비사용법 및 기초자세 교육을 받는다. 건강상태 및 당일의 컨디션에 맞게 이용한다.</p>
										</div>

										<!-- 현장안전지침서 -->


										<div id="ContentMain_ContentPlaceHolder_pn_itishopping_info"
											class="itinerary shopping_info">
											<!--일정표하단 쇼핑정보 노출-->
											<h3>
												<img alt="쇼핑정보"
													src="http://img.modetour.co.kr/modetour/2014/itinerary/tit_heart_shopping.png">
											</h3>
											<div class="note">
												<p>
													전 일정 중 <strong>총3회</strong>의 쇼핑센터 방문이 있습니다.
												</p>
											</div>
											<div class="shop_list">
												<h4>쇼핑품목 리스트</h4>
												<div class="table" id="iti_ShoppingInfo"></div>
												<div id="ContentMain_ContentPlaceHolder_pn_InfoShopping_2">

													<h4>쇼핑정보 참고사항</h4>
													<div class="reference">
														① 환불에 관한 유의사항<br />- 물품의 교환 환불처리는 물품수령후 1달이내만 가능하며 수수료가
														부과될수 있으며, 처리기간은 15일 ~ 최대 60일정도 소요됩니다.<br />- 여행도착후 1달이후
														환불접수시에는 환불이 불가할수 있습니다.<br />
														<br />② 현지 환불 정보<br />- 고객님께서 구입하신 물품의 교환 및 환불처리는 고객님과
														쇼핑센터간의 계약사항으로 <br /> 이루어집니다.<br />- 일부 쇼핑센터는 카드환불시 수수료
														공제후 카드취소됩니다.<br />- 현금환불시 결재시 환율로 환불 처리됩니다.<br />- 고객에
														의해 파손되었을 경우, 포장을 뜯거나, 상품성이 훼손되었을 경우 환불이 불가능합니다<br />- 환불
														배송료는 고객분이 부담해 주셔야 되시고, 환불 및 반품시 영수증 첨부해주셔야 <br /> 환불
														가능합니다.<br />
														<br />③귀국후 환불 절차<br />- 여행사를 통해 본인 및 확인사유를 확인한 후 물건 회수후
														환불 조치를 해드리고 있습니다.<br />
														<br />* 해외여행시 구입한 물품은 US $600 초과금액에 대해 입국시 관세가 부과될 수 있사오니
														참고 바랍니다.
													</div>

												</div>
											</div>
										</div>

									</div>

									<!-- 핵심정보 -->
									<%-- ${productDto.product_name} --%>
									<%-- ${product_airLineDto.start_date} --%>
									<%-- ${product_airLineDto.end_date} --%>
									<%-- ${productDto.product_price_adult} --%>
									<%-- ${productDto.product_price_child} --%>
									<%-- ${productDto.product_price_baby} --%>

									<div id="detail_1" class="contents">
										<div class="core_info">
											<div class="core_print">
												<a href="#top"
													onclick="Itinerary_Popup('/Popup/Package/Itinerary/TravelCoreInfoPrint.html', '', 'width=824px,height=859px,scrollbars=yes'); return false;"
													class="btn_print"><span class="blind">여행 핵심정보 인쇄</span></a>
											</div>
											<div class="summary_info">
												<div class="tables">
													<table>
														<colgroup>
															<col width="140" />
															<col width="206" />
															<col width="141" />
															<col width="205" />
														</colgroup>
														<tbody>
															<tr>
																<th scope="row">상품명</th>
																<td colspan="3">[다다익선/아동반값]코타 키나발루 수트라하버
																	마젤란(초특급/가든뷰) 5일</td>
															</tr>
															<tr>
																<th scope="row">여행기간</th>
																<td>2015. 12. 12 ~ 2015. 12. 16</td>
																<th scope="row">상품종류</th>
																<td>
																	<div class="input_list">
																		<ul>
																			<li>
																				<div class="uip_input radio">
																					<input type="radio" id="kind_single" name="kind_of"
																						class="blind" /> <label for="kind_single">
																						<i></i>단독상품
																					</label>
																				</div>
																			</li>
																			<li>
																				<div class="uip_input radio">
																					<input type="radio" id="kind_combine"
																						name="kind_of" class="blind" /> <label
																						for="kind_combine"> <i></i>연합상품
																					</label>
																				</div>
																			</li>
																		</ul>
																	</div>
																</td>
															</tr>
															<tr>
																<th scope="row">영업보증보험</th>
																<td>가입</td>
																<th scope="row">기획여행 보증보험</th>
																<td>가입</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="tour_cost groups">
												<h2>
													<span class="blind">여행경비 총액</span>
												</h2>
												<div class="section">
													<div class="tables">
														<table>
															<caption>여행경비 총액</caption>
															<thead>
																<tr>
																	<th scope="col" colspan="2">구분</th>
																	<th class="pii_adult" scope="col" id="pii_adult">성인<br />
																	<span>(만 12세이상)</span></th>
																	<th class="pii_child1" scope="col" id="pii_child1">아동
																		No Bed<br />
																	<span>(만 12세미만)</span>
																	</th>
																	<th class="pii_child2" scope="col" id="pii_child2">아동
																		Extr Bed<br />
																	<span>(만 12세미만)</span>
																	</th>
																	<th class="pii_infant" scope="col" id="pii_infant">유아
																		No Bed<br />
																	<span>(만 2세미만)</span>
																	</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<th width="105" rowspan="4" scope="row" id="e">상품가격</th>
																	<th width="105" scope="row" id="e-1" class="txt_l">기본상품가격</th>
																	<td class="pii_adult" headers="pii_adult e e-1">799,000원</td>
																	<td class="pii_child1" headers="pii_child1 e e-1">639,200원</td>
																	<td class="pii_child2" headers="pii_child2 e e-1"></td>
																	<td class="pii_infant" headers="pii_infant e e-1">150,000원</td>
																</tr>
																<tr>
																	<th scope="row" id="e-2" class="txt_l">유류할증료</th>
																	<td class="pii_adult" headers="pii_adult e e-2"></td>
																	<td class="pii_child1" headers="pii_child1 e e-2"></td>
																	<td class="pii_child2" headers="pii_child2 e e-2"></td>
																	<td class="pii_infant" headers="pii_infant e e-2"></td>
																</tr>
																<tr>
																	<th scope="row" id="e-3" class="txt_l">제세공과금</th>
																	<td class="pii_adult" headers="pii_adult e e-3"></td>
																	<td class="pii_child1" headers="pii_child1 e e-3"></td>
																	<td class="pii_child2" headers="pii_child2 e e-3"></td>
																	<td class="pii_infant" headers="pii_infant e e-3"></td>
																</tr>
																<tr>
																	<th scope="row" id="e-4" class="txt_l">소계</th>
																	<td class="pii_adult" headers="pii_adult e e-4"><strong>799,000원</strong></td>
																	<td class="pii_child1" headers="pii_child1 e e-4"><strong>639,200원</strong></td>
																	<td class="pii_child2" headers="pii_child2 e e-4"><strong>0원</strong></td>
																	<td class="pii_infant" headers="pii_infant e e-4"><strong>150,000원</strong></td>
																</tr>
																<tr id="tr_pii_ess_guide">
																	<th rowspan="2" scope="row" id="f" class="cost_must"><i></i><br />현지
																		필수 경비</th>
																	<th scope="row" id="f-1" class="txt_l">현지필수경비</th>
																	<td class="pii_adult" headers="pii_adult f f-1"><span
																		class="adult">없음</span></td>
																	<td class="pii_child1" headers="pii_child1 f f-1"><span
																		class="child1">없음</span></td>
																	<td class="pii_child2" headers="pii_child2 f f-1"><span
																		class="child2">없음</span></td>
																	<td class="pii_infant" headers="pii_infant f f-1"><span
																		class="infant">없음</span></td>
																</tr>
																<tr id="tr_pii_ess_total">
																	<th scope="row" id="f-2" class="txt_l">소계</th>
																	<td class="pii_adult" headers="pii_adult f f-2"><strong
																		class="adult">없음</strong></td>
																	<td class="pii_child1" headers="pii_child1 f f-2"><strong
																		class="child1">없음</strong></td>
																	<td class="pii_child2" headers="pii_child2 f f-2"><strong
																		class="child2">없음</strong></td>
																	<td class="pii_infant" headers="pii_infaant f f-2"><strong
																		class="infant">없음</strong></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="warning_msg">
													<p>※ 유류할증료 및 제세공과금은 유가와 환율에 따라 변동될 수 있습니다.</p>
												</div>
											</div>
											<div class="min_tax groups">
												<h2>
													<span class="blind">최소출발인원 및 취소 수수료 정보</span>
												</h2>
												<div class="section">
													<div class="tables">
														<table>
															<caption>최소출발인원 및 최소 수수료 정보</caption>
															<colgroup>
																<col width="137" />
																<col width="123" />
																<col width="155" />
																<col width="277" />
															</colgroup>
															<thead>
																<tr>
																	<th scope="col">최소출발인원 기준</th>
																	<td><strong>2</strong> 명</td>
																	<th scope="col">최소수수료 부과 기준</th>
																	<td>
																		<div class="input_list">
																			<ul>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="standard" name="terms"
																							class="blind" /> <label for="standard">
																							<i></i>표준 약관 적용
																						</label>
																					</div>
																				</li>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="special" name="terms"
																							class="blind" /> <label for="special"> <i></i>특별
																							약관 적용
																						</label>
																					</div>
																				</li>
																			</ul>
																		</div>
																	</td>
																</tr>
															</thead>
														</table>
													</div>
												</div>
												<div class="warning_msg">
													<p>
														※ 최소출발인원 미충족시 여행약관 제9조에 따라 여행출발7일전까지 여행사는 여행계약을 일방적으로 해제하고
														여행자에게<br /> 통보할 수 있습니다.
													</p>
													<p>※ 취소수수료는 계약금 입금일부터 적용됩니다. 취소수수료 부과 세부 기준을 반드시 확인하세요.</p>
													<p>※ 특별약관 적용의 경우, 표준약관보다 높은 취소수수료가 부과될 수 있습니다.</p>
												</div>
											</div>
											<div class="info groups">
												<h2>
													<span class="blind">주요 확정/미정 정보</span>
												</h2>
												<div class="section">
													<div class="tables">
														<table>
															<caption>주요 확정/미정 정보</caption>
															<colgroup>
																<col width="118" />
																<col width="" />
																<col width="118" />
																<col width="" />
															</colgroup>
															<tbody>
																<tr>
																	<th scope="row">출발</th>
																	<td>
																		<div class="input_list">
																			<ul>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoDeparture_d"
																							name="InfoDeparture" class="blind" /> <label
																							for="InfoDeparture_d"> <i></i>확정
																						</label>
																					</div>
																				</li>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoDeparture_s"
																							name="InfoDeparture" class="blind" /> <label
																							for="InfoDeparture_s"> <i></i>미정
																						</label>
																					</div>
																				</li>
																			</ul>
																		</div>
																	</td>
																	<th scope="row">여행일정</th>
																	<td>
																		<div class="input_list">
																			<ul>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoSchedule_d"
																							name="InfoSchedule" class="blind" /> <label
																							for="InfoSchedule_d"> <i></i>확정
																						</label>
																					</div>
																				</li>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoSchedule_s"
																							name="InfoSchedule" class="blind" /> <label
																							for="InfoSchedule_s"> <i></i>미정
																						</label>
																					</div>
																				</li>
																			</ul>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th scope="row">상품가격</th>
																	<td>
																		<div class="input_list">
																			<ul>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoPrice_d"
																							name="InfoPrice" class="blind" /> <label
																							for="InfoPrice_d"> <i></i>확정
																						</label>
																					</div>
																				</li>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoPrice_s"
																							name="InfoPrice" class="blind" /> <label
																							for="InfoPrice_s"> <i></i>미정
																						</label>
																					</div>
																				</li>
																			</ul>
																		</div>
																	</td>
																	<th scope="row">항공</th>
																	<td>
																		<div class="input_list">
																			<ul>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoAir_d" name="InfoAir"
																							class="blind" /> <label for="InfoAir_d">
																							<i></i>확정
																						</label>
																					</div>
																				</li>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoAir_s" name="InfoAir"
																							class="blind" /> <label for="InfoAir_s">
																							<i></i>미정
																						</label>
																					</div>
																				</li>
																			</ul>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th scope="row">숙박</th>
																	<td>
																		<div class="input_list">
																			<ul>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoLodge_d"
																							name="InfoLodge" class="blind" /> <label
																							for="InfoLodge_d"> <i></i>확정
																						</label>
																					</div>
																				</li>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoLodge_s"
																							name="InfoLodge" class="blind" /> <label
																							for="InfoLodge_s"> <i></i>미정
																						</label>
																					</div>
																				</li>
																			</ul>
																		</div>
																	</td>
																	<th scope="row">가이드</th>
																	<td>
																		<div class="input_list">
																			<ul>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoGuide_d"
																							name="InfoGuide" class="blind" /> <label
																							for="InfoGuide_d"> <i></i>있음
																						</label>
																					</div>
																				</li>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoGuide_s"
																							name="InfoGuide" class="blind" /> <label
																							for="InfoGuide_s"> <i></i>없음
																						</label>
																					</div>
																				</li>
																			</ul>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th scope="row">인솔자</th>
																	<td>
																		<div class="input_list">
																			<ul>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoConductor_d"
																							name="InfoConductor" class="blind" /> <label
																							for="InfoConductor_d"> <i></i>동반
																						</label>
																					</div>
																				</li>
																				<li>
																					<div class="uip_input radio">
																						<input type="radio" id="InfoConductor_s"
																							name="InfoConductor" class="blind" /> <label
																							for="InfoConductor_s"> <i></i>미동반
																						</label>
																					</div>
																				</li>
																			</ul>
																		</div>
																	</td>
																	<th scope="row"></th>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<div class="shopping groups">
												<h2>
													<span class="blind">쇼핑정보</span>
												</h2>
												<div class="section">
													<div class="tables">
														<table>
															<caption>쇼핑정보</caption>
															<colgroup>
																<col width="213" />
																<col width="" />
															</colgroup>
															<tbody>
																<tr>
																	<th>일정에 포함 된 쇼핑 횟수</th>
																	<td><strong>3</strong> 회</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="warning_msg">
													<p>※ 쇼핑품목, 장소, 소요시간, 환불여부 등 세부항목은 상세페이지에서 반드시 확인하세요.</p>
												</div>
											</div>
											<div class="safe groups">
												<h2>
													<span class="blind">여행지 안전정보</span>
												</h2>
												<div class="section">

													<div class="tables">
														<DIV>
															<DIV>말레이시아</DIV>
															<TABLE>
																<CAPTION>여행지 안전정보</CAPTION>
																<COLGROUP>
																	<COL WIDTH="98">
																	<COL WIDTH="148">
																	<COL WIDTH="">
																</COLGROUP>
																<THEAD>
																	<TR>
																		<TH COLSPAN="2">여행경보단계</TH>
																		<TH>여행지(국가 또는 지역)</TH>
																	</TR>
																</THEAD>
																<TBODY>
																	<TR>
																		<TH>남색경보</TH>
																		<TD>-</TD>
																		<TD>-</TD>
																	</TR>
																	<TR>
																		<TH>황색경보</TH>
																		<TD>-</TD>
																		<TD>-</TD>
																	</TR>
																	<TR>
																		<TH>적색경보</TH>
																		<TD>철수권고(일부)</TD>
																		<TD>사바 주 동부 도서, 해안 지역</TD>
																	</TR>
																</TBODY>
															</TABLE>
															<BR />
														</DIV>
													</div>
												</div>
												<div class="warning_msg">
													<p>
														※ 여행경보단계는 여행유의/자제/제한/금지 4단계로 구분되며, 외교부 '해외안전여행' 사이트(<a
															href="http://www.0404.go.kr" target="_blank"
															title="해외안전여행 사이트 (새창)">www.0404.go.kr</a>)에서<br />
														상세정보를 확인 할 수 있습니다.
													</p>
												</div>
											</div>
										</div>
									</div>
									<div id="detail_2" class="contents">
										<div class="tour_info" id="tabTourInfo">
											<div class="sub_tab">
												<ul>
													<li class="current" data-code="5"><a
														href="#visit_info" class="sub_link">방문지정보</a></li>
													<li data-code="3"><a href="#choice_tour"
														class="sub_link">선택관광정보</a></li>
													<li data-code="0"><a href="#hotel_info"
														class="sub_link">호텔정보</a></li>
													<li data-code="2"><a href="#golf_info"
														class="sub_link">골프장정보</a></li>
												</ul>
											</div>
											<div class="sub_tabs_contents">
												<ul class="accordion">
													<li class="visit_info"><a class="button current"
														href="#visit_info"><span class="blind">방문지 정보</span></a>
														<div class="acc_contents" id="visit_info">
															<div class="itinerary">
																<div class="day">
																	<span class="days"><b>1일</b></span> <span class="date">12월
																		12일 토요일</span>
																</div>
																<div class="plan">
																	<div class="visit_place_nav">
																		<div class="item">
																			<a href="#P126633" title='※수트라하버 부대시설 이용 안내※'
																				id="Place_26633" class='SelectedPlace'>※수트라하버
																				부대시설 이용 안내※</a>
																		</div>
																	</div>
																	<div id='TourPlaceDay1' class="visit_place"></div>
																</div>
															</div>
															<div class="itinerary">
																<div class="day">
																	<span class="days"><b>2일</b></span> <span class="date">12월
																		13일 일요일</span>
																</div>
																<div class='plan place_none'>당일에는 방문지가 없습니다.</div>
															</div>
															<div class="itinerary">
																<div class="day">
																	<span class="days"><b>3일</b></span> <span class="date">12월
																		14일 월요일</span>
																</div>
																<div class='plan place_none'>당일에는 방문지가 없습니다.</div>
															</div>
															<div class="itinerary">
																<div class="day">
																	<span class="days"><b>4일</b></span> <span class="date">12월
																		15일 화요일</span>
																</div>
																<div class="plan">
																	<div class="visit_place_nav">
																		<div class="item">
																			<a href="#P431033" title='시티투어' id="Place_31033"
																				class='SelectedPlace'>시티투어</a>
																		</div>
																	</div>
																	<div id='TourPlaceDay4' class="visit_place"></div>
																</div>
															</div>
															<div class="itinerary">
																<div class="day">
																	<span class="days"><b>5일</b></span> <span class="date">12월
																		16일 수요일</span>
																</div>
																<div class="plan">
																	<div class="visit_place_nav">
																		<div class="item">
																			<a href="#P547634" title='선택관광리스트' id="Place_47634"
																				class='SelectedPlace'>선택관광리스트</a>
																		</div>
																	</div>
																	<div id='TourPlaceDay5' class="visit_place"></div>
																</div>
															</div>
															<div class="unfold">
																<button type="button">
																	<span>접기</span>
																</button>
															</div>
														</div></li>
													<li class="choice_tour"><a class="button"
														href="#choice_tour"><span class="blind">선택관광정보</span></a>
														<div class="acc_contents" id="choice_tour">
															<h4>선택관광 리스트</h4>
															<div class="guide_note">
																<div class="title">
																	<strong>현지 선택관광에 대한 안내</strong>
																</div>
																<div class="comment">
																	<b>선택관광은 고객님이 자유롭게 지불여부를 결정할 수 있으며</b> 선택관광에 참여하지 않음으로
																	인한 추가적인 비용 또는 일정상의 불이익은 없습니다.
																</div>
															</div>
															<div id="TabView5_List"></div>

															<div class="unfold">
																<button type="button">
																	<span>접기</span>
																</button>
															</div>
														</div></li>
													<li class="hotel_info"><a class="button"
														href="#hotel_info"><span class="blind">호텔 정보</span></a>
														<div class="acc_contents" id="hotel_info">
															<div class="guide_note">
																<div class="title">
																	<strong>호텔등급 안내</strong>
																</div>
																<div class="comment">
																	일정표상에 표기된 호텔등급은 국제적으로 통용되는 호텔등급기준이 없는 관계로<br />현지호텔로부터
																	받은 등급을 바탕으로 고객님의 이해를 돕기위해 임의로 표기한 것임을 알려드립니다.
																</div>
															</div>
															<div class="list_tabs">
																<div class="table">
																	<table>
																		<caption>호텔정보 리스트</caption>
																		<colgroup>
																			<col width="230" />
																			<col width="" />
																			<col width="230" />
																		</colgroup>
																		<tbody id="HotelList">
																			<tr>
																				<td><div class="hotel_tab" data-code="0"
																						data-type="H" data-plid="26090">
																						<a href='#PlaceName'
																							title="[코타키나발루] 마젤란 수트라하버 리조트"><span>[코타키나발루]
																								마젤란 수트라하버...</span></a>
																					</div></td>
																				<td><div></div></td>
																				<td><div></div></td>
																			<tr>
																		</tbody>
																	</table>
																</div>
															</div>
															<div class="list_tabs_wrap" id="HotelInfoView"></div>
															<div class="unfold">
																<button type="button">
																	<span>접기</span>
																</button>
															</div>
														</div></li>
													<li class="golf_info"><a class="button"
														href="#golf_info"><span class="blind">골프장 정보</span></a>
														<div class="acc_contents" id="golf_info">
															<div class="list_tabs">
																<div class="table">
																	<table>
																		<caption>골프장정보 리스트</caption>
																		<colgroup>
																			<col width="230" />
																			<col width="" />
																			<col width="230" />
																		</colgroup>
																		<tbody id="GolfList">

																		</tbody>
																	</table>
																</div>
															</div>
															<div id="GolfInfoView"></div>
															<div class="unfold">
																<button type="button">
																	<span>접기</span>
																</button>
															</div>
														</div></li>
												</ul>
											</div>
										</div>
									</div>
									<div id="detail_3" class="contents">
										<div class="reference">
											<div class="sub_tab_menu">
												<div class="sub_tab_wrap before">
													<div class="title">출발 전 참고사항</div>
													<div class="sub_tab">
														<ul>
															<li><a class="sub_link" href="#reference_list1">예약취소료
																	규정</a></li>
															<li><a class="sub_link" href="#reference_list7">항공정보</a></li>
															<li><a class="sub_link" href="#reference_list3">예약시
																	유의사항</a></li>
															<li><a class="sub_link" href="#reference_list17">최소출발인원
																	규정</a></li>
															<li><a class="sub_link" href="#reference_list18">결제안내</a></li>
															<!--<li><a class="sub_link" href="#reference_list10">해외여행 안전정보</a></li>-->
															<li><a class="sub_link" href="#reference_list5">사용
																	객실정보</a></li>
															<li><a class="sub_link" href="#reference_list6">싱글룸
																	사용정보</a></li>
															<li><a class="sub_link" href="#reference_list4">유류할증료/환율</a></li>
															<li><a class="sub_link" href="#reference_list13">선택추가경비</a></li>
															<li><a class="sub_link" href="#reference_list12">여권/비자
																	관련정보</a></li>
															<li><a class="sub_link" href="#reference_list16">자주하는
																	질문과 답변</a></li>
														</ul>
													</div>
												</div>
												<div class="sub_tab_wrap after">
													<div class="title">출발 후 참고사항</div>
													<div class="sub_tab">
														<ul>
															<li><a class="sub_link" href="#reference_list2">여행자보험</a></li>
															<li><a class="sub_link" href="#reference_list8">공항이용
																	주의사항</a></li>
															<li><a class="sub_link" href="#reference_list15">여행시
																	주의사항</a></li>
															<li><a class="sub_link" href="#reference_list14">쇼핑정보</a></li>
															<li><a class="sub_link" href="#reference_list11">한국
																	수신자부담전화</a></li>
															<li><a class="sub_link" href="#reference_list9">국내
																	긴급연락처</a></li>
															<li><a class="sub_link" href="#reference_list9_2">해외
																	긴급연락처</a></li>
															<li><a class="sub_link" href="#reference_list19"><span>현지
																		행사정보</span></a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="sub_tabs_contents">
												<ul>
													<li>
														<div class="acc_contents" id="reference_list1">
															<h4>예약취소료 규정</h4>
															<div class="reference_contents">
																<div style='margin-bottom: 10px;'>
																	▶ <span style='color: red;'>인터넷상에서 예약/결제 취소 및
																		변경은 불가능하오니, 예약/결제 취소나 여행자정보 변경을 원하시면 반드시 예약담당자에게 연락하여
																		주시기바랍니다.</span>
																</div>
																▶여행자의 여행계약 해제 요청 시 여행약관에 의거하여 취소료가 부과됩니다◀<br />제15조(여행출발
																전 계약해제)<br /> ? 여행개시 30일전까지( ～30) 통보 시 - 계약금 환급<br />
																? 여행개시 20일전까지(29 ～20) 통보 시 - 여행요금의 10% 배상<br /> ? 여행개시
																10일전까지(19～10) 통보 시 - 여행요금의 15% 배상<br /> ? 여행개시 8일전까지(
																9～ 8) 통보 시 - 여행요금의 20% 배상<br /> ? 여행개시 1일전까지( 7～ 1) 통보
																시 - 여행요금의 30% 배상<br /> ? 여행 당일 통보 시 - 여행요금의 50% 배상<br />(※공정거래위원회
																고시 제2014-4호 소비자분쟁해결기준에 의한것으로 제15조의 변경사항은 2014년 3월21일
																여행상품예약자부터 적용)
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list2">
															<h4>여행자보험</h4>
															<div class="reference_contents">
																<div class="table">
																	<table cellspacing="0" cellpadding="3">
																		<caption style="text-align: left;">◎ 여행자보험
																			연령별 담보한도</caption>
																		<colgroup>
																			<col width="10%" />
																			<col width="20%" />
																			<col width="20%" />
																			<col width="20%" />
																			<col width="20%" />
																		</colgroup>
																		<thead>
																			<tr>
																				<th colspan="2" scope="colgroup">나이</th>
																				<th scope="col">만0세~ 만14세</th>
																				<th scope="col">만15세~79세 5개월</th>
																				<th scope="col">79세6개월~99세</th>
																			</tr>
																		</thead>
																		<tbody align="center">
																			<tr>
																				<th rowspan="4" style="letter-spacing: 10px;"
																					scope="rowgroup">상해</th>
																				<th style="letter-spacing: 30px;" scope="row">사망</th>
																				<td>부담보(無)</td>
																				<td colspan="2">1억원</td>
																			</tr>
																			<tr>
																				<th style="letter-spacing: 8px;" scope="row">후유장애</th>
																				<td colspan="3">최대 1억원(장애 등급에 따라 지급)</td>
																			</tr>
																			<tr>
																				<th style="letter-spacing: 18px;" scope="row">의료비</th>
																				<td colspan="3">해외 발생 300만원 / 국내발생 입원의료실비 500만원</td>
																			</tr>
																			<tr>
																				<th scope="row">통원/조제비</th>
																				<td colspan="3">국내발생 외래의료실비(통원) 25만원(회당/45회한정)
																					/ 조제5만원(건당/45회한정)</td>
																			</tr>
																			<tr>
																				<th rowspan="3" style="letter-spacing: 10px;"
																					scope="rowgroup">질병</th>
																				<th style="letter-spacing: 30px;" scope="row">사망</th>
																				<td>부담보(無)</td>
																				<td>1,000만원</td>
																				<td>부담보(無)</td>
																			</tr>
																			<tr>
																				<th style="letter-spacing: 18px;" scope="row">의료비</th>
																				<td colspan="3">해외 발생 100만원 / 국내발생 입원의료실비 100만원</td>
																			</tr>
																			<tr>
																				<th scope="row">통원/조제비</th>
																				<td colspan="3">국내발생 외래의료실비(통원) 25만원(회당/45회 한정)
																					/ 조제5만원(건당/45회한정)</td>
																			</tr>
																			<tr>
																				<th colspan="2" scope="row">배상책임(면책1만원)</th>
																				<td colspan="3">100만원</td>
																			</tr>
																			<tr>
																				<th colspan="2" scope="row">휴대품손해(면책1만원)</th>
																				<td colspan="3">50만원 (1품목, 1조, 1쌍 최대 20만원)</td>
																			</tr>
																			<tr>
																				<th colspan="2" style="letter-spacing: 25px;"
																					scope="row">특별비용</th>
																				<td colspan="3">200만원</td>
																			</tr>
																		</tbody>
																	</table>
																	<ol
																		style="list-style-type: decimal; margin: 5px 0 5px 20px;">
																		<li>보험 접수는 여행 종료일 다음날부터 2년 이내 접수하셔야 합니다.</li>
																		<li>일정 종료후 보험기간은 개별연장 불가하며 보장기간은 종료일로부터 90일
																			이내입니다.</li>
																		<li>15세 미만과 79세 6개월이상 및 임산부는 보상 불가부분이 있으므로 확인 후
																			개별 보험 가입을 권장합니다.</li>
																		<li>15세 미만자, 심실상실자 또는 심신 박약자의 사망을 보험사고로 한 보험계약은
																			무효로 합니다. (상법 732조)</li>
																		<li>여행자보험은 실손실 보상 보험으로 보상한도 안에서 심사지급 되며 타보험사와 중복
																			가입시 비례보상됩니다.</li>
																		<li>보험금은 보험한도내에서 지급되며 본인부담금 공제후 지급됩니다.
																			<table summary="항목별 본인부담금" cellspacing="0"
																				cellpadding="5">
																				<colgroup>
																					<col width="40%" />
																					<col width="40%" />
																					<col width="20%" />
																				</colgroup>
																				<thead>
																					<tr>
																						<th scope="col">항목</th>
																						<th scope="col">본인부담금</th>
																						<th scope="col">비고</th>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td>국내발생 입원의료실비 (상해, 질병)</td>
																						<td>10% (단, 동부화재 20%)</td>
																						<td>&nbsp;</td>
																					</tr>
																					<tr>
																						<td>국내발생 외래의료실비 (상해, 질병)</td>
																						<td><ol
																								style="list-style-type: decimal; margin: 5px 0 5px 20px; padding-left: 20px;">
																								<li>의원 - 1만원</li>
																								<li>종합병원 병원, 한방병원등 - 1만5천원</li>
																								<li>종합전문요양기관, 상급종합병원 - 2만원</li>
																							</ol></td>
																						<td>1일,1회당</td>
																					</tr>
																					<tr>
																						<td>국내발생처방조제의료실비 (상해, 질병)</td>
																						<td>8천원</td>
																						<td>1일,1회당</td>
																					</tr>
																				</tbody>
																			</table>
																		</li>
																		<li>진료와 무관한 제비용 (제증명료, 의료보조기구 구입비)이나 입원 및국내 통원치료시
																			치과치료, 한방치료에서발생한 비급여 의료비는 보상되지 않습니다.</li>
																		<li>진료기관 방문시 발생되는 통원비용 및 업무 손실비용등에 대해서는 보상되지
																			않습니다.</li>
																		<li>교통사고등 국민건강 보험공단의 적용을 받지 못하는 경우 치료비의 40% 이내에서
																			보상됩니다</li>
																		<li>상해사고로 인한 장애 판정은 사고일로부터 6개월 이후 대학병원급의 의료기관에서
																			후유장애를 진단 받으시길 바랍니다.</li>
																		<li>본인 부주의에 의한 휴대품 분실 / 파손 사고 청구시에 대해서는 보상이
																			불가합니다.<br />- 현금 및 유가증권, 신체보조장구 (치아, 틀니, 콘택트렌즈)는 보상
																			불가합니다.<br />- 흠. 기스에 의한 파손은 보상 불가합니다.
																		</li>
																		<li>여행자 보험은 여행기간내 발생하는 사고에 대해 보장을 해드리며 기존 병력으로 인해
																			여행기간중 발생되는사고에 대해서는 보상하지 않습니다. (ex. 기왕증등)</li>
																	</ol>
																</div>
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list3">
															<h4>예약시 주의사항</h4>
															<div class="reference_contents">
																① 여권 만료일 6개월 이상이 남아있는지 꼭 체크바랍니다.<br />② 커넥팅 룸이나 더블베드 요청
																시 확정여부는 사전에 확인이 불가합니다. 현지에서 체크인 할 시 확인 가능한 부분이므로 양해바랍니다<br />③
																코타키나발루의 특급 호텔은 선입금을 전제로 진행되기 때문에, 예약에 신중을 부탁드립니다.(예약 및
																취소료 특약 규정 참조)<br />④ 리조트 중/석식으로 식사를 추가로 포함해 가실 경우, 현지에서
																안드셔도 환불이 안되므로 추가로 호텔 식사를 원하실 경우, 체크아웃시 룸차지로 계산하는 방식을
																추천합니다.(현지 지불과 포함시 비용 동일)<br />※여행일정은 계약체결시 예상하지 못한 부득이한
																사정 등이 발생하는 경우 사전협의를 거쳐 변경될 수 있음을 양지하시기 바랍니다.<br />
																<br />▶ 힐링투어는 영업보증보험 22억1천만원(기간:2015년2월18일~2016년2월17일)에
																가입되어 있습니다.<br />
																<br />
																<a
																	href="http://img.modetour.co.kr/modetour/2014/itinerary/pds/%EA%B8%B0%ED%9A%8D%EB%B3%B4%EC%A6%9D.jpg"
																	target="_blank" title="새창">기획보증보험 바로가기&gt;&gt;</a><br />
																<a
																	href="http://img.modetour.co.kr/modetour/2014/itinerary/pds/%EC%98%81%EC%97%85%EB%B3%B4%EC%A6%9D.jpg"
																	target="_blank" title="새창">영업보증보험 바로가기&gt;&gt;</a><br />
																<br />본 상품은 단체여행을 목적으로하는 패키지 상품으로 여행자는 여행업자의 여행질서 유지에
																적극 협조하여 주셔야 하며 정해진 일정에서 벗어나는 개별일정의 진행은 불가합니다. 단체여행 일정이
																아닌 개별 일정을 진행하실 수 있는 개별여행을 원하시는 분은 [자유여행] 상품을 이용해 주시기
																바랍니다.<br />
																<br />
																<근거 및 처리 절차>
																<br />
																- 국외여행약관 제2조 2항 ˝여행자는 안전하고 즐거운 여행을 위하여 여행자간 화합도모 및 여행업자의
																여행질서 유지에 적극 협조하여야 합니다.˝<br />
																- 국외여행약관 제13조 4항 ˝여행자는 여행출발 후 자기의 사정으로 숙박, 식사, 관광 등
																여행요금에 포함된 서비스를 제공받지 못한 경우 당사에게 그에 상응하는 요금의 환급을 청구할 수
																없습니다. 단, 여행이 중도에 종료된 경우에는 제16조에 준하여 처리합니다.˝<br />
																- 국외여행약관 제16조 1항 ˝당사 또는 여행자는 여행출발 후 부득이한 사유가 있는 경우 이
																여행계약을 해지할 수 있습니다. 단, 이로 인하여 상대방이 입은 손해를 배상하여야 합니다.˝<br />
																- 위의 경우에 의하여 약속된 일정이 변경된 경우 당사는 관광진흥법 시행규칙에 의거 고객에게
																일정변경동의서의 동의를 요구합니다.<br />
																<br />
																<법정대리인 (부모) 동행 없는 미성년자의 여행계약 주의사항>
																<br />
																<br />
																만 19세 미만의 미성년자끼리의 여행계약 또는 법정대리인(부모)이 아닌 성인과 동행하는 미성년자의
																여행계약은 민법 제5조에 의거하여 법정대리인인 부모 또는 친권자와 체결함을 원칙으로 해야 하고,
																당사는 법정대리인의 동의 없는 여행계약의 체결을 거부할 수 있습니다. 
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list4">
															<h4>유류할증료/환율</h4>
															<div class="reference_contents">
																☞ 국제유가와 항공사 영업환경을 고려한 국토교통부의 ‘국제선 항공요금과 유류할증료 확대방안’에따라
																추가인상된 유류할증료 금액을 상품가에 반영할수 있습니다.<br />☞ 달러/엔/유로화등의 환율이
																급격하게 변동될 경우는 국외여행표준약관 제12조 1항에 의거하여 추가금액이 발생하거나 상품가 인상이
																있을 수 있습니다.<br />※ 국외여행 표준약관 제12조(여행요금의 변경) ※<br />①
																국외여행을 실시함에 있어서 이용운송, 숙박기관에 지급하여야 할 요금이 계약체결시보다 5%이상
																증감하거나 여행요금에 적용된 외화환율이 계약체결시보다 2% 이상 증감한 경우 당사 또는 여행자는 그
																증감된 금액 범위 내에서 여행요금의 증감을 상대방에게 청구할 수 있습니다.<br />② 당사는
																제1항의 규정에 따라 여행요금을 증액하였을 때에는 여행출발일 15일전에 여행자에게 통지하여야 합니다.
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list5">
															<h4>사용객실 정보</h4>
															<div class="reference_contents">
																객실하나에 투숙 가능한 인원은 성인3명 또는 성인2명+아동2명이 최대입니다. 이를 초과할 시 추가요금
																지불 후 객실 2개를 사용해야 합니다.<br />(예: 성인3명+아동1명 이용시는 추가요금 지불 후
																객실 2개 이용)
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list6">
															<h4>싱글룸 사용정보</h4>
															<div class="reference_contents">
																13만원/1박당/1룸당 <br />(성수기 기간 써차지 별도추가 - 2015년 12월21일 부터
																2016년 1월4일 그리고 2월 6일부터 2월13일 까지는 성수기기간으로 4만원/박당 별도로
																추가됩니다)
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list7">
															<h4>항공정보</h4>
															<div class="reference_contents">
																◐ 여행예약시 알아두어야 할 아시아나항공정보 ◑ <BR>1. 예약시 좌석이 여유좌석이
																있는경우는 여권상의 정확한 영문이름을 늦어도 출발일 기준 보름(D-15일)전까지 반드시 입력 및
																영문이름 통보 하셔야만 합니다. <BR>2. 여권상의 영문이 불가피하게 변경이 되었을경우
																출발이 어려울 수도 있습니다.<BR>3. 15일 이내 리턴연장을 원하실경우 현지지불
																150$의 추가 요금이 있으며, 연장을 원하시는 해당일의 좌석 가능 여부를 꼭 확인하시기 바랍니다.
																<BR>※ 비지니스석 이용을 원하시는 경우 약 100~150만원의 추가비용이 발생합니다.
																마일리지로 비지니스 업그레이드를 원하시는 경우 왕복 2만5천마일(평수기 기준 / 성수기 50%
																추가공제) 소진과 함께 약 45만원의 추가비용이 발생합니다.<BR>(추가금액은 성수기 /
																비수기 / 요일에 따라 가격이 다릅니다.&nbsp; 담당자와 체크 부탁드립니다)<BR>┏━━━━━━━━━
																■ 아동식 메뉴 및 아기 바구니 신청안내 ■ ━━━━━━━━━┓ <BR>★
																챠일드밀(만2세~12세 미만) <BR>☞출발편(인천-&gt;코타) - 떡갈비와 밥, 볶음밥과
																치킨너겟, 오므라이스와 소세지, 미트볼 토마토소스 파스타 중 선택 1개.<BR>☞리턴편(코타-&gt;인천)
																- 스탠다드밀로 현지 사정에 따라 제공되는 메뉴와 서비스만 이용가능 <BR>☞
																베이비밀(만2세 미만의 유아) - 미음 / 거버이유식 / 거버쥬스 <BR>☞
																토들러밀(12개월~36개월) - 진밥 / 거버이유식 / 거버쥬스 / 두유<BR>※ 여행
																출발일 3일전(출발72시간전)까지 항공사요청
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list8">
															<h4>공항이용 주의사항</h4>
															<div class="reference_contents">
																국토교통부 액체,젤류,에어로졸에 대한 항공보안 통제지침에 따라<br />대한민국을 출발하는 모든
																국제선 항공편과 환승·통과편을 이용하는 <br />승객들이 용기 1개당 100 ㎖(cc) 를 초과하는
																액체, 젤류 및 에어로졸류 물질을 <br />휴대하여 항공기에 탑승하는 것을 금지합니다. <br />
																<br />면세점에서 액체, 젤류 및 에어로졸 면세품을 사는 경우, <br />면세점의 포장 봉투를
																뜯지만 않으시면 용량에 관계없이 <br />기내에 가지고 탈 수 있으므로, 최종 목적지 도착시까지
																절대 포장을 뜯지 마십시오.<br />국토교통부 <a
																	href="http://www.mltm.go.kr"
																	style="text-decoration: underline;" target="_blank">http://www.mltm.go.kr</a>
																(1599-0001) 참조<br />
																<br />단, EU국가에서 갈아타시는 경우, EU 이외의 국가(인천공항 포함)에 위치한 공항 또는<br />시내
																면세점에서 구입한 모든 액체류는 환승시 해당 국가 규정에 따라 압수될 수 있습니다.<br />
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list9">
															<h4>국내긴급 연락처</h4>
															<div class="reference_contents">
																※ 아래의 연락처는 공항에서 첫만남시 긴급상황이 발생했을 경우에 해당되며<br /> 상품관련 문의는
																예약하신곳(힐링투어 상품판매점) 또는 예약센터 (1800-0000)로<br /> 하시기 바랍니다.<br />
																<br /> 평일 : 힐링투어 공항지점 ☎ 031) 000-0000<br /> 주말 : 힐링투어
																본사 당직자 ☎ 02) 000-0000
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list9_2">
															<h4>해외긴급 연락처</h4>
															<div class="reference_contents">
																①랜드스타<br />사무실 : 088-486-194/195/196 <br />최우영 이사님 :
																HP.016-883-9041<br />박보애 차장님 : Hp. 016-832-1700 <br />
																<br />②메카투어<br />사무실 : 088-250-040<br />이혜경 소장님
																:HP.016-838-0248<br />
																<br />③레이스투어<br />사무실 : 070-4240-6545<br />마민정 실장님 :
																HP.014 674 8104<br />
																<br />한국에서 거실때<br />+60(말레이시아 국가번호)-전화번호(번호 맨 앞자리의 0은
																제외하고 거
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list19">
															<h4>현지 행사정보</h4>
															<div class="reference_contents"></div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list11">
															<h4>한국수신자부담전화</h4>
															<div class="reference_contents">말레이시아에서 한국으로 전화 하실때
																1800-80-7588(수신자 부담 전화번호)</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list12">
															<h4>여권/비자 관련 정보</h4>
															<div class="reference_contents">
																① 반드시 6개월 이상의 여권을 소지하셔야 합니다.<br />- 여권만료일 6개월 미만시 ,
																비행기에 탑승할 수도 없습니다.<br />② 대한민국 국적자는 3개월까지 무비자 입국 가능, 미국인
																무비자<br />③ 주요 비자 필요국적 : 중국,인도 등<br />④ 더 자세한 비자 필요국
																확인(www.imi.gov.my/index.php/en/visa/visa-requirement-by-country)<br />⑤
																말레이시아 대사관 ☎ 02-795-9203<br />⑥ 외국/이중국적자의 해외여행은
																도착지국가(경유국가 포함)의 출입국정책이 상이하므로,<br /> 반드시 여행자본인이 해당국의
																대사관에 확인하셔야 합니다.
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list13">
															<h4>선택추가경비</h4>
															<div class="reference_contents">
																&nbsp;<BR>
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list14">
															<h4>쇼핑정보</h4>
															<div class="reference_contents">
																① 환불에 관한 유의사항<br />- 물품의 교환 환불처리는 물품수령후 1달이내만 가능하며 수수료가
																부과될수 있으며, 처리기간은 15일 ~ 최대 60일정도 소요됩니다.<br />- 여행도착후 1달이후
																환불접수시에는 환불이 불가할수 있습니다.<br />
																<br />② 현지 환불 정보<br />- 고객님께서 구입하신 물품의 교환 및 환불처리는 고객님과
																쇼핑센터간의 계약사항으로 <br /> 이루어집니다.<br />- 일부 쇼핑센터는 카드환불시 수수료
																공제후 카드취소됩니다.<br />- 현금환불시 결재시 환율로 환불 처리됩니다.<br />- 고객에
																의해 파손되었을 경우, 포장을 뜯거나, 상품성이 훼손되었을 경우 환불이 불가능합니다<br />-
																환불 배송료는 고객분이 부담해 주셔야 되시고, 환불 및 반품시 영수증 첨부해주셔야 <br /> 환불
																가능합니다.<br />
																<br />③귀국후 환불 절차<br />- 여행사를 통해 본인 및 확인사유를 확인한 후 물건
																회수후 환불 조치를 해드리고 있습니다.<br />
																<br />* 해외여행시 구입한 물품은 US $600 초과금액에 대해 입국시 관세가 부과될 수
																있사오니 참고 바랍니다.
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list15">
															<h4>여행시 주의사항</h4>
															<div class="reference_contents">
																①여권 만료일 6개월 이상이 남아있는지 꼭 체크바랍니다.<br />②코타의 특급 호텔은 선입금을
																전제로 진행되기 때문에, 예약에 신중을 부탁드립니다.(예약 및 취소료 특약규정을 참조해주세요.)<br />③커넥팅룸이나
																더블베드 요청 시 확정여부는 사전에 확인이 불가합니다. 현지에서 체크인 할 시 확인 가능한 부분이므로
																양해바랍니다.<br />④코타에서는 현지화폐인 링깃-RM(Ringgit Malaysia)만 사용이
																가능합니다. RM(링깃)은 약 300원(2015.08월기준)가량이고 한국에서 환전이 가능합니다. 미국
																달러로 환전해가셔도 현지 공항,호텔에서 말레이시아 링깃(RM)으로 환전할 수 있습니다.<br />⑤호텔에
																따라 체크인시 사전 예치금을 현금 또는 카드로 요구할 수 있습니다. 이는 손님이 호텔 숙박 중 발생할
																수 있는 전화비, 미니바, 객실파손등의 가능성에 대한 보증금 형식이므로 이에 대한 사전인지
																부탁드립니다. 체크아웃할 시 비용발생이 되지 않았을 경우에는 현금데파짓은 바로 돌려드리며 카드결재의
																경우에는 보름에서 한달 가량 사이에 자동 취소됨으로 걱정하시지 않으셔도 됩니다. <br />⑥리조트
																중/석식을 추가로 포함해 가실 경우, 현지에서 안드셔도 환불이 안되므로 미리 돈을 지불하고 포함해
																가시는 것보다 현지에서 드신 후 체크아웃 시 룸차지로 계산하는 방식을 추천합니다.(현지 지불과 포함시
																비용 동일)<br />⑦선택관광을 추가로 포함해 가실 경우 현지사정에 맞게 투어가 이루어지다보니
																손님들께서 원하시는때에 진행이 불가 할 수 있습니다. 현지사정에 맞춰 투어일정이 조율되오니 이점
																사전에 양해 부탁드립니다.<br />⑧안전을 위해서 해양스포츠 중 발생할 수 있는 해양동.식물의
																상해를 막기위해 아쿠아슈즈(수상용 신발)를 준비하여 가시길 권하여 드립니다. 해양스포츠와 리조트
																수영장 관련된 안전사고는 이용자의 책임이며 안전수칙 및 주의를 당부드립니다.<br />⑨코타키나발루
																상품은 현지의 미팅/센딩 가이드와 각 선택관광별로 가이드들이 따로 있습니다. 따라서 일정이 유사한
																여러상품들이 현지에서 합류/조인 행사될 수 있으며 때로는 선택관광별로 가이드가 변경될 수 도
																있습니다. <br />⑩예약전 일정에 대한 유의사항<br />본 상품은 가이드가 동반하여 일정을
																함께하는기획여행(패키지)상품으로, 자유일정 이외에는 단체의 일정에 따라야 하며 불참시 패널티가 부과될
																수 있습니다.<br />만약, 따로 개별활동을 하실 의사가 있으신 분들은 반드시 에어텔상품 으로
																예약하셔야 합니다.<br />⑪호텔등급표기에 대한 공지 <br />국제적으로 공식적인 호텔등급을
																결정하는 기관은 없는 관계로, 현재 힐링투어 일정표 및 호텔정보에 기재되어 있는 호텔의 등급표기는
																현지 호텔측으로 부터 제공받은 것을 기준으로 작성된 것이며, 국제적인 기관에 의한 절대적인 평가기준이
																반영된 것이 아님을 양해바랍니다.<br />※여행일정은 계약체결시 예상하지 못한 부득이한 사정 등이
																발생하는 경우 사전협의를 거쳐 변경될 수 있음을 양지하시기 바랍니다. <br />
																<br />〈동물·축산물·식물검역 안내〉<br />☞ 대부분의 축산물(소세지, 육포 등) 및
																생과실, 열매채소 등은 휴대 반입할 수 없고, 휴대반입이 가능한 축산물과 식물류를 반입하는 여행객도
																농림축산검역본부에 신고하여 검역을 받아야 하며, 불법 반입하는 경우에는 500만원 이하의 과태료가
																부과됩니다.<br />☞ 해외 축산농장 또는 가축시장을 방문한 여행객과 가축전염병 발생 국가를
																방문한 축산 관계자는 농림축산검역본부에 신고하여 소독을 받아야 합니다.
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list16">
															<h4>질문과 답변</h4>
															<div class="reference_contents">
																<FONT face=돋움><STRONG>1. 전압 </STRONG>240V ( 한국
																	제품을 사용할 수 있으나, 콘센트 모양이 달라서 어댑터를 준비하시거나, 호텔 프론트에 요청하셔야
																	합니다.)<BR>
																<BR>
																<FONT face=돋움><IMG
																		src="http://img4info.modetour.com/old/dong/plug/bki.jpg"
																		width=160><BR></FONT><FONT face=돋움><STRONG>2.
																			한 객실에 싱글베드 세 개 또는 더블베드와 싱글베드를 넣어줄 수 있나요?<BR>
																	</STRONG>☞ 현재 동남아에서도 동일한 크기의 싱글베드가 세 개(또는 더블베드+싱글베드) 들어가는 호텔은 극히
																		드뭅니다. 코타키나발루 역시, 그러한 룸이 없습니다. 킹사이즈 침대(더블)나 싱글 두개(트윈)에
																		추가 침대를 원하실 경우 엑스트라베드(싱글 사이즈이며, 약간 더 낮은 바퀴침대)를
																		넣어드리고있습니다.<BR></FONT><FONT face=돋움><STRONG>3.
																			커넥팅룸 요청 <BR>
																	</STRONG>☞ 커넥팅룸은 미리 호텔측에 요청은 할 수 있지만, 거의 대부분 호텔쪽에서 확정을 주지 않습니다.
																		그래서, 도착 후 체크인 하실 때 100% 결정이 됩니다.<BR></FONT><FONT face=돋움><STRONG>4.
																			행사 인원은 몇 명인가요? 현지 가이드 연락처를 알려주세요.<BR>
																	</STRONG>☞ 현재 코타키나발루 상품은 현지 공항 미팅/센딩 가이드와 각 선택관광별로 가이드들이 따로
																		있습니다.(단독행사 팀은 제외)<BR>그래서 , &lt;사피섬과 시내관광이 포함된
																		분들&gt;과 &lt;자유여행으로 오셔서 별도로 선택관광을 하시는 분들&gt;이 서로 합류될 수
																		있습니다.<BR>또한, 현지에 통화를 원하실 시, 가이드 연락처보다는 아래 현지 연락처를
																		참고하시기 바랍니다. (현지 사정상 가이드 배정이 늦게되고, 자주 바뀌기 때문입니다.)<BR></FONT><FONT
																	face=돋움><STRONG>5. 식사 비용 관련<BR></STRONG>한국에서
																		호텔식(부페기준)을 포함해서 가실 경우<BR>☞ 수트라하버 : 중식 USD
																		30(카페볼레), 석식 USD 35<BR>☞ 샹그릴라 탄중아루/라사리아 : 중식 X,
																		석식 USD 35<BR>☞ 넥서스 : 중식 X, 석식 USD 30<BR>☞
																		노보텔 : 중식 X, 석식 USD 15<BR>이며, 현지에서 사드셔도 동일합니다.(단,
																		한국에서 결재 후, 안드셔도 환불이 안되므로, 가급적 현지에서 사드시는 것을 권장합니다.)<BR>또한,
																		포함된 상기 식사 외에, 각 호텔별로 특식(시푸드,바베큐등)을 권하거나, 별도로 더 드실 경우에는
																		상기 포함된 금액외에 추가금액이 발생하며, 체크아웃 하실 때 계산하시면 됩니다.<BR>
																	<FONT color=maroon>※ X된 경우 부페식당 운영이 없으며, 셋메뉴 혹은
																			다른 식당에서 주문하신 만큼 가격이 달라집니다.</FONT></FONT><BR>
																<FONT face=돋움><STRONG>6. 특급 호텔의 키즈클럽은
																			인터넷 여행정보를 참조하세요.<BR>
																	</STRONG>(입장료나 기타 이용비용은 호텔측에서 수시로 바꾸고 있어서, 정확히 말씀드리가 곤란합니다.)</FONT><BR></FONT>
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list17">
															<h4>최소출발인원규정</h4>
															<div class="reference_contents">
																☞ 패키지 여행은 단체 여행이기 때문에 출발일까지 최소 출발 인원이 채워지지 않는 경우 다른 날로
																상품을 변경하시거나 혹은 여행상품이 취소될 수 있습니다.<br />
																<h3>여행약관 제9조(최저행사인원 미 충족시 계약해제) 에 의거</h3>
																<br />
																<ol style='list-style-type: decimal;'>
																	<li>당사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행출발 7일전까지
																		여행자에게 통지하여야 합니다.</li>
																	<li>당사는 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는
																		경우 이미 지급 받은 계약금 환급 외에 다음 각 목의 1의 금액을 여행자에게 배상하여야 합니다.
																		<ol style='list-style-type: lower-roman;'>
																			<li>가. 여행개시 7일전까지 여행계약 해제 통지시 : 계약금 환급</li>n
																			<li>여행출발 1일전까지 통지시 : 여행요금의 30%</li>
																			<li>여행출발 당일 통지시 : 여행요금의 50%</li>
																		</ol>
																	</li>
																</ol>
															</div>
														</div>
													</li>
													<li>
														<div class="acc_contents" id="reference_list18">
															<h4>결제안내</h4>
															<div class="reference_contents">
																<strong>1. 결제방법</strong><br /> ※ '신용카드, 상품권, 상품권+신용카드,
																무통장입금(가상계좌), 힐링투어 결제계좌' 총 5가지 결제수단으로 결제하실수 있습니다. <br />
																① 신용카드 : 신용카드로 여행상품을 결제하고 차후에 신용카드사를 통해 카드대금이 청구되며, 국민,
																비씨, 우리 카드 결제는 선택한 카드사별 ISP결제로 진행이되며, 그외 카드사는 선택한 카드사별
																안심클릭 결제로 진행이 됩니다. 30만원이상 결제시 공인인증서 사용을 의무화 합니다.<br /> ②
																상품권 : ㈜힐링투어네트워크에서 발행한 힐링투어 여행상품권으로 온라인, 오프라인에서 힐링투어 및 전국
																힐링투어 대리점에서 사용 하실수 있습니다.<br /> ③ 신용카드+상품권 : 신용카드와 힐링투어
																여행상품권으로 복합결제를 하실수 있습니다.<br /> ④ 무통장입금(가상계좌) : 무통장 입금
																신청시 예약상품 기준으로 예약자에게 발급되는 가상계좌이며, 총 여행경비가 완불될때까지 발급받은 계좌로
																일정기간내에 여러차레 입금이 가능합니다.<br /> ⑤ 힐링투어 결제계좌 : 힐링투어네트워크
																전용계좌로, 별도의 결제창 없이 바로 힐링투어 결제계좌로 입금이 가능합니다.(아래 표에서 힐링투어
																결제계좌 정보를 확인하세요)
																<div class="table mt25">
																	<table>
																		<tfoot>
																			<tr>
																				<td class="txt_right" colspan="4">예금주 :
																					(주)힐링투어네트워크</td>
																			</tr>
																		</tfoot>
																		<thead>
																			<tr>
																				<th scope="col">은행명</th>
																				<th scope="col">계좌번호</th>
																				<th scope="col">은행명</th>
																				<th scope="col">계좌번호</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<th scope="col">신한은행</th>
																				<td class="txt_left">312-01-195126</td>
																				<th scope="col">신한은행</th>
																				<td class="txt_left">262-05-015956</td>
																			</tr>
																			<tr>
																				<th scope="col">국민은행</th>
																				<td class="txt_left">832-01-0268-385</td>
																				<th scope="col">외환은행</th>
																				<td class="txt_left">010-22-01322-6</td>
																			</tr>
																			<tr>
																				<th scope="col">기업은행</th>
																				<td class="txt_left">087-023700-04-012</td>
																				<th scope="col">우리은행</th>
																				<td class="txt_left">102-04-110851</td>
																			</tr>
																			<tr>
																				<th scope="col">농협</th>
																				<td class="txt_left">056-01-104843</td>
																				<th scope="col"></th>
																				<td></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<strong>2. 결제시 유의사항</strong><br /> ① 반드시 예약담당자에게 상담후
																결제를 진행하여 주시기 바랍니다. <br /> ② 인터넷상에서 결제취소 및 변경이 불가능하오니,
																결제취소나 변경을 원하시면 반드시 예약담당자에게 <br /> 연락하여 주시기바랍니다. <br />
																<strong>③ 여행대금의 모든 결제 수단은 힐링투어 법인 계좌 및 힐링투어
																	결제시스템을 이용하셔야 하며, 그 외의 결제방법을 이용하실 경우 법적 보호를 받으실 수 없습니다.</strong><br />
																④ 타사 상품권 결제 후 환불 요청시 환불 절차상 다소 시간이 걸릴 수 있사오니, 이점 양해해 주시기
																바랍니다.
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									<div id="detail_4" class="contents">
										<!--<div class="travel_qna" id="ProductQA"></div>-->
										<div class="safe-info">
											<div class="sub_tab">
												<ul>
													<li class="current"><a href="#safeInfo01"
														class="sub_link">여행금지제도의 법적근거 및 금지국가 현황</a></li>
													<li><a href="#safeInfo02" class="sub_link">여행지(국가/지역)
															여행경보 발령현황</a></li>
													<li class="right"><a href="#safeInfo03"
														class="sub_link">여행지 사건사고</a></li>
													<li><a href="#safeInfo04" class="sub_link">현지연락처</a></li>
													<li><a href="#safeInfo05" class="sub_link">해외여행자
															인터넷 등록제도</a></li>
													<li class="right"><a href="#travelNotice"
														class="sub_link not_list">여행지 공지사항</a></li>
												</ul>
											</div>
											<div class="sub_tabs_contents">
												<ul class="accordion">
													<li class="safe-info01"><a class="button current"
														href="#safeInfo01"> <img
															src="//img.modetour.co.kr/modetour/2014/itinerary/bg_txt_safeinfo01.png"
															alt="여행금지제도의 법적근거 및 금지국가 현황" /> <i class="arr"></i>
													</a>
														<div class="acc_contents" id="safeInfo01"
															style="display: block;">
															<h4>법적근거</h4>
															<dl>
																<dt>- 여권법 17조(여권의 사용제한 등)</dt>
																<dd>외교부장관은 천재지변·전쟁·내란·폭동·테러 등 대통령령으로 정하는 국외
																	위난상황(危難狀況)으로 인하여 국민의 생명·신체나 재산을 보호하기 위하여 국민이 특정 국가나 지역을
																	방문하거나 체류하는 것을 중지시키는 것이 필요하다고 인정하는 때에는 기간을 정하여 해당 국가나
																	지역에서의 여권의 사용을 제한하거나 방문·체류를 금지 (이하 "여권의 사용제한 등"이라 한다)할수
																	있다. 다만, 영주(永住), 취재·보도, 긴급한 인도적 사유, 공무 등 대통령령으로 정하는 목적의
																	여행으로서 외교부장관이 필요하다고 인정하면 여권의 사용과 방문·체류를 허가할 수 있다.</dd>
																<dt>- 여권법 제26조</dt>
																<dd>제17조제1항 본문 및 제2항에 따라 방문 및 체류가 금지된 국가나 지역으로 고시된
																	사정을 알면서도 같은 조 제1항 단서에 따른 허가(제14조제3항에 따라 준용되는 경우를 포함한다)를
																	받지 아니하고 해당 국가나 지역에서 여권 등을 사용하거나 해당 국가나 지역을 방문하거나 체류한
																	사람은 1년 이하의 징역 또는 1000만원 이하의 벌금에 처한다.</dd>
															</dl>
															<h4>금지국가 지정현황</h4>
															<p class="line-space">외교부는 우리 국민의 생명·안전을 보호하기 위하여 여권법
																제 17조에 따라 아래의 국가들은 지정된 기간 동안 여행금지국으로 지정하여 우리 국민들의 방문 및
																체류를 금지합니다.</p>
															<ul class="line-space">
																<li>- 이라크(2007년 8월 7일 ~ 2016년 1월31일까지)</li>
																<li>- 소말리아·아프가니스탄(2007년 8월 7일 ~ 2016년 2월 6일까지)</li>
																<li>- 예멘(2011년 6월 28일 ~ 2016년 1월 31일까지)</li>
																<li>- 시리아(2011년 8월 20일 ~ 2016년 1월 31일까지)</li>
																<li>- 리비아(2014년 8월 4일 ~ 2016년 2월 2일까지)</li>
															</ul>
															<p class="line-space">방문 및 체류가 금지된 국가나 지역으로 고시된 사정을
																알면서도 해당 국가나 지역에서 여권 등을 사용하거나 해당 국가나 지역을 방문하거나 체류한 사람은
																여권법 제 26조 제3호에 따라 1년 이하의 징역 또는 1000만원 이하의 벌금에 처해집니다.</p>
															<div class="unfold">
																<button type="button">
																	<span>접기</span>
																</button>
															</div>
														</div></li>
													<li class="safe-info02"><a class="button"
														href="#safeInfo02"> <img
															src="//img.modetour.co.kr/modetour/2014/itinerary/bg_txt_safeinfo02.png"
															alt="여행지(국가/지역) 여행경보 발령현황" /> <i class="arr"></i>
													</a>
														<div class="acc_contents" id="safeInfo02">
															<div class="travel-warning">
																<div
																	style="font-weight: bold; font-size: 18px; margin-top: 15px; margin-bottom: 5px;">■여행국가
																	: 말레이시아</div>
																&#x0D;<br />◆ 적색경보/철수권고(일부) : 사바 주 동부 도서, 해안 지역<br />&#x0D;
															</div>
															<div class="unfold">
																<button type="button">
																	<span>접기</span>
																</button>
															</div>
														</div></li>
													<li class="safe-info03"><a class="button"
														href="#safeInfo03"> <img
															src="//img.modetour.co.kr/modetour/2014/itinerary/bg_txt_safeinfo03.png"
															alt="여행지 사건사고" /> <i class="arr"></i>
													</a>
														<div class="acc_contents" id="safeInfo03">
															<div class="accident">
																<div
																	style="font-weight: bold; font-size: 18px; margin-top: 15px; margin-bottom: 5px;">■여행국가
																	: 말레이시아</div>
																<div>
																	<h3 class="tit marz">사건ㆍ사고 현황 (2014년)</h3>
																	ㅇ 범죄 피해 : 강도 11/ 절도 193/ 상해 1/ 안전사고 사망 3/ 단순 행방불명
																	6/교통사고 5/ 기타 2/ 소계 221건<br> ㅇ 범죄 가해 : 절도 1/ 사기 1/
																	출입국 관련 2/ 교통사고 1/ 불법체류 4 / 기타 1/ 소계 10건<br> ㅇ 행려
																	병자 : 1건<br> ㅇ 기타 : 16건<br>
																	&nbsp;&nbsp;&nbsp;&nbsp; - 총 248건<br> <br>

																	<h3 class="tit">사건ㆍ사고의 유형</h3>
																	[유형 1: 오토바이 날치기]<br> ㅇ 대로를 지나는 여성을 상대로 어깨에 메고 있는
																	핸드백을 채 달아나는 오토바이 날치기 사건이 자주 발생하고 있습니다. 이 오토바이 날치기범들은
																	작게는 2인조에서 많게는 20명씩 떼를 이루어 범행을 자행하고 있으며, 특히 대항 능력이 부족한
																	여성들을 주요 대상으로 하고 있습니다.<br> <br> ㅇ 일몰 후 시내 중심가나
																	한적한 곳에서 홀로 산책하거나 이동하는 것을 삼가시기 바랍니다. 특히 Jalan Sultan
																	Ismail과 Bukit Bintang, 차이나타운 인근 지역에서 피해사례가 매우 높습니다.<br>
																	<br> ㅇ 대로를 보행할 때에는 도로의 반대쪽, 즉 인도의 안쪽으로 통행하시고, 핸드백을
																	휴대하실 때에는 도로 반대쪽에 핸드백이 오도록 하는 것이 좋습니다.<br> <br>
																	ㅇ 피해를 당하는 순간 핸드백을 놓치지 않게 저항하거나 갑작스럽게 가방끈이 당겨짐으로 인해 넘어져
																	상해를 입거나 넘어진 후 뒤따라오던 통행차량에 의해 사고를 입는 경우도 있으므로 주의가 필요합니다.<br>
																	<br> [유형 2: 소매치기/절도]<br> ㅇ 쇼핑몰, 백화점 등의 푸드코트와
																	같이 개방되어 있는 장소에서 핸드백, 가방, 지갑, 노트북 등을 절도당하는 사례가 매우 많습니다.
																	이러한 장소에서 식사를 하거나 차를 마실 때 같은 테이블의 옆자리 의자 위에 소지품을 놓아두고
																	동행인과 이야기하는 틈을 타 순식간에 가방을 들고 도주하는 것입니다.<br> <br>
																	ㅇ 쇼핑객 등 통행인이 많고 출입구가 없는 개방된 장소에서는 핸드백 등을 옆자리에 두지 마시고 무릎
																	위에 두거나 여권, 지갑 등의 귀중품은 벨트 가방에 보관하시는 것이 좋습니다.<br> <br>
																	ㅇ 여권 복사본과 사진은 여권과는 별도로 휴대하는 것이 좋으며, 신용카드 번호와 여행자수표
																	일련번호를 기재해 두고 분실할 경우를 대비하여 긴급 연락처를 적어둡니다.<br> <br>
																	[유형 3: 사기도박]<br> ㅇ 혼자 여행하는 여행객에게 한국을 아주 잘 아는 체하거나
																	한국에 대해 관심이 많다면서 접근하여 본인 또는 가족이 곧 한국에 갈 예정이라면서 한국에 대해
																	이것저것 묻다가 자기 집에 가서 차나 식사를 대접한다고 유인한 후 데리고 간 집에서 사기도박에
																	빠지게 하여 소지하고 있던 현금은 물론 추가로 현금서비스를 받은 현지화까지 모두 잃게 하는 경우가
																	자주 발생하고 있습니다.<br> <br> ㅇ 낯선 자가 접근하여 한국에 대해
																	관심을 보이면서 이유 없이 친절을 베푸는 경우에는 매우 주의를 기울여 처신해야 하며, 이러한 경우
																	응대할 필요 없이 무시하면서 상황을 벗어나도록 하는 것이 좋습니다. 특히 KL 국제공항에서 출발한
																	기차가 도착하는 KL 센트럴역과 관광명소 중 하나인 KLCC(쌍둥이 빌딩) 인근 등 관광객이 많이
																	통행하는 곳에서 이러한 유인행위가 자주 보고되고 있으니 주의하시기 바랍니다. 또한 말레이시아에서의
																	도박행위는 법령에 의해 개설된 도박장을 제외하고는 내ㆍ외국인을 막론하고 불법이므로 어떠한 이유로도
																	가담하지 않아야 합니다.<br> <br> [유형 4: 무역 송금 사기]<br>
																	ㅇ Alibaba.com 등과 같은 온라인 오픈마켓을 통해 알게 된 무역상과 수출입거래 계약을 맺고
																	대금을 송금했으나 물품은 한국으로 송부되지 않고 현지 무역상(가명, 허위 여권번호, 허위 주소,
																	허위 사업자등록번호)은 전화 연락은 되나 끝내 찾을 수도, 변제받을 수도 없는 사례가 매우
																	흔합니다.<br> <br> ㅇ 온라인 오픈마켓 가입자가 비록 높은 등급을 갖고
																	있더라도 신용도를 등급 그대로 보장하는 것은 아니므로 주의가 요구되고, 국제 무역거래에 있어
																	일반적으로 확보되어 있는 거래 안전 제도를 적극 활용하는 것이 필요합니다.<br> <br>
																	ㅇ Western Union을 통해 대금 송금할 것을 요구할 경우는 특히 사기의 가능성이 높으므로
																	주의하시고, 송금 사기의 경우 일반 은행으로 송금하더라도 위조 신분증으로 개설한 계좌이거나 타인의
																	계좌를 차용하는 경우가 대부분이므로 범인을 찾아내기는 거의 불가능하다고 현지 경찰은 밝히고
																	있습니다.<br> <br> [유형 5:국제 송금 사기(로맨스 사기)]<br>
																	ㅇ 온라인 사교 사이트를 통해 알게 된 외국인 남성(주로 영국인)이 교제가 어느 정도 진행되고 나면
																	한국에 있는 여성에게 선물을 보냈다며 알려옵니다. 그러고 난후 난데없이 말레이시아 세관이라며 이메일
																	또는 전화가 여성에게 와서는 수화인이 당신으로 되어 있는 소포 안에 다액의 현금이 들어있다며,
																	말레이시아 정부는 이것이 국제 자금 세탁 또는 범죄와 관련된 현찰이 아닌가 의심된다는 내용을
																	전합니다. 그러면서 이를 원만하게 처리하기 위해서는 US $2,500을 말레이시아 세관으로 송금할
																	것을 요청하거나 또 다른 에이전트라며 연락이 와서는 자기가 이를 처리해 주겠다며 수수료와 에이전트
																	fee를 송금할 것을 요구해 옵니다.<br> <br> ㅇ이 때 송금은 주로
																	Western Union을 통해 이루어지는 경우가 많습니다. Western Union은 자사
																	홈페이지의 첫 화면에서도 알리는 바와 같이 모르는 사람에게 자사의 시스템을 통해 절대 송금을 하지
																	말 것을 고객들에게 요청하고 있습니다. 이는 송금할 때 생성되는 10자리의 MTCN 번호와 수취인
																	성명이 일치하면 대부분 송금된 돈을 청구인에게 지급하기 때문입니다. 일반은행으로 송금되었더라도
																	모르는 제삼자의 계좌를 차용하거나 위조 신분증으로 개설한 계좌를 사용하므로 추적이 곤란하다는 것이
																	현지 경찰의 설명입니다.<br> <br> ㅇ 세관 수수료 등을 일단 송금하고 나면
																	그 후에도 각종 명목으로 지속적으로 송금을 요구해 옵니다.<br> <br> ㅇ
																	범인과 계속 연락은 되나 이는 대부분 선불제 휴대전화로서 사용자 파악이 곤란할 뿐만 아니라
																	말레이시아는 아직 휴대전화 위치 추적 기술이 없어 소재 파악이 불가능하며, 범인이 알려준 자신의
																	신상은 모두 허위로서 신분확인 또한 불가능합니다. 범인이 인터넷을 접속한 IP는 커피점이나
																	레스토랑과 같이 wi fi를 제공하는 공공장소로 밝혀지고 있어 IP 추적을 통해 범인을 검거한
																	사례도 없다고 합니다. 이러한 이유들로 인해 말레이시아 경찰과 검찰은 이와 같은 범죄유형에 대해
																	수사 단서와 증거 부족으로 인해 처벌 사례가 거의 전무한 것으로 확인되고 있습니다.<br>
																	<br> ㅇ 결론적으로, 영국에서 발송한 소포가 한국으로 배송되면서 말레이시아 세관을
																	통과할 이유가 전혀 없고, 세관 또는 수화물 처리 대행업체의 계좌를 Western Union으로
																	사용할 리가 전혀 없으므로 이러한 사기행각에 휘말리지 않도록 주의하시기 바랍니다.<br>
																	<br> [유형 6 : 택시 강도]<br> ㅇ 택시를 타자 목적지와 다른 방향으로
																	주행하다가 인적이 드문 곳에서 흉기로 위협하면서 금품 강탈<br> <br> ㅇ
																	택시를 타자 주유소에 들러야 한다며 목적지와 다른 방향으로 가다가 범인 일행을 동승시킨 후 피해자를
																	흉기로 제압하여 금품 강탈<br> <br> ㅇ 택시강도에 의해 납치되었다가
																	풀려나는 경우도 발생<br> <br> ㅇ 이를 예방하기 위해서는,<br>
																	&nbsp;&nbsp;&nbsp;&nbsp; - 가급적 콜택시를 이용합니다.<br>
																	&nbsp;&nbsp;&nbsp;&nbsp; - 정차해 있는 택시나 서행하면서 따라오는 택시 이용은
																	삼갑니다.<br> &nbsp;&nbsp;&nbsp;&nbsp; - 유리창이 짙게 썬팅되어
																	있는 택시는 절대 타지 않습니다.<br> &nbsp;&nbsp;&nbsp;&nbsp; -
																	은행 앞에서의 택시 탑승은 특히 더 위험할 수 있습니다.<br>
																	&nbsp;&nbsp;&nbsp;&nbsp; - 기사가 친절을 베풀면서 음료를 제공할 경우 절대
																	마시지 않고 즉시 하차합니다.<br> <br>

																	<h3 class="tit">자연재해</h3>
																	ㅇ 말레이시아는 자연재해로부터 비교적 자유로운 편이지만 말레이반도의 동해안 지방은 10월~2월에
																	걸쳐 북동 몬순 기간으로 집중호우로 인한 피해가 발생하기도 합니다.<br> <br>

																	<h3>유의해야 할 지역</h3>
																	ㅇ 보르네오 섬인 동말레이시아의 사바주 동부 해안지역(Tawau, Semporna,
																	Sandakan, Kudat 등 포함)은 필리핀 남부지역의 정정 불안과 언론에 발표되지 않은 각종
																	납치기도 사건 등이 계속 발생하고 있습니다.<br> <br> ㅇ
																	2013.11.15(금), 새벽 1시경, 사바주 Semporna 연안의 Pom Pom Island
																	리조트에 무장괴한이 침입, 샬레에 투숙하고 있던 대만인 관광객 부부를 습격하여 남편(57세)은
																	침실에서 흉부에 총상을 입고 사망하였고, 부인(58세)은 납치당하는 사건이 발생하였으며,<br>
																	<br> ㅇ 사바주 동부 해안과 섬지역은 과거에도 이와 유사한 납치 사건이 여러 번
																	발생했었는데, 말레이시아 공안당국은 현재, 이러한 전례를 감안할 때 이번 사건 역시 필리핀 남부에서
																	활동 중인 무장반군단체 Abu Sayyaf가 몸값을 목적으로 자행한 소행으로 추정하고 있습니다.<br>
																	<br> ㅇ 또한, 사바주 동부 해안 Lahad Datu에 필리핀 술루족 무장단체가 무단
																	상륙하여 말레이시아 군경과 대치하다가 소탕된 사건 이후, 필리핀 남부해역 및 연안에 필리핀과
																	말레이시아 양측의 경비가 한층 강화되었으나, 필리핀 중부지역에 태풍 하이옌으로 인한 대규모 재난이
																	발생하자 필리핀 남부지역 군경이 대거 중부지역으로 이동, 재난 복구활동에 투입됨에 따라 필리핀
																	남부해역의 경비 공백이 불가피할 것이라는 분석이 나오고 있습니다.<br> <br>
																	ㅇ 이를 감안할 때, 이번 사건과 같은 외국인 관광객 살해 및 납치 사건의 재발 가능성을 배제할 수
																	없어 현재 여행유의 지역으로 여행경보가 설정되어 있던 사바주 동부 해안 및 도서지역에 대해 지역을
																	세분화하여 상향 조정되었으니 교민 및 관광객 여러분께서는 이점 양지하시어 신변안전에 유의하여 주시기
																	바랍니다.<br> <br> [여행경보 조정전]<br> ㅇ 사바주 동부
																	해안 및 도서지역 : 1단계 - 여행유의<br> <br> [여행경보 조정후]<br>
																	ㅇ 사바주 동부 해안지역 : 2단계 - 여행 자제 (신변안전 특별유의/ 여행 필요성 신중 검토)<br>
																	ㅇ 사바주 동부 도서지역 : 3단계 - 철수 권고 (긴급용무가 아닌 한 귀국/ 가급적 취소, 연기)<br>
																</div>
															</div>
															<div class="unfold">
																<button type="button">
																	<span>접기</span>
																</button>
															</div>
														</div></li>
													<li class="safe-info04"><a class="button"
														href="#safeInfo04"> <img
															src="//img.modetour.co.kr/modetour/2014/itinerary/bg_txt_safeinfo04.png"
															alt="현지연락처" /> <i class="arr"></i>
													</a>
														<div class="acc_contents" id="safeInfo04">
															<div class="tellphone">
																<div
																	style="font-weight: bold; font-size: 18px; margin-top: 15px; margin-bottom: 5px;">■여행국가
																	: 말레이시아</div>
																<br />긴급 연락처ㅇ 경찰/화재/구급 : 999 <br /> <br /> <br />관광통역
																서비스ㅇ KL 관광경찰 <br /> - 본부: 03-2149-6590 <br /> - 신고:
																03-2163-4422 <br />ㅇ 관광통역 서비스 기관은 없습니다. <br /> <br />
																<br />의료기관 연락처□ 의료기관(응급) <br />ㅇ 우리나라 개업의 형태의 Clinic이
																있고, 정부에서 운영하는 Kuala Lumpurl Hospital과 사설 종합병원이 있습니다.
																대부분의 병원에서 영어 소통이 어느 정도 가능합니다. <br /> - Kuala Lumpur
																Hospital: 03-2615-6705 <br /> - UM Hospital:
																03-7949-2151 <br /> - Gleneagles: 03-4141-3180 <br />
																- Ampang Puteri: 03-4270-7060 <br /> - Putrajaya:
																03-8312-4261 <br /> <br />ㅇ 정부에서 운영하는 Kuala Lumpur
																Hospital의 경우 비교적 비용이 저렴하나, 사설 종합병원의 경우에는 의료 서비스가 정부 운영
																병원에 비행 양호한 반면 비용이 훨씬 비싼 편입니다. 우리나라와 마찬가지로 전문의약품의 경우 의사의
																처방전이 필요합니다. <br /> - 999로 신고하여 구급차 이용 시 국공립병원으로만 후송
																가능하므로 응급상황에서 사설 병원 이용 희망 시 해당 의료기관에 전화하여 구급차를 요청해야 하므로
																생활근거지 인근에 있는 대형병원의 연락처를 사전에 파악해 둘 필요가 있습니다. <br /> <br />
																<br />대사관 연락처ㅇ 주소: 9&amp;11 Jalan Nipah, Off Jalan
																Ampang, 55000 Kuala Lumpur, Malaysia <br />ㅇ 홈페이지:
																http://mys.mofa.go.kr <br />ㅇ 대표 이메일:
																korem-my@mofa.go.kr <br />ㅇ 대표전화: 60-3-4251-2336/4904 <br />ㅇ
																팩스 <br /> 60-3-4251-2336(대표) <br />
																60-16-381-9940(영사핫라인) <br /> 60-3-4251-9066(영사과) <br />
																<br />ㅇ 민원실 근무시간 <br /> 오전접수: 08:30~12:00 <br />
																오후접수: 13:30~17:00 <br /> <br /> <br />영사협력원 연락처ㅇ 조호바루
																<br /> - 성명 : 김연진 <br /> - 전화 : 012-733-7661 <br /> <br />ㅇ
																페낭 <br /> - 성명 : 조준연 <br /> - 전화 : 012-429 0747 <br />
																<br />ㅇ 코타키나발루 <br /> - 성명 : 이태훈 <br /> - 전화 :
																019-821 2521 <br /> <br />ㅇ 쿠칭 <br /> - 성명 : 김형근 <br />
																- 전화 : 012-858-3370 <br />
															</div>
															<div class="unfold">
																<button type="button">
																	<span>접기</span>
																</button>
															</div>
														</div></li>
													<li class="safe-info05 last-child"><a class="button"
														href="#safeInfo05"> <img
															src="//img.modetour.co.kr/modetour/2014/itinerary/bg_txt_safeinfo05.png"
															alt="해외여행자 인터넷 등록제도" /> <i class="arr"></i>
													</a>
														<div class="acc_contents" id="safeInfo05">
															<div>
																<p class="line-space">해외여행 등록제 '동행' 에 가입하시면 목적지의
																	안전정보, 여행객의 안전정보, 해외여행 중 사고에 대해 가족에게 사고사실 전달이 가능합니다.</p>
																<h4>동행 이용방법</h4>
																<ul class="line-space">
																	<li>- 해외여행자가 해외안전여행홈페이지에 신상정보·국내비상연락처·현지연락처·일정 등을
																		등록</li>
																	<li>- 등록된 여행자에게 방문지의 안전정보를 메일로 발송하는 맞춤형 해외여행안전정보제공</li>
																	<li>- 등록된 여행자가 사건·사고에 처했을 때 비상연락처·소재지 등 파악을 용이하게
																		하여 보다 효율적 영사 조력 제공 가능</li>
																</ul>
																<h4>인터넷 등록시 제공되는 세 가지 혜택</h4>
																<ol class="line-space">
																	<li>1. 인터넷등록과 동시에 목적지의 안전정보를 이메일을 통해 받아볼 수 있습니다.
																		이와 함께 수시로 업데이트되는 목적지의 치안상황이나 자연재해 가능성 등의 안전공지 역시 이메일을
																		통해 확인할 수 있습니다.</li>
																	<li>2. 해외에서 대규모 재난· 재해가 발생하여 우리 여행객의 안전을 확인해야하는
																		경우, 미리 등록한 여행정보와 현지 연락처를 바탕으로 소재파악을 할 수 있습니다.</li>
																	<li>3. 해외 여행 중 불의 의 사고를 당하여 가족에게 사고사실을 알려야 하는 경우,
																		재외공관(대사관)에서 미리 등록한 비상연락처를 바탕으로 신속하게 연락을 취할 수 있습니다.</li>
																</ol>
																<h4>회원가입을 위한 동행 사이트 접속방법</h4>
																<p>
																	<a class="link" href="http://www.0404.go.kr/"
																		target="_blank" title="새창">www.0404.go.kr</a> 접속 -&gt;
																	동행 -&gt; 동행소개 -&gt; 회원가입
																</p>
															</div>
															<div class="unfold">
																<button type="button">
																	<span>접기</span>
																</button>
															</div>
														</div></li>
												</ul>
												<div id="travelNotice">
													<h3>
														<img
															src="//img.modetour.co.kr/modetour/2014/itinerary/tit_travel_notice.png"
															alt="여행지 공지사항" />
													</h3>
													<div class="bbs_wrap">
														<div class="notice_header">
															<div class="title">제목</div>
															<div class="date">등록일</div>
														</div>
														<div class="notice_list">
															<ul>
																<script type="text/x-jquery-tmpl" id="tmptravelNotice">
                                                            <li>
																<a href="#">
																	<span class="title">${Title}</span><span class="date">${WrtDT}</span>
																</a>
																<div class="read">
                                                                    {{html String(Content)}}
																</div>
															</li>
                                                            </script>
															</ul>
														</div>
														<div class="pager"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tabs_pager">
									<button class="prev">
										<i></i><span>이전<b>여행상품문의</b></span>
									</button>
									<button class="next">
										<i></i><span>다음<b>핵심정보</b></span>
									</button>
								</div>
							</div>
							<div id="travelReview" class="postscript">
								<h3>
									<img
										src="http://img.modetour.co.kr/modetour/2014/itinerary/hn_postscript.png"
										alt="여행후기" />
								</h3>
								<div class="etc_links">
									<a href="#top"
										onclick="Itinerary_Popup('/w3c/TravelAgreementOverseas1.aspx', '', 'width=780px,height=783px'); return false;"
										class="tour_terms"><span class="blind">여행약관</span></a> <a
										href="#" class="tour_homepage"><span class="blind">해외안전
											여행 홈페이지</span></a>
								</div>
								<!--
							<div class="outline">
								<div class="tour_eval">
									<h4><img src="http://img.modetour.co.kr/modetour/2014/itinerary/txt_exam_mark.png" alt="여행평점 - 이지역을 다녀온 고객님들의 평점입니다." /></h4>
									<div class="clearfix">
										<div class="caption">총 등록건수<b id="b_review_count">(1건)</b></div>
										<div class="graph">
											<div id="div_review_avg" class="eval marks_1">
												<b>1</b>/5점
											</div>
										</div>
									</div>
								</div>
								<div class="tour_popluar">
									<h4><img src="http://img.modetour.co.kr/modetour/2014/itinerary/txt_popluar.png" alt="여행인기도 - 연령대별 인기상품입니다." /></h4>
									<div class="caption">
										<img img src="http://img.modetour.co.kr/modetour/2014/itinerary/ico_popluar_male.png" alt="남성(파란색)" />
										<img img src="http://img.modetour.co.kr/modetour/2014/itinerary/ico_popluar_female.png" alt="여성(핑크색)" />
									</div>
									<div class="graph">
										<div class="age">
											<div class="clearfix">
												<div class="m" style="height:0%"></div>
												<div class="w" style="height:0%"></div>
											</div>
											<div class="label">10대</div>
										</div>
										<div class="age">
											<div class="clearfix">
												<div class="m" style="height:0%;"></div>
												<div class="w" style="height:0%;"></div>
											</div>
											<div class="label">20대</div>
										</div>
										<div class="age">
											<div class="clearfix">
												<div class="m" style="height:0%;"></div>
												<div class="w" style="height:0%;"></div>
											</div>
											<div class="label">30대</div>
										</div>
										<div class="age">
											<div class="clearfix">
												<div class="m" style="height:0%;"></div>
												<div class="w" style="height:0%;"></div>
											</div>
											<div class="label">40대</div>
										</div>
										<div class="age">
											<div class="clearfix">
												<div class="m" style="height:0%;"></div>
												<div class="w" style="height:0%;"></div>
											</div>
											<div class="label">50대</div>
										</div>
										<div class="age">
											<div class="clearfix">
												<div class="m" style="height:0%;"></div>
												<div class="w" style="height:0%;"></div>
											</div>
											<div class="label">60대</div>
										</div>
									</div>
								</div>
							</div>
                            -->
								<div class="board_contain" id="ProductPreview"></div>
							</div>

						</div>

						<!-- 우측 메뉴 -->

						<%-- <div id="aside" class="aside">
							<div id="totalPrice">
								<div class="title">성인 1인 가격</div>
								<div class="contents">
									<div class="price_info">
										<p class="total_price">
											<span class="num">779,000</span>원
										</p>
										<ul>
											<li id="aside_ess"><span class="th">현지필수경비</span><span
												class="td">없음</span></li>

										</ul>
										<p class="">
											<a href="#cost_price">+ 상품가격 자세히보기</a>
										</p>
									</div>
									<div class="tourmileage_wrap">
										<p class="txt_tourmileage">
											투어마일리지 <b>7,260</b> 마일 적립예정 <a href="#tourmileage_guide"
												class="balloon_layer"><i></i><span class="blind">투어마일리지
													안내</span></a>
										</p>
										<div class="balloon_layer_wrap" id="tourmileage_guide">
											<i class="i_arr"></i>
											<div class="container">
												<div class="conts">
													여행 출발 전까지 모두멤버스 가입 후 <br />예약담당자에게 적립요청 필수<br />(출발 후 가입
													시 적립 불가능) <br />-2013년 7월 2일 이전 홈페이지 가입자는<br />모두멤버스 약관
													추가 동의 필요<br />(로그인 후 동의)
												</div>
											</div>
										</div>
									</div>

									<!--
								<p class="price"><span class="num"></span>원</p>
								<p class="txt_tourmileage">투어마일리지 <b>7,260</b> 마일 적립예정 <a href="#tourmileage_guide" class="balloon_layer"><i></i><span class="blind">투어마일리지 안내</span></a></p>
								<p><a href="#cost_price">+ 상품가격 자세히보기</a></p>
                                <div class="balloon_layer_wrap" id="tourmileage_guide">
									<i class="i_arr"></i>
									<div class="container">
										<div class="conts">
											여행 출발 전까지 모두멤버스 가입 후 <br />예약담당자에게 적립요청 필수<br />(출발 후 가입 시 적립 불가능) <br />-2013년 7월 2일 이전 홈페이지 가입자는<br />모두멤버스 약관 추가 동의 필요<br />(로그인 후 동의)
										</div>
									</div>
								</div>
                                <p>비즈니스추가요금 </p>
                                -->
								</div>
							</div>
							<div id="product_info">
								<div class="title">상품정보 바로보기</div>
								<div class="contents">
									<div class="selectbox">
										<p>
											<select id="selectDay" title="여행일자 선택">
												<option value="">여행일자 바로보기</option>

												<option value="0">1일차</option>

												<option value="1">2일차</option>

												<option value="2">3일차</option>

												<option value="3">4일차</option>

											</select>
										</p>
										<p>
											<select id="selectTripInfo" title="관광정보 선택">
												<option value="">관광정보 바로보기</option>
												<option value="0">방문지정보</option>
												<option value="1">선택관광정보</option>
												<option value="2">호텔정보</option>
												<option value="4">골프장정보</option>
											</select>
										</p>
										<div class="quick_move">
											<a class="btn_quick" href="#privilege"><span
												class="blind">특징 및 특전</span></a> <a class="btn_print"
												onclick="PopupBriefing(); return false;"><span
												class="blind">여행설명회 보기</span></a>
										</div>
									</div>
									<div class="share">
										<ul>
											<li class="sns"><a href="#share01" title="SNS 공유"
												class="btn_sns"> <i></i> <span>SNS 공유</span>
											</a></li>
											<li class="link"><a href="#share02"
												onclick="smallUrl('O'); return false;" title="단축 URL"
												class="btn_link"> <i></i> <span>URL</span>
											</a></li>
											<li class="wish"><a class="btn_wish" href="#top"
												onclick="Tozzim('29068116','D'); return false;" title="찜 하기">

													<i></i> <span>찜하기</span>
											</a></li>
											<li class="email"><a class="btn_email" href="#top"
												title="메일 보내기"
												onclick="Itinerary_Popup('/Popup/Package/Itinerary/Mail_Input.aspx?Pnum=29068116&URL=www.modetour.com&Inum=0&Sno=&Ano=&MLoc=01', '', 'width=770px,height=590px'); return false;">
													<i></i> <span>메일</span>
											</a></li>
										</ul>
										<div class="layer_wrap">
											<div id="share01" class="share_layer sns">
												<div class="body">
													<div class="conts">
														<p>
															<a href="#top"
																onclick="goFaceBook('[365일 초특가]아시아나 타고 가는 초특가 동경 4일 ! 도미인 아키하바라 * 대욕장 포함상품 *', 'http://www.modetour.com/Package/Itinerary.aspx?MLoc=01&Pnum=29068116'); return false;"
																class="facebook" target="_blank" title="페이스북 보내기">페이스북</a>
														</p>
														<p>
															<a href="#top"
																onclick="goTwitter('[365일 초특가]아시아나 타고 가는 초특가 동경 4일 ! 도미인 아키하바라 * 대욕장 포함상품 *', 'http://www.modetour.com/Package/Itinerary.aspx?MLoc=01&Pnum=29068116'); return false;"
																class="twt" target="_blank" title="트윗하기">트위터</a>
														</p>
														<button type="button" class="btn_close_share">
															<span class="blind">닫기</span>
														</button>
													</div>
												</div>
											</div>
											<div class="share_layer link" id="share02">
												<div class="body">
													<div class="conts">
														<p>
															상품 단축 링크를 직접 복사하여<br>사용 가능합니다.
														</p>
														<input id="smallUrl" title="주소를 복사하시려면 Ctrl+C를 눌러 주세요."
															class="url" type="text" readonly="readonly" value="">
														<button class="btn_close_share" type="button">
															<span class="blind">닫기</span>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="func">
										<a href="#" class="wish"
											onclick="PopupBriefing(); return false;"><span
											class="blind">인쇄</span></a> <a class="booking_qna mode-layer"
											href="${root}/order/write.do?pNum=${productDto.product_number}&fNum=${flightDto.flight_number}"
											><span class="blind">예약문의</span></a>
									</div>
									<div class="helpdesk">
										<p>힐링투어 예약센터</p>
										<p class="call">1544-5252</p>
									</div>
								</div>
							</div>
							<div id="groupMeeting" style="display: none;">
								<div class="title">
									<span>단체상품</span> <span id="customCaption"
										class="custom-caption"></span>
								</div>
								<div class="contents">
									<a class="gm_prev" id="gmPrev" href="#"><span class="blind">이전</span></a>
									<a class="gm_next" id="gmNext" href="#"><span class="blind">다음</span></a>
									<ul class="cycle-slideshow" data-cycle-fx="scrollHorz"
										data-cycle-timeout="0" data-cycle-slides="> li"
										data-cycle-caption="#customCaption"
										data-cycle-caption-template="<strong>{{slideNum}}</strong> / {{slideCount}}"
										data-cycle-pause-on-hover="true" data-cycle-prev="#gmPrev"
										data-cycle-next="#gmNext" data-cycle-allow-wrap="false">
										<script type="text/x-jquery-tmpl" id="tmpIncentiveGroup">
                                    <li>
										<div class="group_proc">
											
                                            <a class="link" href="/Package/Itinerary.aspx?MLoc=01&Pnum=${Pnum}&Sno=&Ano=" target="_blank">
												<span class="bg_circle">
													<span>
														<span>단체예약</span>
														<span class="person">${BookingNum}명</span>
													</span>
												</span>
												<span class="text_info">
													<span>성인 1인 가격</span>
													<strong><span>${SAdult.currentFormat()}</span>원</strong>
												</span>
											</a>
										</div>
									</li>
                                    </script>
									</ul>
								</div>
							</div>
						</div> --%>
						<!-- 우측메뉴 -->


					</div>
				</div>
			</div>
			<!-- 여행일정표 -->

			<input type="hidden" id="PossibleReservationDate" value='' />
			<div id="LayerPopupWrap"></div>


			<div id="InsuranceManager" style="display: none;">
				※ 여행자보험 담당 : [동부화재] 원부미(보험관련문의만가능) <br /> Tel)02-728-8006
				Fax)02-2021-7800 <br />- 단 15세 미만의 사망보험금 및 만 79세 6개월 이상의 질병사망에 대해서는
				보험 약관에 따라 보험금이 지급되지 않습니다. <br />- 자세한 세부사항은 홈페이지 하단 여행보험을 참조 바랍니다.
			</div>
		</div>

		<form id="N_Form" name="N_Form" method="get"
			action="/booking/Package/booking.aspx">
<!-- 			<input type="submit" class="hideSubmitBtn" />  -->
			<input type="hidden"
				name="MLoc" value='01' /> <input type="hidden" name="NoMember"
				value='' /> <input type="hidden" id="Pnum" name="Pnum"
				value='27372215' /> <input type="hidden" name="Inum" value='0' />
			<input type="hidden" name="Idx" value='0' /> <input type="hidden"
				name="Memid" value="" /> <input type="hidden" id="Sno" name="Sno"
				value="" /> <input type="hidden" id="Ano" name="Ano" value="" /> <input
				type="hidden" id="Param_Pcode" value="AMP700" /> <input
				type="hidden" id="Param_MeetCode" value="33" />
			<!-- Mc -->
			<input type="hidden" id="Param_MeetTime" value="2015년 12월 12일 17:00" />
			<!-- Mt -->
			<input type="hidden" id="Param_MeetPlace"
				value="인천국제공항 3층 출국장 F와G 카운터 사이 중앙엘리베이터 옆 힐링투어 1번~8번 전용테이블 앞" />
			<!-- Mp -->
			<input type="hidden" id="Param_MeetPlace2" value="" />
			<!-- Mp2 -->
			<input type="hidden" id="Param_Pname"
				value="[다다익선/아동반값]코타 키나발루 수트라하버 마젤란(초특급/가든뷰) 5일" /> <input
				type="hidden" id="Param_Prefix" value="" /> <input type="hidden"
				id="Param_Grade" value="" /> <input type="hidden" id="Param_State"
				value="NNNNNNN" /> <input type="hidden" id="Param_GuideWith"
				value="N" /> <input type="hidden" id="Param_URL"
				value="www.modetour.com" /> <input type="hidden" id="Param_Area"
				value="01" />
			<!-- [2010.11.09 김민경 -  설명회 팝업 관련] -->
			<input type="hidden" id="Param_View" value="" /> <input
				type="hidden" id="Param_SelView" value="" /> <input type="hidden"
				id="Param_Hotel" value="" /> <input type="hidden" id="Param_Golf"
				value="" /> <input type="hidden" id="Param_Tour" value="" /> <input
				type="hidden" id="Param_Option" value="" /> <input type="hidden"
				id="Param_City" value="" /> <input type="hidden" id="Param_TourAll"
				value="" /> <input type="hidden" id="Param_OptionAll" value="" />
			<input type="hidden" id="Param_BF" value="" /> <input type="hidden"
				id="odMaxDate" name="odMaxDate" value="" /> <input type="hidden"
				id="odMinDate" name="odMinDate" value="" />
			<!-- 2014.07.04 천승희 핵심정보 용 -->
			<input type="hidden" id="Param_PII_ProductKind" value="N" /> <input
				type="hidden" id="Param_PII_EssentialCurrency" value="$" /> <input
				type="hidden" id="Param_PII_EssentialExpense" value="30" /> <input
				type="hidden" id="Param_PII_ChildEssentialExpense" value="30" /> <input
				type="hidden" id="Param_PII_InfantEssentialExpense" value="0" /> <input
				type="hidden" id="Param_PII_TravelClause" value="N" /> <input
				type="hidden" id="Param_PII_DepartureDecide" value="N" /> <input
				type="hidden" id="Param_PII_ScheduleDecide" value="N" /> <input
				type="hidden" id="Param_PII_PriceDecide" value="N" /> <input
				type="hidden" id="Param_PII_AirDecide" value="N" /> <input
				type="hidden" id="Param_PII_LodgeDecide" value="N" /> <input
				type="hidden" id="Param_PII_GuideDecide" value="N" /> <input
				type="hidden" id="Param_PII_ConductorDecide" value="N" />
		</form>

		<script type="text/javascript">
			// 일정표 타이틀
			//         window.document.title = "\"상품코드 AMP700OZM1 출발일 2015년 12월 12일\" 일정표 - " + document.title;

			//  스크립트, css 파일등의 버전
			var _SourceVer = "20151209";

			var PlaceMapImg = new Array();

			// 상품대표 이미지 (확대보기용)
			var ItineraryImg = new Array();
			var ItineraryImgName = new Array();
			ItineraryImg[0] = "http://img.modetour.co.kr/eagle/photoimg/26633/sfile/20.jpg";
			ItineraryImgName[0] = "20.jpg";
			ItineraryImg[1] = "http://img.modetour.co.kr/eagle/photoimg/31033/sfile/1.jpg";
			ItineraryImgName[1] = "1.jpg";
			ItineraryImg[2] = "http://img.modetour.co.kr/eagle/photoimg/26633/sfile/21.jpg";
			ItineraryImgName[2] = "21.jpg";
			ItineraryImg[3] = "http://img.modetour.co.kr/eagle/photoimg/31033/sfile/15.jpg";
			ItineraryImgName[3] = "15.jpg";
			ItineraryImg[4] = "http://img.modetour.co.kr/eagle/photoimg/26633/sfile/22.jpg";
			ItineraryImgName[4] = "22.jpg";
			ItineraryImg[5] = "http://img.modetour.co.kr/eagle/photoimg/26633/sfile/24.jpg";
			ItineraryImgName[5] = "24.jpg";
			ItineraryImg[6] = "http://img.modetour.co.kr/eagle/photoimg/31033/sfile/IMG_2715.JPG";
			ItineraryImgName[6] = "이슬람사원";
			ItineraryImg[7] = "http://img.modetour.co.kr/eagle/photoimg/26633/sfile/25.jpg";
			ItineraryImgName[7] = "25.jpg";
			ItineraryImg[8] = "http://img.modetour.co.kr/eagle/photoimg/26633/sfile/26.jpg";
			ItineraryImgName[8] = "26.jpg";
			ItineraryImg[9] = "http://img.modetour.co.kr/eagle/photoimg/26633/sfile/27.jpg";
			ItineraryImgName[9] = "27.jpg";
			ItineraryImg[10] = "http://img.modetour.co.kr/eagle/photoimg/26633/sfile/28.jpg";
			ItineraryImgName[10] = "28.jpg";
			ItineraryImg[11] = "http://img.modetour.co.kr/eagle/photoimg/31033/sfile/IMG_2682.JPG";
			ItineraryImgName[11] = "정부청사";
			ItineraryImg[12] = "http://img.modetour.co.kr/eagle/photoimg/26633/sfile/29.jpg";
			ItineraryImgName[12] = "29.jpg";
			ItineraryImg[13] = "http://img.modetour.co.kr/eagle/photoimg/31033/sfile/IMG_5712.JPG";
			ItineraryImgName[13] = "IMG_5712.JPG";
			ItineraryImg[14] = "http://img.modetour.co.kr/eagle/photoimg/31033/sfile/IMG_5757.JPG";
			ItineraryImgName[14] = "IMG_5757.JPG";
			ItineraryImg[15] = "http://img.modetour.co.kr/eagle/photoimg/31033/sfile/IMG_5727.JPG";
			ItineraryImgName[15] = "IMG_5727.JPG";
			ItineraryImg[16] = "http://img.modetour.co.kr/eagle/photoimg/47634/sfile/28.jpg";
			ItineraryImgName[16] = "28.jpg";
			ItineraryImg[17] = "http://img.modetour.co.kr/eagle/photoimg/47634/sfile/21.jpg";
			ItineraryImgName[17] = "21.jpg";
			ItineraryImg[18] = "http://img.modetour.co.kr/eagle/photoimg/47634/sfile/25.jpg";
			ItineraryImgName[18] = "25.jpg";
			ItineraryImg[19] = "http://img.modetour.co.kr/eagle/photoimg/47634/sfile/26.jpg";
			ItineraryImgName[19] = "26.jpg";
			ItineraryImg[20] = "http://img.modetour.co.kr/eagle/photoimg/47634/sfile/27.JPG";
			ItineraryImgName[20] = "27.JPG";
			ItineraryImg[21] = "http://img.modetour.co.kr/eagle/photoimg/1275/sfile/IMG_0961.JPG";
			ItineraryImgName[21] = "코타키나발루 선셋";
			ItineraryImg[22] = "http://img.modetour.co.kr/eagle/photoimg/1275/sfile/IMG_1334.JPG";
			ItineraryImgName[22] = "맹글로브 투어";
			ItineraryImg[23] = "http://img.modetour.co.kr/eagle/photoimg/1275/sfile/IMG_2485.JPG";
			ItineraryImgName[23] = "키나발루산 현지시장";
			ItineraryImg[24] = "http://img.modetour.co.kr/eagle/photoimg/1275/sfile/IMG_2683.JPG";
			ItineraryImgName[24] = "사바주청사";
			ItineraryImg[25] = "http://img.modetour.co.kr/eagle/photoimg/1275/sfile/IMG_2723.JPG";
			ItineraryImgName[25] = "이슬람사원";
			ItineraryImg[26] = "http://img.modetour.co.kr/eagle/photoimg/1275/sfile/IMG_2224.JPG";
			ItineraryImgName[26] = "스노쿨링";
			ItineraryImg[27] = "http://img.modetour.co.kr/eagle/photoimg/1275/sfile/IMG_1971.JPG";
			ItineraryImgName[27] = "래프팅";
			ItineraryImg[28] = "http://img.modetour.co.kr/eagle/photoimg/1275/sfile/635116574873343323.jpg";
			ItineraryImgName[28] = "635116574873343323.jpg";
			ItineraryImg[29] = "http://img.modetour.co.kr/eagle/photoimg/1275/sfile/635259839540734845.jpg";
			ItineraryImgName[29] = "635259839540734845.jpg";
			ItineraryImg[30] = "http://img.modetour.co.kr/eagle/photoimg/26090/sfile/Sutera Harbour Resort.jpg";
			ItineraryImgName[30] = "Sutera Harbour Resort";
			ItineraryImg[31] = "http://img.modetour.co.kr/eagle/photoimg/26090/sfile/TMS Deluxe Sea View.jpg";
			ItineraryImgName[31] = "TMS Deluxe Sea View";
			ItineraryImg[32] = "http://img.modetour.co.kr/eagle/photoimg/26090/sfile/SHMGCC Berth View.jpg";
			ItineraryImgName[32] = "SHMGCC Berth View";
			ItineraryImg[33] = "http://img.modetour.co.kr/eagle/photoimg/26090/sfile/Five Sails.JPG";
			ItineraryImgName[33] = "Five Sails";
			ItineraryImg[34] = "http://img.modetour.co.kr/eagle/photoimg/26090/sfile/map_sabah.gif";
			ItineraryImgName[34] = "map_sabah";
			ItineraryImg[35] = "http://img.modetour.co.kr/eagle/photoimg/26090/sfile/20060513170339266.jpg";
			ItineraryImgName[35] = "퍼시픽수영장-이브닝2";
			ItineraryImg[36] = "http://img.modetour.co.kr/eagle/photoimg/26090/sfile/20060513170340895.jpg";
			ItineraryImgName[36] = "슈트라하버-마젤란윙(야경2)";
			ItineraryImg[37] = "http://img.modetour.co.kr/eagle/photoimg/26090/sfile/Golf View Hole 24.jpg";
			ItineraryImgName[37] = "Golf View Hole 24";
			ItineraryImg[38] = "http://img.modetour.co.kr/eagle/photoimg/26090/sfile/Al Fresco.jpg";
			ItineraryImgName[38] = "Al Fresco";

			// 상품대표 동영상 (확대보기용)
			var ItineraryVideo = "";

			// 환율 데이터
			ExchageArr[0] = "USD|미국|달러|1|1198.61|1.00";
			// 날씨 데이터
			WeatherArr[0] = [
					[ "1275", "Kota Kinabalu", "2015-12-10(木)", "27.1", "32.7",
							"천둥번개", "39" ],
					[ "1275", "Kota Kinabalu", "2015-12-11(金)", "26.1", "32.6",
							"천둥번개", "39" ],
					[ "1275", "Kota Kinabalu", "2015-12-12(土)", "25.6", "32.1",
							"천둥번개", "39" ],
					[ "1275", "Kota Kinabalu", "2015-12-13(日)", "25.5", "32.0",
							"천둥번개", "39" ],
					[ "1275", "Kota Kinabalu", "2015-12-14(月)", "25.2", "32.0",
							"천둥번개", "39" ],
					[ "1275", "Kota Kinabalu", "2015-12-15(火)", "24.2", "32.3",
							"흐리고 비", "10" ] ];
			// 시간 데이터
			ParallaxArr[0] = "1275|-1:0";

			// PLACE 정보 데이터
			var PlaceSelected = new Array();
			PlaceSelected[0] = "";
			PlaceSelected[1] = "";
			PlaceSelected[2] = "";
			PlaceSelected[3] = "";
			PlaceSelected[4] = "";
			PlaceSelected[5] = "";
			PlaceSelected[1] += "^1=26633:※수트라하버 부대시설 이용 안내※";
			PlaceSelected[5] += "^1=26633:※수트라하버 부대시설 이용 안내※";
			PlaceSelected[1] += "^4=31033:시티투어";
			PlaceSelected[5] += "^4=31033:시티투어";
			PlaceSelected[3] += "^5=47634:선택관광리스트 코타키나발루";
			PlaceSelected[5] += "^5=47634:선택관광리스트 코타키나발루";
			PlaceSelected[4] += "^0=10389:멍카봉 선셋투어-코타키나발루|23763:키나발루 국립공원 관광-코타키나발루|23764:아일랜드 호핑투어-코타키나발루|26654:맹글로브 투어-코타키나발루|27536:만따나니섬 호핑투어-코타키나발루|27699:반딧불투어(클리아스/나나문)-코타키나발루|28245:나이트투어-코타키나발루|36302:마리마리 민속마을-코타키나발루|36449:바다낚시-코타키나발루|43776:라군팍워터월드-코타키나발루|44462:보르네오 컬쳐빌리지-코타키나발루|47013:래프팅-코타키나발루|47014:맛사지-코타키나발루|47015:씨워킹-코타키나발루|47016:체험스쿠버다이빙-코타키나발루|47017:제트스키-코타키나발루|47018:바나나보트-코타키나발루";
			PlaceSelected[0] = "26090";

			// 다른 일정 여행상품
			var ProductOtherXml = new Array();
			var otherDaysProductxml = "";

			// 상품가격 설정
			Set_PriceInfo(3);

			// 일정표하단 쇼핑정보 노출
			Get_PlaceInfo('13', 'P', '');

			// 핵심정보 표시설정
			PII_Set();

			// 예약취소료 규정 항목 비활성
			Reference_MenuSet();

			// 여행후기보기
			Page(1);

			// 관광정보 서브 노출설정 ([0]호텔, [1]방문지, [2]골프, [3]선택관광(방문지에 통합시킴)
			var _SelTourInfo = "Y";
			var _ShoppingInfo = "Y";
			Set_PlaceSub();

			// 도시정보 설정
			var obj = document.getElementById("Cmd_City");
			if (obj != null) {
				obj.selectedIndex = 0;
				CityInfo(obj);
			}

			// 인센티브단체
			_IncentiveGroup = [];

			jQuery(document).ready(function() {
				// 인센티브단체(준비중)
				IncentiveGroup();
			});
		</script>

		<!-- [S] criteo 상품 페이지 트래커  ---->
		<script type="text/javascript">
			window.criteo_q = window.criteo_q || [];
			window.criteo_q.push({
				event : "setAccount",
				account : 22309
			}, {
				event : "setHashedEmail",
				email : ""
			}, {
				event : "setSiteType",
				type : "d"
			}, {
				event : "viewItem",
				item : "AMP700OZM1"
			}, {
				event : "viewSearch",
				checkin_date : "2015-12-12",
				checkout_date : "2015-12-16"
			});
		</script>
		<!-- [E] criteo 상품 페이지 트래커  ---->

		<!--Content End-->
	</div>
	<a href="${root}/order/write.do?pNum=${productDto.product_number}&fNum=${flightDto.flight_number}">구매하기</a>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>