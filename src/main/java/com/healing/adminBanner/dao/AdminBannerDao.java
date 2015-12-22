package com.healing.adminBanner.dao;

import java.util.List;

import com.healing.adminBanner.dto.TestFileDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;

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
