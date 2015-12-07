package com.healing.adminProduct.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminProduct.dao.AdminProductDao;

@Component
public class AdminProductServiceImp implements AdminProductService {
	@Autowired
	private AdminProductDao adminProductDao;
	
	@Override
	public void productWrite(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void productWriteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}
}
