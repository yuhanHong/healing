package com.healing.healingHome.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminBanner.dao.AdminBannerDao;
import com.healing.aop.HomeAspect;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;

@Component
public class HealingHomeServiceImp implements HealingHomeService {
	@Autowired
	private AdminBannerDao adminBannerDao;

	/**
	 * @함수이름 : healingHome
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 전현준
	 * @함수설명 : healingHome.do 요청이 들어오면 menu.jsp로 페이지 이동(추후 메인으로 될 페이지)
	 */
	@Override
	public void healingHome(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		int count = adminBannerDao.bannerGetCount();			// 메인 배너에 등록됬는지를 알려주는 필드 개수
		HomeAspect.logger.info(HomeAspect.logMsg + count);		
		
		List<ProductDto> productList = null;
		List<ProductPhotoDto> productPhotoList = null;
		if(count > 0){
			productList = adminBannerDao.getBannerList();		// 메인배너등록여부 상태가 1인것만 select해서 List로 받음
			//HomeAspect.logger.info(HomeAspect.logMsg + productList);
			
			for(int i=0; i<productList.size(); i++){
				productPhotoList = adminBannerDao.getProductPhotoList();		// product, product_photo 테이블하고 조인해서 select해서 List로 받음
				//HomeAspect.logger.info(HomeAspect.logMsg + productPhotoList);
			}
		}
		
		Cookie[] cookie = request.getCookies();
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		List<String> list = null;
		if(cookie != null){
			for(int i=0; i<cookie.length;i++){
				list = new ArrayList<String>();
				list.add(cookie[i].getValue());
			}
		}
		
		int listSize = productList.size();		// product 테이블하고 product_photo 테이블 조인한 결과에서 리스트 사이즈
		
		mav.addObject("productList", productList);
		mav.addObject("listSize", listSize);
		mav.addObject("productPhotoList", productPhotoList);
		mav.addObject("list", list);
		mav.setViewName("/menu");
	}
}
