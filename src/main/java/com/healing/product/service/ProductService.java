package com.healing.product.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @이름 : ProductDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 홍유한
 * @설명 : 상품조회 Service 인터페이스
 */
public interface ProductService {
	void productRead(ModelAndView mav);
}
