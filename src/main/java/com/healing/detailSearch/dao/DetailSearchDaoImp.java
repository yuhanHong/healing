package com.healing.detailSearch.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.product.dto.ProductDto;

@Component
public class DetailSearchDaoImp implements DetailSearchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Integer> detailSearchSortCity(List<String> city) {
		
		return sqlSessionTemplate.selectList("dao.detailSearchMapper.detailSearchSortCity",city);
	}

	@Override
	public List<ProductDto> detailSearchSortDay(int minDay, int maxDay) {
		HashMap<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("minDay", minDay);
		hMap.put("maxDay", maxDay);
		
		return sqlSessionTemplate.selectList("dao.detailSearchMapper.detailSearchSortDay",hMap);
	}

	@Override
	public List<ProductDto> detailSearchSortCityNumber(int product_number) {
		
		return sqlSessionTemplate.selectList("dao.detailSearchMapper.detailSearchSortCityNumber",product_number);
	}
	
	@Override
	public List<ProductDto> detailSearchSortMulti(int product_number, int minDay, int maxDay) {
		HashMap<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("minDay", minDay);
		hMap.put("maxDay", maxDay);
		hMap.put("product_number", product_number);
		
		return sqlSessionTemplate.selectList("dao.detailSearchMapper.detailSearchSortMulti",hMap);
	}
	
}
