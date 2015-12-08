package com.healing.adminOrder.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AdminOrderDaoImp implements AdminOrderDao {
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate;
}
