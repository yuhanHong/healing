package com.healing.memberMypage.controller;

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

import com.healing.freeplan.dto.FreePlanDto;
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
		
		memberMypageService.memberMypageRe(mav);
		
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
	
	@RequestMapping(value="/memberMypage/memberFreeplan.do",method=RequestMethod.GET)
	public ModelAndView memberFreeplan(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		memberMypageService.memberMypageFreeplan(mav);
		return mav;
	}
	
	@RequestMapping(value="/memberMypage/memberMypagePrintMarker.do", method=RequestMethod.GET)
	public ModelAndView memberMypagePrintMarker(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		List<FreePlanDto> freePlanList = memberMypageService.memberMypagePrintMarker(mav);
		
		JSONObject obj = new JSONObject();
		obj.put("data", freePlanList);
		try{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(obj.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null; 
	}
	
	@RequestMapping(value="/memberMypage/memberMypageDeletePlan.do", method=RequestMethod.GET)
	public ModelAndView memberMypageDeletePlan(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		memberMypageService.memberMypageDeletePlan(mav);
		
		return mav;
	}
	
}
