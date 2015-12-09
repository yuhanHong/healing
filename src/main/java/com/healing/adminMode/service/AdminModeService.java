package com.healing.adminMode.service;

import org.springframework.web.servlet.ModelAndView;

public interface AdminModeService {
	public void adminModeCreateOk(ModelAndView mav);
	
	public void adminModeLogin(ModelAndView mav);
	
	public void adminModeUpdate(ModelAndView mav);
}
