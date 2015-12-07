package com.healing.adminProduct.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AdminProductDaoImp implements AdminProductDao{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
}
