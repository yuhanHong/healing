package com.healing.adminMember.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminMember.service.AdminMemberService;

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/adminMember/adminMember.do", method=RequestMethod.GET)
	public ModelAndView adminMemberList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminMemberService.adminMemberList(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/adminMember/adminMemberSort.do", method=RequestMethod.GET)
	public ModelAndView adminMemberSort(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminMemberService.adminMemberSort(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/adminMember/adminMemberSearch.do", method=RequestMethod.POST)
	public ModelAndView adminMemberSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminMemberService.adminMemberSearch(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/adminMember/adminMemberPrice.do", method=RequestMethod.GET)
	public ModelAndView adminMemberPrice(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		
		adminMemberService.adminMemberPrice(mav);
		
		return mav;
	}
}
