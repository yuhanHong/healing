package com.healing.order.service;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.member.dto.MemberDto;
import com.healing.order.dao.OrderDao;
import com.healing.order.dto.OrderDto;
import com.healing.product.dao.ProductDao;
import com.healing.product.dto.FlightDto;
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
	@Autowired
	private ProductDao productDao;
	
	@Override
	public void orderProductRead(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
		
		int member_number=0;
		MemberDto memberDto;
		if(session.getAttribute("member_number")==null) {
			//member_number=1;
			memberDto=null;
		}else{
			member_number=(Integer) session.getAttribute("member_number");
			memberDto=orderDao.getMemberInfo(member_number);
		}

		int product_number=Integer.parseInt(request.getParameter("pNum"));
		ProductDto productDto=productDao.productRead(product_number);
		int flight_number=Integer.parseInt(request.getParameter("fNum"));
		FlightDto flightDto=productDao.flightRead(flight_number);
		//HomeAspect.logger.info(HomeAspect.logMsg+"///"+productDto.getProduct_name());
		//HomeAspect.logger.info(HomeAspect.logMsg+"///"+memberDto.getMember_name());
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start_date =sdf.format(flightDto.getFlight_start_date());
		
		mav.addObject("start_date", start_date);
		
		mav.addObject("productDto", productDto);
		mav.addObject("flightDto", flightDto);
		mav.addObject("member", memberDto);
		mav.setViewName("order/order");
	}

	@Override
	public void orderInsert(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		OrderDto orderDto=(OrderDto) map.get("orderDto");
		
		ProductDto productDto=productDao.productRead(orderDto.getProduct_number());
		FlightDto flightDto=productDao.flightRead(orderDto.getFlight_number());
		
		if(orderDto.getPayment_option().equals("카드")){
			orderDto.setPayment_state("결제완료");
			orderDto.setOrder_pay(orderDto.getOrder_money());
		}else{
			orderDto.setPayment_state("입금전");
			orderDto.setOrder_pay(0);
		}
		orderDto.setStart_time(flightDto.getFlight_start_date());
		
		int check= orderDao.orderInsert(orderDto);
//		HomeAspect.logger.info(HomeAspect.logMsg+"///"+check+":  orderInsert Check");
		
		orderDto=orderDao.getNewOrderDto();
//		HomeAspect.logger.info(HomeAspect.logMsg+"///"+orderDto.getOrder_number()+":  orderInsert resultnumber");
				
		
		mav.addObject("orderDto", orderDto);
		mav.addObject("productDto", productDto);
		mav.addObject("flightDto", flightDto);
		mav.setViewName("order/orderCheck");
	}	
}
