package com.healing.adminInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminInfo.dto.AdminInfoDto;
import com.healing.adminInfo.service.AdminInfoService;

@Controller
public class AdminInfoController {

	@Autowired
	private AdminInfoService adminInfoService;
	
	@RequestMapping(value="/admin/manager.do", method=RequestMethod.GET)
	public ModelAndView manager(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/manager");
	}
	
	@RequestMapping(value="/admin/infoInsert.do", method=RequestMethod.GET)
	public ModelAndView infoInsert(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/infoInsert");
	}
	
	@RequestMapping(value="/admin/infoInsert.do", method=RequestMethod.POST)
	public ModelAndView infoInsertOk(HttpServletRequest request, HttpServletResponse response, AdminInfoDto adminInfoDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("adminInfoDto", adminInfoDto);
		adminInfoService.infoInsert(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : introduce, road, abroadTour, privateInfo
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 전현준
	 * @함수설명 : 회사소개 메인페이지
	 */
	
	@RequestMapping(value="/company/tourInfo.do", method=RequestMethod.GET)
	public ModelAndView tourInfo(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("company/tourInfo");
	}
	
	@RequestMapping(value="/company/road.do", method=RequestMethod.GET)
	public ModelAndView road(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("company/road");
	}
	
	@RequestMapping(value="/company/abroadTour.do", method=RequestMethod.GET)
	public ModelAndView abroadTour(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("company/abroadTour");
	}
	
	@RequestMapping(value="/company/privateInfo.do", method=RequestMethod.GET)
	public ModelAndView privateInfo(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("company/privateInfo");
	}
	
}
