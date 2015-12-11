package com.healing.productLike.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.product.dao.ProductDao;
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

	@Override
	public void productLikeinsert(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		int product_number=Integer.parseInt(request.getParameter("product_number"));
		
	//	HomeAspect.logger.info(HomeAspect.logMsg+"productLikeinsert"+member_number+"/"+product_number);
		
		int check=productLikeDao.productLikeinsert(member_number,product_number);
		HomeAspect.logger.info(HomeAspect.logMsg+"Insert check"+check);
						
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
		
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		List<ProductLikeDto> productLikeList=productLikeDao.getProductLikeList(member_number);
	//	HomeAspect.logger.info(HomeAspect.logMsg+"productLikeList"+productLikeList.size());
		
		mav.addObject("productLikeList",productLikeList);
		mav.addObject("member_number",member_number);
		
		mav.setViewName("productLike/productLikeList");
	}
}
