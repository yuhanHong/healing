package com.healing.adminMode.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.adminMode.dto.AdminModeDto;

/**
 * @이름 : AdminModeDaoImp
 * @날짜 : 2015. 12. 21.
 * @개발자 : 김진수
 * @설명 : 관리자 계정관리 
 */
@Component
public class AdminModeDaoImp implements AdminModeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int adminModeCreate(AdminModeDto adminModeDto) {
		
		return sqlSessionTemplate.insert("dao.adminModeMapper.adminModeCreate",adminModeDto);
	}

	/**
	 * @함수이름 : adminModeLogin
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 관리자 계정 로그인
	 */
	@Override
	public AdminModeDto adminModeLogin(String admin_id, String admin_password) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("admin_id", admin_id);
		hMap.put("admin_password", admin_password);
		
		return sqlSessionTemplate.selectOne("dao.adminModeMapper.adminModeLogin",hMap);
	}

	/**
	 * @함수이름 : adminModeSelect
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 계정 전체리스트
	 */
	@Override
	public List<AdminModeDto> adminModeSelect() {
		
		return sqlSessionTemplate.selectList("dao.adminModeMapper.adminModeSelect");
	}

	/**
	 * @함수이름 : adminModeUpdate
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 계정수정
	 */
	@Override
	public int adminModeUpdate(AdminModeDto adminModeDto) {
		
		return sqlSessionTemplate.update("dao.adminModeMapper.adminModeUpdate",adminModeDto);
	}

	/**
	 * @함수이름 : adminDelete
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 관리자 계정 삭제
	 */
	@Override
	public int adminDelete(int admin_number) {
		
		return sqlSessionTemplate.delete("dao.adminModeMapper.adminModeDelete",admin_number);
	}
}
