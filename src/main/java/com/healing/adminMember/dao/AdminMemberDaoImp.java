package com.healing.adminMember.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.member.dto.MemberDto;

@Component
public class AdminMemberDaoImp implements AdminMemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MemberDto> adminMemberList() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberList");
	}

	@Override
	public List<MemberDto> adminMemberSortId() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortId");
	}

	@Override
	public List<MemberDto> adminMemberSortName() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortName");
	}

	@Override
	public List<MemberDto> adminMemberSortDate() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortDate");
	}

	@Override
	public List<MemberDto> adminMemberSortPurchase() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortPurchase");
	}

	@Override
	public List<MemberDto> adminMemberSearchName(String search) {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSearchName",search);
	}

	@Override
	public List<MemberDto> adminMemberSearchId(String search) {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSearchId",search);
	}

	@Override
	public List<MemberDto> adminMemberSearchPhone(String search) {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSearchPhone",search);
	}

	@Override
	public List<MemberDto> adminMemberPrice(int min, int max) {
		HashMap<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("min", min);
		hMap.put("max", max);
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberPrice",hMap);
	}
}
