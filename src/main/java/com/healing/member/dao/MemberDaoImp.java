package com.healing.member.dao;

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

	/**
	 * @함수이름 : memberIdCheck
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 아이디체크
	 */
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
	
	/**
	 * @함수이름 : InterestInsert
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 관심여행지 입력
	 */
	@Override
	public int InterestInsert(String interest_content,int member_number) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("interest_content", interest_content);
		hMap.put("member_number", member_number);
		
		return sessionTemplate.insert("dao.memberMapper.interestInsert",hMap);
	}

	/**
	 * @함수이름 : memberLoginCheck
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 로그인체크
	 */
	@Override
	public MemberDto memberLoginCheck(String member_id, String member_password) {
		HashMap<String,String> hMap=new HashMap<String,String>();
		hMap.put("member_id", member_id);
		hMap.put("member_password", member_password);
		
		return sessionTemplate.selectOne("dao.memberMapper.memberLoginCheck",hMap);
	}

	/**
	 * @함수이름 : memberDelete
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 멤버삭제, 삭제기록 업데이트
	 */
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

	/**
	 * @함수이름 : interestSelect
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원이 입력했던 관심정보 빼기
	 */
	@Override
	public List<InterestDto> interestSelect(int member_number) {
		
		return sessionTemplate.selectList("dao.memberMapper.interestSelect",member_number);
	}

	/**
	 * @함수이름 : memberUpdate
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보 업데이트
	 */
	@Override
	public int memberUpdate(MemberDto memberDto) {
		
		return sessionTemplate.update("dao.memberMapper.memberUpdate",memberDto);
	}

	/**
	 * @함수이름 : interestDelete
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원의 관심여행지 삭제
	 */
	@Override
	public int interestDelete(int member_number) {
		
		return sessionTemplate.delete("dao.memberMapper.interestDelete",member_number);
	}
}
