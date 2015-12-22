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
	
	/**
	 * @함수이름 : recentProductRead
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 18.
	 * @개발자 : 전현준
	 * @함수설명 : 메인페이지 - 메인베너에서 .do 요청을 받으면 Service에서 쿠키 생성 후 productList.jsp(read 페이지)로 이동 
	 */
	@RequestMapping(value="/recentProduct/recentProduct.do", method=RequestMethod.GET)
	public ModelAndView recentProductRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		recentProductService.recentProductRead(mav);
		
		return mav;
	}
	
	/*@RequestMapping(value="/recentProduct/recentProductReadList.do", method=RequestMethod.GET)
	public ModelAndView recentProductReadList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		recentProductService.recentProductReadList(mav);
		
		return mav;
	}*/
	
	@RequestMapping(value="/recentProduct/paging.do", method=RequestMethod.GET)
	public ModelAndView paging(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		recentProductService.paging(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : recentProductList
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 전현준
	 * @함수설명 : recentProduct.jsp 페이지에서 onLoad 됬을 때 실행되는 함수
	 */
	@RequestMapping(value="/recentProduct/recentProductList.do", method=RequestMethod.GET)
	public ModelAndView recentProductList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);			// ajax 요청할 시 데이터 response 넣는것 중요 ★★★
		
		recentProductService.recentProductList(mav);
		
		return null;									// ajax 요청할 시 return null 중요 ★★★
	}

}
