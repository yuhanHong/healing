package com.healing.memberMypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.memberMypage.dao.MemberMypageDao;
import com.healing.memberMypage.dto.MemberMypageDto;

@Component
public class MemberMypageServiceImp implements MemberMypageService {
	
	@Autowired
	private MemberMypageDao memberMypageDao;

	@Override
	public void memberMypageReply(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		int order_number=Integer.parseInt(request.getParameter("order_number"));
		int product_number=Integer.parseInt(request.getParameter("product_number"));
		
		String review_content=request.getParameter("review_content");
		int star_number=Integer.parseInt(request.getParameter("star_number"));
		// HomeAspect.logger.info(HomeAspect.logMsg+"평점:"+star_number+"후기:"+review_content);
		// HomeAspect.logger.info(HomeAspect.logMsg+"멤버넘버:"+member_number+"오더넘버:"+order_number+"상품넘버:"+product_number);
		List<Object> reviewList=new ArrayList<Object>();
		reviewList.add(member_number);
		reviewList.add(order_number);
		reviewList.add(product_number);
		reviewList.add(review_content);
		reviewList.add(star_number);
		
		int check=memberMypageDao.memberMypageReviewInsert(reviewList);
		
	}

	@Override
	public void memberMypageOrder(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		// HomeAspect.logger.info(HomeAspect.logMsg+"예약결제 회원넘버:"+member_number);
		
		List<MemberMypageDto> mypageDto=memberMypageDao.memberMypageOrderList(member_number);
		
		mav.addObject("mypageDto",mypageDto);
		mav.setViewName("memberMypage/memberMypageOrder");
	}

	@Override
	public void memberMypageRe(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		HomeAspect.logger.info(HomeAspect.logMsg+"후기 회원넘버:"+member_number);
		
		List<MemberMypageDto> mypageDto=memberMypageDao.memberMypageOrderList(member_number);
		
		mav.addObject("mypageDto",mypageDto);
		mav.setViewName("memberMypage/memberMypageRe");
	}
}
