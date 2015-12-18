package com.healing.adminProduct.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminProduct.service.AdminProductService;
import com.healing.aop.HomeAspect;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductCityDto;
import com.healing.product.dto.ProductDayDto;
import com.healing.product.dto.ProductDetailDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;

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

	/**
	 * @함수이름 : productWrite
	 * @작성일 : 2015. 12. 7.
	 * @개발자 : 홍유한
	 * @함수설명 : admin이 상품을 등록할 때 호출하여 productWrite.jsp를 엽니다.
	 */
	@RequestMapping(value="/adminProduct/adminProductWrite.do",method=RequestMethod.GET)
	public ModelAndView productWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		adminProductService.productWrite(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : productWriteOk
	 * @작성일 : 2015. 12. 7.
	 * @개발자 : 홍유한
	 * @함수설명 : admin이 상품을 등록할때 호출하여 productDto를 넘겨받아 adminProductService로 보냅니다.
	 */
	@RequestMapping(value="/adminProduct/adminProductWrite.do",method=RequestMethod.POST)
	public ModelAndView productWriteOk(HttpServletRequest request, HttpServletResponse response, ProductDto productDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("productDto",productDto);
		mav.addObject("response",response);
		
		adminProductService.productWriteOk(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : productCityWriteOk
	 * @작성일 : 2015. 12. 7.
	 * @개발자 : 홍유한
	 * @함수설명 : admin이 상품을 등록할때 호출하여 productCityDto를 넘겨받아 adminProductService로 보냅니다.
	 */
	@RequestMapping(value="/adminProduct/adminProductCityWrite.do",method=RequestMethod.POST)
	public ModelAndView productCityWriteOk(HttpServletRequest request, HttpServletResponse response, ProductCityDto productCityDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("productCityDto",productCityDto);
		mav.addObject("response",response);
		
		adminProductService.productCityWriteOk(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : flightWriteOk
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 홍유한
	 * @함수설명 : admin이 상품을 등록할때 호출하여 flightDto를 넘겨받아 adminProductService로 보냅니다.
	 */
	@RequestMapping(value="/adminProduct/adminFlightWrite.do",method=RequestMethod.POST)
	public ModelAndView flightWriteOk(HttpServletRequest request, HttpServletResponse response, FlightDto flightDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("flightDto",flightDto);
		mav.addObject("request",request);
		mav.addObject("response",response);
		
		adminProductService.flightWriteOk(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : productDayWriteOk
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 홍유한
	 * @함수설명 : admin이 상품을 등록할때 호출하여 productDayDto를 넘겨받아 adminProductService로 보냅니다.
	 */
	@RequestMapping(value="/adminProduct/adminProductDayWrite.do",method=RequestMethod.POST)
	public ModelAndView productDayWriteOk(HttpServletRequest request, HttpServletResponse response, ProductDayDto productDayDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("productDayDto",productDayDto);
		mav.addObject("response",response);
		
		adminProductService.productDayWriteOk(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : productDetailWriteOk
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 홍유한
	 * @함수설명 : admin이 상품을 등록할때 호출하여 productDetailDto를 넘겨받아 adminProductService로 보냅니다.
	 */
	@RequestMapping(value="/adminProduct/adminProductDetailWrite.do",method=RequestMethod.POST)
	public ModelAndView productDetailWriteOk(HttpServletRequest request, HttpServletResponse response, ProductDetailDto productDetailDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("productDetailDto",productDetailDto);
		mav.addObject("response",response);
//		HomeAspect.logger.info(HomeAspect.logMsg + productDetailDto.getProduct_day_number());
		
		adminProductService.productDetailWriteOk(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : productPhotoWriteOk
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 홍유한
	 * @함수설명 : admin이 상품을 등록할때 호출하여 productPhotoDto를 넘겨받아 adminProductService로 보냅니다.
	 */
	@RequestMapping(value="/adminProduct/adminProductPhotoWrite.do",method=RequestMethod.POST)
	public ModelAndView productPhotoWriteOk(HttpServletRequest request, HttpServletResponse response, ProductPhotoDto productPhotoDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		mav.addObject("productPhotoDto",productPhotoDto);
		
		adminProductService.productPhotoWriteOk(mav);
		
		return null;
	}
}
