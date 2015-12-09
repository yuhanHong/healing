package com.healing.boardFaq.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.boardFaq.dto.BoardFaqDto;
import com.healing.boardFaq.service.BoardFaqService;

@Controller
public class BoardFaqController {
	@Autowired
	private BoardFaqService boardFaqService;
	
	@RequestMapping(value="/boardFaq/write.do", method=RequestMethod.GET)
	public ModelAndView boardFaqWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardFaqService.boardFaqWrite(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardFaq/write.do", method=RequestMethod.POST)
	public ModelAndView boardFaqWriteOk(HttpServletRequest request, HttpServletResponse response, BoardFaqDto boardFaqDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("boardFaqDto",boardFaqDto);
		boardFaqService.boardFaqWriteOk(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardFaq/list.do", method=RequestMethod.GET)
	public ModelAndView boardFaqList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardFaqService.boardFaqList(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardFaq/delete.do", method=RequestMethod.GET)
	public ModelAndView boardFaqDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardFaqService.boardFaqDelete(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardFaq/update.do", method=RequestMethod.GET)
	public ModelAndView boardFaqUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardFaqService.boardFaqUpdate(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardFaq/update.do", method=RequestMethod.POST)
	public ModelAndView boardFaqUpdateOk(HttpServletRequest request, HttpServletResponse response, BoardFaqDto boardFaqDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("boardFaqDto",boardFaqDto);
		boardFaqService.boardFaqUpdateOk(mav);
		return mav; 
	}
}
