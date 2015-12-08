package com.healing.member.dao;

import java.util.ArrayList;

import com.healing.member.dto.InterestDto;
import com.healing.member.dto.MemberDto;

public interface MemberDao {

	public int memberInsert(MemberDto memberDto);
	
	public int memberIdCheck(String member_id);
	
	public MemberDto memberSelect(MemberDto MemberDto);
	
	public int InterestInsert(String interest_content,int member_number);
	
	public MemberDto memberLoginCheck(String member_id,String member_password);
}
