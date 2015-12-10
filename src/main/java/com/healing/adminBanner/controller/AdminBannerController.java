package com.healing.adminBanner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminBanner.service.AdminBannerService;

/**
 * @이름 : AdminBannerController
 * @날짜 : 2015. 12. 9.
 * @개발자 : 전현준
 * @설명 : 관리자모드에서 추천상품 검색/등록해줘서 사용자 페이지에 올라가게 하는 Controller
 */
@Controller
public class AdminBannerController {
	@Autowired
	private AdminBannerService adminBannerService;
	
	@RequestMapping(value="adminBanner/bannerInsert.do", method=RequestMethod.POST)
	public ModelAndView bannerInsert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminBannerService.bannerInsert(mav);
		
		return mav;
	}
	
	/*@RequestMapping(value="adminBanner/bannerSearch.do", method=RequestMethod.POST)
	public ModelAndView bannerSearch(){
		ModelAndView mav = new ModelAndView();
		
	}*/
}
