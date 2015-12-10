package com.healing.adminBanner.dao;

import com.healing.product.dto.ProductDto;

public interface AdminBannerDao {
	public ProductDto productSelect(String product, String keyword);
}
