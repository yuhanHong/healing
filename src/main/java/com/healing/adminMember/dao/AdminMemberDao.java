package com.healing.adminMember.dao;

import java.util.List;

import com.healing.member.dto.MemberDto;

public interface AdminMemberDao {
	
	public List<MemberDto> adminMemberList();
	
	public List<MemberDto> adminMemberSortId();
	
	public List<MemberDto> adminMemberSortName();
	
	public List<MemberDto> adminMemberSortDate();
	
	public List<MemberDto> adminMemberSortPurchase();
	
	public List<MemberDto> adminMemberSearchName(String search);
	
	public List<MemberDto> adminMemberSearchId(String search);
	
	public List<MemberDto> adminMemberSearchPhone(String search);
	
	public List<MemberDto> adminMemberPrice(int min,int max);

}
