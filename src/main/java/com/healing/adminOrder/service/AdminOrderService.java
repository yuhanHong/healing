package com.healing.adminOrder.service;

import org.springframework.web.servlet.ModelAndView;

public interface AdminOrderService {

	public void adminOrderSearch(ModelAndView mav);
	public void adminOrderSearchOne(ModelAndView mav);
	public void adminOrderSearchMulti(ModelAndView mav);
}
