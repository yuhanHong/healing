
function joinForm(form){
/*	if(form.member_id.value==""){
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
*/

}

function idCheck(form,root){
	
	var id=form.member_id.value;

	var url=root+"/member/memberIdCheck.do?id="+id;
	// alert(url);
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			var result=data;
			// alert(result);
			
			if(result=="same"){
				$("#idCheck").remove();
				var str="<div id='idCheck' style='color:red;'>사용이 불가능한 아이디 입니다.</div>";
				$("#memberId").prepend(str);
			}else if(result=="ok"){
				$("#idCheck").remove();
				var str="<div id='idCheck' style='color:red;'>사용가능한 아이디 입니다.</div>";
				$("#memberId").prepend(str);
			}
			
		},
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	});
}

