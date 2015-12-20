package com.healing.adminBanner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminBanner.service.AdminBannerService;
import com.healing.aop.HomeAspect;

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
	
	/**
	 * @함수이름 : bannerInsert
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 전현준
	 * @함수설명 : 관리자 모드 - 추천상품등록 페이지로 페이지 이동하는 함수(bannerInsert.jsp)
	 */
	@RequestMapping(value="adminBanner/bannerInsert.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView bannerInsert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		adminBannerService.bannerRecommandSelect(mav);
		
		mav.setViewName("adminBanner/bannerInsert");	// 추천상품 테이블에 데이트 추가 후 검색페이지(bannerInsert.jsp)로 이동
		return mav;
	}
	
	/**
	 * @함수이름 : bannerSearch
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 전현준
	 * @함수설명 : 추천 상품 검색
	 */
	@RequestMapping(value="adminBanner/bannerSearch.do", method=RequestMethod.POST)
	public ModelAndView bannerSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		adminBannerService.bannerSearch(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : bannerRecommandInsert
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 전현준
	 * @함수설명 : 메인배너에 등록(insert)한 후 Service거친후 bannerInsert.jsp 페이지로 이동하는 함수
	 */
	@RequestMapping(value="/adminBanner/bannerRecommandInsert.do", method=RequestMethod.GET)
	public ModelAndView bannerRecommandInsert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		adminBannerService.bannerRecommandInsert(mav);
		adminBannerService.bannerRecommandSelect(mav);
		
		mav.setViewName("adminBanner/bannerInsert");	// 추천상품 테이블에 데이트 추가 후 검색페이지(bannerInsert.jsp)로 이동
		
		return mav;
	}

	
	/**
	 * @함수이름 : bannerRecommandDelete
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 전현준
	 * @함수설명 : 상품 테이블에 메인배너 등록상태값을 0으로 바꾼후 Service거친후 bannerInsert.jsp 페이지로 이동하는 함수
	 */
	@RequestMapping(value="/adminBanner/bannerRecommandDelete.do", method=RequestMethod.GET)
	public ModelAndView bannerRecommandDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		adminBannerService.bannerRecommandDelete(mav);
		adminBannerService.bannerRecommandSelect(mav);
		
		mav.setViewName("adminBanner/bannerInsert");	// 추천상품 테이블에 데이트 추가 후 검색페이지(bannerInsert.jsp)로 이동
		return mav;
	}
}
