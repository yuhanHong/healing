package com.healing.adminMember.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminMember.service.AdminMemberService;
import com.healing.member.dto.MemberDto;

/**
 * @이름 : AdminMemberController
 * @날짜 : 2015. 12. 21.
 * @개발자 : 김진수
 * @설명 : 관리자 회원관리
 */
@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	/**
	 * @함수이름 : adminMemberList
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 전체회원리스트
	 */
	@RequestMapping(value="/adminMember/adminMember.do", method=RequestMethod.GET)
	public ModelAndView adminMemberList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminMemberService.adminMemberList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : adminMemberSort
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보 정렬
	 */
	@RequestMapping(value="/adminMember/adminMemberSort.do", method=RequestMethod.GET)
	public ModelAndView adminMemberSort(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminMemberService.adminMemberSort(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : adminMemberSearch
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보 검색
	 */
	@RequestMapping(value="/adminMember/adminMemberSearch.do", method=RequestMethod.POST)
	public ModelAndView adminMemberSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminMemberService.adminMemberSearch(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : adminMemberPrice
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 누적금액으로 일괄검색
	 */
	@RequestMapping(value="/adminMember/adminMemberPrice.do", method=RequestMethod.GET)
	public ModelAndView adminMemberPrice(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		List<MemberDto> list=adminMemberService.adminMemberPrice(mav);
		
		JSONObject jso=new JSONObject();
		jso.put("data", list);
		try{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(jso.toString());        // out.print 내용을 ajax의 dataType이 jason인 놈에게 데이터 쏴줌
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * @함수이름 : adminMemberChangeLevel
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 누적금액으로 일괄검색된 회원들 일괄적으로 등급변경
	 */
	@RequestMapping(value="/adminMember/adminMemberChangeLevel.do",method=RequestMethod.POST)
	public ModelAndView adminMemberChangeLevel(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminMemberService.adminMemberChangeLevel(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : adminMemberUpdate
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보수정
	 */
	@RequestMapping(value="/adminMember/adminMemberUpdate.do",method=RequestMethod.GET)
	public ModelAndView adminMemberUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminMemberService.adminMemberUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : adminMemberUpdateOk
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수	
	 * @함수설명 : 회원정보수정
	 */
	@RequestMapping(value="/adminMember/adminMemberUpdateOk.do",method=RequestMethod.POST)
	public ModelAndView adminMemberUpdateOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("memberDto",memberDto);
		
		adminMemberService.adminMemberUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : adminMemberKick
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원추방
	 */
	@RequestMapping(value="/adminMember/adminMemberKick.do",method=RequestMethod.GET)
	public ModelAndView adminMemberKick(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminMemberService.adminMemberKick(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : adminMemberRestore
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수	
	 * @함수설명 : 추방 탈퇴된 회원복구
	 */
	@RequestMapping(value="/adminMember/adminMemberRestore.do",method=RequestMethod.GET)
	public ModelAndView adminMemberRestore(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminMemberService.adminMemberRestore(mav);
		
		return mav;
		
	}
}
