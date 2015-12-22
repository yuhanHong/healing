package com.healing.product.dto;

import java.util.Date;

public class FlightDto {
	private int flight_number;
	private int product_number;
	private int flight_occupancy;
	private Date flight_start_date;
	private Date flight_start_departure;
	private Date flight_start_arrival;
	private String flight_start_airline;
	private String flight_start_departure_city;
	private String flight_start_arrival_city;
	private Date flight_end_date;
	private Date flight_end_departure;
	private Date flight_end_arrival;
	private String flight_end_airline;
	private String flight_end_departure_city;
	private String flight_end_arrival_city;
	
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
	public int getFlight_occupancy() {
		return flight_occupancy;
	}
	public void setFlight_occupancy(int flight_occupancy) {
		this.flight_occupancy = flight_occupancy;
	}
	public Date getFlight_start_date() {
		return flight_start_date;
	}
	public void setFlight_start_date(Date flight_start_date) {
		this.flight_start_date = flight_start_date;
	}
	public Date getFlight_start_departure() {
		return flight_start_departure;
	}
	public void setFlight_start_departure(Date flight_start_departure) {
		this.flight_start_departure = flight_start_departure;
	}
	public Date getFlight_start_arrival() {
		return flight_start_arrival;
	}
	public void setFlight_start_arrival(Date flight_start_arrival) {
		this.flight_start_arrival = flight_start_arrival;
	}
	public String getFlight_start_airline() {
		return flight_start_airline;
	}
	public void setFlight_start_airline(String flight_start_airline) {
		this.flight_start_airline = flight_start_airline;
	}
	public String getFlight_start_departure_city() {
		return flight_start_departure_city;
	}
	public void setFlight_start_departure_city(String flight_start_departure_city) {
		this.flight_start_departure_city = flight_start_departure_city;
	}
	public String getFlight_start_arrival_city() {
		return flight_start_arrival_city;
	}
	public void setFlight_start_arrival_city(String flight_start_arrival_city) {
		this.flight_start_arrival_city = flight_start_arrival_city;
	}
	public Date getFlight_end_date() {
		return flight_end_date;
	}
	public void setFlight_end_date(Date flight_end_date) {
		this.flight_end_date = flight_end_date;
	}
	public Date getFlight_end_departure() {
		return flight_end_departure;
	}
	public void setFlight_end_departure(Date flight_end_departure) {
		this.flight_end_departure = flight_end_departure;
	}
	public Date getFlight_end_arrival() {
		return flight_end_arrival;
	}
	public void setFlight_end_arrival(Date flight_end_arrival) {
		this.flight_end_arrival = flight_end_arrival;
	}
	public String getFlight_end_airline() {
		return flight_end_airline;
	}
	public void setFlight_end_airline(String flight_end_airline) {
		this.flight_end_airline = flight_end_airline;
	}
	public String getFlight_end_departure_city() {
		return flight_end_departure_city;
	}
	public void setFlight_end_departure_city(String flight_end_departure_city) {
		this.flight_end_departure_city = flight_end_departure_city;
	}
	public String getFlight_end_arrival_city() {
		return flight_end_arrival_city;
	}
	public void setFlight_end_arrival_city(String flight_end_arrival_city) {
		this.flight_end_arrival_city = flight_end_arrival_city;
	}
	
	@Override
	public String toString() {
		return "FlightDto [flight_number=" + flight_number + ", product_number=" + product_number
				+ ", flight_occupancy=" + flight_occupancy + ", flight_start_date=" + flight_start_date
				+ ", flight_start_departure=" + flight_start_departure + ", flight_start_arrival="
				+ flight_start_arrival + ", flight_start_airline=" + flight_start_airline
				+ ", flight_start_departure_city=" + flight_start_departure_city + ", flight_start_arrival_city="
				+ flight_start_arrival_city + ", flight_end_date=" + flight_end_date + ", flight_end_departure="
				+ flight_end_departure + ", flight_end_arrival=" + flight_end_arrival + ", flight_end_airline="
				+ flight_end_airline + ", flight_end_departure_city=" + flight_end_departure_city
				+ ", flight_end_arrival_city=" + flight_end_arrival_city + "]";
	}
}
