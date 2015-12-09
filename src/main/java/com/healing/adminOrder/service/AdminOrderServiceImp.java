package com.healing.adminOrder.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminOrder.dao.AdminOrderDao;
import com.healing.aop.HomeAspect;
import com.healing.order.dto.OrderDto;

@Component
public class AdminOrderServiceImp implements AdminOrderService {

	@Autowired
	private AdminOrderDao adminOrderDao;

	@Override
	public void adminOrderSearch(ModelAndView mav) {
		// TODO Auto-generated method stub
	
	    List<OrderDto> orderList=adminOrderDao.getAllOrderList();
	  //HomeAspect.logger.info(HomeAspect.logMsg+"///"+orderList.size());
	    
	    mav.addObject("orderList", orderList);	    
		mav.setViewName("adminOrder/adminOrderSearch");
	}

	@Override
	public void adminOrderSearchOne(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    
	    int search_label=Integer.parseInt(request.getParameter("search_label"));
	    String search_input=request.getParameter("search_input");
	   
	    if(search_label==8) search_input="비회원";
	    List<OrderDto> orderList=adminOrderDao.adminOrderSearchOne(search_label,search_input);
	    HomeAspect.logger.info(HomeAspect.logMsg+"///"+orderList.size());
	   
	    mav.addObject("orderList", orderList);	    
		mav.setViewName("adminOrder/adminOrderSearch");
	}

	@Override
	public void adminOrderSearchMulti(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    
	    int search_label=Integer.parseInt(request.getParameter("search_label"));
	    String search_input=request.getParameter("search_input");
	    String start_date=request.getParameter("start_date");
	    String end_date=request.getParameter("end_date"); 		
	    
		List<OrderDto> orderList=adminOrderDao.adminOrderSearchMulti(search_label,search_input,start_date,end_date);
		mav.addObject("orderList", orderList);	    
		mav.setViewName("adminOrder/adminOrderSearch");
	}
	
	
}
