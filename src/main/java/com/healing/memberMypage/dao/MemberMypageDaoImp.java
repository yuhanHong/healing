package com.healing.memberMypage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberMypageDaoImp implements MemberMypageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
