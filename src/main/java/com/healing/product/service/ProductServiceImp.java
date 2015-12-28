package com.healing.product.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.memberMypage.dto.ReviewDto;
import com.healing.product.dao.ProductDao;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductDayDto;
import com.healing.product.dto.ProductDetailDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;
import com.healing.product.dto.ProductSearchDto;
import com.healing.recentProduct.dao.RecentProductDao;

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
	@Autowired				
	private RecentProductDao recentProductDao;			// 쿠키 생성하기 위해서 받아오는 dao

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
		mav.addObject("product_category",product_category);
		mav.addObject("pageNumber",currentPage);
		mav.setViewName("product/productList");
	}
	
	@Override
	public void flightList(ModelAndView mav) {
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
		
		String pNum=request.getParameter("pNum");		// pNum 값
		
		if(pNum==null) {
			mav.setViewName("product/productList");
			return;
		}
		int product_number=Integer.parseInt(pNum);
		ProductDto productDto = productDao.productRead(product_number);
		int flightCount = productDao.flightGetCount(product_number);		// 조건에 맞는 항공정보 개수
		
		int value=productDao.productPlusCount(product_number);
		HomeAspect.logger.info(HomeAspect.logMsg + "value:" + value);
		
		if(flightCount == 0) {
			mav.setViewName("product/flightList");
			return;
		}
		
		List<FlightDto> flightList=null;
		flightList=productDao.flightGetList(product_number);		// 항공정보 pNum값이 일치하는것만 오름차순 정렬
//		HomeAspect.logger.info(HomeAspect.logMsg + "flightList:" + flightList);
		
		List<Integer> flightOrderedList=new ArrayList<Integer>();
		for(int i=0;i<flightList.size();i++){
			int flight_ordered=productDao.getOrdered(flightList.get(i).getFlight_number());
			flightOrderedList.add(i, flight_ordered);
		}
		
		mav.addObject("flightOrderedList",flightOrderedList);
		mav.addObject("flightCount",flightCount);
		mav.addObject("productDto",productDto);
		mav.addObject("flightList",flightList);
		mav.addObject("pNum",pNum);
		mav.addObject("pc",pc);
		mav.addObject("product_category",product_category);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("product/flightList");
	}
	
	@Override
	public void productRead(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
				
		String product_category="";
		String pc=request.getParameter("pc");
		if(pc==null) pc="1";
		if(pc.equals("1")) product_category="동남아";
		else if(pc.equals("2")) product_category="중국";
		else if(pc.equals("3")) product_category="일본";
		else product_category="동남아";
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
		String product_cities = productDao.productCitiesRead(product_number);
		String product_city = productDao.productCityRead(product_number);
		List<ProductDayDto> productDayList = productDao.productDayGetList(product_number);
		List<List<ProductDetailDto>> productDetailList = new ArrayList<List<ProductDetailDto>>();
		List<List<List<ProductPhotoDto>>> productPhotoList = new ArrayList<List<List<ProductPhotoDto>>>();
		for(int i=0;i<productDayList.size();i++){
			productDetailList.add(i,productDao.productDetailGetList(productDayList.get(i).getProduct_day_number()));
			List<List<ProductPhotoDto>> tempList = new ArrayList<List<ProductPhotoDto>>();
			for(int j=0;j<productDetailList.get(i).size();j++){
				tempList.add(j, productDao.productPhotoGetList(productDetailList.get(i).get(j).getProduct_detail_number()));;
			}
			productPhotoList.add(i,tempList);
		}
		List<ReviewDto> reviewList = productDao.reviewGetList(product_number);
		int flight_ordered=productDao.getOrdered(flight_number);
		
		//////////////////////////////////////////////////////////
		/** 
		 * @개발자 : 전현준
		 * @수정내용 : flightList 함수 안에 최근 본 상품 - 쿠키 생성 부분 추가
		 * @수정날짜 : 2015. 12. 21.
		 * @최종수정날짜 : 2015. 12. 23.
		 */
		
		Cookie cookie = new Cookie("key" + product_number, product_number+"");
		cookie.setMaxAge(60 * 10);		// 초 * 분 * 시 * 일
		cookie.setPath("/");			// 어디에서 쿠키를 나중에 불러오더라도 찾을수 있게 만드는 경로설정
		response.addCookie(cookie);
		response.setContentType("text/html;charset=utf-8");
		
		////////////////////////////////////////////////////////////////////////////////////
		
		mav.addObject("flight_ordered",flight_ordered);
		mav.addObject("productDto",productDto);
		mav.addObject("flightDto",flightDto);
		mav.addObject("product_city",product_city);
		mav.addObject("product_cities",product_cities);
		mav.addObject("productDayList",productDayList);
		mav.addObject("productDetailList",productDetailList);
		mav.addObject("productPhotoList",productPhotoList);
		mav.addObject("pNum",pNum);
		mav.addObject("fNum",fNum);
		mav.addObject("pc",pc);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("product/productRead");
	}
}
