package com.healing.memberMypage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.memberMypage.dto.MemberMypageDto;

@Component
public class MemberMypageDaoImp implements MemberMypageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MemberMypageDto> memberMypageOrderList(int member_number) {
		
		return sqlSessionTemplate.selectList("dao.memberMyPageMapper.memberMypageOrderList",member_number);
	}

	@Override
	public int memberMypageReviewInsert(HashMap<String,Object> hMap) {
		
		return sqlSessionTemplate.insert("dao.memberMyPageMapper.memberMypageReviewInsert",hMap);
	}
}
