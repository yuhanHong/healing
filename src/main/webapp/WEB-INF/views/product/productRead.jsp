<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">

<title>힐링투어에 오신 것을 환영합니다!</title>
<link rel="stylesheet" type="text/css" href="${root}/css/product/product.css" />
<link rel="Shortcut Icon" href="${root}/resources/icons/H.ico" />
<link rel="stylesheet" href="http://www.modetour.com/Include/Css/Modetour/product/Itinerary.css?ver=20151222" type="text/css">
<link rel="stylesheet" href="http://www.modetour.com/Include/css/warp.css" type="text/css">
<link rel="stylesheet" href="http://www.modetour.com/Include/css/Modetour/product/product.css" type="text/css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.cycle2.min.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.cycle2.scrollVert.js"></script>
<script type="text/javascript" src="${root}/jquery/effect.min.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery.mCustomScrollbar.js"></script>

<script type="text/javascript" src="http://modetour.com/include/js/modetour/selectbox.min.js"></script>
<script type="text/javascript" src="http://modetour.com/include/js/modetour/Common_Top.min.js"></script>
<script type="text/javascript" src="http://modetour.com/Include/js/swfobject.js"></script>
<script type="text/javascript" src="http://modetour.com/Include/js/Modetour/etcs.js"></script>
<script type="text/javascript" src="http://modetour.com/Include/js/Modetour/popup.js"></script>

<script type="text/javascript" src="http://modetour.com/Include/Js/Cookie.js"></script>
<script type="text/javascript" src="http://modetour.com/Include/Js/Package/ZimSelect.js"></script>
<script type="text/javascript" src="http://modetour.com/Include/JS/GoSocialNetWorking.js"></script>
<script type="text/javascript" src="http://modetour.com/Include/Js/XmlObject.JS"></script>
<script type="text/javascript" src="http://modetour.com/include/js/plugin/jquery.cycle2.carousel.js"></script>
<script type="text/javascript" src="http://js.modetour.com/Jquery/jquery.tmpl.js"></script>
<script type="text/javascript" src="http://js.modetour.com/Package/Itinerary.js?ver=20151222"></script>
<script type="text/javascript" src="http://js.modetour.com/Board/Tnote_v2.js?ver=20151222"></script>

<script type="text/javascript" src="http://modetour.com/include/js/plugin/jquery.cycle2.carousel.js"></script>
<script type="text/javascript" src="http://js.modetour.com/Jquery/jquery.tmpl.js"></script>
<script type="text/javascript" src="http://js.modetour.com/jquery/jquery-ajaxq.js"></script>
<script type="text/javascript" src="http://js.modetour.com/Json/json2.js"></script>
</head>
<body>
	
	<jsp:include page="../include/header.jsp" />

	<div id="Containerwrap">
		<!--Content Start-->

		<div id="content">
			<div class="nav">
				<img src="${root}/resources/boardImg/img01.PNG" align="center">
				<h2 style="display:inline;"><span style="font-weight: bold; ">여행 일정표</span></h2>
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
														<col width="130" />
														<col width="130" />
														<col width="140" />
														<col width="140" />
														<col width="140" />
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
															<th rowspan="1" scope="row"><div class="b_wrap">상품가격</div></th>
															<th scope="row" class="txt_l"><div class="b_wrap">기본상품가격</div></th>
															<td class="pii_adult"><div class="b_wrap"><fmt:formatNumber value="${productDto.product_price_adult}"/>원</div></td>
															<td class="pii_child1"><div class="b_wrap"><fmt:formatNumber value="${productDto.product_price_child}"/>원</div></td>
															<td class="pii_infant"><div class="b_wrap"><fmt:formatNumber value="${productDto.product_price_baby}"/>원</div></td>
														</tr>
														<tr class="ess">
															<th rowspan="1" scope="row" class="cost_must"><div
																	class="b_wrap">
																	<i></i><br />현지 필수 경비
																</div></th>
															<th scope="row" class="txt_l"><div class="b_wrap">현지필수경비</div></th>
															<td class="pii_adult"><div class="b_wrap adult">$${productDto.product_guide_adult}&nbsp;&nbsp;</div></td>
															<td class="pii_child1"><div class="b_wrap child1">$${productDto.product_guide_child}&nbsp;&nbsp;</div></td>
															<td class="pii_infant"><div class="b_wrap infant">$${productDto.product_guide_baby}&nbsp;&nbsp;</div></td>
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
											    <col width="109">
											    <col width="145">
											    <col width="115">
											    <col width="340">
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
										    <tbody><tr>    <th scope="row"><div><img alt="현대카드" src="//img.modetour.co.kr/modetour/2014/itinerary/logo/card_32.png"></div></th>    <td><div>~ 2016년 12월 31일</div></td>    <td><div>2~5개월 무이자</div></td>    <td><div>6개월(1회차), 10개월(1~2회차) 고객부담 부분무이자</div></td></tr><tr>    <th scope="row"><div><img alt="국민카드 " src="//img.modetour.co.kr/modetour/2014/itinerary/logo/card_35.png"></div></th>    <td><div>~ 2016년 12월 31일</div></td>    <td><div>2~5개월 무이자</div></td>    <td><div>6개월(1회차), 10개월(1~2회차) 고객부담 부분무이자</div></td></tr><tr>    <th scope="row"><div><img alt="롯데카드" src="//img.modetour.co.kr/modetour/2014/itinerary/logo/card_31.png"></div></th>    <td><div>~ 2016년 12월 31일</div></td>    <td><div>2~5개월 무이자</div></td>    <td><div>6개월(1회차), 10개월(1~2회차) 고객부담 부분무이자</div></td></tr><tr>    <th scope="row"><div><img alt="삼성카드" src="//img.modetour.co.kr/modetour/2014/itinerary/logo/card_88.png"></div></th>    <td><div>~ 2016년 12월 31일</div></td>    <td><div>2~5개월 무이자</div></td>    <td><div>부분무이자 X</div></td></tr></tbody>
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
											<img src="http://img.modetour.co.kr/modetour/2014/itinerary/hn_exclude.png" alt="불포함사항" />
										</h3>
										<div class="contents">
											<div id="ContentMain_ContentPlaceHolder_Pnl_NonInclusion">

												&nbsp;<br />① (현지가이드/기사경비)는 전일정 $${productDto.product_guide_adult}/1인
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
								<div id="detail_0" class="contents">

<!-- 	for문, List<Product_detailDto> detailList[i] -->
									<c:forEach var="i" begin="1" end="${fn:length(productDayList)-1}" >
										<c:set var="productDayDto" value="${productDayList[i]}" />
									
										<div class="daily_routine">
											<div class="itinerary">
												<div class="day">
													<span class="days"><b>${i}일</b></span> <span class="date"><fmt:formatDate value="${flightDto.flight_start_departure}" type="date" pattern="yyyy년 M월 d일 E요일" />+${i}</span>
												</div>
												
												<div class="plan">
													<c:if test="${i==1}">
														<div class="tour">
															<div class="timeline">
																<strong>한국출발시간 : <fmt:formatDate value="${flightDto.flight_start_departure}" type="both" pattern="yyyy년 M월 d일 (E) HH:mm" />
																<br/>현지도착시간 : <fmt:formatDate value="${flightDto.flight_start_arrival}" type="both" pattern="yyyy년 M월 d일 (E) HH:mm" /></strong>
																<br />▶인천국제공항 출발 <br />▶${product_city} 도착 후 
																<br />▶&lt;힐링투어&gt; 피켓을 든 한국인 가이드와 미팅 후 ${productDayDto.product_day_hotel}로 이동 
																<br />▶호텔 CHECK-IN ☞ 한국인 직원 상주 ☜ 
																<br />
																<br />
															</div>
														</div>
													</c:if>
													
													<c:forEach var="j" begin="0" end="${fn:length(productDetailList[i])-1}" >
														<c:set var="productDetailDto" value="${productDetailList[i][j]}" />
														<c:forEach var="k" begin="0" end="${fn:length(productPhotoList[i][j])-1}" >
															<c:set var="productPhotoDto" value="${productPhotoList[i][j][k]}" />
															<img src="${root}/resources/productPhoto/${productDto.product_number}/${productPhotoDto.product_photo_filename}" width="300px" height="200px"/>
															<h3>☆${productDetailDto.product_detail_name}☆</h3>
															<h4>${productDetailDto.product_detail_explain}</h4>
															<br/>
														</c:forEach>
													</c:forEach>
										
													<c:if test="${i==(fn:length(productDayList)-1)}">
														<div class="tour">
															<div class="timeline">
																<strong>현지출발시간 : <fmt:formatDate value="${flightDto.flight_end_departure}" type="both" pattern="yyyy년 M월 d일 (E) HH:mm" />
																<br/>한국도착시간 : <fmt:formatDate value="${flightDto.flight_end_arrival}" type="both" pattern="yyyy년 M월 d일 (E) HH:mm" /></strong>
																<br />▶${product_city} 출발 
																<br />▶인천국제공항 도착 후 해산
																<br />
															</div>
														</div>
													</c:if>
										
												</div>
											</div>
										</div>
											
									</c:forEach>
								</div>
										<!-- 일정끝 -->

								</div>
							<div style="clear:both"></div>
							
							

								<div class="etc_links">
									<a href="#top"
										onclick="Itinerary_Popup('/w3c/TravelAgreementOverseas1.aspx', '', 'width=780px,height=783px'); return false;"
										class="tour_terms"><span class="blind">여행약관</span></a> <a
										href="#" class="tour_homepage"><span class="blind">해외안전
											여행 홈페이지</span></a>
								</div>

								<div class="board_contain" id="ProductPreview">
								<div id="travelReview" class="postscript">
								<h3>
									※여행후기※
								</h3>
								<c:if test="${fn:length(reviewList)==0}">
									<h4>후기가 없습니다.</h4>
								</c:if>
								<c:if test="${fn:length(reviewList)>0}">
									<div class="reviewTable">
										<c:forEach var="reviewDto" items="${reviewList}"  varStatus="status">
											<div class="reviewDetail" style="border: 1px black solid;">
												글쓴이: ${reviewDto.member_number}
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
								</div>
				

						</div>

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
		
			<div style="align: center;">
				<input type="button" id="product_like" value="관심상품 추가"/>
				<input type="button" id="product_order" onclick="javascript:location.href='${root}/order/write.do?pNum=${productDto.product_number}&fNum=${flightDto.flight_number}'" value="예약하기"/>
			</div>
		
		</div>

		<!--Content End-->
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>