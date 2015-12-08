package com.healing.boardFaq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;

@Component
public class BoardFaqDaoImp implements BoardFaqDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
}
