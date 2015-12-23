package com.healing.memberMypage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.freeplan.dto.FreePlanDto;
import com.healing.freeplan.dto.ScheduleDto;
import com.healing.memberMypage.dto.MemberMypageDto;
import com.healing.memberMypage.dto.ReviewDto;

@Component
public class MemberMypageDaoImp implements MemberMypageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MemberMypageDto> memberMypageReList(int member_number,String today) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("member_number", member_number);
		hMap.put("today", today);
		
		return sqlSessionTemplate.selectList("dao.memberMyPageMapper.memberMypageReList",hMap);
	}
	
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

	@Override
	public List<ReviewDto> reviewList(int member_number) {
		
		return sqlSessionTemplate.selectList("dao.memberMyPageMapper.reviewList",member_number);
	}

	@Override
	public int reviewCount(int product_number) {
		
		return sqlSessionTemplate.selectOne("dao.memberMyPageMapper.reviewCount",product_number);
	}

	@Override
	public List<Integer> scoreList(int product_number) {
		
		return sqlSessionTemplate.selectList("dao.memberMyPageMapper.scoreList",product_number);
	}

	@Override
	public int avgScore(float starAvg,int product_number) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("starAvg", starAvg);
		hMap.put("product_number", product_number);
		
		return sqlSessionTemplate.update("dao.memberMyPageMapper.avgScore",hMap);
	}
}
