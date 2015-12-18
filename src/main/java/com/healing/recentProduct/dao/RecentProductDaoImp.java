package com.healing.recentProduct.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductDto;

@Component
public class RecentProductDaoImp implements RecentProductDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ProductDto> productList(int product_number) {
		return sqlSessionTemplate.selectList("dao.recentProductMapper.productList", product_number);
	}

	@Override
	public List<FlightDto> flightList(int product_number) {
		return sqlSessionTemplate.selectList("dao.recentProductMapper.flightList", product_number);
	}

}
