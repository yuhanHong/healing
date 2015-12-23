
function payCompl(root,order_number,member_number,order_pay,order_money){
	 var check=confirm("결제 및 환불이 완료 되었습니까?");
	 
	 if(check!=true){
		 return false;
	 }
	 
	 location.href=root+"/adminOrder/adminOrderPay.do?order_number="+order_number+"&member_number="+member_number+"&order_pay="+order_pay+"&order_money="+order_money;
}

function orderCancel(root,order_number,member_number,order_pay){
	 var check=confirm("주문취소 및 환불을 하시겠습니까?");
	 
	 if(check!=true){
		 return false;
	 }
	 
	 location.href=root+"/adminOrder/adminOrderCancel.do?order_number="+order_number+"&member_number="+member_number+"&order_pay="+order_pay;
}