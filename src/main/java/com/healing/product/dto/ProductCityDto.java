package com.healing.product.dto;

public class ProductCityDto {
	private int product_city_number;
	public int getProduct_city_number() {
		return product_city_number;
	}
	public void setProduct_city_number(int product_city_number) {
		this.product_city_number = product_city_number;
	}
	private int product_number;
	private String product_city;
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getProduct_city() {
		return product_city;
	}
	public void setProduct_city(String product_city) {
		this.product_city = product_city;
	}
}
