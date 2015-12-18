package com.healing.adminPushNotice.dao;

import java.util.List;

import com.healing.adminPushNotice.dto.AdminPushNoticeDto;
import com.healing.member.dto.MemberDto;

public interface AdminPushNoticeDao {

	public AdminPushNoticeDto adminPushNoticeOverCheck(AdminPushNoticeDto adminPushNoticeDto);
	public int adminPushNoticeRequestCancel(AdminPushNoticeDto adminPushNoticeDto);
	
	public List<AdminPushNoticeDto> getAdminPushList();
	public MemberDto getAdminMember(int member_number);
 

	public int adminPushNoticeReadCheckUpdate(int push_number);
	public List<AdminPushNoticeDto> getAdminPushNoList();
	public List<AdminPushNoticeDto> getAdminPushYesList();
	public int adminPushCheck();
}
