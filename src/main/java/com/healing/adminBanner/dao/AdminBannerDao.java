package com.healing.adminBanner.dao;

import java.util.List;

import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;

/**
 * @인터페이스이름 : AdminBannerDao
 * @작성일 : 2015. 12. 9.
 * @개발자 : 전현준
 * @인터페이스설명 : 추천상품 검색/등록하는 Dao(Controller -> Service -> Dao -> mapper 처리)
 */
public interface AdminBannerDao {
	public List<ProductDto> productSelect(String product, String keyword);
	
	public int bannerRecommandInsert(int productNumber);
	
	public List<ProductDto> recBannerSelect();
	
	public int bannerRecommandDelete(int productNumber);
	
	public int bannerGetCount();
	
	public List<ProductDto> getBannerList();
	
	public List<ProductPhotoDto> getProductPhotoList();
	
	public List<ProductDto> recentlyProductSelect(int value);
	
	public List<ProductPhotoDto> recentlyProductPhotoSelect(int value);
}
