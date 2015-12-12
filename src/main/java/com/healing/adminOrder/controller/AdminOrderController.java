package com.healing.adminOrder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminOrder.service.AdminOrderService;
import com.healing.order.dto.OrderDto;

@Controller
public class AdminOrderController {
	
	@Autowired
	private AdminOrderService adminOrderService;
	
	@RequestMapping(value="/adminOrder/adminOrder.do",method=RequestMethod.GET)
	public ModelAndView adminOrderSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		adminOrderService.adminOrderSearch(mav);
				
		return mav;
	}
	
	@RequestMapping(value="/adminOrder/adminOrderSearchOne.do",method=RequestMethod.GET)
	public ModelAndView adminOrderSearchOne(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminOrderService.adminOrderSearchOne(mav);
		return mav;
	}
	
	@RequestMapping(value="/adminOrder/adminOrderSearchMulti.do",method=RequestMethod.GET)
	public ModelAndView adminOrderSearchMulti(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminOrderService.adminOrderSearchMulti(mav);
		return mav;
	}
	
	@RequestMapping(value="/adminOrder/adminOrderRead.do",method=RequestMethod.GET)
	public ModelAndView adminOrderRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminOrderService.adminOrderRead(mav);
		mav.setViewName("adminOrder/adminOrderRead");
		
		return mav;
	}
	
	@RequestMapping(value="/adminOrder/adminOrderModify.do",method=RequestMethod.GET)
	public ModelAndView adminOrderModify(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminOrderService.adminOrderRead(mav);
		mav.setViewName("adminOrder/adminOrderModify");
		
		return mav;
	}
	
	@RequestMapping(value="/adminOrder/adminOrderModify.do",method=RequestMethod.POST)
	public ModelAndView adminOrderModifyOk(HttpServletRequest request, HttpServletResponse response,OrderDto orderDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("orderDto",orderDto);
		
		adminOrderService.adminOrderModyfy(mav);
		adminOrderService.adminOrderRead(mav);
		mav.setViewName("adminOrder/adminOrderRead");
		return mav;
	}
		
	@RequestMapping(value="/adminOrder/adminOrderPay.do",method=RequestMethod.GET)
	public ModelAndView adminOrderPay(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminOrderService.adminOrderPay(mav);
		adminOrderService.adminOrderRead(mav);
		mav.setViewName("adminOrder/adminOrderModify");
		return mav;
	}
		
	@RequestMapping(value="/adminOrder/adminOrderCancle.do",method=RequestMethod.GET)
	public ModelAndView adminOrderCancle(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminOrderService.adminOrderCancle(mav);
		adminOrderService.adminOrderRead(mav);
		mav.setViewName("adminOrder/adminOrderRead");
		return mav;
	}
		
	@RequestMapping(value="/adminOrder/adminOrderStats.do",method=RequestMethod.GET)
	public ModelAndView adminOrderStats(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminOrderService.adminOrderStats(mav);
		mav.setViewName("adminOrder/adminOrderStats");
		return mav;
	}
	
	@RequestMapping(value="/adminOrder/adminOrderStatsSearch.do",method=RequestMethod.GET)
	public ModelAndView adminOrderStatsSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminOrderService.adminOrderStatsSearch(mav);
		mav.setViewName("adminOrder/adminOrderStats");
		return mav;
	}
}
