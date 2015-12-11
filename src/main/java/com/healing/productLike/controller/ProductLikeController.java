package com.healing.productLike.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.productLike.service.ProductLikeService;

/**
 * @이름 : ProductLikeController
 * @날짜 : 2015. 12. 11.
 * @개발자 : 봉채윤
 * @설명 : 관심상품 Controller
 */
@Controller
public class ProductLikeController {
	
	@Autowired
	private ProductLikeService productLikeService;
	
	@RequestMapping(value="/productLike/productLikeinsert.do",method=RequestMethod.GET)
	public ModelAndView productLikeinsert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		mav.addObject("response",response);	
		productLikeService.productLikeinsert(mav);
		
		return null;
	}
		
	@RequestMapping(value="/productLike/productLikeList.do",method=RequestMethod.GET)
	public ModelAndView productLikeList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		
		productLikeService.productLikeList(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/productLike/productLikeAllDelete.do",method=RequestMethod.GET)
	public ModelAndView productLikeAllDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		
		productLikeService.productLikeAllDelete(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/productLike/productLikeSelectDel.do",method=RequestMethod.GET)
	public ModelAndView productLikeSelectDel(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		
		productLikeService.productLikeSelectDel(mav);
		
		return mav;
	}
}
