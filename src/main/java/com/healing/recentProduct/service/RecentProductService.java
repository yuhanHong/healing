package com.healing.recentProduct.service;

import org.springframework.web.servlet.ModelAndView;

public interface RecentProductService {
	public void recentProductRead(ModelAndView mav);
	
	/*public void recentProductReadList(ModelAndView mav);*/
	
	public void paging(ModelAndView mav);
	
	public void recentProductList(ModelAndView mav);
}
