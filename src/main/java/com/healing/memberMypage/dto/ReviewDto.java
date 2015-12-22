package com.healing.memberMypage.dto;

public class ReviewDto {
	private int review_number;
	private int order_number;
	private int member_number;
	private int flight_number;
	private int product_number;
	private String review_content;
	private int review_score;
	
	public int getReview_number() {
		return this.review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}
	public int getOrder_number() {
		return this.order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public int getMember_number() {
		return this.member_number;
	}
	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}
	public int getFlight_number() {
		return this.flight_number;
	}
	public void setFlight_number(int flight_number) {
		this.flight_number = flight_number;
	}
	public int getProduct_number() {
		return this.product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getReview_content() {
		return this.review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_score() {
		return this.review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	
}
