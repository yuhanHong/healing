package com.healing.memberMypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.memberMypage.service.MemberMypageService;

@Controller
public class MemberMypageController {
	
	@Autowired
	private MemberMypageService memberMypageService;
	
	@RequestMapping(value="/memberMypage/memberMypage.do",method=RequestMethod.GET)
	public ModelAndView memberMypage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.setViewName("memberMypage/memberMypage");
		
		return mav;
	}
}
