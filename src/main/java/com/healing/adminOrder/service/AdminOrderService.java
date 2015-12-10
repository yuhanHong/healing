package com.healing.adminOrder.service;

import org.springframework.web.servlet.ModelAndView;

public interface AdminOrderService {

	public void adminOrderSearch(ModelAndView mav);
	public void adminOrderSearchOne(ModelAndView mav);
	public void adminOrderSearchMulti(ModelAndView mav);
	public void adminOrderRead(ModelAndView mav);
	public void adminOrderModyfy(ModelAndView mav);
	public void adminOrderPay(ModelAndView mav);
	public void adminOrderCancle(ModelAndView mav);
}
