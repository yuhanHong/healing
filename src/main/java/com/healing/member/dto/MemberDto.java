package com.healing.member.dto;

import java.util.Date;

/**
 * @이름 : MemberDto
 * @날짜 : 2015. 12. 7.
 * @개발자 : 김진수
 * @설명 : 회원정보 Dto
 */
public class MemberDto {

	private int member_number;
	private String member_name;
	private String member_id;
	private String member_password;
	private String member_email;
	private String member_email_check;
	private String member_level;
	private String member_phone;
	private Date member_date;
	private int member_delete;
	private int member_purchase;
	
	public int getMember_purchase() {
		return this.member_purchase;
	}
	public void setMember_purchase(int member_purchase) {
		this.member_purchase = member_purchase;
	}
	public int getMember_number() {
		return this.member_number;
	}
	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}
	public String getMember_name() {
		return this.member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_id() {
		return this.member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return this.member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_email() {
		return this.member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_email_check() {
		return this.member_email_check;
	}
	public void setMember_email_check(String member_email_check) {
		this.member_email_check = member_email_check;
	}
	public String getMember_level() {
		return this.member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

	public String getMember_phone() {
		return this.member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public Date getMember_date() {
		return this.member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	public int getMember_delete() {
		return this.member_delete;
	}
	public void setMember_delete(int member_delete) {
		this.member_delete = member_delete;
	}
	

}
