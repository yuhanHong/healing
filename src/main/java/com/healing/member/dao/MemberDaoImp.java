package com.healing.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.aop.HomeAspect;
import com.healing.member.dto.MemberDto;

/**
 * @이름 : MemberDaoImp
 * @날짜 : 2015. 12. 7.
 * @개발자 : 김진수
 * @설명 : 회원가입 Dao
 */
@Component
public class MemberDaoImp implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public int memberInsert(MemberDto memberDto) {
		HomeAspect.logger.info(HomeAspect.logMsg+"회원정보:"+memberDto.getMember_name());
		return sessionTemplate.insert("dao.memberMapper.memberInsert",memberDto);
	}
}
