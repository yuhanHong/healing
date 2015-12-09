package com.healing.member.dto;

public class InterestDto {
	private int member_number;
	private String interest_content;
	private int interest_number;
	
	public int getInterest_number() {
		return this.interest_number;
	}
	public void setInterest_number(int interest_number) {
		this.interest_number = interest_number;
	}
	public int getMember_number() {
		return this.member_number;
	}
	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}
	public String getInterest_content() {
		return this.interest_content;
	}
	public void setInterest_content(String interest_content) {
		this.interest_content = interest_content;
	}
	
}
