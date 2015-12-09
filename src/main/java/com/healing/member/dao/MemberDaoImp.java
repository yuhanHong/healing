package com.healing.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.aop.HomeAspect;
import com.healing.member.dto.InterestDto;
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
	
	/**
	 * @함수이름 : memberInsert
	 * @작성일 : 2015. 12. 7.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보 입력
	 */
	@Override
	public int memberInsert(MemberDto memberDto) {
		// HomeAspect.logger.info(HomeAspect.logMsg+"회원정보:"+memberDto.getMember_name());
		return sessionTemplate.insert("dao.memberMapper.memberInsert",memberDto);
	}

	@Override
	public int memberIdCheck(String member_id) {
		int value=0;
		String result;
		result=sessionTemplate.selectOne("dao.memberMapper.memberIdCheck",member_id);
		if(result!=null){
			value=1;
		}
		return value;
	}

	@Override
	public MemberDto memberSelect(MemberDto MemberDto) {
		
		return sessionTemplate.selectOne("dao.memberMapper.memberSelect",MemberDto);
	}
	
	@Override
	public int InterestInsert(String interest_content,int member_number) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("interest_content", interest_content);
		hMap.put("member_number", member_number);
		
		return sessionTemplate.insert("dao.memberMapper.interestInsert",hMap);
	}

	@Override
	public MemberDto memberLoginCheck(String member_id, String member_password) {
		HashMap<String,String> hMap=new HashMap<String,String>();
		hMap.put("member_id", member_id);
		hMap.put("member_password", member_password);
		
		return sessionTemplate.selectOne("dao.memberMapper.memberLoginCheck",hMap);
	}

	@Override
	public int memberDelete(String member_id,String member_password,int member_delete) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("member_id", member_id);
		hMap.put("member_password", member_password);
		hMap.put("member_delete", member_delete);
		
		return sessionTemplate.update("dao.memberMapper.memberDelete",hMap);
	}

	@Override
	public MemberDto memberSelect2(String member_id) {
		
		return sessionTemplate.selectOne("dao.memberMapper.memberSelect2",member_id);
	}

	@Override
	public List<InterestDto> interestSelect(int member_number) {
		
		return sessionTemplate.selectList("dao.memberMapper.interestSelect",member_number);
	}

	@Override
	public int memberUpdate(MemberDto memberDto) {
		
		return sessionTemplate.update("dao.memberMapper.memberUpdate",memberDto);
	}

	@Override
	public int interestDelete(int member_number) {
		
		return sessionTemplate.delete("dao.memberMapper.interestDelete",member_number);
	}
}
