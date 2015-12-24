function bargainFormCheck(form){
	if (form.bargain_day1.value==null) form.bargain_day1.value=0;
	if (form.bargain_rate1.value==null) form.bargain_rate1.value=0;
	if (form.bargain_day2.value==null) form.bargain_day2.value=0;
	if (form.bargain_rate2.value==null) form.bargain_rate2.value=0;

	if (form.bargain_day1.value!=null && form.bargain_day1.value>0 && form.bargain_rate1.value!=null && form.bargain_rate1.value>0 && form.bargain_day2.value!=null && form.bargain_day2.value>0 && form.bargain_rate2.value!=null && form.bargain_rate2.value>0 && Number.parseInt(form.bargain_day1.value)<=Number.parseInt(form.bargain_day2.value)) {
		form.bargain_day2.select();
		alert("할인율2 시작일은 할인율1 시작일보다 작아야 합니다.")
		return false;
	}

	if (form.bargain_rate1.value==0) form.bargain_day1.value=0;
	if (form.bargain_rate2.value==0) form.bargain_day2.value=0;
	if (form.bargain_day1.value==0) form.bargain_rate1.value=0;
	if (form.bargain_day2.value==0) form.bargain_rate2.value=0;
	
	return confirm("할인율을 수정하시겠습니까?");
}