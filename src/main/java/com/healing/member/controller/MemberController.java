package com.healing.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.member.dto.MemberDto;
import com.healing.member.service.MemberService;

/**
 * @이름 : MemberController
 * @날짜 : 2015. 12. 7.
 * @개발자 : 김진수
 * @설명 : 회원관리 컨트롤러
 */
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/memberJoin.do",method=RequestMethod.GET)
	public ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		memberService.memberJoin(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/memberJoinOk.do",method=RequestMethod.POST)
	public ModelAndView memberJoinOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberDto",memberDto);
		memberService.memberJoinOk(mav);
		
		return mav;
	}

}
