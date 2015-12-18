package com.healing.recentProduct.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.recentProduct.service.RecentProductService;

@Controller
public class RecentProductController {
	@Autowired
	private RecentProductService recentProductService;
	
	@RequestMapping(value="/recentProduct/recentProduct.do", method=RequestMethod.GET)
	public ModelAndView recentProductRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		recentProductService.recentProductRead(mav);
		
		return mav;
	}
	
}
