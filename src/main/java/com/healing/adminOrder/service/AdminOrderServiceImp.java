package com.healing.adminOrder.service;


import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminOrder.dao.AdminOrderDao;
import com.healing.aop.HomeAspect;
import com.healing.member.dto.MemberDto;
import com.healing.order.dto.OrderDto;
import com.healing.product.dto.ProductDto;

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
//	    HomeAspect.logger.info(HomeAspect.logMsg+"///"+orderList.size());
	   
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

	@Override
	public void adminOrderRead(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    
	    int order_number=Integer.parseInt(request.getParameter("order_number"));
	    OrderDto orderDto=adminOrderDao.adminOrderRead(order_number);
	    ProductDto productDto=adminOrderDao.adminProductRead(orderDto.getFlight_number());
	    MemberDto memberDto=adminOrderDao.adminOrderMember(orderDto.getMember_number());
	    
	    mav.addObject("orderDto", orderDto);	    
	    mav.addObject("productDto", productDto);	
	    mav.addObject("memberDto", memberDto);	
	
	}

	@Override
	public void adminOrderModyfy(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    OrderDto orderDto=(OrderDto)map.get("orderDto");
	    
//	    HomeAspect.logger.info(HomeAspect.logMsg+"///orderMoney"+orderDto.getOrder_money()+"//modimoney"+orderDto.getOrder_modify_money());
	   
	    if(orderDto.getOrder_pay()<orderDto.getOrder_money()){
	    	orderDto.setPayment_state("추가 결제필요");
	    }else if(orderDto.getOrder_pay()>orderDto.getOrder_money()){
	    	orderDto.setPayment_state("부분 환불 필요");
	    }else{
	    	orderDto.setPayment_state("결제완료");
	    }

	    adminOrderDao.adminOrderModify(orderDto);
	    mav.addObject("orderDto", orderDto);	    
		
	    
	}

	@Override
	public void adminOrderPay(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	   
	    int order_number=Integer.parseInt(request.getParameter("order_number")); 

	    adminOrderDao.adminOrderPay(order_number);
	    
	}

	@Override
	public void adminOrderCancel(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	   
	    int order_number=Integer.parseInt(request.getParameter("order_number")); 

	    adminOrderDao.adminOrderCancle(order_number);
	
	}

	@Override
	public void adminOrderStats(ModelAndView mav) {
		// TODO Auto-generated method stub
	   
	    Date date=new Date();
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	    
	    String today=sdf.format(date);
		
	    int todaySales=adminOrderDao.getTodaySales(today);
	    int todayPay=adminOrderDao.getTodayPay(today);
	    
	    mav.addObject("todaySales", todaySales);
	    mav.addObject("todayPay", todayPay); 
	}

	@Override
	public void adminOrderStatsSearch(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    HttpServletResponse response=(HttpServletResponse)map.get("response");
	    String start_date=request.getParameter("start_date");
	    String end_date=request.getParameter("end_date");
	    String select=request.getParameter("select");

	    List<String> dateList=null;
	    List<String> salesList=null;
	    List<String> payList=null;
//	    HomeAspect.logger.info(HomeAspect.logMsg+"///adminOrderStatsSearch//"+select);
	    
	    //일별로 선택한 경우
	    if(select.equals("day")){
	    	dateList=adminOrderDao.adminOrderStatsSearchDate(start_date,end_date);
	    	salesList=adminOrderDao.adminOrderStatsSearchDay(start_date,end_date);
	    	payList=adminOrderDao.adminOrderStatsSearchDayPay(start_date,end_date);
	    }
	    
	    //월별로 선택한 경우
	    if(select.equals("month")){
	    	
	    	start_date=start_date.substring(0, 7);
	    	start_date+="/01";
	    	
	    	end_date=end_date.substring(0, 7);
	    	
	    	int sub= Integer.parseInt(end_date.substring(5, 7));
	    	if(sub==1||sub==3||sub==5||sub==7||sub==8||sub==10||sub==12){
	    		end_date+="/31";
	    	}else if(sub==4||sub==6||sub==9||sub==11){
	    		end_date+="/30";
	    	}else{
	    		end_date+="/28";
	    	}
	    	dateList=adminOrderDao.adminOrderStatsSearchMonthly(start_date,end_date);
	    	salesList=adminOrderDao.adminOrderStatsSearchMonth(start_date,end_date);
	    	payList=adminOrderDao.adminOrderStatsSearchMonthPay(start_date,end_date);
	    }
	    
	    if(select.equals("year")){
	    	dateList=adminOrderDao.adminOrderStatsSearchyearly();
	    	salesList=adminOrderDao.adminOrderStatsSearchyear();
	    	payList=adminOrderDao.adminOrderStatsSearchyearPay();
	    }
	    
	    for(int i=0; i<dateList.size();i++){
//	    	HomeAspect.logger.info(HomeAspect.logMsg+dateList.get(i)+"//"+salesList.get(i)+"//"+payList.get(i));
	    }
	    int dateListLength=dateList.size();
	    
	    
	    JSONArray jsonArray=new JSONArray();
	    JSONObject rootObj = new JSONObject();
	    
	    
	    for(int i=0; i<dateListLength;i++){
	    	 JSONObject obj = new JSONObject();
	    	 obj.put("date", dateList.get(i));
	    	 obj.put("sales", salesList.get(i));
	    	 obj.put("pay", payList.get(i));
	    	 jsonArray.add(obj);
	    }
	    
	    String statsString = jsonArray.toJSONString();
	      System.out.println(statsString);
	      
	      try{
		      response.setContentType("application/json;charset=UTF-8");
		      PrintWriter out = response.getWriter();
		      out.print(statsString);	    
	      }catch(Exception e){
	    	  e.printStackTrace();
	      }
	}
	
	
}
