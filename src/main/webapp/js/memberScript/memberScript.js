

function joinForm(form){
//	alert("!");
	if(form.member_id.value==""){
		alert("아이디는 반드시 입력하셔야합니다.");
		form.member_id.focus();
		return false;
	}
	
	if(form.member_password.value==""){
		alert("비밀번호는 반드시 입력하셔야 합니다.");
		form.member_password.focus();
		return false;
	}
	
	if(form.passwordCheck.value==""){
		alert("비밀번호 확인은 반드시 입력하셔야 합니다.");
		form.passwordCheck.focus();
		return false;
	}
	
	if(form.member_password.value.length < 6){
		alert("패스워드는 6글자 이상이어야 합니다.");
		form.member_password.focus();
		return false;
	}
	
	if(form.member_password.value != form.passwordCheck.value){
		alert("패스워드가 일치하지 않습니다.");
		form.passwordCheck.focus();
		form.passwordCheck.select();
		return false;
	}
	
	if(form.member_name.value==""){
		alert("이름은 반드시 입력하셔야 합니다.");
		form.member_name.focus();
		return false;
	}
	
	if(form.member_phone.value==""){
		alert("전화번호는 반드시 입력하셔야 합니다.");
		form.member_phone.focus();
		return false;
	}
	
	
   var re = /^[0-9]+$/;
   if(!re.test(form.member_phone.value)) {
          alert("숫자만 넣으셔야 합니다.");
          form.member_phone.focus();
          return false;
   }
   
   if(form.member_email.value==""){
	      alert("이메일 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
	   if(form.member_email.value.indexOf('@')==-1){
	      alert("이메일을 바르게 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
	   if(form.member_email.value.indexOf('@')==0){
	      alert("이메일을 바르게 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
	   if(form.member_email.value.indexOf('@')!=form.member_email.value.lastIndexOf('@')){
	      alert("이메일을 바르게 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
	   if(form.member_email.value.lastIndexOf('@')==form.member_email.value.length-1){
	      alert("이메일을 바르게 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
	   if(form.member_email.value.indexOf('.')==-1){
	      alert("이메일을 바르게 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
	   if(form.member_email.value.indexOf('.')==0){
	      alert("이메일을 바르게 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
	   if(form.member_email.value.indexOf('.')!=form.member_email.value.lastIndexOf('.')){
	      alert("이메일을 바르게 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
	   if(form.member_email.value.lastIndexOf('.')==form.member_email.value.length-1){
	      alert("이메일을 바르게 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
	   if(form.member_email.value.lastIndexOf('@')+2>form.member_email.value.indexOf('.')){
	      alert("이메일을 바르게 입력하세요.");
	      form.member_email.focus();
	      return false;
	   }
	   
   if(form.join1.checked==false){
	   alert("약관은 반드시 동의하셔야 합니다.");
	   form.join1.focus();
	   return false;
   }
   
   if(form.join2.checked==false){
	   alert("약관은 반드시 동의하셔야 합니다.");
	   form.join2.focus();
	   return false;
   }

}

function idCheck(idInputText,root){
	
//	var id=form.member_input_id.value;
	var id=idInputText.value;
	
// 첫문자가 영문자인지 확인
	var re1 = /^[a-zA-Z]*$/;
	var re2 = /^[0-9a-zA-Z]*$/;
	if(!re1.test(id.charAt(0))) {
		$("#exFieldi").remove();
		var str="<div id='exFieldi' style='color:red; font-size:12px;'>아이디 첫글자는 영어만 입력가능합니다.</div>";
		$("#memberId").append(str);
		return;
	}else{
		$("#exFieldi").remove();
	}
	
// 아이디에 영어 대소문자 숫자 이외의 문자가 있는지 확인
	if(!re2.test(id)) {
		$("#exFieldi").remove();
		var str="<div id='exFieldi' style='color:red; font-size:12px;'>아이디에는 영어와 숫자만 입력가능합니다.</div>";
		$("#memberId").append(str);
		return;
	}else{
		$("#exFieldi").remove();
	}
	 
// 아이디가 세글자 이상인지 확인
	if(id.length<3){
		$("#exFieldi").remove();
		var str="<div id='exFieldi' style='color:red; font-size:12px;'>아이디를 세자이상 입력하세요.</div>";
		$("#memberId").append(str);
		return;
	}else{
		$("#exFieldi").remove();
	}
	
//db에 중복아이디 있는지 확인
	var url=root+"/member/memberIdCheck.do?id="+id;
	// alert(url);
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			var result=data;
			// alert(result);
			/*<div id="exField">*/
			if(result=="same"){
				$("#exFieldi").remove();
				var str="<div id='exFieldi' style='color:red; font-size:12px;'>사용이 불가능한 아이디 입니다.</div>";
				$("#memberId").append(str);
			}else if(result=="ok"){
				$("#exFieldi").remove();
				var str="<div id='exFieldi' style='color:red; font-size:12px;'>사용가능한 아이디 입니다.</div>";
				$("#memberId").append(str);
			}
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	});
}

