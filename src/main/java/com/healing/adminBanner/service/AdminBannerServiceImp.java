package com.healing.adminBanner.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminBanner.dao.AdminBannerDao;
import com.healing.aop.HomeAspect;
import com.healing.product.dto.ProductDto;

@Component
public class AdminBannerServiceImp implements AdminBannerService {
	@Autowired
	private AdminBannerDao adminBannerDao;

	/**
	 * @함수이름 : bannerInsert
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 전현준
	 * @함수설명 : bannerInsert.jsp 파일로 데이터(id, password)값 가지고 이동하는 함수 
	 */
	@Override
	public void bannerInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");
		HomeAspect.logger.info(HomeAspect.logMsg + "관리자 id:" + admin_id + ", 관리자 pw:" + admin_pw);
		
		mav.addObject("admin_id", admin_id);
		mav.addObject("admin_pw", admin_pw);
		mav.setViewName("adminBanner/bannerInsert");
	}

	/**
	 * @함수이름 : bannerSearch
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 전현준
	 * @함수설명 : 추천 상품 검색($.ajax 이용)
	 */
	@Override
	public void bannerSearch(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String product = request.getParameter("product");
		String keyword = request.getParameter("keyword");
		
		HomeAspect.logger.info(HomeAspect.logMsg + "상품명:" + product + ", 검색어:" + keyword);
		
		ProductDto productDto = adminBannerDao.productSelect(product, keyword);
		HomeAspect.logger.info(HomeAspect.logMsg + productDto);
	}
}
