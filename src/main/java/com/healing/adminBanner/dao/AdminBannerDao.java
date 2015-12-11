package com.healing.adminBanner.dao;

import java.util.List;

import com.healing.product.dto.ProductDto;

public interface AdminBannerDao {
	public List<ProductDto> productSelect(String product, String keyword);
	
	public int bannerRecommandInsert(int productNumber);
}
