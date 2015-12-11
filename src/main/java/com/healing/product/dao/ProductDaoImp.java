package com.healing.product.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @이름 : ProductDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 홍유한
 * @설명 : 상품조회 DAO 구현클래스
 */
@Component
public class ProductDaoImp implements ProductDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
}
