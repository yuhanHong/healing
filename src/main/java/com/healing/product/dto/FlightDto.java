package com.healing.product.dto;

import java.sql.Timestamp;
import java.util.Date;

public class FlightDto {
	private int flight_number;
	private int product_number;
	private Date start_date;
	private Timestamp start_time;
	private String start_airline;
	private String start_city;
	private Date end_date;
	private Timestamp end_time;
	private String end_airline;
	private String end_city;
	public int getFlight_number() {
		return flight_number;
	}
	public void setFlight_number(int flight_number) {
		this.flight_number = flight_number;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Timestamp getStart_time() {
		return start_time;
	}
	public void setStart_time(Timestamp start_time) {
		this.start_time = start_time;
	}
	public String getStart_airline() {
		return start_airline;
	}
	public void setStart_airline(String start_airline) {
		this.start_airline = start_airline;
	}
	public String getStart_city() {
		return start_city;
	}
	public void setStart_city(String start_city) {
		this.start_city = start_city;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public Timestamp getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}
	public String getEnd_airline() {
		return end_airline;
	}
	public void setEnd_airline(String end_airline) {
		this.end_airline = end_airline;
	}
	public String getEnd_city() {
		return end_city;
	}
	public void setEnd_city(String end_city) {
		this.end_city = end_city;
	}
}
