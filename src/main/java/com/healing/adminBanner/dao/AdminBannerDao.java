package com.healing.adminBanner.dao;

import java.util.List;

import com.healing.product.dto.ProductDto;

public interface AdminBannerDao {
	public List<ProductDto> productSelect(String product, String keyword);
	
	public int bannerRecommandInsert(int productNumber);
	
	public List<ProductDto> recBannerSelect();
	
	public int bannerRecommandDelete(int productNumber);
	
	/*public int getBannerCount();
	
	public List<ProductDto> getBannerList(int startRow, int endRow);*/
}
