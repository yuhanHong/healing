package com.healing.adminMode.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminMode.dto.AdminModeDto;
import com.healing.adminMode.service.AdminModeService;

@Controller
public class AdminModeController {
	@Autowired
	private AdminModeService adminModeService;
	
	@RequestMapping(value="/adminMode/adminModeCreate.do",method=RequestMethod.GET)
	public ModelAndView adminModeCreate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("adminMode/adminModeCreate");
		
		return mav;
	}
	
	@RequestMapping(value="/adminMode/adminModeCreateOk.do",method=RequestMethod.POST)
	public ModelAndView adminModeCreateOk(HttpServletRequest request, HttpServletResponse response, AdminModeDto adminModeDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("adminModeDto",adminModeDto);
		
		adminModeService.adminModeCreateOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/adminMode/adminModeLogin.do",method=RequestMethod.POST)
	public ModelAndView adminModeLogin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminModeService.adminModeLogin(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/adminMode/adminModeLogout.do",method=RequestMethod.GET)
	public ModelAndView adminModeLogout(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.setViewName("adminMode/adminModeLogout");
		return mav;
	}
	
	@RequestMapping(value="/adminMode/adminModeUpdate.do",method=RequestMethod.GET)
	public ModelAndView adminModeUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminModeService.adminModeUpdate(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/adminMode/adminModeUpdateOk.do",method=RequestMethod.POST)
	public ModelAndView adminModeUpdateOk(HttpServletRequest request, HttpServletResponse response,AdminModeDto adminModeDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("adminModeDto",adminModeDto);
		
		adminModeService.adminModeUpdateOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/adminMode/adminModeDelete.do",method=RequestMethod.GET)
	public ModelAndView adminModeDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminModeService.adminModeDelete(mav);
		return mav;
	}
}
