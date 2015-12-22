<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"/>
	<jsp:include page="../include/adminSide.jsp"/>
	
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<div>
		<div align="center">
			<form action="${root}/admin/infoInsert.do" name="infoForm" method="post" onsubmit="return infoForm()">
				<div>
					<h3>회사정보</h3>
				</div>
				<div>
					<label>회사이름 : </label>
					<input type="text" name="company_name"/>
				</div>
				<div>
					<label>회사대표이름 : </label>
					<input type="text" name="master_name"/>
				</div>
				<div>
					<label>회사주소 : </label>
					<input type="text" name="company_introduce"/>
				</div>
				<div>
					<label>사업자등록번호 : </label>
					<input type="text" name="company_number"/>
				</div>
				<div>
					<label>통신판매신고번호 : </label>
					<input type="text" name="report_number"/>
				</div>
				<div>
					<label>관광사업자등록번호 : </label>
					<input type="text" name="register_number"/>
				</div>
				<div>
					<label>고객센터 전화번호 : </label>
					<input type="text" name="customer_number"/>
				</div>
				<div>
					<label>개인정보관리책임자 : </label>
					<input type="text" name="person_charge"/>
				</div>
				<div>
					<label>부가설명 : </label>
					<input type="text" name="content"/>
				</div>
				<div>
					<label>팩스번호 : </label>
					<input type="text" name="fax_number"/>
				</div>
				<div>
					<input type="submit" value="전송"/>
					<input type="reset" value="취소"/>					
				</div>
			</form>
		</div>
	</div>
</body>
</html>