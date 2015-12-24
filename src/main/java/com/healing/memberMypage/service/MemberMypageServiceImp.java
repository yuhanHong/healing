package com.healing.memberMypage.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.freeplan.dto.FreePlanDto;
import com.healing.freeplan.dto.ScheduleDto;
import com.healing.memberMypage.dao.MemberMypageDao;
import com.healing.memberMypage.dto.MemberMypageDto;
import com.healing.memberMypage.dto.ReviewDto;

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
		int flight_number=Integer.parseInt(request.getParameter("flight_number"));
		
		String review_content=request.getParameter("review_content");
		int star_number=Integer.parseInt(request.getParameter("star_number"));
		// HomeAspect.logger.info(HomeAspect.logMsg+"평점:"+star_number+"후기:"+review_content);
		// HomeAspect.logger.info(HomeAspect.logMsg+"멤버넘버:"+member_number+"오더넘버:"+order_number+"상품넘버:"+product_number);
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("member_number", member_number);
		hMap.put("order_number", order_number);
		hMap.put("product_number", product_number);
		hMap.put("review_content", review_content);
		hMap.put("star_number", star_number);
		hMap.put("flight_number", flight_number);
		
		int check=memberMypageDao.memberMypageReviewInsert(hMap);
		// HomeAspect.logger.info(HomeAspect.logMsg+"후기체크:"+check);
		
		// 별점 평균
		int count=memberMypageDao.reviewCount(product_number); // 상품넘버로 상품에 등록된 모든 후기의 숫자를 가져온다.
		List<Integer> scoreList=memberMypageDao.scoreList(product_number);
		// HomeAspect.logger.info(HomeAspect.logMsg+"후기갯수:"+count);
		int amount=0;
		
		for(int i=0;i<scoreList.size();i++){
			amount+=scoreList.get(i);
		}
		float starAvg=(float)amount/count;
		
		int value=memberMypageDao.avgScore(starAvg,product_number);
		// HomeAspect.logger.info(HomeAspect.logMsg+"후기 평점등록체크:"+value);
		
		mav.addObject("check",check);
		mav.setViewName("memberMypage/memberMypageReviewInsertOk");
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
//		HomeAspect.logger.info(HomeAspect.logMsg+"후기 회원넘버:"+member_number);
		 Date date=new Date();
		 SimpleDateFormat sdf=new SimpleDateFormat("yy/MM/dd");
		 String today=sdf.format(date);
		
		List<MemberMypageDto> mypageDto=memberMypageDao.memberMypageReList(member_number,today);
		List<ReviewDto> reviewDto=memberMypageDao.reviewList(member_number);
		
		mav.addObject("mypageDto",mypageDto);
		mav.addObject("reviewDto",reviewDto);
		mav.setViewName("memberMypage/memberMypageRe");
	}
	
	// Mypage에 자신이 저장한 자유여행 저장기록 출력
	@Override
	public void memberMypageFreeplan(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		// 회원의 고유번호를 전달받는다.
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		//HomeAspect.logger.info(HomeAspect.logMsg+"자유여행 회원넘버:"+member_number);
		
		int check = memberMypageDao.memberMypageGetScheduleCnt(member_number);
		//HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		List<ScheduleDto> scheduleList = null;
		
		List<Integer> countList = new ArrayList<Integer>();
		List<FreePlanDto> freeplanList = new ArrayList<FreePlanDto>();
		// 사용자가 저장한 자유일정이 db에 존재하는 경우
		if(check > 0){
			// 회원고유번호를 갖는 일정을 schedule db로부터 읽어온다.
			scheduleList = memberMypageDao.memberMypageGetSchedule(member_number);
			
			for(int i = 0; i < scheduleList.size(); i++){
				// day에 추가한 장소 교유 번호를 뽑아낸다(place_number)
				String schedule_content = scheduleList.get(i).getSchedule_content();
				//HomeAspect.logger.info(HomeAspect.logMsg+schedule_content);
				
				String[] place_number = schedule_content.split(",");
				// 각 day에 저장되어 있는 장소 개수 저장
				countList.add(place_number.length);
				
				// 모든 일정 장소를 list에 저장
				for(int j = 0; j < place_number.length; j++){
					FreePlanDto placeDto = memberMypageDao.memberMypageGetPlaceList(Integer.parseInt(place_number[j]));
					freeplanList.add(placeDto);
				}
			}
		}
		
		mav.addObject("check",check);
		// 자유플랜 일정에 저장된 장소 list
		mav.addObject("freeplanList",freeplanList);
		// 자유플랜 일정이 몇일인지, 각 day당 몇 개의 장소가 저장되어있는지 저장 - countList
		mav.addObject("countList",countList);
		mav.setViewName("memberMypage/memberMypageFreeplan");
	}

	@Override
	public List<FreePlanDto> memberMypagePrintMarker(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		// 회원 고유번호와 day를 전달받는다.
		int member_number = Integer.parseInt(request.getParameter("member_number"));
		String day = request.getParameter("day");
		
		String schedule_content = memberMypageDao.memberMypageGetContent(member_number, day);
		
		List<FreePlanDto> freeplanList = new ArrayList<FreePlanDto>();
		String[] content = schedule_content.split(",");
		// place_number를 뽑아내 FreePlanDto를 갖고온다.
		for(int i = 0; i < content.length; i++){
			FreePlanDto freePlanDto = memberMypageDao.memberMypageGetPlaceList(Integer.parseInt(content[i]));
			freeplanList.add(freePlanDto);
		}
		
		return freeplanList;
	}

	@Override
	public void memberMypageDeletePlan(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		// 회원 넘버를 받는다.
		int member_number = Integer.parseInt(request.getParameter("member_number"));
		
		int check = memberMypageDao.memberMypageDeletePlan(member_number);
		
		mav.addObject("check",check);
		mav.setViewName("memberMypage/memberMypageDelete");
		
	}
}
