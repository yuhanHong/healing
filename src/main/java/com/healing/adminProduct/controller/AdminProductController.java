package com.healing.adminProduct.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminProduct.service.AdminProductService;
import com.healing.product.dto.ProductDto;

/**
 * @이름 : AdminProductController
 * @날짜 : 2015. 12. 7.
 * @개발자 : 홍유한
 * @설명 : 상품등록 컨트롤러
 */
@Controller
public class AdminProductController {
	@Autowired
	private AdminProductService adminProductService;
	
	@RequestMapping(value="/adminProduct/productWrite.do",method=RequestMethod.GET)
	public ModelAndView productWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		adminProductService.productWrite(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/adminProduct/productWrite.do",method=RequestMethod.POST)
	public ModelAndView productWriteOk(HttpServletRequest request, HttpServletResponse response, ProductDto productDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("productDto",productDto);
		adminProductService.productWriteOk(mav);
		
		return mav;
	}

}
