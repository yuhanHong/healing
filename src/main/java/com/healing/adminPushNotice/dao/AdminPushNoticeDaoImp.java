package com.healing.adminPushNotice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.adminPushNotice.dto.AdminPushNoticeDto;
import com.healing.member.dto.MemberDto;

@Component
public class AdminPushNoticeDaoImp implements AdminPushNoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public AdminPushNoticeDto adminPushNoticeOverCheck(AdminPushNoticeDto adminPushNoticeDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.adminPushNoticeMapper.adminPushNoticeOverCheck",adminPushNoticeDto);
	}
	
	@Override
	public int adminPushNoticeRequestCancel(AdminPushNoticeDto adminPushNoticeDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("dao.adminPushNoticeMapper.adminPushNoticeRequestCancel",adminPushNoticeDto);
	}

	@Override
	public List<AdminPushNoticeDto> getAdminPushList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.adminPushNoticeMapper.getAdminPushList");
	}

	@Override
	public MemberDto getAdminMember(int member_number) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.adminPushNoticeMapper.getAdminMember",member_number);
	}

	@Override
	public int adminPushNoticeReadCheckUpdate(int push_number) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.adminPushNoticeMapper.adminPushNoticeReadCheckUpdate",push_number);
	}

	@Override
	public List<AdminPushNoticeDto> getAdminPushNoList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.adminPushNoticeMapper.getAdminPushNoList");
	}

	@Override
	public List<AdminPushNoticeDto> getAdminPushYesList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.adminPushNoticeMapper.getAdminPushYesList");
	}

	@Override
	public int adminPushCheck() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.adminPushNoticeMapper.adminPushCheck");
	}


	
}
