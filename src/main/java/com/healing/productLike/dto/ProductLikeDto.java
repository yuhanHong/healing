package com.healing.productLike.dto;

import java.util.Date;

/**
 * @이름 : ProductLikeDto
 * @날짜 : 2015. 12. 11.
 * @개발자 : 봉채윤
 * @설명 : 관심상품 DTO
 */
public class ProductLikeDto {

	private int like_number;
	private int member_number;
	private int flight_number;
	private int product_number;
	private Date like_date;
	
	public int getFlight_number() {
		return flight_number;
	}
	public void setFlight_number(int flight_number) {
		this.flight_number = flight_number;
	}
	public int getMember_number() {
		return member_number;
	}
	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public Date getLike_date() {
		return like_date;
	}
	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}
	public int getLike_number() {
		return like_number;
	}
	public void setLike_number(int like_number) {
		this.like_number = like_number;
	}

}
