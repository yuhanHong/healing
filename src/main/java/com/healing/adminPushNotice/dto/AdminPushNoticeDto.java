package com.healing.adminPushNotice.dto;

import java.util.Date;

public class AdminPushNoticeDto {
	private	int push_number;
	private int order_number;
	private int member_number;
	private int flight_number;
	private String push_content;	
	private Date push_date;
	private String push_readcheck;
	public int getPush_number() {
		return push_number;
	}
	public void setPush_number(int push_number) {
		this.push_number = push_number;
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
	public int getFlight_number() {
		return flight_number;
	}
	public void setFlight_number(int flight_number) {
		this.flight_number = flight_number;
	}
	public String getPush_content() {
		return push_content;
	}
	public void setPush_content(String push_content) {
		this.push_content = push_content;
	}
	public Date getPush_date() {
		return push_date;
	}
	public void setPush_date(Date push_date) {
		this.push_date = push_date;
	}
	public String getPush_readcheck() {
		return push_readcheck;
	}
	public void setPush_readcheck(String push_readcheck) {
		this.push_readcheck = push_readcheck;
	}
	
	
	
	
}
