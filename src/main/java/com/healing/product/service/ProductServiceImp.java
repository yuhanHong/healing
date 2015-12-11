package com.healing.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.product.dao.ProductDao;

/**
 * @이름 : ProductDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 홍유한
 * @설명 : 상품조회 Service 구현클래스
 */
@Component
public class ProductServiceImp implements ProductService {
	@Autowired
	private ProductDao productDao;

	@Override
	public void productRead(ModelAndView mav) {
		// TODO Auto-generated method stub
	}
}
