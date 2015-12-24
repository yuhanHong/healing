package com.healing.productLike.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.order.dao.OrderDao;
import com.healing.product.dao.ProductDao;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductDto;
import com.healing.productLike.dao.ProductLikeDao;
import com.healing.productLike.dto.ProductLikeDto;

/**
 * @이름 : ProductLikeServiceImp
 * @날짜 : 2015. 12. 11.
 * @개발자 : 봉채윤
 * @설명 : 관심상품 Service Imp
 */
@Component
public class ProductLikeServiceImp implements ProductLikeService {

	@Autowired
	public ProductLikeDao productLikeDao;
	
	@Autowired
	public OrderDao orderDao; 
	
	@Autowired
	public ProductDao productDao; 
	
	@Override
	public void productLikeinsert(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		HttpSession session=request.getSession();
		int member_number=(Integer) session.getAttribute("member_number");
		//int member_number=Integer.parseInt(request.getParameter("member_number"));
		int flight_number=Integer.parseInt(request.getParameter("flight_number"));
		int product_number=Integer.parseInt(request.getParameter("product_number"));
	//	HomeAspect.logger.info(HomeAspect.logMsg+"productLikeinsert"+member_number+"/"+product_number);
		
		int check=productLikeDao.productLikeinsert(member_number,flight_number,product_number);
	//	HomeAspect.logger.info(HomeAspect.logMsg+"Insert check"+check);
						
		try {
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(check);
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void productLikeList(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		HttpSession session=request.getSession();
		int member_number=(Integer) session.getAttribute("member_number");
		List<ProductLikeDto> flightLikeList=productLikeDao.getProductLikeList(member_number);
		for(int i=0; i<flightLikeList.size();i++){
			//HomeAspect.logger.info(HomeAspect.logMsg+"productLikeList"+flightLikeList.get(i).getProduct_number());
		}
		//관심상품 번호마다 상품Dto 붙이기
		HashMap<Integer, ProductDto> productMap=new HashMap<Integer, ProductDto>();
		HashMap<Integer, FlightDto> flightMap=new HashMap<Integer, FlightDto>();
		
		int like_number=0;
		int product_number=0;
		int flight_number=0;
		ProductLikeDto pld=null;
		ProductDto productDto=null;
		FlightDto flightDto=null;
		
		Iterator<ProductLikeDto> iter=flightLikeList.iterator();
		
		while(iter.hasNext()){
			pld=iter.next();
			//맵으로 넣어주기위해..
			like_number=pld.getLike_number();
			
			flight_number=pld.getFlight_number();
			flightDto=productDao.flightRead(flight_number);
			flightMap.put(like_number, flightDto);
			
			product_number=pld.getProduct_number();
			productDto=productDao.productRead(product_number);
			productMap.put(like_number, productDto);			
			
		}
		
		int check=productMap.size();
		int productMapSize=productMap.size();
		
		mav.addObject("check",check);
		mav.addObject("productMapSize",productMapSize);
		mav.addObject("productMap",productMap);
		mav.addObject("flightMap",flightMap);
		mav.setViewName("productLike/productLikeList");
	}

	@Override
	public void productLikeAllDelete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
	
		HttpSession session=request.getSession();
		int member_number=(Integer) session.getAttribute("member_number");
		productLikeDao.productLikeAllDelete(member_number);
		mav.addObject("member_number",member_number);
		
		mav.setViewName("productLike/productLikeList");
		
	}

	@Override
	public void productLikeSelectDel(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String str=request.getParameter("str");
		String[] deleteList=str.split(",");
		
		for(int i=1; i<deleteList.length;i++){
			productLikeDao.productLikeSelectDel(Integer.parseInt(deleteList[i]));
		}
	
		productLikeList(mav);
	}
}
