package com.healing.adminMember.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.healing.member.dto.MemberDto;

public interface AdminMemberService {
	
	public void adminMemberList(ModelAndView mav);
	
	public void adminMemberSort(ModelAndView mav);
	
	public void adminMemberSearch(ModelAndView mav);
	
	public List<MemberDto> adminMemberPrice(ModelAndView mav);
}
