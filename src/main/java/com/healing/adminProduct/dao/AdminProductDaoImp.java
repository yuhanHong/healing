package com.healing.adminProduct.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @이름 : AdminProductDaoImp
 * @날짜 : 2015. 12. 7.
 * @개발자 : 홍유한
 * @설명 : 상품등록 DAO 구현클래스
 */
@Component
public class AdminProductDaoImp implements AdminProductDao{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
}
