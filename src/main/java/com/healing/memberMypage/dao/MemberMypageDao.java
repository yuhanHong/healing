package com.healing.memberMypage.dao;

import java.util.HashMap;
import java.util.List;

import com.healing.freeplan.dto.FreePlanDto;
import com.healing.freeplan.dto.ScheduleDto;
import com.healing.memberMypage.dto.MemberMypageDto;
import com.healing.memberMypage.dto.ReviewDto;

public interface MemberMypageDao {
	public List<MemberMypageDto> memberMypageOrderList(int member_number);
	
	public List<MemberMypageDto> memberMypageReList(int member_number,String today);
	
	public int memberMypageReviewInsert(HashMap<String,Object> hMap);
	
	public List<ScheduleDto> memberMypageGetSchedule(int member_number);
	public FreePlanDto memberMypageGetPlaceList(int place_number);
	public int memberMypageGetScheduleCnt(int member_number);
	public String memberMypageGetContent(int member_number, String day);
	public int memberMypageDeletePlan(int member_number);
	public List<ReviewDto> reviewList(int member_number);
	public int reviewCount(int product_number);
	public List<Integer> scoreList(int product_number);
	public int avgScore(float starAvg,int product_number);
}
