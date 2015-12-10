package com.healing.boardQna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.boardQna.dto.BoardQnaDto;
import com.healing.boardQna.service.BoardQnaService;

@Controller
public class BoardQnaController {
	@Autowired
	private BoardQnaService boardQnaService;
	
	@RequestMapping(value="/boardQna/write.do", method=RequestMethod.GET)
	public ModelAndView boardQnaWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardQnaService.boardQnaWrite(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardQna/write.do", method=RequestMethod.POST)
	public ModelAndView boardQnaWriteOk(HttpServletRequest request, HttpServletResponse response, BoardQnaDto boardQnaDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("boardQnaDto",boardQnaDto);
		boardQnaService.boardQnaWriteOk(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardQna/list.do", method=RequestMethod.GET)
	public ModelAndView boardQnaList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardQnaService.boardQnaList(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardQna/read.do", method=RequestMethod.GET)
	public ModelAndView boardQnaRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardQnaService.boardQnaRead(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardQna/delete.do", method=RequestMethod.GET)
	public ModelAndView boardQnaDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardQnaService.boardQnaDelete(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardQna/update.do", method=RequestMethod.GET)
	public ModelAndView boardQnaUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardQnaService.boardQnaUpdate(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardQna/update.do", method=RequestMethod.POST)
	public ModelAndView boardQnaUpdateOk(HttpServletRequest request, HttpServletResponse response, BoardQnaDto boardQnaDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("boardQnaDto",boardQnaDto);
		boardQnaService.boardQnaUpdateOk(mav);
		return mav; 
	}
}
