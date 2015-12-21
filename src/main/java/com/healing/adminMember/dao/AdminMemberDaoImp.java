package com.healing.adminMember.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.member.dto.MemberDto;

/**
 * @이름 : AdminMemberDaoImp
 * @날짜 : 2015. 12. 21.
 * @개발자 : 김진수
 * @설명 : 관리자 회원정보 관리
 */
@Component
public class AdminMemberDaoImp implements AdminMemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	/**
	 * @함수이름 : adminMemberList
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원 전체리스트
	 */
	@Override
	public List<MemberDto> adminMemberList() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberList");
	}

	/**
	 * @함수이름 : adminMemberSortId
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 아이디정렬
	 */
	@Override
	public List<MemberDto> adminMemberSortId() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortId");
	}

	/**
	 * @함수이름 : adminMemberSortName
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 이름순 정렬
	 */
	@Override
	public List<MemberDto> adminMemberSortName() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortName");
	}

	/**
	 * @함수이름 : adminMemberSortDate
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 가입날짜순 정렬
	 */
	@Override
	public List<MemberDto> adminMemberSortDate() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortDate");
	}

	/**
	 * @함수이름 : adminMemberSortPurchase
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 누적금액순 정렬
	 */
	@Override
	public List<MemberDto> adminMemberSortPurchase() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortPurchase");
	}
	
	/**
	 * @함수이름 : adminMemberSortNomal
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 :	일반회원 리스트
	 */
	@Override
	public List<MemberDto> adminMemberSortNomal() {
	
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortNomal");
	}

	/**
	 * @함수이름 : adminMemberSortVip
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 우대고객 리스트
	 */
	@Override
	public List<MemberDto> adminMemberSortVip() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortVip");
	}

	/**
	 * @함수이름 : adminMemberSortDelete
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 탈퇴회원 리스트
	 */
	@Override
	public List<MemberDto> adminMemberSortDelete() {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSortDelete");
	}

	/**
	 * @함수이름 : adminMemberSearchName
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 이름검색
	 */
	@Override
	public List<MemberDto> adminMemberSearchName(String search) {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSearchName",search);
	}

	/**
	 * @함수이름 : adminMemberSearchId
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 아이디 검색
	 */
	@Override
	public List<MemberDto> adminMemberSearchId(String search) {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSearchId",search);
	}

	/**
	 * @함수이름 : adminMemberSearchPhone
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 전화번호 검색
	 */
	@Override
	public List<MemberDto> adminMemberSearchPhone(String search) {
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberSearchPhone",search);
	}

	/**
	 * @함수이름 : adminMemberPrice
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 누적구매금액으로 검색
	 */
	@Override
	public List<MemberDto> adminMemberPrice(int min, int max) {
		HashMap<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("min", min);
		hMap.put("max", max);
		
		return sqlSessionTemplate.selectList("dao.adminMemberMapper.adminMemberPrice",hMap);
	}

	/**
	 * @함수이름 : adminMemberChange
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 금액별 회원등급변경
	 */
	@Override
	public int adminMemberChange(int minValue, int maxValue, String member_level) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("minValue", minValue);
		hMap.put("maxValue", maxValue);
		hMap.put("member_level", member_level);
		
		return sqlSessionTemplate.update("dao.adminMemberMapper.adminMemberChange",hMap);
	}

	/**
	 * @함수이름 : adminMemberSelect
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보열람
	 */
	@Override
	public MemberDto adminMemberSelect(int member_number) {
		
		return sqlSessionTemplate.selectOne("dao.adminMemberMapper.adminMemberSelect",member_number);
	}

	/**
	 * @함수이름 : amdinMemberUpdate
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보 수정
	 */
	@Override
	public int amdinMemberUpdate(MemberDto memberDto) {
		
		return sqlSessionTemplate.update("dao.adminMemberMapper.adminMemberUpdate",memberDto);
	}

	/**
	 * @함수이름 : adminMemberKick
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원추방
	 */
	@Override
	public int adminMemberKick(int member_delete, int member_number) {
		HashMap<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("member_delete", member_delete);
		hMap.put("member_number", member_number);
		
		return sqlSessionTemplate.update("dao.adminMemberMapper.adminMemberKick",hMap);
	}

	/**
	 * @함수이름 : adminMemberRestore
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원 복구
	 */
	@Override
	public int adminMemberRestore(int member_delete, int member_number) {
		HashMap<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("member_delete", member_delete);
		hMap.put("member_number", member_number);
		
		return sqlSessionTemplate.update("dao.adminMemberMapper.adminMemberRestore",hMap);
	}

}
