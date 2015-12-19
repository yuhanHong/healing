package com.healing.detailSearch.dao;

import java.util.List;

import com.healing.product.dto.ProductDto;

public interface DetailSearchDao {
	public List<Integer> detailSearchSortCity(List<String> cityList);
	
	public List<ProductDto> detailSearchSortDay(int minDay,int maxDay);
	
	public List<ProductDto> detailSearchSortCityNumber(int product_number);
	
	public List<ProductDto> detailSearchSortMulti(int product_number,int minDay,int maxDay);

}
