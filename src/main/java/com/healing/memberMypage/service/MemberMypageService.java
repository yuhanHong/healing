package com.healing.memberMypage.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.healing.freeplan.dto.FreePlanDto;

public interface MemberMypageService {
	
	public void memberMypageReply(ModelAndView mav);
	
	public void memberMypageOrder(ModelAndView mav);
	
	public void memberMypageRe(ModelAndView mav);
	
	public void memberMypageFreeplan(ModelAndView mav);
	public List<FreePlanDto> memberMypagePrintMarker(ModelAndView mav);
	public void memberMypageDeletePlan(ModelAndView mav);
}
