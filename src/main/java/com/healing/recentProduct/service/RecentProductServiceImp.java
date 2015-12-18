package com.healing.recentProduct.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductDto;
import com.healing.recentProduct.dao.RecentProductDao;

@Component
public class RecentProductServiceImp implements RecentProductService {

	@Autowired
	private RecentProductDao recentProductDao;
	
	@Override
	public void recentProductRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		int product_number = Integer.parseInt(request.getParameter("product_number"));
		HomeAspect.logger.info(HomeAspect.logMsg + product_number);
		
		List<ProductDto> recentProductList = recentProductDao.productList(product_number);
		HomeAspect.logger.info(HomeAspect.logMsg + recentProductList.size());
		
		List<FlightDto> flightList = recentProductDao.flightList(product_number);
		HomeAspect.logger.info(HomeAspect.logMsg + flightList.size());
		
		// 쿠키 생성
		String pro_num = String.valueOf(product_number);
		
		if(recentProductList.size() != 0){
			Cookie cookie = new Cookie("key" + pro_num, pro_num);
			cookie.setMaxAge(60 * 30);		// 초 * 분 * 시 * 일
			response.addCookie(cookie);
		}
		
		/*if(flightList.size() != 0){
			for(int i=0; i<flightList.size(); i++){
				Cookie cookie = new Cookie("product_number", pro_num);
				cookie.setMaxAge(60 * 30);
				response.addCookie(cookie);
			}
		}*/
		
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int recentProductSize = recentProductList.size();
		int flightListSize = flightList.size();
		
		mav.addObject("recentProductSize", recentProductSize);
		mav.addObject("recentProductList", recentProductList);
		
		mav.addObject("flightListSize", flightListSize);
		mav.addObject("flightList", flightList);
		
		mav.setViewName("recentProduct/productList");
	}

}
