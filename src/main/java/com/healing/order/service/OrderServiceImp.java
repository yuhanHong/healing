package com.healing.order.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.order.dao.OrderDao;
import com.healing.order.dto.OrderDto;
import com.healing.product.dto.ProductDto;

@Component
public class OrderServiceImp implements OrderService {

		@Autowired
		private OrderDao orderDao;
		
		private OrderDto orderDto;
		private ProductDto productDto;
		
		@Override
		public void orderProductRead(ModelAndView mav) {
			// TODO Auto-generated method stub
			Map<String, Object> map=mav.getModelMap();
		    HttpServletRequest request = (HttpServletRequest) map.get("request");
		      
		    int product_number=1;
		    		//Integer.parseInt(request.getParameter("product_number"));
		    productDto=orderDao.orderProductRead(product_number);
		   int member_number=1;
		   HomeAspect.logger.info(HomeAspect.logMsg+"///"+productDto.getProduct_name());
		   mav.addObject("productDto", productDto);
		   mav.addObject("member_number", member_number);
		   mav.setViewName("order/order");
		}

		@Override
		public void orderInsert(ModelAndView mav) {
			// TODO Auto-generated method stub
			Map<String, Object> map=mav.getModelMap();
		    HttpServletRequest request = (HttpServletRequest) map.get("request");
		    
		    orderDto=(OrderDto) map.get("orderDto");
		    
		    if(orderDto.getPayment_option().equals("card")){
		    	orderDto.setPayment_state("결제완료");
		    }else{
		    	orderDto.setPayment_state("입금전");
		    }
		   int check= orderDao.orderInsert(orderDto);
		   HomeAspect.logger.info(HomeAspect.logMsg+"///"+check+":  orderInsert Check");
		   
		   orderDto=orderDao.getNewOrderDto();
		   HomeAspect.logger.info(HomeAspect.logMsg+"///"+orderDto.getOrder_number()+":  orderInsert resultnumber");
		    
		    productDto=orderDao.orderProductRead(orderDto.getProduct_number());
		    
		    mav.addObject("orderDto", orderDto);
		    mav.addObject("productDto", productDto);
		    
		    mav.setViewName("order/orderCheck");
		}	
		
}
