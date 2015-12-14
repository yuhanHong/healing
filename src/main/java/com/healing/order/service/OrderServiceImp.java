package com.healing.order.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.member.dto.MemberDto;
import com.healing.order.dao.OrderDao;
import com.healing.order.dto.OrderDto;
import com.healing.product.dto.ProductDto;

/**
 * @이름 : OrderServiceImp
 * @날짜 : 2015. 12. 8.
 * @개발자 : 봉채윤
 * @설명 :  예약Service
 */
@Component
public class OrderServiceImp implements OrderService {

		@Autowired
		private OrderDao orderDao;
		
		private OrderDto orderDto;
		private ProductDto productDto;
		private MemberDto memberDto;
		
		@Override
		public void orderProductRead(ModelAndView mav) {
			// TODO Auto-generated method stub
			Map<String, Object> map=mav.getModelMap();
		    HttpServletRequest request = (HttpServletRequest) map.get("request");
		    HttpSession session=request.getSession();
		    
		    int member_number=0;
		    if(session.getAttribute("member_number")==null) {
		    	//member_number=1;
		    	memberDto=null;
		    }else{
			     member_number=(Integer) session.getAttribute("member_number");
			     memberDto=orderDao.getMemberInfo(member_number);
		  }
		    
		    int product_number=1;
		    		//Integer.parseInt(request.getParameter("product_number"));
		    productDto=orderDao.orderProductRead(product_number);
		   //HomeAspect.logger.info(HomeAspect.logMsg+"///"+productDto.getProduct_name());
		   //HomeAspect.logger.info(HomeAspect.logMsg+"///"+memberDto.getMember_name());
		  
		   mav.addObject("productDto", productDto);
		   mav.addObject("member", memberDto);
		   mav.setViewName("order/order");
		}

		@Override
		public void orderInsert(ModelAndView mav) {
			// TODO Auto-generated method stub
			Map<String, Object> map=mav.getModelMap();
		    HttpServletRequest request = (HttpServletRequest) map.get("request");
		    
		    orderDto=(OrderDto) map.get("orderDto");
		    
		    if(orderDto.getPayment_option().equals("카드")){
		    	orderDto.setPayment_state("결제완료");
		    	orderDto.setOrder_pay(orderDto.getOrder_money());
		    }else{
		    	orderDto.setPayment_state("입금전");
		    	orderDto.setOrder_pay(0);
		    }
		   int check= orderDao.orderInsert(orderDto);
		   HomeAspect.logger.info(HomeAspect.logMsg+"///"+check+":  orderInsert Check");
		   
		   orderDto=orderDao.getNewOrderDto();
		   HomeAspect.logger.info(HomeAspect.logMsg+"///"+orderDto.getOrder_number()+":  orderInsert resultnumber");
		    
		    productDto=orderDao.orderProductRead(orderDto.getFlight_number());
		    
		    mav.addObject("orderDto", orderDto);
		    mav.addObject("productDto", productDto);
		    
		    mav.setViewName("order/orderCheck");
		}	
		
}
