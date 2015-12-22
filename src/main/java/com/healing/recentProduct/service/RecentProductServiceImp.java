package com.healing.recentProduct.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminBanner.dao.AdminBannerDao;
import com.healing.aop.HomeAspect;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;
import com.healing.recentProduct.dao.RecentProductDao;

@Component
public class RecentProductServiceImp implements RecentProductService {

	@Autowired
	private RecentProductDao recentProductDao;
	@Autowired
	private AdminBannerDao adminBannerDao;
	
	@Override
	public void recentProductRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		int product_number = Integer.parseInt(request.getParameter("product_number"));
		//HomeAspect.logger.info(HomeAspect.logMsg + product_number);
		
		List<ProductDto> recentProductList = recentProductDao.productList(product_number);
		//HomeAspect.logger.info(HomeAspect.logMsg + recentProductList.size());
		
		List<FlightDto> flightList = recentProductDao.flightList(product_number);
		//HomeAspect.logger.info(HomeAspect.logMsg + flightList.size());
		
		// *** 쿠키 생성 ***
		String pro_num = String.valueOf(product_number);
		
		if(recentProductList.size() != 0){
			Cookie cookie = new Cookie("key" + pro_num, pro_num);
			cookie.setMaxAge(60 * 10);		// 초 * 분 * 시 * 일
			cookie.setPath("/");			// 어디에서 쿠키를 나중에 불러오더라도 쿠키를 찾을 수 있게 만드는 경로설정
			response.addCookie(cookie);
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int recentProductSize = recentProductList.size();
		int flightListSize = flightList.size();
		
		mav.addObject("recentProductSize", recentProductSize);		// 상품정보 list Size
		mav.addObject("recentProductList", recentProductList);		// 상품정보 data
		
		mav.addObject("flightListSize", flightListSize);			// 항공정보 list Size
		mav.addObject("flightList", flightList);					// 항공정보 data
		mav.addObject("product_number", product_number);			// 상품번호
		
		//mav.setViewName("recentProduct/productList");
		mav.setViewName("product/flightList");
	}

	@Override
	public void paging(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		String count = request.getParameter("listCount");
//		HomeAspect.logger.info(HomeAspect.logMsg + count);
	}

	@Override
	public void recentProductList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		// 1. recentProduct.jsp 에서 쿠키 value값 얻어오기(상품번호)
		String value = request.getParameter("value");
		String comma[] = value.split(",");
		
		// 2. recentProduct.jsp페이지에서 쿠키를 받은 거를 getParameter()로 cookies 얻어오기
		String cookies = request.getParameter("cookies");
		
		// 3. 쿠키길이 얻어오기
		int cookiesLength = Integer.parseInt(request.getParameter("cookiesLength"));
		
		List<ProductDto> product = new ArrayList<ProductDto>();
		List<ProductPhotoDto> productPhoto = new ArrayList<ProductPhotoDto>();
		
		if(cookies != null){
			for(int i=0; i<cookiesLength-1; i++){
				// 상품명, 상품가격, 상품이미지를 상품번호를 이용해서 갖고온다.
				// ProductDto productDto = adminBannerDao.recentlyProductSelect(Integer.parseInt(value));
				List<ProductDto> productDto = adminBannerDao.recentlyProductSelect(Integer.parseInt(comma[i]));
				
				// 사진 설명, 사진 파일명, 사진 설명 등을 가져온다.
				// ProductPhotoDto productPhotoDto = adminBannerDao.recentlyProductPhotoSelect(Integer.parseInt(value));
				List<ProductPhotoDto> productPhotoDto = adminBannerDao.recentlyProductPhotoSelect(Integer.parseInt(comma[i]));
				
				product.addAll(productDto);
				productPhoto.addAll(productPhotoDto);
			}
		}
		
		JSONObject json = new JSONObject();			// JSONObject 객체 생성
		json.put("productInfo", product);			// JSONObject에 값 넣기
		json.put("productPhotoInfo", productPhoto);
		
		PrintWriter out = null;
		try {
			response.setContentType("application/html;charset=UTF-8");
			out = response.getWriter();
			out.print(json.toString());		// out 객체의 내용을 ajax의 데이터타입이 json에게 갖고있는 데이터를 전달함
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*@Override
	public void recentProductReadList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		Cookie cookies[] = request.getCookies();
		HomeAspect.logger.info(HomeAspect.logMsg + "쿠키길이" + cookies.length);
		
		List<ProductDto> product = new ArrayList<ProductDto>();
		List<ProductPhotoDto> productPhoto = new ArrayList<ProductPhotoDto>();
		
		if(cookies != null){
			for(int i=1; i<cookies.length; i++){
				String value = cookies[i].getValue();
				HomeAspect.logger.info(HomeAspect.logMsg + "value" + value);
				
				// 상품명, 상품가격, 상품이미지를 상품번호를 이용해서 갖고온다.
				ProductDto productDto = adminBannerDao.recentlyProductSelect(Integer.parseInt(value));
				//HomeAspect.logger.info(HomeAspect.logMsg + "Dto:" + productDto);
				
				// 사진 설명, 사진 파일명, 사진 설명 등을 가져온다.
				ProductPhotoDto productPhotoDto = adminBannerDao.recentlyProductPhotoSelect(Integer.parseInt(value));
				
				product.add(productDto);
				productPhoto.add(productPhotoDto);
				
			}
			HomeAspect.logger.info(HomeAspect.logMsg + "상품 사이즈:" + product.size());
			HomeAspect.logger.info(HomeAspect.logMsg + "상품 이미지 사이즈:" + productPhoto.size());
		}
		
		JSONObject json = new JSONObject();		// JSONObject 객체 생성
		json.put("productInfo", product);			// JSONObject에 값 넣기
		json.put("productPhotoInfo", productPhoto);
		
		PrintWriter out = null;
		try {
			response.setContentType("application/html;charset=UTF-8");
			out = response.getWriter();
			out.print(json.toString());		// out 객체의 내용을 ajax의 데이터타입이 json에게 갖고있는 데이터를 전달함
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.addObject("product", product);						// 최근 본 상품 정보
		mav.addObject("productPhoto", productPhoto);			// 최근 본 상품 이미지 정보 
		
		mav.setViewName("/recentProduct/recentProduct");
	}*/

}
