package com.healing.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
	public void memberJoin(ModelAndView mav);
	
	public void memberJoinOk(ModelAndView mav);

}
