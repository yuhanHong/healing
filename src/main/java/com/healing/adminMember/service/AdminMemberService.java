package com.healing.adminMember.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.healing.member.dto.MemberDto;

public interface AdminMemberService {
	
	public void adminMemberList(ModelAndView mav);
	
	public void adminMemberSort(ModelAndView mav);
	
	public void adminMemberSearch(ModelAndView mav);
	
	public List<MemberDto> adminMemberPrice(ModelAndView mav);
	
	public void adminMemberChangeLevel(ModelAndView mav);
	
	public void adminMemberUpdate(ModelAndView mav);
	
	public void adminMemberUpdateOk(ModelAndView mav);
	
	public void adminMemberKick(ModelAndView mav);
	
	public void adminMemberRestore(ModelAndView mav);
}
