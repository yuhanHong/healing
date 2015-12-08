package com.healing.boardNotice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.boardNotice.dto.BoardNoticeDto;
import com.healing.boardNotice.service.BoardNoticeService;

@Controller
public class BoardNoticeController {
	@Autowired
	private BoardNoticeService boardNoticeService;
	
	@RequestMapping(value="/boardNotice/write.do", method=RequestMethod.GET)
	public ModelAndView boardNoticeWrite(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("OK");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardNoticeService.boardNoticeWrite(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardNotice/write.do", method=RequestMethod.POST)
	public ModelAndView boardNoticeWriteOk(HttpServletRequest request, HttpServletResponse response, BoardNoticeDto boardNoticeDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("boardNoticeDto",boardNoticeDto);
		boardNoticeService.boardNoticeWriteOk(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardNotice/list.do", method=RequestMethod.GET)
	public ModelAndView boardNoticeList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardNoticeService.boardNoticeList(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardNotice/read.do", method=RequestMethod.GET)
	public ModelAndView boardNoticeRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardNoticeService.boardNoticeRead(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardNotice/delete.do", method=RequestMethod.GET)
	public ModelAndView boardNoticeDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardNoticeService.boardNoticeDelete(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardNotice/update.do", method=RequestMethod.GET)
	public ModelAndView boardNoticeUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		boardNoticeService.boardNoticeUpdate(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardNotice/update.do", method=RequestMethod.POST)
	public ModelAndView boardNoticeUpdateOk(HttpServletRequest request, HttpServletResponse response, BoardNoticeDto boardNoticeDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("boardNoticeDto",boardNoticeDto);
		boardNoticeService.boardNoticeUpdateOk(mav);
		return mav; 
	}
	
	@RequestMapping(value="/boardNotice/download.do", method=RequestMethod.GET)
	public ModelAndView boardNoticeDown(HttpServletRequest request, HttpServletResponse response, BoardNoticeDto boardNoticeDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response", response);
		boardNoticeService.boardNoticeDown(mav);
		return null;	// page 이동하지 않기때문에 반환하지 않음
	}
	
}
