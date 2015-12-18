package com.healing.adminPushNotice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminPushNotice.dto.AdminPushNoticeDto;
import com.healing.adminPushNotice.service.AdminPushNoticeService;

@Controller
public class AdminPushNoticeController {

	@Autowired
	private AdminPushNoticeService adminPushNoticeService;
		
	//회원
	@RequestMapping(value="/adminPushNotice/adminPushNoticeRequest.do",method=RequestMethod.GET)
	public ModelAndView adminPushNoticeRequest(HttpServletRequest request, HttpServletResponse response,AdminPushNoticeDto adminPushNoticeDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		mav.addObject("response",response);
		
		mav.addObject("adminPushNoticeDto",adminPushNoticeDto);
		adminPushNoticeService.adminPushNoticeRequest(mav);
				
		return null;
	}
	
	//관리자
	@RequestMapping(value="/adminPushNotice/adminPushNotice.do",method=RequestMethod.GET)
	public ModelAndView adminOrderSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		
		adminPushNoticeService.adminPushNoticeGetRequest(mav);
				
		return mav;
	}
	@RequestMapping(value="/adminOrder/adminPushNoticeReadCheckUpdate.do",method=RequestMethod.GET)
	public ModelAndView adminPushNoticeReadCheckUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		
		adminPushNoticeService.adminPushNoticeReadCheckUpdate(mav);
				
		return mav;
	}
	
	@RequestMapping(value="/adminPushNotice/adminPushCheck.do",method=RequestMethod.GET)
	public ModelAndView adminPushCheck(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		mav.addObject("response",response);	
		
		adminPushNoticeService.adminPushCheck(mav);
				
		return null;
	}
	
}
