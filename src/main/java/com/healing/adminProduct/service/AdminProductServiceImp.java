package com.healing.adminProduct.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminProduct.dao.AdminProductDao;

/**
 * @이름 : AdminProductServiceImp
 * @날짜 : 2015. 12. 7.
 * @개발자 : 홍유한
 * @설명 : 상품등록 Service 구현클래스
 */
@Component
public class AdminProductServiceImp implements AdminProductService {
	@Autowired
	private AdminProductDao adminProductDao;
	
	@Override
	public void productWrite(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		mav.setViewName("adminProduct/productWrite");
	}

	@Override
	public void productWriteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		mav.setViewName("adminProduct/productWriteOk");
	}
}
