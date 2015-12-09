package com.healing.adminInfo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.adminInfo.dto.AdminInfoDto;

@Component
public class AdminInfoDaoImp implements AdminInfoDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	/**
	 * @함수이름 : infoInsert
	 * @작성일 : 2015. 12. 7.
	 * @개발자 : 전현준
	 * @함수설명 : xml 파일에 넘겨서 관리자 페이지 회사정보 등록 - (footer 부분)
	 */
	@Override
	public int infoInsert(AdminInfoDto adminInfoDto) {
		int value = 0;
		
		value = sessionTemplate.insert("dao.adminInfoMapper.infoInsert", adminInfoDto);
		return value;
	}
}
