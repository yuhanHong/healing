package com.healing.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.member.dto.InterestDto;
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
	

	/**
	 * @함수이름 : memberJoin
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원가입
	 */
	@RequestMapping(value="/member/memberJoin.do",method=RequestMethod.GET)
	public ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		memberService.memberJoin(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberJoinOk
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원가입
	 */
	@RequestMapping(value="/member/memberJoinOk.do",method=RequestMethod.POST)
	public ModelAndView memberJoinOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto, InterestDto interestDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberDto",memberDto);
		mav.addObject("request",request);
		mav.addObject("interestDto",interestDto);
		memberService.memberJoinOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberIdCheck
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 아이디체크
	 */

	@RequestMapping(value="/member/memberIdCheck.do",method=RequestMethod.GET)
	public ModelAndView memberIdCheck(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		
		memberService.memberIdCheck(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : memberLogin
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 로그인
	 */
	@RequestMapping(value="/member/memberLogin.do",method=RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		
		memberService.memberLogin(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberLogOut
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 로그아웃
	 */
	@RequestMapping(value="/member/memberLogout.do",method=RequestMethod.GET)
	public ModelAndView memberLogOut(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/logOut");
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberDelete
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원탈퇴
	 */
	@RequestMapping(value="/member/memberDelete.do",method=RequestMethod.GET)
	public ModelAndView memberDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		memberService.memberDelete(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberDeleteOk
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원탈퇴
	 */
	@RequestMapping(value="/member/memberDeleteOk.do",method=RequestMethod.POST)
	public ModelAndView memberDeleteOk(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		memberService.memberDeleteOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberUpdate
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보수정
	 */
	@RequestMapping(value="/member/memberUpdate.do",method=RequestMethod.GET)
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		memberService.memberUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberUpdateOk
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보수정
	 */
	@RequestMapping(value="/member/memberUpdateOk.do",method=RequestMethod.POST)
	public ModelAndView memberUpdateOk(HttpServletRequest request, HttpServletResponse response,MemberDto memberDto, InterestDto interestDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("memberDto",memberDto);
		mav.addObject("interestDto",interestDto);
		memberService.memberUpdateOk(mav);
		
		return mav;
	}
	
}
