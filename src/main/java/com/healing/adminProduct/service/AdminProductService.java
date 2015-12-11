package com.healing.adminProduct.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @이름 : AdminProductService
 * @날짜 : 2015. 12. 7.
 * @개발자 : 홍유한
 * @설명 : 상품등록 Service 인터페이스
 */
public interface AdminProductService {

	void productWrite(ModelAndView mav);

	void productWriteOk(ModelAndView mav);

}
