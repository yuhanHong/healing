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
	
	/**
	 * @함수이름 : productList
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 전현준
	 * @함수설명 : product 테이블, flight 테이블 조인해서 List로 데이터 받는 함수(조건, 배너가 1이고, 상품번호가 일치하는 것만)
	 * @result-Type : productDto
	 */
	@Override
	public List<ProductDto> productList(int product_number) {
		return sqlSessionTemplate.selectList("dao.recentProductMapper.productList", product_number);
	}

	/**
	 * @함수이름 : flightList
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 전현준
	 * @함수설명 : product 테이블, flight 테이블 조인해서 List로 데이터 받는 함수(조건, 배너가 1이고, 상품번호가 일치하는 것만)
	 * @result-Type : flightDto
	 */
	@Override
	public List<FlightDto> flightList(int product_number) {
		return sqlSessionTemplate.selectList("dao.recentProductMapper.flightList", product_number);
	}

}
