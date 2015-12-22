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
	 * @함수설명 : 1. healingHome.do 요청이 들어오면 /include/home.jsp로 페이지 이동(추후 메인으로 될 페이지)
	 * @수정일 : 2015. 12. 18.
	 * @수정내용(추가) : 2. 최근 본 상품 목록 가져오기(쿠키 이용)
	 */
	@Override
	public void healingHome(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		int count = adminBannerDao.bannerGetCount();			// 메인 배너에 등록됬는지를 알려주는 필드 개수
//		HomeAspect.logger.info(HomeAspect.logMsg + count);		
		
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
		
		int listSize = productList.size();		// product 테이블하고 product_photo 테이블 조인한 결과에서 리스트 사이즈
		//HomeAspect.logger.info(HomeAspect.logMsg +"배너배너배너~"+ listSize);
		mav.addObject("count", count);							// 메인 배너에 등록됬는지를 알려주는 필드 개수
		mav.addObject("listSize", listSize);
		mav.addObject("productList", productList);				// 배너 상품 정보
		mav.addObject("productPhotoList", productPhotoList);	// 배너 상품이미지 정보
		mav.setViewName("/include/home");
	}
}
