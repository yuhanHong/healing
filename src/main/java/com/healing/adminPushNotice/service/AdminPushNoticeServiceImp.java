package com.healing.adminPushNotice.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminOrder.dao.AdminOrderDao;
import com.healing.adminOrder.dao.AdminOrderDaoImp;
import com.healing.adminOrder.service.AdminOrderServiceImp;
import com.healing.adminPushNotice.dao.AdminPushNoticeDao;
import com.healing.adminPushNotice.dto.AdminPushNoticeDto;
import com.healing.aop.HomeAspect;
import com.healing.member.dto.MemberDto;
import com.healing.order.dao.OrderDao;
import com.healing.order.dao.OrderDaoImp;

/**
 * @이름 : AdminPushNoticeServiceImp
 * @날짜 : 2015. 12. 16.
 * @개발자 : 봉채윤
 * @설명 : Push 알림 Service
 */
@Component
public class AdminPushNoticeServiceImp implements AdminPushNoticeService {
	
	@Autowired
	public AdminPushNoticeDao adminPushNoticeDao;
	
	@Autowired
	public AdminOrderServiceImp adminOrderServiceImp;
	
	private HomeAspect homeAspect;

	//회원
	@Override
	public void adminPushNoticeRequest(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map=mav.getModelMap();
	    HttpServletResponse response=(HttpServletResponse)map.get("response");
		
	    AdminPushNoticeDto adminPushNoticeDto=(AdminPushNoticeDto)map.get("adminPushNoticeDto");
	    AdminPushNoticeDto dto=adminPushNoticeDao.adminPushNoticeOverCheck(adminPushNoticeDto);
	    int check=0;
	    
	    if(dto==null){
	    	check=adminPushNoticeDao.adminPushNoticeRequestCancel(adminPushNoticeDto);
	    }
	    try{
	      response.setContentType("application/html;charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      out.print(check);	    
      }catch(Exception e){
    	  e.printStackTrace();
      }
	}

	//관리자

	@Override
	public void adminPushNoticeGetRequest(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
	    HttpServletRequest request=(HttpServletRequest)map.get("request");
	    
	    String select=request.getParameter("select");
	    List<AdminPushNoticeDto> pushList=null;
	    if(select.equals("all")){
	    	pushList=adminPushNoticeDao.getAdminPushList();
		}else if(select.equals("no")){
			pushList=adminPushNoticeDao.getAdminPushNoList();
		}else if(select.equals("yes")){
			pushList=adminPushNoticeDao.getAdminPushYesList();
		}
		
		ArrayList<MemberDto> memberList=new ArrayList<MemberDto>() ;
		
		for(int i=0; i<pushList.size();i++){
			MemberDto memberDto=adminPushNoticeDao.getAdminMember(pushList.get(i).getMember_number());
			memberList.add(memberDto);
		}
//		HomeAspect.logger.info(HomeAspect.logMsg+"/"+pushList.get(0).getMember_number());
		int listSize=memberList.size();
		
		mav.addObject("listSize",listSize);
		mav.addObject("memberList",memberList);
		mav.addObject("pushList",pushList);
		mav.setViewName("adminPushNotice/adminPushNotice");
	}

	@Override
	public void adminPushNoticeReadCheckUpdate(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
	    HttpServletRequest request=(HttpServletRequest)map.get("request");
	    
	    int push_number=Integer.parseInt(request.getParameter("push_number"));
	    
	    adminPushNoticeDao.adminPushNoticeReadCheckUpdate(push_number);
	    adminOrderServiceImp.adminOrderRead(mav);
	    
	    mav.setViewName("adminOrder/adminOrderRead");
	}

}
