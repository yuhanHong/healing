package com.healing.product.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.aop.HomeAspect;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductSearchDto;

/**
 * @이름 : ProductDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 홍유한
 * @설명 : 상품조회 DAO 구현클래스
 */
@Component
public class ProductDaoImp implements ProductDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int productGetCount(String product_category) {
		return sqlSessionTemplate.selectOne("dao.productMapper.productGetCount",product_category);
	}

	@Override
	public List<ProductDto> productGetList(ProductSearchDto productSearchDto) {
		return sqlSessionTemplate.selectList("dao.productMapper.productGetList",productSearchDto);
	}

	@Override
	public ProductDto productRead(int product_number) {
		return sqlSessionTemplate.selectOne("dao.productMapper.productRead",product_number);
	}

	@Override
	public int flightGetCount(int product_number) {
		return sqlSessionTemplate.selectOne("dao.productMapper.flightGetCount",product_number);
	}

	@Override
	public List<ProductDto> flightGetList(int product_number) {
		return sqlSessionTemplate.selectList("dao.productMapper.flightGetList",product_number);
	}
	
	@Override
	public FlightDto flightRead(int flight_number) {
		return sqlSessionTemplate.selectOne("dao.productMapper.flightRead",flight_number);
	}
}
