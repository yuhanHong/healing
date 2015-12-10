package com.healing.adminMember.service;

import org.springframework.web.servlet.ModelAndView;

public interface AdminMemberService {
	
	public void adminMemberList(ModelAndView mav);
	
	public void adminMemberSort(ModelAndView mav);
	
	public void adminMemberSearch(ModelAndView mav);
	
	public void adminMemberPrice(ModelAndView mav);
}
