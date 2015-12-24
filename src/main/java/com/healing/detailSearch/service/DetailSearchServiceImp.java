package com.healing.detailSearch.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.detailSearch.dao.DetailSearchDao;
import com.healing.product.dto.ProductDto;

@Component
public class DetailSearchServiceImp implements DetailSearchService {
	
	@Autowired
	private DetailSearchDao detailSearchDao;

	@Override
	public List<ProductDto> detailSearchSort(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String city=request.getParameter("str");
		int minDay=Integer.parseInt(request.getParameter("min"));
		int maxDay=Integer.parseInt(request.getParameter("max"));
		
		List<ProductDto> detailListDemo=null;
		List<ProductDto> detailList=new ArrayList<ProductDto>();
		List<Integer> list=null;
		List<String> cityList=new ArrayList<String>();
 		
		String result[]=city.split(",");
		for(int i=0;i<result.length;i++){
			cityList.add(result[i]);
		}
				
		 //HomeAspect.logger.info(HomeAspect.logMsg+"선택된 선택자들:"+city);
		// HomeAspect.logger.info(HomeAspect.logMsg+"선택된 선택자들:"+maxDay);
		
		if(city==""){
			// HomeAspect.logger.info(HomeAspect.logMsg+"선택된 선택자들:"+maxDay);
			detailList=detailSearchDao.detailSearchSortDay(minDay,maxDay);
		}else if(maxDay==1){
			list=detailSearchDao.detailSearchSortCity(cityList);
			//HomeAspect.logger.info(HomeAspect.logMsg+"도시선택상품:"+list);
			for(int i=0;i<list.size();i++){
				int product_number=list.get(i);
				detailListDemo=detailSearchDao.detailSearchSortCityNumber(product_number);
				detailList.addAll(detailListDemo);
			}
		}else if(city!="" && maxDay!=1){
			list=detailSearchDao.detailSearchSortCity(cityList);
//			HomeAspect.logger.info(HomeAspect.logMsg+"선택된 선택자들:"+list);
			for(int i=0;i<list.size();i++){
				int product_number=list.get(i);
				detailListDemo=detailSearchDao.detailSearchSortMulti(product_number,minDay,maxDay);
				detailList.addAll(detailListDemo);
			}
		}
		return detailList;
	}
}
