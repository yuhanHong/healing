package com.healing.order.dto;

import java.util.Date;

import org.springframework.stereotype.Component;


/**
 * @이름 : OrderDto
 * @날짜 : 2015. 12. 7.
 * @개발자 : 봉채윤
 * @설명 : 예약정보 Dto 
 */
public class OrderDto {

	private int order_number;
	private int member_number;
	private int product_number;
	private int order_money;
	private Date order_date;
	private int order_price_adult;
	private int order_price_child;
	private int order_price_baby;
	private int order_adult;
	private int order_child;
	private int order_baby;
	private String payment_option;
	private String payment_state;
	private String order_name;
	private String order_email;
	private String order_phone;
	private Date start_time;
	private String product_name;
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
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
	public int getOrder_money() {
		return order_money;
	}
	public void setOrder_money(int order_money) {
		this.order_money = order_money;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getOrder_price_adult() {
		return order_price_adult;
	}
	public void setOrder_price_adult(int order_price_adult) {
		this.order_price_adult = order_price_adult;
	}
	public int getOrder_price_child() {
		return order_price_child;
	}
	public void setOrder_price_child(int order_price_child) {
		this.order_price_child = order_price_child;
	}
	public int getOrder_price_baby() {
		return order_price_baby;
	}
	public void setOrder_price_baby(int order_price_baby) {
		this.order_price_baby = order_price_baby;
	}
	public int getOrder_adult() {
		return order_adult;
	}
	public void setOrder_adult(int order_adult) {
		this.order_adult = order_adult;
	}
	public int getOrder_child() {
		return order_child;
	}
	public void setOrder_child(int order_child) {
		this.order_child = order_child;
	}
	public int getOrder_baby() {
		return order_baby;
	}
	public void setOrder_baby(int order_baby) {
		this.order_baby = order_baby;
	}
	public String getPayment_option() {
		return payment_option;
	}
	public void setPayment_option(String payment_option) {
		this.payment_option = payment_option;
	}
	public String getPayment_state() {
		return payment_state;
	}
	public void setPayment_state(String payment_state) {
		this.payment_state = payment_state;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_email() {
		return order_email;
	}
	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	
}
