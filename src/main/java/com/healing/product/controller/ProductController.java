package com.healing.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.product.service.ProductService;

/**
 * @이름 : ProductController
 * @날짜 : 2015. 12. 8.
 * @개발자 : 홍유한
 * @설명 : 상품조회 컨트롤러
 */
@Controller
public class ProductController {
	@Autowired
	private ProductService productService;

	@RequestMapping(value="/product/productList.do",method=RequestMethod.GET)
	public ModelAndView productList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		productService.productList(mav);
		
		return mav;
	}

	@RequestMapping(value="/product/flightList.do",method=RequestMethod.GET)
	public ModelAndView flightList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);	// cookie 생성 추가하기 위해 response 추가
		productService.flightList(mav);
		
		return mav;
	}

	@RequestMapping(value="/product/productRead.do",method=RequestMethod.GET)
	public ModelAndView productRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		productService.productRead(mav);
		
		return mav;
	}
}
