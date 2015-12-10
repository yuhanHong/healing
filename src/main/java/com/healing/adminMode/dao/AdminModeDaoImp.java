package com.healing.adminMode.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.adminMode.dto.AdminModeDto;

@Component
public class AdminModeDaoImp implements AdminModeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int adminModeCreate(AdminModeDto adminModeDto) {
		
		return sqlSessionTemplate.insert("dao.adminModeMapper.adminModeCreate",adminModeDto);
	}

	@Override
	public AdminModeDto adminModeLogin(String admin_id, String admin_password) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("admin_id", admin_id);
		hMap.put("admin_password", admin_password);
		
		return sqlSessionTemplate.selectOne("dao.adminModeMapper.adminModeLogin",hMap);
	}

	@Override
	public List<AdminModeDto> adminModeSelect() {
		
		return sqlSessionTemplate.selectList("dao.adminModeMapper.adminModeSelect");
	}

	@Override
	public int adminModeUpdate(AdminModeDto adminModeDto) {
		
		return sqlSessionTemplate.update("dao.adminModeMapper.adminModeUpdate",adminModeDto);
	}

	@Override
	public int adminDelete(int admin_number) {
		
		return sqlSessionTemplate.delete("dao.adminModeMapper.adminModeDelete",admin_number);
	}
}
