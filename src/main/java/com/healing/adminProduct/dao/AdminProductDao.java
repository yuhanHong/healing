package com.healing.adminProduct.dao;

import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductCityDto;
import com.healing.product.dto.ProductDayDto;
import com.healing.product.dto.ProductDetailDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;

/**
 * @이름 : AdminProductDao
 * @날짜 : 2015. 12. 7.
 * @개발자 : 홍유한
 * @설명 : 상품등록 DAO 인터페이스
 */
public interface AdminProductDao {
	int productWrite(ProductDto productDto);
	int productCityWrite(ProductCityDto productCityDto);
	int flightWrite(FlightDto flightDto);
	int productDayWrite(ProductDayDto productDayDto);
	int productDetailWrite(ProductDetailDto productDetailDto);
	int productPhotoWrite(ProductPhotoDto productPhotoDto);
}
