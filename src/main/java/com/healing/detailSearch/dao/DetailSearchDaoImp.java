package com.healing.detailSearch.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DetailSearchDaoImp implements DetailSearchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
