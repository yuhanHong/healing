package com.healing.adminMember.service;

import java.io.IOException;
import java.io.PrintWriter;
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

@Component
public class AdminMemberServiceImp implements AdminMemberService {
	
	@Autowired
	private AdminMemberDao adminMemberDao;

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

	@Override
	public void adminMemberSort(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String value=request.getParameter("value");
		// HomeAspect.logger.info(HomeAspect.logMsg+"선택벨류"+value);
		List<MemberDto> adminMemberList=null;
		if(value.equals("id")){
			adminMemberList=adminMemberDao.adminMemberSortId();
		}else if(value.equals("name")){
			adminMemberList=adminMemberDao.adminMemberSortName();
		}else if(value.equals("date")){
			adminMemberList=adminMemberDao.adminMemberSortDate();
		}else if(value.equals("purchase")){
			adminMemberList=adminMemberDao.adminMemberSortPurchase();
		}
		
		mav.addObject("adminMemberList",adminMemberList);
		mav.setViewName("adminMember/adminMember");
	}

	@Override
	public void adminMemberSearch(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String search=request.getParameter("search");
		String choose=request.getParameter("choose");
		List<MemberDto> adminMemberList=null;
		
		if(choose.equals("name")){
			adminMemberList=adminMemberDao.adminMemberSearchName(search);
		}
		if(choose.equals("id")){
			adminMemberList=adminMemberDao.adminMemberSearchId(search);
		}
		if(choose.equals("phone")){
			adminMemberList=adminMemberDao.adminMemberSearchPhone(search);
		}
		
		mav.addObject("adminMemberList",adminMemberList);
		mav.setViewName("adminMember/adminMember");
	}

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
		
		// HomeAspect.logger.info(HomeAspect.logMsg+"결과"+adminMemberList);
		/*mav.addObject("adminMemberList",adminMemberList);
		mav.setViewName("adminMember/adminMember");*/
	}
}
