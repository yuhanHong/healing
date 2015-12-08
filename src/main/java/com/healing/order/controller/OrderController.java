package com.healing.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.order.dto.OrderDto;
import com.healing.order.service.OrderService;


/**
 * @이름 : OrderController
 * @날짜 : 2015. 12. 8.
 * @개발자 : 봉채윤
 * @설명 : 예약 컨트롤러
 */
@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/order/write.do",method=RequestMethod.GET)
	public ModelAndView orderProductRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		orderService.orderProductRead(mav);
				
		return mav;
	}
	
	@RequestMapping(value="/order/write.do",method=RequestMethod.POST)
	public ModelAndView orderCheck(HttpServletRequest request, HttpServletResponse response, OrderDto orderDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("orderDto",orderDto);
		orderService.orderInsert(mav);
		
		return mav;
	}
}
