package com.healing.adminBanner.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @인터페이스이름 : AdminBannerService
 * @작성일 : 2015. 12. 9.
 * @개발자 : 전현준
 * @인터페이스설명 : 관리자쪽에서 사용자페이지 추천상품 메인배너 처리하는 서비스
 */
public interface AdminBannerService {
	
	public void bannerSearch(ModelAndView mav);
	
	public void bannerRecommandInsert(ModelAndView mav);
	
	public void bannerRecommandSelect(ModelAndView mav);
	
	public void bannerRecommandDelete(ModelAndView mav);
}
