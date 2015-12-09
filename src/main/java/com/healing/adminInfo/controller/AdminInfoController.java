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

/**
 * @이름 : AdminInfoController
 * @날짜 : 2015. 12. 7.
 * @개발자 : 전현준
 * @설명 : 회사정보, 회사소개 관련 된 것을 조정해주는 Controller
 */
@Controller
public class AdminInfoController {

	@Autowired
	private AdminInfoService adminInfoService;
	
	/**
	 * @함수이름 : manager, infoInsert, infoInsertOk
	 * @리턴타입 : ModelAndView or mav
	 * @작성일 : 2015. 12. 7.
	 * @개발자 : 전현준
	 * @함수설명 : 회사 정보 등록 관련 페이지
	 */
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
	 * @함수설명 : 회사소개, 찾아오는길, 해외여행이용약관, 개인정보취급방침 페이지 
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
