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
	
	@RequestMapping(value="/memberMypage/memberMypageRe.do",method=RequestMethod.GET)
	public ModelAndView memberMypageRe(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.setViewName("memberMypage/memberMypageRe");
		
		return mav;
	}
	
	@RequestMapping(value="/memberMypage/memberMypageReply.do",method=RequestMethod.POST)
	public ModelAndView memberMypageReply(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		memberMypageService.memberMypageReply(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/memberMypageOrder.do",method=RequestMethod.GET)
	public ModelAndView memberMypageOrder(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		memberMypageService.memberMypageOrder(mav);
		
		return mav;
	}
	
}
