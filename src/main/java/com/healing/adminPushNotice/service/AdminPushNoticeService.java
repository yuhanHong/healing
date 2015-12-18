package com.healing.adminPushNotice.service;

import org.springframework.web.servlet.ModelAndView;

public interface AdminPushNoticeService {

	//회원
	public void adminPushNoticeRequest(ModelAndView mav);
	
	//관리자
	public void adminPushNoticeGetRequest(ModelAndView mav);
	public void adminPushNoticeReadCheckUpdate(ModelAndView mav);
	public void adminPushCheck(ModelAndView mav);
}
