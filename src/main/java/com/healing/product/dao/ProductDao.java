package com.healing.product.dao;

import java.util.List;

import com.healing.memberMypage.dto.ReviewDto;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductDayDto;
import com.healing.product.dto.ProductDetailDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;
import com.healing.product.dto.ProductSearchDto;

/**
 * @이름 : ProductDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 홍유한
 * @설명 : 상품조회 DAO 인터페이스
 */
public interface ProductDao {
	int productGetCount(String product_category);
	List<ProductDto> productGetList(ProductSearchDto productSearchDto);
	ProductDto productRead(int product_number);
	int flightGetCount(int product_number);
	List<FlightDto> flightGetList(int product_number);
	FlightDto flightRead(int flight_number);
	String productCitiesRead(int product_number);
	List<ProductDayDto> productDayGetList(int product_number);
	List<ProductDetailDto> productDetailGetList(int product_day_number);
	List<ProductPhotoDto> productPhotoGetList(int product_detail_number);
	int getOrdered(int product_number);
	String productCityRead(int product_number);
	List<ReviewDto> reviewGetList(int product_number);
	int productPlusCount(int product_number);
	List<ProductDto> productHighestCount(int endRow);
}
