package com.healing.adminOrder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminOrder.service.AdminOrderService;

@Controller
public class AdminOrderController {
	
	@Autowired
	private AdminOrderService adminOrderService;
	
	@RequestMapping(value="/adminOrder/adminOrder.do",method=RequestMethod.GET)
	public ModelAndView AdminOrderSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		adminOrderService.adminOrderSearch(mav);
				
		return mav;
	}
	
	@RequestMapping(value="/adminOrder/adminOrderSearchOne.do",method=RequestMethod.GET)
	public ModelAndView AdminOrderSearchOne(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminOrderService.adminOrderSearchOne(mav);
		return mav;
	}
	
	@RequestMapping(value="/adminOrder/adminOrderSearchMulti.do",method=RequestMethod.GET)
	public ModelAndView AdminOrderSearchMulti(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminOrderService.adminOrderSearchMulti(mav);
		return mav;
	}
}
