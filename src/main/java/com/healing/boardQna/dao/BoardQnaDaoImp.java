package com.healing.boardQna.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;

@Component
public class BoardQnaDaoImp implements BoardQnaDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
}
