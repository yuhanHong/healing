<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/boardFaq/boardFaq.css"/>
<style type="text/css">
#companyinfo li{

display: block;
float: left;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="outline_class">
	<jsp:include page="companySide.jsp"/>
	
	<div class="content_class">
		<div>
			<div style="float:left;">
				<img src="${root}/resources/boardImg/img01.PNG" align="center">
				<h2 style="display:inline;"><span style="font-weight: bold; ">회사정보</span></h2>
			</div>
			
		</div>		
		<hr style="border:2px solid green; margin-top: 36px;">
		<ul id="companyinfo">
					<li><img src="${root}/resources/companyinfo/companyinfo.JPG"></li>
					<li style="margin-top: 30px;margin-left: 20px; color: #333; text-align: left"><div>
						&nbsp;전 세계를 향해 끊임없이 도전하여 세계적인 글로벌No.1 문화관광 유통그룹으로 <br/>나아가겠습니다.
						힐링투어는 국내 및 해외에서 3,200여 명이 넘는 직원이 여행서비스를 <br/>제공하는 국내 최대 여행기업으로, 
						15년 연속 해외여행 및 항공권 판매 1위를 달성하고 있는 1등<br/> 여행종합기업입니다.
						힐링투어는 최고의 여행전문 인력과 전 세계 29개 지역을<br/> 커버하는 직영 네트워크를 통해 한 차원 높은 여행서비스를
						제공함으로써 <br/>여행산업의 질적 양적 성장을 동시에 이끌어왔으며, 고객 만족도와 여행사 <br/>선호도 조사에서 확고한 선두 지위를 확보하고 있습니다.
						<br/>
						&nbsp;또한, 힐링투어는 여행산업에 혁신적인 IT 시스템을 접목하여 생산성과 수익성을 높이고 시장 지위를<br/> 지속적으로 확장하며,
						2006년 세계 3대 증권시장 중 하나인 런던증권거래소(LSE)에 상장하여<br/> 하나투어 기업경영의 투명성과 신뢰도를 국제적으로 
						공인 받는 동시에 <br/>세계적인 기업으로 성장하는 발판을 마련하였습니다.<br/>
						&nbsp;힐링투어는 여행업 중심의 사업영역을 관광개발과 문화상품 제작∙유통업 등의<br/> 분야로 확장하여 2020년 글로벌 No.1
						문화관광 유통그룹으로 성장하고자 합니다.<br/> 인적자원의 글로벌 역량을 강화하고,<br/> 문화관광 유통 관련 사업의 역량을 강화하여
						 고객에게 세계 최고의<br/> 문화관광 유통 서비스를 제공하는 기업으로 성장하겠습니다. 
					</div></li>
				</ul>	

		</div>
	</div>
	<!-- 최근 본 상품 include 된 부분 -->
<%-- 	<c:import url="../recentProduct/recentProduct.jsp"/> --%>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>