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
	public List<MemberDto> adminMemberSortNomal() {
	
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortNomal");
	}

	@Override
	public List<MemberDto> adminMemberSortVip() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortVip");
	}

	@Override
	public List<MemberDto> adminMemberSortDelete() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortDelete");
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

	@Override
	public int adminMemberChange(int minValue, int maxValue, String member_level) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("minValue", minValue);
		hMap.put("maxValue", maxValue);
		hMap.put("member_level", member_level);
		
		return sqlSessionTemplate.update("dao.adminMemberMapper.adminMemberChange",hMap);
	}

	@Override
	public MemberDto adminMemberSelect(int member_number) {
		
		return sqlSessionTemplate.selectOne("dao.adminMemberMapper.adminMemberSelect",member_number);
	}

	@Override
	public int amdinMemberUpdate(MemberDto memberDto) {
		
		return sqlSessionTemplate.update("dao.adminMemberMapper.adminMemberUpdate",memberDto);
	}

	@Override
	public int adminMemberKick(int member_delete, int member_number) {
		HashMap<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("member_delete", member_delete);
		hMap.put("member_number", member_number);
		
		return sqlSessionTemplate.update("dao.adminMemberMapper.adminMemberKick",hMap);
	}

	@Override
	public int adminMemberRestore(int member_delete, int member_number) {
		HashMap<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("member_delete", member_delete);
		hMap.put("member_number", member_number);
		
		return sqlSessionTemplate.update("dao.adminMemberMapper.adminMemberRestore",hMap);
	}

}
