package com.healing.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.product.dao.ProductDao;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductSearchDto;

/**
 * @이름 : ProductDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 홍유한
 * @설명 : 상품조회 Service 구현클래스
 */
@Component
public class ProductServiceImp implements ProductService {
	@Autowired
	private ProductDao productDao;

	@Override
	public void productList(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String product_category="";
		String pc=request.getParameter("pc");
		if(pc==null) pc="1";
		if(pc.equals("1")) product_category="동남아";
		else if(pc.equals("2")) product_category="중국";
		else if(pc.equals("3")) product_category="일본";
		else product_category="동남아";
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		if(currentPage < 1) currentPage = 1;
		
		int boardSize=10;
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		int count=productDao.productGetCount(product_category);
		if(endRow > count) endRow=count;
		List<ProductDto> productList=null;

		ProductSearchDto productSearchDto=new ProductSearchDto();
		productSearchDto.setStartRow(startRow);
		productSearchDto.setEndRow(endRow);
		productSearchDto.setProduct_category(product_category);
		
		int startPage=0,endPage=0,pageCount=0;
		if (count > 0){
			productList=productDao.productGetList(productSearchDto);
			int pageBlock=10;
			startPage=currentPage-(currentPage-1)%pageBlock;
			endPage=startPage+pageBlock-1;
			pageCount=(int)Math.ceil((float)count/boardSize);
			if (endPage>pageCount) endPage=pageCount;
		}
		
		mav.addObject("count",count);
		mav.addObject("productList",productList);
		mav.addObject("startPage",startPage);
		mav.addObject("endPage",endPage);
		mav.addObject("pageCount",pageCount);
		mav.addObject("pc",pc);
		mav.addObject("pageNumber",currentPage);
		mav.setViewName("product/productList");
	}
	
	@Override
	public void flightList(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pc=request.getParameter("pc");
		if(pc==null) pc="1";
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		String pNum=request.getParameter("pNum");
		
		if(pNum==null) {
			mav.setViewName("product/productList");
			return;
		}
		int product_number=Integer.parseInt(pNum);
		ProductDto productDto = productDao.productRead(product_number);
		int flightCount = productDao.flightGetCount(product_number);
		
		if(flightCount == 0) {
			mav.setViewName("product/flightList");
			return;
		}
		
		List<ProductDto> flightList=null;
		flightList=productDao.flightGetList(product_number);
		
		mav.addObject("flightCount",flightCount);
		mav.addObject("productDto",productDto);
		mav.addObject("flightList",flightList);
		mav.addObject("pNum",pNum);
		mav.addObject("pc",pc);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("product/flightList");
	}
	
	@Override
	public void productRead(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pc=request.getParameter("pc");
		if(pc==null) pc="1";
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";

		String pNum=request.getParameter("pNum");
		if(pNum==null) {
			mav.setViewName("product/productList");
			return;
		}

		String fNum=request.getParameter("fNum");
		if(fNum==null) {
			mav.setViewName("product/flightList?pNum=" + pNum + "&pc=" + pc + "&pageNumber=" + pageNumber);
			return;
		}
		
		int product_number=Integer.parseInt(pNum);
		int flight_number=Integer.parseInt(fNum);
		ProductDto productDto = productDao.productRead(product_number);
		FlightDto flightDto = productDao.flightRead(flight_number);
		
		mav.addObject("productDto",productDto);
		mav.addObject("flightDto",flightDto);
		mav.addObject("pNum",pNum);
		mav.addObject("fNum",fNum);
		mav.addObject("pc",pc);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("product/productRead");
	}
}
