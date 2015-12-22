package com.healing.memberMypage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.freeplan.dto.FreePlanDto;
import com.healing.freeplan.dto.ScheduleDto;
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
	
	@Override
	public List<ScheduleDto> memberMypageGetSchedule(int member_number) {
		return sqlSessionTemplate.selectList("dao.memberMyPageMapper.memberMyPageGetSchedule",member_number);
	}

	@Override
	public FreePlanDto memberMypageGetPlaceList(int place_number) {
		return sqlSessionTemplate.selectOne("dao.memberMyPageMapper.memberMyPageGetPlaceList",place_number);
	}

	@Override
	public String memberMypageGetContent(int member_number, String day) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("member_number", member_number);
		hMap.put("day", day);
		return sqlSessionTemplate.selectOne("dao.memberMyPageMapper.memberMyPageGetContent", hMap);
	}

	@Override
	public int memberMypageDeletePlan(int member_number) {
		return sqlSessionTemplate.delete("dao.memberMyPageMapper.memberMypageDeletePlan",member_number);
	}

	@Override
	public int memberMypageGetScheduleCnt(int member_number) {
		return sqlSessionTemplate.selectOne("dao.memberMyPageMapper.memberMypageGetScheduleCnt",member_number);
	}
}
