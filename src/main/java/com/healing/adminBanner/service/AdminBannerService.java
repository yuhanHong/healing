package com.healing.adminBanner.service;

import org.springframework.web.servlet.ModelAndView;

public interface AdminBannerService {
	public void bannerInsert(ModelAndView mav);
	
	public void bannerSearch(ModelAndView mav);
	
	public void bannerRecommandInsert(ModelAndView mav);
	
	public void bannerRecommandSelect(ModelAndView mav);
	
	public void bannerRecommandDelete(ModelAndView mav);
}
