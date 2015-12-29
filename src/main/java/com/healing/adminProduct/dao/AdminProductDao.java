package com.healing.adminProduct.dao;

import java.util.List;

import com.healing.product.dto.BargainDto;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductCityDto;
import com.healing.product.dto.ProductDayDto;
import com.healing.product.dto.ProductDetailDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;
import com.healing.product.dto.ProductSearchDto;

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
	BargainDto getBargain();
	int setBargain(BargainDto bargainDto);
	int updateBargain(BargainDto bargainDto);
	List<ProductDto> adminProductSearch(ProductSearchDto productSearchDto);
	int adminProductGetCount(ProductSearchDto productSearchDto);
	void adminProductDeletePhoto(int product_number);
	void adminProductDeleteDetail(int product_number);
	void adminProductDeleteDay(int product_number);
	void adminProductDeleteFlight(int product_number);
	void adminProductDeleteCity(int product_number);
	int adminProductDeleteProduct(int product_number);
}
