package com.healing.adminBanner.dto;

public class AdminBannerDto {
	private int banner_number;		// 추천상품번호
	private int product_number;		// 상품번호
	
	public int getBanner_number() {
		return banner_number;
	}
	public void setBanner_number(int banner_number) {
		this.banner_number = banner_number;
	}
	
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
}
