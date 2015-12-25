package com.healing.healingHome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.healingHome.service.HealingHomeService;

/**
 * @클래스이름 : HealingHomeController
 * @작성일 : 2015. 12. 15.
 * @개발자 : 전현준
 * @함수설명 : Tomcat7.0 실행하면 사용자 main 페이지 찾는 컨트롤러
 */
@Controller
public class HealingHomeController {
	@Autowired
	private HealingHomeService healingHomeService;
	
	/**
	 * @함수이름 : healingHome
	 * @리턴타입 : ModelAndView
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 전현준
	 * @함수설명 : healingHome.do 요청이 들어오면 /include/home.jsp로 페이지 이동(메인 페이지)
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)		// 나중에 메인페이지에 링크 걸리게되면 main - HomeController : home함수를 주석걸고 mapping을 추가해야함
	//@RequestMapping(value="/healingHome/healingHome.do", method=RequestMethod.GET)
	public ModelAndView healingHome(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		healingHomeService.healingHome(mav);
		mav.setViewName("include/home");
		
		return mav;
	}
}
