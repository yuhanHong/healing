<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root}/css/member/memberJoin.css"/>
<script type="text/javascript" src="${root}/js/memberScript/memberScript.js"></script>
<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>

</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	
<div id="joinTotal">
	<div class="outline_class" style="margin-left: 290px;">
		<div class="content_class">
		
			<div style="float:left;margin-top:5px;font-size: 13px;">
				<img src="${root}/resources/boardImg/img01.PNG" align="center">
				<h2 style="display:inline;"><span style="font-weight: bold; ">회원가입</span></h2>
			</div>
				
			<hr style="border:2px solid green; margin-top: 41px;">
			<div class="content" style="width: 950px;">
			<h4>※표시가 있는부분은 반드시 입력해 주십시오.</h4>
			<form action="${root}/member/memberJoinOk.do" name="memberForm" method="POST"  onsubmit="return joinForm(this)">

					<div id="memberSection">
						<div id="memberId">
							<div id="subj">※ 아이디</div>
							<div id="fieldDiv">
								<input type="text" size="30" id="field" name="member_id" size="20" maxlength="10" oninput="idCheck(this,'${root}')"/>
							</div>
							<div id="exFieldi">&nbsp;</div>
						</div>
						
						<div>
							<div id="subj">※ 비밀번호</div>
							<div id="fieldDiv">
								<input type="password" size="30" id="field" name="member_password"/>
							</div>
							<div id="exField">&nbsp;</div>
						</div>
						<div>
							<div id="subj">※ 비밀번호확인</div>
							<div id="fieldDiv">
								<input type="password" size="30" id="field" name="passwordCheck"/>
							</div>
							<div id="exField">&nbsp;</div>
						</div>
						<div>
							<div id="subj">※ 이름</div>
							<div id="fieldDiv">
								<input type="text" size="30" id="field" name="member_name"/>
							</div>
							<div id="exField">&nbsp;</div>
						</div>
						<div>
							<div id="subj">※ 전화번호</div>
							<div id="fieldDiv">
								<input type="text" size="30" id="field" name="member_phone"/>
							</div>
							<div id="exField">&nbsp;</div>
						</div>
						<div>
							<div id="subj">※ 이메일</div>
							<div id="fieldDiv">
								<input type="text" size="12" id="field" name="member_email"/>@<input type="hidden" name="member_email" value="@" size="1" id="field"><input type="text" name="member_email" size="12" id="field">
								<select name="member_email_sel" id="field">
									<option value="self_input"> 직접입력 </option>
									<option value="naver.com"> naver.com </option>
									<option value="hanmail.net"> hanmail.net </option>
									<option value="nate.com"> nate.com </option>
									<option value="google.com"> google.com </option>
									<option value="yahoo.com"> yahoo.com </option>
									<option value="facebook.com"> facebook.com </option>
								</select>
							</div>
						</div>
						<div>
							<div id="exField" style="width:700px">
								<div id="subj">이메일 수신동의&nbsp;</div>
									<input type="radio" name="member_email_check" value="yes"/>
									yes
									<input type="radio" name="member_email_check" value="no" checked="checked"/>
									no
							</div>
						</div>
					</div>
					<br/><div id="subj" style="margin-left: 50px;">관심 여행지</div>
					<div>
						
						<div id="tabs" style="width:500px;margin-left: 150px; font-size: 12px;">
						  <ul>
						    <li><a href="#tabs-1">동남아</a></li>
						    <li><a href="#tabs-2">중국</a></li>
						    <li><a href="#tabs-3">일본</a></li>
						  </ul>
						  <div id="tabs-1" style="width:600px;">
						    <p>
							    <input type="checkbox" name="interest_content" value="캄보디아"/>캄보디아 &nbsp;&nbsp;
							    <input type="checkbox" name="interest_content" value="태국"/>태국 &nbsp;&nbsp;
							    <input type="checkbox" name="interest_content" value="필리핀 "/>필리핀 &nbsp;&nbsp;
							   	<input type="checkbox" name="interest_content" value="말레이시아 "/>말레이시아 &nbsp;&nbsp;
							</p>
						  </div>
						  <div id="tabs-2" style="width:600px;">
						    <p>
						    	<input type="checkbox" name="interest_content" value="북경 "/>북경	 &nbsp;&nbsp;
						    	<input type="checkbox" name="interest_content" value="상해 "/>상해 &nbsp;&nbsp;
						    	<input type="checkbox" name="interest_content" value="장가계 "/>장가계 &nbsp;&nbsp;
						    	<input type="checkbox" name="interest_content" value="백두산 "/>백두산 &nbsp;&nbsp;
						    </p>
						  </div>
						  <div id="tabs-3" style="width:600px;">
						    <p>
						    	<input type="checkbox" name="interest_content" value="도쿄"/>도쿄 &nbsp;&nbsp;
						    	<input type="checkbox" name="interest_content" value="오사카"/>오사카 &nbsp;&nbsp;
						    	<input type="checkbox" name="interest_content" value="오키나와"/>오키나와 &nbsp;&nbsp;
							    <input type="checkbox" name="interest_content" value="훗카이도"/>훗카이도 &nbsp;&nbsp;
						   		<input type="checkbox" name="interest_content" value="쿄토"/>쿄토 &nbsp;&nbsp;
						    </p>
						  </div>
					  </div>
					</div>
					<div style="margin-top: 30px; margin-left: 50px;" >
						<b>이용 약관</b>
					</div>
					<div style="margin-top: 30px; margin-left:50px; " >
						<textarea rows="6" cols="100" style="resize:none; font-size: 12px;">
				▶제 1장 총칙
제1조(목적)
1. 이 약관은 전기통신사업법 및 동법 시행령에 의하여 (주)힐링여행사 (이하 당사라 한다)가 제공하는 인터넷 여행 서비스(이하 서비스)인 healing.com의 이용조건, 절차, 그리고 회원규칙에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합시다.
제2조(약관의 효력과 준용)
1. 이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로서 효력을 발생합니다.
2. 당사는 이 규정을 변경할 수 있으며, 변경된 규정은 제1항과 같은 방법으로 규정함으로써 효력을 발생합니다.
제3조(약관 외 준칙)
1. 이 약관에 명시되지 않은 사항은 전기통신본법, 전기통신사업사업법 및 기타관계 법령의 규정에 따릅니다.
제4조(용어의 정의)
1. 이 규정에서 사용하는 용어의 정의는 다음과 같습니다.
가. 이용자 : 당사가 제공하는 서비스를 이용하는 모든 자
나. 회원 : 이용자 중 당사와 서비스 이용계약을 체결한 자
다. 아이디 : 회원식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인한 문자 또는 이루어진 조합
라. 비밀번호 : 회원이 부여받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 정한 문자와 숫자의 조합
마. 해지 : 회사 또는 회원이 서비스 개통 후 이용계약을 해약하는 것
제 2 장 회원가입과 서비스 이용 계약
제5조(이용계약의 성립)
1. 이용 계약은 이용자의 이용 신청에 대한 당사의 이용 응낙과 이용자의 약관 내용에 대한 동의로 성립됩니다.
2. 회원에 가입하여 서비스를 이용하고자 하는 희망자는 당사에서 요청하는 개인 신상정보를 제공해야 합니다.
3. 회원에 가입하여 서비스를 이용하고자 하는 희망자는 지정된 온라인 가입신청 양식에 정보를 필수로 제공하며, 그 외의 정보는 선택사항으로 합니다.
-이용자 번호(ID) -비밀번호(PASSWORD)-이름(실명/영문명) -주민등록번호-전화번호와 주소
4. 위의 내용 이외에도 당사가 필요하다고 인정되는 내용을 추가로 덧붙일 수 있으며, 이 사실을 공고합니다.
제6조(이용신청의 승낙)
1. 당사는 이용자가 제2장 3조에서 정한 사항을 정확히 기재하여 이용신청을 하였을 때 승낙합니다.
2. 당사는 다음에 해당하는 이용신청에 대하여서는 승낙을 유보할 수 있습니다.
- 설비에 여유가 없거나 기술상 지장이 있는 경우 - 기타 본사가 필요하다고 인정되는 경우
3. 당사는 다음에 해당하는 이용신청에 대하여서는 이를 응낙하지 아니할 수 있습니다.
- 이름이 실명이 아닌 경우
- 다른 사람의 명의를 사용하여 신청한 경우
- 이용신청시 필요내용을 허의로 기재하여 신청한 경우
- 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
- 기타 당사가 정한 이용신청요건이 미비된 경우
- 기타 당사가 정한 이용신청요건이 미비되었을 때
제7조(계약사항의 변경)
1. 회원은 이용신청시 기재한 사항이 변경되었을 경우에는 온라인을 통해 수정을 해야합니다. 수저을 하지 않아서 발생하는 이용자의 피해에 대한 책임은 이용자에게 있습니다.
제8조(개인정보의 보호)
1. 당사는 서비스 이용자의 정보수집시 반드시 당해 이용자의 동의를 얻어 필요한 최소한의 정보만을 수집하며, 이용자는 온라인을 통하여 수시로 본인의 신장정보를 열람, 정정 또는 삭제할 수 있습니다.
2. 당사는 이용고객의 개인 신상정보를 본인의 동이없이는 절대 제3자에게 제공, 분실 또는 유출하여서는 아니되며 이를 지키지 않아서 발생하는 고객의 모든 피해에 대한 책임은 당사에 있습니다. 단, 다음의 각호에 해당하는 경우에는 예외로 합니다.
가. 전기통신기본법 등 관계법령에 의해 국가기관 등의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우
다. 배송 업무상 배송업체에게 고객의 정보를 알려주는 경우
라. 은행업무상 관련사항에 한하여 일부 정보를 공유하는 경우
마. 특정인을 식별할 수 없는 통계작성, 홍보자료, 학술연구 등의 목적인 경우
바. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
이용자의 동의 없이 개인정보가 유출되는 등 부당한 사례에 발견했을 때에는
전화 02-654-4111, 한국소비자보호원, 경실련 등을 통해 신고할 수 있으며,
이에 대해 본사는 적절한 조치를 취할 의무가 있습니다.
제 3 장 서비스 이용
제9조(회원 아이디, 이메일, 비밀번호 관리에 대한 의무)
1. 아이디, 이메일과 비밀번호에 관한 모든 관리책임은 회원에게 있습니다. 회원에게 부여된 아이디(ID), 이메일(E-mail), 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
2. 자신의 아이디(ID), 이메일(E-mail)과 비밀번호가 부정하게 사용된 경우 회원은 반드시 당사에 그 사실을 통보해야 합니다.
제10조(서비스 종류)
1. 당사는 서비스의 내용과 종류를 변경할 수 있으며, 변경사항은 공지사항을 통하여 공지합니다. 서비스의 종류는 아래와 같습니다.
가. 인터넷 온라인을 통한 항공/호텔예약/판매
나. 인터넷 온라인을 통한 여행상품 예약/판매
다. 기타 여행관련 상품 및 정보 서비스
제11조(정보의 제공)
1.당사는 이용자가 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서 전자우편, 유선매체, 서신우편 등의 방법으로 이용자에게 제공할 수 있습니다.
제12조(서비스 제공의 중지)
1. 당사는 다음 각 호에 해당하는 경우 서비스의 일부 혹은 전부의 제공을 중지할 수 있습니다
가. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우
나. 전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지했을 경우
다. 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주등으로 정상적인 서비스 이용에 지장이 있는 경우
제13조(당사의 서비스 유지책임)
1. 당사는 서비스 제공설비를 항상 운용가능한 상태로 유지하고 서비스 제공을 위한 설비에 장애가 발생하거나 또는 그 설비가 멸실될 때에는 이를 신속하게 수리, 복구합니다.
제14조(이용자의 의무)
1. 이용자는 서비스를 이용할 때 다음 각호의 행위를 하지 않아야 합니다.
가. 부정한 ID를 사용하는 행위
나. 서비스에서 얻은 정보를 회사의 사전승낙없이 회원의 이용이외의 목적으로 복제하거나 이를 출판 및 방송 등에 사용하거나 제3자에게 제공하는 행위
다. 제3자의 저작권 등 기타 권리를 침해하는 행위
라. 범죄와 결부된다고 객관적으로 판단되는 행위
마. 기타 관계법령에 위배되는 행위
2. 이용자는 이 규정에서 규정하는 사항과 서비스 이용안내, 공지사항에 기재하거나 별도로 공지한 이용제한 사항을 준수하여야 합니다.
3. 이용자는 회사의 사전승낙없이는 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동의 결과와 이용자가 규정에 위반한 영업활동을 이용하여 발생한 결과에 대하여 책임을 지지 않습니다.
제 4 장 서비스 이용요금
제15조(요금의 체계 등)
1. 당사가 제공하는 서비스 요금체계는 다음과 같습니다.
-가입 : 무료-여행관련 정보열람 : 무료-여행관련 서비스 예약 및 판매 : 유료-당사는 서비스 요금을 변경할 수 있으며, 요금에 관한 세부사항은 따로 공지합니다.
제 5 장 계약의 해지 및 서비스 이용제한
제16조(계약해지)
1. 회원이 이용계약을 해지하고자 하는 때에는 회원본인이 온라인을 통해 회사에 해지 신청을 하여야 합니다.
2. 당사는 회원이 다음 각 호에 해당하는 행위를 하였을 경우 사전통지없이 이용계약을 해지하거나 기간을 정하여 서비스 이용을 중지할 수 있습니다.
가. 부정한 ID를 사용하거나 이메일(E-mail) 및 비밀번호를 도용한 경우
나. 서비스 운영을 고의로 방해한 경우
다. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우
라. 타인의 명예를 손상시키거나 불이익을 주는 경우
마. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행하는 경우
바. 기타 회사가 정한 이용조건에 위배되는 경우
제17조(이용제한에 관한 사항)
1. 당사가 제 5 장 제1조 2항 각호의 규정에 의하여 이용제한을 하고자 하는 경우에는 그 사유과 일시, 기간, 기타사항을 정하여 이메일(E-mail)이나 기타방법에 의하여 해당 이용자나 대리인에게 통지합니다. 단, 회사가 긴급하게 이용을 정지할 필요가 있다고 인정하는 경우에는 그러하지 아니합니다.
2. 제1항의 규정에 의해 이용제한의 통지를 받은 이용자 또는 대리인은 그 이용정지의 통지에 대하여 이의가 있을 경우 이의신청을 할 수 있습니다.
3. 당사는 제2항의 규정에 의한 이의신청에 대하여 그 확인을 위한 기간까지 이용정지를 일시 연기할 수 있으며, 그 결과를 이용자 또는 그 대리인에게 통지합니다.
4. 회사는 이용정지 기간중에 그 이용정지 사유가 해소된 것이 확인된 경우에는 이용정지 조치를 즉시 해제합니다.
제 6 장 손해배상 및 면책조항
제18조(손해배상에 관한 사항)
1. 당사는 무료 서비스 이용과 관련하여 이용자에게 발생한 어떠한 손해에 관하여도 책임지지 않습니다.?? 2. 당사는 유료로 제공되는 서비스와 관련되어 회사의 귀책사유로 발생하는 모든 손해에 관하여 관계법률이 정하는 손해배상을 해당회원에게 하여야 합니다.
제19조(면책조항)
1. 당사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
2. 당사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.
3. 당사는 회원이 서비스를 이용하여 기대되는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.
4. 당사는 회원이 서비스에 게제한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다
제20조(관할법원)
1. 서비스의 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.
				</textarea>
					</div>
					<div>
						<input style="margin-top: 30px; margin-left: 520px;" type="checkbox" value="join1" name="join1"/> 위 약관에 동의합니다.
					</div>
					<div style="margin-top: 30px; margin-left: 50px;" >
							<b>	개인정보 취급 방침</b>
					</div>
					<div style="margin-top: 30px; margin-left:50px; ">
						<textarea rows="6" cols="100" style="resize:none; font-size: 12px;">
				■ 수집하는 개인정보 항목
  회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
  ο 수집항목 : 이름 , 성별, 주민번호, 로그인 아이디 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 여권정보
  ο 개인정보 수집방법 : 예약시 신청자 및 여행자 정보입력 
■ 개인정보의 수집 및 이용목적 및 제 3자 정보제공
  회사는 수집한 개인정보를 서비스 제공에 관한 계약 이행의 목적을 위해 활용합니다.
  ο 항공권 예약시 항공사에 정보제공 : 이름, 여권정보(영문명, 여권번호, 여권만료일)
  ο 숙박 예약시 호텔,호스텔,민박에 정보제공 : 이름, 영문명
  ο 투어 예약시 현지 투어진행사에 정보제공 : 이름, 영문명
  ο 보험 계약시 보험사에 정보제공 : 이름, 주민번호
■ 개인정보의 보유 및 이용기간
  회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
				
						</textarea>
					</div>
					<div>
						<input  style="margin-top: 30px; margin-left: 520px;" type="checkbox" name="join2"/> 위 약관에 동의합니다.
					</div>
					<div id="mj_su_button">
						<input type="submit" value="가입"/>
						<input type="button" value="취소" onclick="location.href='${root}/'"/>
					</div>
			
			</form>
		</div>
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>