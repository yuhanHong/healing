package com.healing.member.dao;

import java.util.ArrayList;
import java.util.List;

import com.healing.member.dto.InterestDto;
import com.healing.member.dto.MemberDto;

public interface MemberDao {

	public int memberInsert(MemberDto memberDto);
	
	public int memberIdCheck(String member_id);
	
	public MemberDto memberSelect(MemberDto MemberDto);
	
	public int InterestInsert(String interest_content,int member_number);
	
	public MemberDto memberLoginCheck(String member_id,String member_password);
	
	public int memberDelete(String member_id,String member_password,int member_delete);
	
	public MemberDto memberSelect2(String member_id);
	
	public List<InterestDto> interestSelect(int member_number);
	
	public int memberUpdate(MemberDto memberDto);
	
	public int interestDelete(int member_number);
}
