package com.healing.adminInfo.dto;

/**
 * @이름 : AdminInfoDto
 * @날짜 : 2015. 12. 7.
 * @개발자 : 전현준
 * @설명 : DB와 주고받는 AdminInfoDto 클래스
 * @Oracle 테이블명 : company_info(회사정보)
 */

public class AdminInfoDto {
	private String company_number;		// 사업자등록번호
	private String report_number;		// 통신판매업신고번호
	private String register_number;		// 관광사업자등록번호
	private String company_name;		// 회사이름
	private String company_introduce;	// 회사주소
	private String master_name;			// 회사대표이름
	private String customer_number;		// 고객센터 전화번호
	private String person_charge;		// 개인정보관리책임자
	private String content;				// 부가설명
	private String fax_number;			// 팩스번호
	
	public String getCompany_number() {
		return company_number;
	}
	public void setCompany_number(String company_number) {
		this.company_number = company_number;
	}
	
	public String getReport_number() {
		return report_number;
	}
	public void setReport_number(String report_number) {
		this.report_number = report_number;
	}
	
	public String getRegister_number() {
		return register_number;
	}
	public void setRegister_number(String register_number) {
		this.register_number = register_number;
	}
	
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	
	public String getCompany_introduce() {
		return company_introduce;
	}
	public void setCompany_introduce(String company_introduce) {
		this.company_introduce = company_introduce;
	}
	
	public String getMaster_name() {
		return master_name;
	}
	public void setMaster_name(String master_name) {
		this.master_name = master_name;
	}
	
	public String getCustomer_number() {
		return customer_number;
	}
	public void setCustomer_number(String customer_number) {
		this.customer_number = customer_number;
	}
	
	public String getPerson_charge() {
		return person_charge;
	}
	public void setPerson_charge(String person_charge) {
		this.person_charge = person_charge;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getFax_number() {
		return fax_number;
	}
	public void setFax_number(String fax_number) {
		this.fax_number = fax_number;
	}
}
