package com.healing.member.service;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.member.dao.MemberDao;
import com.healing.member.dto.MemberDto;

/**
 * @이름 : MemberServiceImp
 * @날짜 : 2015. 12. 7.
 * @개발자 : 김진수
 * @설명 : 회원관리 Service
 */
@Component
public class MemberServiceImp implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public void memberJoin(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		
		
		mav.setViewName("member/memberJoin");
	}

	@Override
	public void memberJoinOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		String nomal="nomal";				// 회원 기본등급 노말 설정
		memberDto.setMember_date(new Date()); // 가입날짜
		memberDto.setMember_level(nomal);	// 회원 기본등급 노말 설정
		
		int check=memberDao.memberInsert(memberDto);
		// HomeAspect.logger.info(HomeAspect.logMsg+"회원가입체크:"+check);
		
		mav.addObject("check",check);
		mav.setViewName("member/memberJoinOk");
	}
}
