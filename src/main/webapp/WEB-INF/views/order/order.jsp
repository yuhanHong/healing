<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 page</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root }/css/order/style.css"/>
<script type="text/javascript" src="${root }/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/order/order.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</head>
<body>
<jsp:include page="../home.jsp"/>
<hr/>
	<form id="orderForm" action="${root}/order/write.do"  method ="post" onsubmit="return orderCheck(this,'${root}')">
		<div id="orderPage">
			<!-- Page Info -->
			<div id="order_title">
				<h1 style="">예약</h1>
			</div>
			<!-- Product Info -->
			<div class="orderDiv" id="productInfo">
				<label>${productDto.product_name }</label><br/>
				<label>${productDto.product_summary }</label>
			</div>
			
			<!-- INPUT -->
			<!-- hidden-->
			<div id="hiddenInfo">
				<input type="hidden" name="product_number" value="${productDto.product_number}"/>
				<input type="hidden" name="order_price_adult" value="${productDto.product_price_adult}"/>
				<input type="hidden" name="order_price_child" value="${productDto.product_price_child}"/>
				<input type="hidden" name="order_price_baby" value="${productDto.product_price_baby}"/>	
				<input id="order_adult" type="hidden" name="order_adult" value="0"/>
				<input id="order_child" type="hidden" name="order_child"value="0"/>
				<input id="order_baby" type="hidden" name="order_baby"value="0"/>
				<input type="hidden" name="product_name" value="${productDto.product_name}"/>	
			</div>
			<div class="orderDiv">
							
				<label>예약자 명 :</label>  
				
				<!--예약자명 ;  회원-->
					<c:if test="${member_number!=null }">
					<input type="text" name="order_name" size="10" value="${member.member_name }"/>
					<input type="hidden" name="member_number" value="${member_number}"/>
					</c:if>
					
				<!--예약자명 ; 비회원-->
					<c:if test="${member_number==null }">
					<input type="text" name="order_name" size="10" />
					<input type="hidden" name="member_number" value="1"/>
					</c:if>
				
				<label>전화번호 :</label>  
				
				<!--예약자 전화번호 ;  회원-->
					<c:if test="${member_number!=null }">
					<input type="text" name=order_phone size="10" value="${member.member_phone }"/>
					</c:if>
				
				<!-- 비회원 -->
					<c:if test="${member_number==null }">
					<input type="text" name=order_phone size="10"/>
					</c:if>
			</div>
			<div class="orderDiv">
				
				<label>이메일  :</label>
				
				<!-- 이메일 ; 회원 -->
				  	  <c:if test="${member_number!=null }">
					  <input type="text" name="order_email" value="${member.member_email }"/>
			    </c:if>
				  
				<!-- 이메일 ; 비회원 -->
				  	  <c:if test="${member_number==null }">
					  <input type="text" name="order_email" />
				</c:if>
				  
			</div>
			<div class="orderDiv">
				<label>출발 날짜  :</label>
				<select name="start_time" id="time_select">
					<!--<option>2015년 12월 24일  22:00</option>  -->
				</select>
			</div>
			<div class="orderDiv">
				<label>성인 인원 : </label> <input id="adult" type="number"  value="0" max="20" min="1" size="2">									
				<label>아동 인원 : </label><input id="child" type="number"  value="0" max="20" min="0" size="2">
				<label>유아 인원 : </label> <input id="baby" type="number"  value="0" max="20" min="0" size="2">
			</div>
	
			<div class="orderDiv" >
				<label>결제 방법 : </label> 
				<input type="radio" name="payment_option" value="카드" ><label>카드</label>
				<input type="radio" name="payment_option" value="무통장 입금" ><label>무통장 입금</label>
			</div>
			<div class="orderDiv">
				<b>최종 결제 금액 : &nbsp;&nbsp;&nbsp;&nbsp;  <font id="result_money"></font>&nbsp;&nbsp;&nbsp;&nbsp;원</b>
				<input type="hidden" id="order_money" name="order_money" >
			</div>
			<br/><br/><br/>
			<div id="tabs" class="orderDiv">
				 <ul>
					<li><a href="#tabs-1">국외여행 특별약관</a></li>
					<li><a href="#tabs-2">개인 정보 수집 및 이용 안내</a></li>
					<li><a href="#tabs-3">개인정보 제 3자 제공 및 공유안내</a></li>
					<li><a href="#tabs-4">고유식별정보 수집 이용안내</a></li>
					<li><a href="#tabs-5">개인정보 활용 동의안내</a></li>
					<li><a href="#tabs-6"> 취소 수수료 안내</a></li>
				</ul>
				<div id="tabsDiv" class="orderDiv">
					  <div id="tabs-1">
							<p><h6>제1조 (목적)</h6><br></p>
							<p>이 약관은 (주)하나투어(이하 당사라한다.)와 여행자가 체결한 국외여행계약의 세부 이행 및 준수사항을 정함을 목적으로 합니다.<br/><br></p>
							<p><h6>제2조 (당사와 여행자 의무)</h6><br></p>
							<p> ① 당사는 여행자에게 안전하고 만족스러운 여행서비스를 제공하기 위하여 여행알선 및 안내,운송,숙박 등 여행계획의 수립 및 실행과정에서 맡은 바 임무를 충실히 수행하여야 합니다.<br/>② 여행자는 안전하고 즐거운 여행을 위하여 여행자간 화합도모 및 여행사의 여행질서 유지에 적극 협조하여야 합니다.<br/><br></p>
							<p><h6>제3조(용어의 정의)</h6><br></p>
							<p>여행의 종류 및 정의, 해외여행수속대행업의 정의는 다음과 같습니다.<br/>1. 기획여행 : 당사가 미리 여행목적지 및 관광일정, 여행자에게 제공될 운송 및 숙식서비스 내용(이하 '여행서비스'라 함), 여행요금을 정하여 광고 또는 기타 방법으로 여행자를 모집하여 실시하는 여행.<br/>2. 희망여행 : 여행자(개인 또는 단체)가 희망하는 여행조건에 따라 당사가 운송,숙식,관광 등 여행에 관한 전반적인 계획을 수립하여 실시하는 여행.<br/>3. 해외여행 수속대행(이하 수속대형계약이라 함) : 당사가 여행자로부터 소정의 수속대행요금을 받기로 약정하고, 여행자의 위탁에 따라 다음에 열거하는 업무(이하 수속 대행업무라함)를 대행하는 것.<br/>&nbsp;&nbsp;1) 사증, 재입국 허가 및 각종 증명서 취득에 관한 수속<br/>&nbsp;&nbsp;2) 출입국 수속서류 작성 및 기타 관련업무 <br/><br></p>
							<p><h6>제4조(계약의 구성)</h6><br></p>
							<p>①  여행계약은 여행계약서(붙임)와 여행약관,여행일정표(또는 여행 설명서)를 계약내용으로 합니다.<br/>②  여행일정표(또는 여행설명서)에는 여행일자별 여행지와 관광내용,교통수단,쇼핑횟수,숙박장소,식사 등 여행실시일정 및 여행사 제공 서비스 내용과 여행자 유의사항이 포함되어야 합니다.<br/><br></p>
							<p><h6>제5조(특약)</h6><br></p>
							<p>당사와 여행자는 관계법규에 위반되지 않는 범위내에서 서면으로 특약을 맺을 수 있습니다. 이 경우 표준약관과 다름을 당사는 여행자에게 설명해야 합니다.<br/><br></p>
							<p><h6>제6조(안전정보 제공 및 계약서 등 교부)</h6><br></p>
							<p>당사는 여행자와 여행계약을 체결할 때 여행약관과 외교부 해외안전여행 홈페이지(www.0404.go.kr)에 게재된 여행지 안전정보를 제공하여야 하며, 여행계약을 체결한 경우 계약서와 여행일정표(또는 여행설명서)를 각 1부씩 여행자에게 교부하여야 합니다.<br/><br></p>
							<p><h6>제7조(계약서 및 약관 등 교부 간주)</h6><br></p>
							<p>당사와 여행자는 다음 각 호의 경우 여행계약서와 여행약관 및 여행일정표(또는 여행설명서)가 교부된 것으로 간주합니다. <br/>1.  여행자가 인터넷 등 전자정보망으로 제공된 여행계약서, 약관 및 여행일정표(또는 여행설명서)의 내용에 동의하고 여행계약의 체결을 신청한데 대해 당사가 전자정보망 내지 기계적 장치 등을 이용하여 여행자에게 승낙의 의사를 통지한 경우<br/>2.  당사가 팩시밀리 등 기계적 장치를 이용하여 제공한 여행계약서, 약관 및 여행일정표(또는 여행설명서)의 내용에 대하여 여행자가 동의하고 여행계약의 체결을 신청하는 서면을 송부한데 대해 당사자가 전자정보망 내지 기계적 장치 등을 이용하여 여행자에게 승낙의 의사를 통지한 경우 <br/><br></p>
							<p><h6>제8조(당사의 책임)</h6><br></p>
							<p>당사는 여행 출발 시부터 도착 시까지 당사 본인 또는 그 고용인, 현지여행업자 또는 그 고용인 등(이하 '사용인'이라 함)이 제2조 제1항에서 규정한 당사 임무와 관련하여 여행자에게 고의 또는 과실로 손해를 가한 경우 책임을 집니다.<br/><br></p>
							<p><h6>제9조(최저행사인원 미 충족시 계약해제)</h6><br></p>
							<p>①  당사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행출발 7일전까지 여행자에게 통지하여야 합니다.<br/>②  당사가 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는 경우 이미 지급받은 계약금 환급 외에 다음 각 목의 1의 금액을 여행자에게 배상하여야 합니다.<br/>&nbsp;&nbsp;가. 여행출발 1일전까지 통지시 : 여행요금의 30% <br/>&nbsp;&nbsp;나. 여행출발 당일 통지시 : 여행요금의 50%<br/>&nbsp;&nbsp;(※여행요금이란 일정표상 명시된 총 상품가격을 의미한다.)<br/><br></p>
							<p><h6>제10조(계약체결 거절)</h6><br></p>
							<p>당사는 여행자에게 다음 각 호의 1에 해당하는 사유가 있을 경우에는 여행자와의 계약체결을 거절할 수 있습니다. <br/>&nbsp;&nbsp;1. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 지장이 있다고 인정될 때  <br/>&nbsp;&nbsp;2. 질병 기타 사유로 여행이 어렵다고 인정될 때<br/>&nbsp;&nbsp;3. 명시한 최대행사인원이 초과되었을 때<br/>&nbsp;&nbsp;4. 일정표에 최저행사인원이 미달되었을 때<br/><br></p>
							<p><h6>제11조(여행요금) </h6><br></p>
							<p>① 여행계약서의 여행요금에는 다음 각 호가 포함됩니다. 단, 다음의 1~9호는 여행자 본인이 직접 여행지에서 지불하여야 할 금액이나 당사가 여행자 편의를 위하여 수탁받아 이를 대신 지불합니다.<br/>&nbsp;&nbsp;1. 항공기, 선박, 철도 등 이용운송기관의 운임(보통운임기준)<br/>&nbsp;&nbsp;2. 공항, 역, 부두와 호텔사이 등 송영버스요금<br/>&nbsp;&nbsp;3. 숙박요금 및 식사요금<br/>&nbsp;&nbsp;4. 안내자경비<br/>&nbsp;&nbsp;5. 여행 중 필요한 각종세금<br/>&nbsp;&nbsp;6. 국내외 공항, 항만세<br/>&nbsp;&nbsp;7. 관광진흥개발기금<br/>&nbsp;&nbsp;8. 일정표내 관광지 입장료<br/>&nbsp;&nbsp;9. 기타 개별계약에 따른 비용<br/>&nbsp;&nbsp;10. 여행 알선 수수료 <br/>② 여행자는 계약체결시 계약금(여행요금 중 계약금으로 별도 고지된 금액)을 당사에게 지급하여야 하며, 계약금은 여행요금 또는 손해배상액의 전부 또는 일부로 취급합니다.<br/>③ 여행자는 제1항의 여행요금 중 계약금을 제외한 잔금을 여행출발 7일전까지 당사에게 지급하여야 합니다.<br/>④ 여행자는 제1항의 여행요금을 당사자가 약정한 바에 따라 카드, 계좌이체 또는 무통장입금 등의 방법으로 지급하여야 합니다.<br/>⑤ 희망여행요금에 여행자 보험료가 포함되는 경우 당사는 보험회사명, 보상내용 등을 여행자에게 설명하여야 합니다.<br/><br></p>
							<p><h6>제12조(여행요금의 변경)</h6><br></p>
							<p>① 국외여행을 실시함에 있어서 이용운송,숙박기관에 지급하여야 할 요금이 계약체결시보다 5% 이상 증감하거나 여행 요금에 적용된 외화환율이 계약체결시보다 2% 이상 증감한 경우 당사 또는 여행자는 그 증감된 금액 범위 내에서 여행요금의 증감을 상대방에게 청구할 수 있습니다.<br/>② 당사는 제1항의 규정에 따라 여행요금을 증액하였을 때에는 여행개시 15일전에 여행자에게 통지하여야 합니다.<br/><br></p>
							<p><h6>제13조(여행조건의 변경요건 및 요금 등의 정산)</h6><br></p>
							<p>①  위 제1조 내지 제12조의 여행조건은 다음 각 호의 1의 경우에 한하여 변경될 수 있습니다.<br/>1. 여행자의 안전과 보호를 위하여 여행자의 요청 또는 현지사정에 의하여 부득이하다고 쌍방이 합의한 경우<br/>2. 천재지변, 전란, 정부의 명령, 운송,숙박기관 등의 파업,휴업 등으로 여행의 목적을 달성할 수 없는 경우<br/>②  제1항의 여행조건 변경 및 제12조의 여행요금 변경으로 인하여 제11조제1항의 여행요금에 증감이 생기는 경우에는 여행출발 전 변경 분은 여행출발 이전에, 여행 중 변경 분은 여행종료 후 10일 이내에 각각 정산(환급)하여야 합니다.  <br/>③  제1항의 규정에 의하지 아니하고 여행조건이 변경되거나 제15조 또는 제16조의 규정에 의한 계약의 해제,해지로 인하여 손해배상액이 발생한 경우에는 여행출발 전 발생 분은 여행출발이전에, 여행 중 발생 분은 여행종료 후 10일 이내에 각각 정산(환급)하여야 합니다.  <br/>④ 여행자는 여행출발 후 자기의 사정으로 숙박, 식사, 관광 등 여행요금에 포함된 서비스를 제공받지 못한 경우 당사에게 그에 상응하는 요금의 환급을 청구할 수 없습니다. 단, 여행이 중도에 종료된 경우에는 제14조에 준하여 처리합니다.  <br/><br></p>
							<p><h6>제14조(손해배상)</h6><br></p>
							<p>① 당사는 현지여행업자 등의 고의 또는 과실로 여행자에게 손해를 가한 경우 당사는 여행자에게 손해를 배상하여야 합니다.<br/>② 당사의 귀책사유로 여행자의 국외여행에 필요한 여권, 사증, 재입국 허가 또는 각종 증명서 등을 취득하지 못하여 여행자의 여행일정에 차질이 생긴 경우 당사는 여행자로부터 절차대행을 위하여 받은 금액 전부 및 그 금액의 100% 상당액을 여행자에게 배상하여야 합니다.<br/>③ 당사는 항공기, 기차, 선박 등 교통기관의 연발착 또는 교통체증 등으로 인하여 여행자가 입은 손해를 배상하여야 합니다. 단, 당사가 고의 또는 과실이 없음을 입증한 때에는 그러하지 아니합니다.<br/>④ 당사는 자기나 그 사용인이 여행자의 수하물 수령, 인도, 보관 등에 관하여 주의를 해태(懈怠)하지 아니하였음을 증명하지 아니하면 여행자의 수하물 멸실, 훼손 또는 연착으로 인한 손해를 배상할 책임을 면하지 못합니다.<br/><br></p>
							<p><h6>제15조(여행출발 전 계약해제)</h6><br></p>
							<p>①  당사 또는 여행자는 여행출발전 이 여행계약을 해제할 수 있습니다. 이 경우 발생하는 손해액은 '소비자분쟁해결기준' (공정거래위원회고시)에 따라 배상합니다.  <br/>&nbsp;&nbsp;1. 여행자의 여행계약 해제 요청이 있는 경우(여행자의 취소요청시) <br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 30일전까지(~30) 통보시 : 계약금 환급<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 20일전까지(29~20) 통보시 : 여행요금의 10% 배상<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 10일전까지(19~10) 통보시 : 여행요금의 15% 배상<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 8일 전까지(9~8) 통보시 : 여행요금의 20% 배상<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 1일 전까지(7~1) 통보시 : 여행요금의 30% 배상<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 당일 통보시 : 여행요금의 50% 배상<br/>&nbsp;&nbsp;2. 당사의 귀책사유로 취소 통보하는 경우<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 30일전까지(~30) 통보시 : 계약금 환급<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 20일전까지(29~20) 통보시 : 여행요금의 10% 배상<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 10일전까지(19~10) 통보시 : 여행요금의 15% 배상<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 8일 전까지(9~8) 통보시 : 여행요금의 20% 배상<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 개시 1일 전까지(7~1) 통보시 : 여행요금의 30% 배상<br/>&nbsp;&nbsp;&nbsp;&nbsp;- 여행 당일 통보시 : 여행요금의 50% 배상<br/>&nbsp;&nbsp;단, 최저행사인원이 충족되지 않아 불가피하게 기획여행을 실시할 수 없는 경우에는 제9조(최저행사인원 미충족시 계약해제)의 조항에 의거하여 당사가 여행자에게 배상한다.<br/>&nbsp;&nbsp;(※여행요금이란 일정표상 명시된 총 상품가격을 의미한다.)<br/>② 당사 또는 여행자는 여행출발 전에 다음 각 호의 1에 해당하는 사유가 있는 경우 상대방에게 제1항의 손해배상액을 지급하지 아니하고 이 여행계약을 해제할 수 있습니다.<br/>&nbsp;&nbsp;1. 당사가 해제할 수 있는 경우<br/>&nbsp;&nbsp;&nbsp;&nbsp;가. 제13조제1항제1호 및 제2호사유의 경우<br/>&nbsp;&nbsp;&nbsp;&nbsp;나. 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 현저한 지장이 있다고 인정될 때<br/>&nbsp;&nbsp;&nbsp;&nbsp;다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우<br/>&nbsp;&nbsp;&nbsp;&nbsp;라. 여행자가 계약서에 기재된 기일까지 여행요금을 납입하지 아니한 경우<br/>&nbsp;&nbsp;2. 여행자가 해제할 수 있는 경우<br/>&nbsp;&nbsp;&nbsp;&nbsp;가. 제13조제1항제1호 및 제2호의 사유가 있는 경우<br/>&nbsp;&nbsp;&nbsp;&nbsp;나. 여행자의 3촌 이내 친족이 사망한 경우 단, 여행자는 아래와 같은 입증서류를 당사에 제출하여야 한다.<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) 친족을 확인할 수 있는 서류(가족관계증명서 등)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) 진단서 또는 사체검안서(사망진단서)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) 그밖에 필요한 자료<br/>&nbsp;&nbsp;&nbsp;&nbsp;다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우 단, 여행자는 아래와 같은 입증서류를 당사에 제출하여야 한다.<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) 진단서<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) 그밖에 필요한 자료<br/>&nbsp;&nbsp;&nbsp;&nbsp;라. 배우자 또는 직계존비속이 신체이상으로 3일 이상 병원(의원)에 입원하여 여행 출발 전까지 퇴원이 곤란한 경우 그 배우자 또는 보호자 1인 단, 여행자는 아래와 같은 입증서류를 당사에 제출하여야 한다.<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) 친족을 확인할 수 있는 서류(가족관계증명서 등)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) 진단서<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) 그밖에 필요한 자료<br/>&nbsp;&nbsp;&nbsp;&nbsp;마. 당사의 귀책사유로 계약서 또는 여행일정표(여행설명서)에 기재된 여행일정대로의 여행실시가 불가능해진 경우<br/>&nbsp;&nbsp;&nbsp;&nbsp;바. 제12조 제1항의 규정에 의한 여행요금의 증액으로 인하여 여행 계속이 어렵다고 인정될 경우<br/><br></p>
							<p><h6>제16조(여행출발 후 계약해지)</h6><br></p>
							<p>① 당사 또는 여행자는 여행출발 후 부득이한 사유가 있는 경우 이 여행계약을 해지할 수 있습니다. 단, 이로 인하여 상대방이 입은 손해를 배상하여야 합니다.<br/>② 제1항의 규정에 의하여 계약이 해지된 경우 당사는 여행자가 귀국하는데 필요한 사항을 협조하여야 하며, 이에 필요한 비용으로써 당사의 귀책사유에 의하지 아니한 것은 여행자가 부담합니다.<br/><br></p>
							<p><h6>제17조(여행의 시작과 종료)</h6><br></p>
							<p>여행의 시작은 탑승수속(선박인 경우 승선수속)을 마친 시점으로 하며, 여행의 종료는 여행자가 입국장 보세구역을 벗어나는 시점으로 합니다. 단, 계약내용상 국내이동이 있을 경우에는 최초 출발지에서 이용하는 운송수단의 출발시각과 도착시각으로 합니다.<br/><br></p>
							<p><h6>제18조(설명의무)</h6><br></p>
							<p>당사는 계약서에 정하여져 있는 중요한 내용 및 그 변경사항을 여행자가 이해할 수 있도록 설명하여야 합니다.<br/><br></p>
							<p><h6>제19조(보험가입 등)</h6><br></p>
							<p>당사는 이 여행과 관련하여 여행자에게 손해가 발생한 경우 여행자에게 보험금을 지급하기 위한 보험 또는 공제에 가입하거나 영업보증금을 예치하여야 합니다.<br/><br></p>
							<p><h6>제20조(기타사항)</h6><br></p>
							<p>①	이 계약에 명시되지 아니한 사항 또는 이 계약의 해석에 관하여 다툼이 있는 경우에는 당사 또는 여행자가 합의하여 결정하되, 합의가 이루어지지 아니한 경우에는 관계법령 및 일반관례에 따릅니다. <br/>②	특수지역에의 여행으로서 정당한 사유가 있는 경우에는 당사의 여행약관의 내용과 달리 정할 수 있습니다.<br/>③	이 약관은 기획여행 상품을 기준으로 적용합니다. <br/><br></p>
							<p><h6>부칙</h6><br></p>
							<p>1. (개정일) 이 약관은 2003년 3월 6일부터 시행한다.<br/>2. (개정일) 이 약관은 2004년 12월 25일부터 시행한다.<br/>3. (개정일) 이 약관은 2005년 4월 5일부터 시행한다.<br/>4. (개정일) 이 약관은 2007년 9월 5일부터 시행한다.<br/>5. (개정일) 이 약관은 2009년 10월 30일부터 시행한다.<br/>6. (개정일) 이 약관은 2011년 10월 10일부터 시행한다.<br/>7. (개정일) 이 약관은 2012년 3월 1일부터 시행한다.<br/>8. (개정일) 이 약관은 2012년 9월 4일 부터 시행한다.<br/>9. (개정일) 이 약관은 2014년 3월 21일 부터 시행한다.<br/>10. (개정일) 이 약관은 2014년 9월 16일 부터 시행한다.<br/>11. (개정일) 이 약관은 2015년 2월 23일 부터 시행한다.<br/><br></p>
					
					  </div>
			
					  <div id="tabs-2" class="stipulationType1">
							<h6>1. 개인정보 수집 및 이용목적</h6>
							<p>회사는 여행상품의 예약 및 여행관련 서비스 제공 등의 업무처리를 위하여 고객으로부터 최소한의 필수정보를 수집하며, 제공한 모든 개인정보는 별도의 동의가 없는 한 해당목적 이외의 다른 목적으로 사용하지 않습니다. </p>
							<p>회사는 수집한 개인정보를 다음의 목적을 위하여 사용합니다.</p>
							<p>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</p>
							<p>여행상품 예약, 여행자보험 가입, 항공권/호텔 등의 예약 및 출입국 정보확인, 예약내역의 확인 및 상담, 컨텐츠 제공, 여행서비스 이용 시 회원의 우대, 마일리지 적립 /조회 / 사용 및 이에 관한 안내, 회원카드 발급, 구매 및 요금결제, 물품배송 또는 청구서 등 발송, 본인인증 및 금융서비스 등 </p>
							<p>나. 회원관리</p>
							<p>회원제 서비스 이용을 위한 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 이용 및 이용횟수 제한, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 분쟁조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 등</p>
							
							<h6>2. 개인정보 수집 항목 및 보유 및 이용기간</h6>
							<p>가. 회사는 적법한 절차와 법적 기준에 의거하여 고객의 개인정보를 수집하고 있으며, 고객의 서비스이용에 필요한 최소한의 정보만을 수집하고 있습니다. 정보통신망법과 개인정보보호법에 의거하여 수집, 이용을 제한하고 있습니다.</p>
							<p>나. 회사는 고객의 인권을 침해할 우려가 있는 민감한 개인정보항목(인종, 종교, 사상, 정치적 성향, 건강상태, 성생활정보 등)은 수집하지 않습니다.</p>
							
							<style type="text/css">
							.table_rule {border-top: 1px solid #ccc; border-collapse:collapse}
							.table_rule h6 {font-size: 12px;}
							.table_rule th:first-child
							.table_rule th:first-child {border-left: none}
							.table_rule th {background-color: #f1f1f1;}
							.table_rule th,
							.table_rule td {padding: 5px 10px; border-left: 1px solid #ccc; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; font-size: 12px;}
							h6 {font-size: 12px}
							</style>
							<table class="table_rule" width="100%" summary="항목별구분,수집되는 개인정보 내역">
								<colgroup>
								<col style="width:33%" />
								<col style="width:33%" />
								<col style="width:34%" />
								<colgroup>
							 <TR>
							 	<th><b>개인정보 항목</b></th>
								<th><b>용도</b></th>
							 	<th><b>보유 및 이용기간</b></th>
							 </TR>
							 <TR>
							 	<TD>예약자 : 성명, 생년월일, 이메일주소, 연락처, 주소<br />여행자 : 성명(국문/영문), 생년월일, 성별, 연락처, 이메일주소</TD>
								<TD>여행상품 예약 및 상담 / 경품배송</TD>
								<TD>서비스 제공 및 관계법령에 따른 보존기간</TD>
							 </TR>
							  <TR>
							 	<TD>성명(국문/영문), 생년월일, 성별, 여권/비자 소지여부, 여권정보(영문성명, 여권번호, 여권만료일)</TD>
								<TD>예약 및 출국가능 여부 파악</TD>
								<TD>서비스 제공 및 관계법령에 따른 보존기간</TD>
							 </TR>
							  <TR>
							 	<TD>성명, 생년월일, 성별, 여권번호</TD>
								<TD>여행자보험 가입(해외여행상품)</TD>
								<TD>서비스 제공 및 관계법령에 따른 보존기간</TD>
							 </TR>
							  <TR>
							 	<TD>성명, 신용카드번호, 유효기간, 계약자와의 관계</TD>
								<TD>대금결제/정산</TD>
								<TD>서비스 제공 및 관계법령에 따른 보존기간</TD>
							 </TR>
							  <TR>
							 	<TD>성명, 연락처, 하나투어 마일리지클럽 회원번호</TD>
								<TD>마일리지 서비스 제공</TD>
								<TD>서비스 제공 및 관계법령에 따른 보존기간</TD>
							 </TR>
							 </TABLE> 
							 <h6>3. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익</h6>
							 <p>개인정보 주체자는 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다. 동의를 거부할 경우 여행상품 예약 서비스 이용이 불가함을 알려드립니다.</p>
			
							<style type="text/css">
							.table_rule {border-top: 1px solid #ccc; border-collapse:collapse}
							.table_rule h6 {font-size: 12px;}
							.table_rule th:first-child
							.table_rule th:first-child {border-left: none}
							.table_rule th {background-color: #f1f1f1;}
							.table_rule th,
							.table_rule td {padding: 5px 10px; border-left: 1px solid #ccc; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; font-size: 12px;}
							h6 {font-size: 12px}
							</style>
					</div>
					
					<div id="tabs-3"  class="stipulationType1">
							<h6>1. 개인정보 제3자 제공에 관한 사항</h6>
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
									<p>회사는 회원의 동의가 있거나 관련 법령의 규정에 의한 경우를 제외하고 어떠한 경우에도 ‘개인정보의 수집 및 이용목적’ 에서 고지한 범위를 넘어서거나, 해당되는 회원 서비스 영역과 무관한 타 기업/기관에 제공하거나 이용하지 않습니다. 단, 제공의 필요 시 회원의 동의를 얻어 회원 서비스 수행에 직접적으로 관계되는 업체에 한해서 제한적인 조건으로 개인정보가 제공되며 내용은 다음과 같습니다.</p>
									
									<style type="text/css">
									.table_rule {border-top: 1px solid #ccc; border-collapse:collapse}
									.table_rule th:first-child
									.table_rule th:first-child {border-left: none}
									.table_rule th {background-color: #f1f1f1;}
									.table_rule th,
									.table_rule td {padding: 5px 10px; border-left: 1px solid #ccc; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; font-size: 12px;}
									h6 {font-size: 12px}
									</style>
									<table class="table_rule" width="100%" summary="서비스영역,제공받는자,제공하는항목,제공받는자의 이용목적">
										<colgroup>
											<col width="20%"/>
											<col width="20%"/>
											<col width="20%"/>
											<col width="20%"/>
											<col width="20%"/>
										</colgroup>
														<tr>
															<th>서비스 영역</th>
															<th>제공받는 자</th>
															<th>제공하는 항목</th>
															<th>제공받는 자의 이용목적</th>
															<th>보유 및 이용기간</th>
														</tr>
														</thead>
														<tbody>
														<tr>
															<td>항공 / 해운 / 운송 </td>
															<td>대한항공, 아시아나 항공 및 국내외 항공사, 해운회사 / 철도회사/렌터카업체<br/><a href="javascript:void ;" onclick="window.open('/temporarypolicy/air_list_01.htm','','resizable=no scrollbars=yes width=500, height=700 left=0 top=0');return false" onfocus="this.blur()">전체보기</a></td>
															<td>영문명,생년월일,성별,연락처(이메일/휴대폰)여권정보(영문명,여권번호,여권만료일)항공사 마일리지정보</td>
															<td>항공권 및 기타운송업체예약 출국가능여부 파악</td>
															<td>서비스 제공 및 관계법령에 따른 보존기간</td>
														</tr>
														<tr>
															<td>숙박 / 행사수배</td>
															<td>국내 외 호텔 및 리조트/숙박업체 / 랜드사<br/><br/><a href="javascript:void ;" onclick="window.open('/temporarypolicy/hotel_list_01.htm','','resizable=no scrollbars=yes width=700, height=700 left=0 top=0');return false" onfocus="this.blur()">전체보기</a></td>
															<td>성명(국문/영문), 연락처</td>
															<td>숙박예약 진행 / 확인</td>
															<td>서비스 제공 및 관계법령에 따른 보존기간</td>
														</tr>
														<tr>
															<td>여행자보험</td>
															<td>여행자보험 서비스 제공 보험사<br/><!--<a href="javascript:void ;" onclick="window.open('/temporarypolicy/hotel_list_01.htm','','resizable=no scrollbars=yes width=700, height=700 left=0 top=0');return false" onfocus="this.blur()">전체보기</a>--></td>
															<td>성명, 생년월일, 성별, 여권번호</td>
															<td>여행자 보험 가입 (해외여행상품)</td>
															<td>보험가입 이후 5년</td>
														</tr>
														<tr>
															<td>비자 수속</td>
															<td>하나패스</td>
															<td>성명, 여권정보(영문명,여권번호,여권만료일)</td>
															<td>비자 수속업무 (ESTA)</td>
															<td>서비스 제공 및 관계법령에 따른 보존기간</td>
														</tr>
														</tbody>
													</table>
												</table>
							
									<h6>2. 동의 거부권 및 거부 시 불이익 사항 : 회원님은 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있습니다. 동의를 거부할 경우 상품서비스 수행에 필수적인 정보제공이 이뤄지지 않으므로, 예약수행이 불가함을 알려드립니다.</h6>
				</div>
					<div id="tabs-4"  class="stipulationType1" >
							<p>당사는 개인정보보호법을 준수하며  서비스 수행의 목적에 한하여 최소한의 고유식별정보를  수집,이용하며  
							기준은 아래와 같습니다.</p>
							<p>1. 고유식별 정보 수집/이용 목적  : 해외여행 상품예약시 출국가능 여부파악 및 여행자 본인식별</p>
							<p>2. 수집하는 고유식별 정보의 항목 : 여권번호 (여권만료일)</p>
							<p>3. 고유식별정보의 보유 및 이용기간 : 여행상품 서비스 수행목적의 완료시점까지</p>
							<h6 style="font-size: 12px">*동의거부권</h6>   
							   <p>개인정보주체자는 고유식별정보(여권번호 등) 에 대한 수집동의를 거부할 권리가 있습니다. </p>
							   <p>동의를 거부할 경우 출국자 확인이 불가하여 예약서비스 수행이 불가함을 알려드립니다.</p>
					</div>
					<div id="tabs-5"  class="stipulationType1" >
						<h6>1. 개인정보 활용 목적</h6>
						
						<p>고객님의 개인정보는 고객님에게 적합한 맞춤 여행상품 안내서비스 및 맞춤 상담을 위해 아래와 같이 활용될 수 있습니다.</p>
						<p>(1) 회사의 여행 상품 및 여행관련 서비스를 이용한 고객에게 한정하여 회사가 기획한 여행상품이나 다양한 맞춤서비스 홍보 및 안내하기 위하여 개인정보 개인정보 활용에 동의한 고객에게 다양한 맞춤 서비스를 제공할 수 있습니다.</p>
						<p>(2) 신규서비스 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 당사 및 제휴사 상품 / 제휴카드 안내, 이벤트 등 광고성 정보 전달, 회원의 서비스 이용에 대한 통계, 회원 대상 각종 마케팅 활동에 활용됩니다.</p>
						
						<h6>2. 개인정보 수집 항목</h6>
						
						<style type="text/css">
						.table_rule {border-top: 1px solid #ccc; border-collapse:collapse}
						.table_rule h6 {font-size: 12px;}
						.table_rule th:first-child
						.table_rule th:first-child {border-left: none}
						.table_rule th {background-color: #f1f1f1;}
						.table_rule th,
						.table_rule td {padding: 5px 10px; border-left: 1px solid #ccc; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; font-size: 12px;}
						h6 {font-size: 12px}
						</style>
						<table class="table_rule" width="100%" summary="항목별구분,수집되는 개인정보 내역">
							<colgroup>
							<col style="width:50%" />
							<col style="width:25%" />
							<col style="width:25%" />
							<colgroup>
						 <TR>
						 	<th><b>개인정보 항목</b></Th>
						 	<th><b>용도</b></th>
							<th><b>보유 및 이용기간</b></th>
						 </TR>
						 <TR>
						 	<TD>이름, 연락처, 이메일, 주소</TD>
							<TD>맞춤서비스 제공, 이벤트 안내, 상품안내 등 마케팅 및 광고에 활용</TD>
							<TD>서비스 제공 및 관계법령에 따른 보존기간</TD>
						 </TR>
						
						 
						 </TABLE> 
						
						<h6>3. 개인정보의 이용 및 보유기간</h6>
						<p>개인정보 활용에 동의한 고객님에 한해 서비스 제공 및 관계 법령에 따른 보존기간 까지</p>
						
						<h6>4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익</h6>
						<p>개인정보 주체자는 개인정보 활용에 대한 동의를 거부할 권리가 있습니다.</p>
						<p>동의를 거부할 경우 여행 맞춤 서비스 및 정보제공이 일부 제한 될 수 있으며 회원가입 및 여행서비스 이용에는 영향이 없습니다.</p>
					</div>
					<div id="tabs-6"  class="stipulationType1" >
					<p>취소료는 여행약관 기준에 의거 취소 출발일 기준으로 다음과 같이 부과됩니다. </p>
					<p>당사 또는 여행자는 여행출발전 이 여행계약을 해제할 수 있습니다. 이 경우 발생하는 손해액은 '소비자 분쟁해결 기준' (공정거래위원회 고시)에 따라 배상합니다.</p> 
							
						<h6>1. 여행자의 여행계약 해제 요청이 있는 경우(여행자의 취소요청시) </h6>	
							<p>- 여행 개시 30일전(~30)까지 통보시 : 계약금환급 </p>
							<p>- 여행 개시 20일전까지(29~20) 통보시 : 상품가격의 10%배상 </p>
							<p>- 여행 개시 10일전까지(19~10) 통보시 : 상품가격의 15% 배상 </p>
							<p>- 여행 개시 8일 전까지(9~8) 통보시 : 상품가격의 20% 배상 </p>
							<p>- 여행 개시 1일 전까지(7~1) 통보시 : 상품가격의 30% 배상 </p>
							<p>- 여행 당일 통보시 : 상품가격의 50% 배상 </p>
						<h6>	2. 당사의 귀책사유로 취소 통보하는 경우 </h6>
							<p>- 여행 개시 30일전(~30)까지 통보시 : 계약금환급 </p>
							<p>- 여행 개시 20일전까지(29~20) 통보시 : 상품가격의 10%배상 </p>
							<p>- 여행 개시 10일전까지(19~10) 통보시 : 상품가격의 15% 배상 </p>
							<p>- 여행 개시 8일 전까지(9~8) 통보시 : 상품가격의 20% 배상 </p>
							<p>- 여행 개시 1일 전까지(7~1) 통보시 : 상품가격의 30% 배상 </p>
							<p>- 여행 당일 통보시 : 상품가격의 50% 배상 </p>
							<p>   단, 최저행사인원이 충족되지 않아 불가피하게 기획여행을 실시할 수 없는 경우에는 제9조(최저행사인원 미충족시 </p>
							<p>   계약해제)의 조항에 의거하여 당사가 여행자에게 배상한다</p>
							
							<p>일부 전세기 상품의 경우 별도의 취소료 규정이 적용되오니 일정표 하단의 예약시 유의사항을 참고해주세요</p>		
				</div>
		</div>
		</div>
		<div class="orderDiv" >
			<input type="checkbox" name="agree" ><label>동의합니다.</label>
		</div>
		<div class="orderDiv">
			<input type="submit" value="결제"/>
			<input type="reset" value="취소"/>
		</div>
	</div>
	</form>
</body>
</html>