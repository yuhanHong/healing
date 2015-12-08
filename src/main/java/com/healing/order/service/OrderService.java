package com.healing.order.service;

import org.springframework.web.servlet.ModelAndView;

public interface OrderService {

	public void orderProductRead(ModelAndView mav);
	public void orderInsert(ModelAndView mav);
}
