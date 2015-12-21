package com.healing.adminMember.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminMember.dao.AdminMemberDao;
import com.healing.aop.HomeAspect;
import com.healing.member.dto.MemberDto;

/**
 * @이름 : AdminMemberServiceImp
 * @날짜 : 2015. 12. 21.
 * @개발자 : 김진수
 * @설명 : 관리자 회원관리
 */
@Component
public class AdminMemberServiceImp implements AdminMemberService {
	
	@Autowired
	private AdminMemberDao adminMemberDao;

	/**
	 * @함수이름 : adminMemberList
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 전체회원정보 리스트
	 */
	@Override
	public void adminMemberList(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		List<MemberDto> adminMemberList=null;
		
		adminMemberList=adminMemberDao.adminMemberList();
		// HomeAspect.logger.info(HomeAspect.logMsg+"멤버리스트"+memberList);
		
		mav.addObject("adminMemberList",adminMemberList);
		mav.setViewName("adminMember/adminMember");
	}

	/**
	 * @함수이름 : adminMemberSort
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원정보 정렬
	 */
	@Override
	public void adminMemberSort(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String value=request.getParameter("value");
		// HomeAspect.logger.info(HomeAspect.logMsg+"선택벨류"+value);
		List<MemberDto> adminMemberList=null;
		if(value.equals("id")){	// 아이디순
			adminMemberList=adminMemberDao.adminMemberSortId();
		}else if(value.equals("name")){	// 이름순
			adminMemberList=adminMemberDao.adminMemberSortName();
		}else if(value.equals("date")){	// 가입날짜순
			adminMemberList=adminMemberDao.adminMemberSortDate();
		}else if(value.equals("purchase")){	// 누적구매금액순
			adminMemberList=adminMemberDao.adminMemberSortPurchase();
		}else if(value.equals("normal")){	// 일반회원
			adminMemberList=adminMemberDao.adminMemberSortNomal();
		}else if(value.equals("vip")){		// vip
			adminMemberList=adminMemberDao.adminMemberSortVip();
		}else if(value.equals("delete")){	// 삭제된회원들
			adminMemberList=adminMemberDao.adminMemberSortDelete();
		}
		
		mav.addObject("adminMemberList",adminMemberList);
		mav.setViewName("adminMember/adminMember");
	}

	/**
	 * @함수이름 : adminMemberSearch
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원검색
	 */
	@Override
	public void adminMemberSearch(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String search=request.getParameter("search");
		String choose=request.getParameter("choose");
		List<MemberDto> adminMemberList=null;
		
		if(choose.equals("name")){	// 이름검색
			adminMemberList=adminMemberDao.adminMemberSearchName(search);
		}
		if(choose.equals("id")){	// 아이디검색
			adminMemberList=adminMemberDao.adminMemberSearchId(search);
		}
		if(choose.equals("phone")){	// 전화번호 검색
			adminMemberList=adminMemberDao.adminMemberSearchPhone(search);
		}
		
		mav.addObject("adminMemberList",adminMemberList);
		mav.setViewName("adminMember/adminMember");
	}

	/**
	 * @함수이름 : adminMemberPrice
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원 누적금액 최소 최대로 선택
	 */
	@Override
	public List<MemberDto> adminMemberPrice(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		int min=Integer.parseInt(request.getParameter("min"));
		int max=Integer.parseInt(request.getParameter("max"));
		
		// HomeAspect.logger.info(HomeAspect.logMsg+"min,max벨류"+minvalue+","+maxvalue);
		
		List<MemberDto> list=null;
		list=adminMemberDao.adminMemberPrice(min,max);
		
		return list;
	}

	/**
	 * @함수이름 : adminMemberChangeLevel
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 선택된 회원들 등급변경
	 */
	@Override
	public void adminMemberChangeLevel(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int maxValue=Integer.parseInt(request.getParameter("maxValue"));
		int minValue=Integer.parseInt(request.getParameter("minValue"));
		String member_level=request.getParameter("memberLevel");
		// HomeAspect.logger.info(HomeAspect.logMsg+"min,max벨류"+maxValue+","+minValue+","+member_level);
		
		int check=adminMemberDao.adminMemberChange(minValue,maxValue,member_level);
		// HomeAspect.logger.info(HomeAspect.logMsg+"등급변경체크:"+check);
		
		mav.addObject("check",check);
		mav.setViewName("adminMember/adminMemberChange");
	}

	/**
	 * @함수이름 : adminMemberUpdate
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원 기본정보수정
	 */
	@Override
	public void adminMemberUpdate(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		
		// HomeAspect.logger.info(HomeAspect.logMsg+"멤버넘버:"+member_number);
		MemberDto memberDto=adminMemberDao.adminMemberSelect(member_number);
		
		mav.addObject("memberDto",memberDto);
		mav.setViewName("adminMember/adminMemberUpdate");
	}

	/**
	 * @함수이름 : adminMemberUpdateOk
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원 기본정보수정
	 */
	@Override
	public void adminMemberUpdateOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		MemberDto memberDto=(MemberDto) map.get("memberDto");
		
		int member_number=memberDto.getMember_number();
		int check=adminMemberDao.amdinMemberUpdate(memberDto);
		
		mav.addObject("check",check);
		mav.addObject("member_number",member_number);
		mav.setViewName("adminMember/adminMemberUpdateOk");
	}

	/**
	 * @함수이름 : adminMemberKick
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원추방
	 */
	@Override
	public void adminMemberKick(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int member_delete=2;
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		
		int check=adminMemberDao.adminMemberKick(member_delete,member_number);
		
		mav.addObject("check",check);
		mav.addObject("member_number",member_number);
		mav.setViewName("adminMember/adminMemberKickOk");
	}

	/**
	 * @함수이름 : adminMemberRestore
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 회원 추방, 탈퇴  복구
	 */
	@Override
	public void adminMemberRestore(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int member_delete=0;
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		
		int check=adminMemberDao.adminMemberRestore(member_delete,member_number);
		
		mav.addObject("check",check);
		mav.addObject("member_number",member_number);
		mav.setViewName("adminMember/adminMemberRestoreOk");
		
	}
}
