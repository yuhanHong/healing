package com.healing.memberMypage.dao;

import java.util.List;

import com.healing.memberMypage.dto.MemberMypageDto;

public interface MemberMypageDao {
	public List<MemberMypageDto> memberMypageOrderList(int member_number);
}
