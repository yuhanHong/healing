package com.healing.adminProduct.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.aop.HomeAspect;
import com.healing.product.dto.BargainDto;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductCityDto;
import com.healing.product.dto.ProductDayDto;
import com.healing.product.dto.ProductDetailDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;

/**
 * @이름 : AdminProductDaoImp
 * @날짜 : 2015. 12. 7.
 * @개발자 : 홍유한
 * @설명 : 상품등록 DAO 구현클래스
 */
@Component
public class AdminProductDaoImp implements AdminProductDao{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public int productWrite(ProductDto productDto) {
		int check=0;
		int result=0;
		check=sessionTemplate.insert("dao.adminProductMapper.productWrite",productDto);

		if(check > 0) result=sessionTemplate.selectOne("dao.adminProductMapper.getProductNumber");
		
		return result;
	}

	@Override
	public int productCityWrite(ProductCityDto productCityDto) {
		return sessionTemplate.insert("dao.adminProductMapper.productCityWrite",productCityDto);
	}

	@Override
	public int flightWrite(FlightDto flightDto) {
		return sessionTemplate.insert("dao.adminProductMapper.flightWrite",flightDto);
	}

	@Override
	public int productDayWrite(ProductDayDto productDayDto) {
		int check=0;
		int result=0;
		check=sessionTemplate.insert("dao.adminProductMapper.productDayWrite",productDayDto);

		if(check > 0) result=sessionTemplate.selectOne("dao.adminProductMapper.getProductDayNumber");
		
		return result;
	}

	@Override
	public int productDetailWrite(ProductDetailDto productDetailDto) {
		int check=0;
		int result=0;
		check=sessionTemplate.insert("dao.adminProductMapper.productDetailWrite",productDetailDto);

		if(check > 0) result=sessionTemplate.selectOne("dao.adminProductMapper.getProductDetailNumber");
		
		return result;
	}

	@Override
	public int productPhotoWrite(ProductPhotoDto productPhotoDto) {
		return sessionTemplate.insert("dao.adminProductMapper.productPhotoWrite",productPhotoDto);
	}

	@Override
	public BargainDto getBargain() {
		return sessionTemplate.selectOne("dao.adminProductMapper.getBargain");
	}
	
	@Override
	public int setBargain(BargainDto bargainDto) {
		return sessionTemplate.insert("dao.adminProductMapper.setBargain",bargainDto);
	}
	
	@Override
	public int updateBargain(BargainDto bargainDto) {
		return sessionTemplate.update("dao.adminProductMapper.updateBargain",bargainDto);
	}
}
