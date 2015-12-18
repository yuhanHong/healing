package com.healing.detailSearch.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.detailSearch.service.DetailSearchService;

@Controller
public class DetailSearchController {
	
	@Autowired
	private DetailSearchService detailSearchService;
	
	@RequestMapping(value="/detailSearch/detailSearch.do",method=RequestMethod.GET)
	public ModelAndView detailSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.setViewName("detailSearch/detailSearch");
		
		return mav;
	}
	
}
