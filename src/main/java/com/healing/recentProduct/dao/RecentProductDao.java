package com.healing.recentProduct.dao;

import java.util.List;

import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductDto;

public interface RecentProductDao {
	public List<ProductDto> productList(int product_number);
	
	public List<FlightDto> flightList(int product_number);
}
