package com.healing.memberMypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.memberMypage.dao.MemberMypageDao;

@Component
public class MemberMypageServiceImp implements MemberMypageService {
	
	@Autowired
	private MemberMypageDao memberMypageDao;

	@Override
	public void memberMypageReply(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		String review_content=request.getParameter("review_content");
		
		// HomeAspect.logger.info(HomeAspect.logMsg+"후기회원넘버,내용:"+member_number+","+review_content);
	}

	@Override
	public void memberMypageOrder(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		HomeAspect.logger.info(HomeAspect.logMsg+"예약결제 회원넘버:"+member_number);
		
		mav.setViewName("memberMypage/memberMypageOrder");
	}
}
