package com.healing.adminBanner.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminBanner.dao.AdminBannerDao;
import com.healing.adminBanner.dto.TestFileDto;
import com.healing.aop.HomeAspect;
import com.healing.product.dao.ProductDao;
import com.healing.product.dto.ProductDto;

@Component
public class AdminBannerServiceImp implements AdminBannerService {
	@Autowired
	private AdminBannerDao adminBannerDao;

	/**
	 * @함수이름 : bannerInsert
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 전현준
	 * @함수설명 : bannerInsert.jsp 파일로 데이터(id, password)값 가지고 이동하는 함수 
	 */
	@Override
	public void bannerInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");
		HomeAspect.logger.info(HomeAspect.logMsg + "관리자 id:" + admin_id + ", 관리자 pw:" + admin_pw);
		
		mav.addObject("admin_id", admin_id);
		mav.addObject("admin_pw", admin_pw);
		mav.setViewName("adminBanner/bannerInsert");
	}

	/**
	 * @함수이름 : bannerSearch
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 전현준
	 * @함수설명 : 추천 상품 검색($.ajax 이용, JSONObject 객체 이용)
	 */
	@Override
	public void bannerSearch(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		String product = request.getParameter("product");
		String keyword = request.getParameter("keyword");
		
		HomeAspect.logger.info(HomeAspect.logMsg + "상품명:" + product + ", 검색어:" + keyword);
		
		//ProductDto productDto = adminBannerDao.productSelect(product, keyword);
		List<ProductDto> productDto = adminBannerDao.productSelect(product, keyword);
		HomeAspect.logger.info(HomeAspect.logMsg + "productDto 주소 :" + productDto);
		
		JSONObject json = new JSONObject();		// JSONObject 객체 생성
		json.put("data", productDto);			// JSONObject에 값 넣기
		
		PrintWriter out = null;
		try {
			response.setContentType("application/html;charset=UTF-8");
			out = response.getWriter();
			out.print(json.toString());		// out 객체의 내용을 ajax의 데이터타입이 json에게 갖고있는 데이터를 전달함
		} catch (IOException e) {
			e.printStackTrace();
		}
				
		mav.addObject("productDto", productDto);
		mav.setViewName("adminBanner/bannerInsert");
	}

	/**
	 * @함수이름 : bannerRecommandUpdate
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 전현준
	 * @함수설명 : url로 보내진 ,(쉼표)를 split으로 나눈 후 배너 등록 상태값을 바꾸는 함수
	 */
	@Override
	public void bannerRecommandInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String str = request.getParameter("str");
		String[] insertList = str.split(",");
		
		for(int i=1; i<insertList.length;i++){
			adminBannerDao.bannerRecommandInsert(Integer.parseInt(insertList[i]));
			//HomeAspect.logger.info(HomeAspect.logMsg + Integer.parseInt(insertList[i]));
		}
	}

	/**
	 * @함수이름 : bannerRecommandSelect
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 전현준
	 * @함수설명 : 관리자 - 추천상품 리스트 조회(equi join)
	 */
	@Override
	public void bannerRecommandSelect(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<ProductDto> productDto = adminBannerDao.recBannerSelect();
		//HomeAspect.logger.info(HomeAspect.logMsg + "로그BannerSelect" + productDto);
		
		mav.addObject("productDto", productDto);
		mav.setViewName("adminBanner/bannerInsert");
	}
	
	/**
	 * @함수이름 : bannerRecommandDelete
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 전현준
	 * @함수설명 : url로 보내진 ,(쉼표)를 split으로 나눈 후 상품 테이블에 배너상태값을 0으로 바꿔주는 함수
	 */
	@Override
	public void bannerRecommandDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String str = request.getParameter("str");
		String[] insertList = str.split(",");
		
		for(int i=1; i<insertList.length;i++){
			adminBannerDao.bannerRecommandDelete(Integer.parseInt(insertList[i]));
			//HomeAspect.logger.info(HomeAspect.logMsg + Integer.parseInt(insertList[i]));
		}
		
	}

	@Override
	public void bannerPrint(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int key = Integer.parseInt(request.getParameter("key"));
		
		List<TestFileDto> list = adminBannerDao.bannerPrint(key);
		HomeAspect.logger.info(HomeAspect.logMsg + list);
	}

	@Override
	public void bannerHome(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String path = adminBannerDao.getPath();
		HomeAspect.logger.info(HomeAspect.logMsg + path);
		
		mav.addObject("path",path);
		mav.setViewName("/home");
	}

	/*@Override
	public void bannerList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int productSize = 10;
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage-1) * productSize +1;
		int endRow = currentPage * productSize;
		
		int count = adminBannerDao.getBannerCount();
		HomeAspect.logger.info(HomeAspect.logMsg + count);
		
		List<ProductDto> productList = null;
		if(count > 0){
			productList = adminBannerDao.getBannerList(startRow, endRow);
		}
		
		HomeAspect.logger.info(HomeAspect.logMsg + productList.size());
		
		mav.addObject("productList", productList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("productSize", productSize);
		mav.setViewName("adminBanner/bannerInsert");
	}*/
}
