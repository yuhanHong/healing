package com.healing.memberMypage.dto;

import java.util.Date;

public class MemberMypageDto {
	
	private int product_number;
	private String product_name;
	private String product_country;
	private int flight_number;
	private Date flight_start_date;
	private Date flight_end_date;
	private int order_number;
	private int member_number;
	private int order_money;
	private String payment_option;
	private String payment_state;
	private int order_adult;
	private int order_child;
	private int order_baby;
	private Date order_date;
	
	
	public Date getOrder_date() {
		return this.order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getProduct_number() {
		return this.product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getProduct_name() {
		return this.product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_country() {
		return this.product_country;
	}
	public void setProduct_country(String product_country) {
		this.product_country = product_country;
	}
	public int getFlight_number() {
		return this.flight_number;
	}
	public void setFlight_number(int flight_number) {
		this.flight_number = flight_number;
	}
	public Date getFlight_start_date() {
		return this.flight_start_date;
	}
	public void setFlight_start_date(Date flight_start_date) {
		this.flight_start_date = flight_start_date;
	}
	public Date getFlight_end_date() {
		return this.flight_end_date;
	}
	public void setFlight_end_date(Date flight_end_date) {
		this.flight_end_date = flight_end_date;
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
	public int getOrder_money() {
		return this.order_money;
	}
	public void setOrder_money(int order_money) {
		this.order_money = order_money;
	}
	public String getPayment_option() {
		return this.payment_option;
	}
	public void setPayment_option(String payment_option) {
		this.payment_option = payment_option;
	}
	public String getPayment_state() {
		return this.payment_state;
	}
	public void setPayment_state(String payment_state) {
		this.payment_state = payment_state;
	}
	public int getOrder_adult() {
		return this.order_adult;
	}
	public void setOrder_adult(int order_adult) {
		this.order_adult = order_adult;
	}
	public int getOrder_child() {
		return this.order_child;
	}
	public void setOrder_child(int order_child) {
		this.order_child = order_child;
	}
	public int getOrder_baby() {
		return this.order_baby;
	}
	public void setOrder_baby(int order_baby) {
		this.order_baby = order_baby;
	}
	
	
	
}
