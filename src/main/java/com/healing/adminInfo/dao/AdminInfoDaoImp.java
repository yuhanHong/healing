package com.healing.adminInfo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.adminInfo.dto.AdminInfoDto;

@Component
public class AdminInfoDaoImp implements AdminInfoDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public int insert(AdminInfoDto adminInfoDto) {
		int value = 0;
		
		value = sessionTemplate.insert("dao.adminInfoMapper.infoInsert", adminInfoDto);
		
		return value;
	}
}
