package com.healing.boardFaq.dto;

public class BoardFaqDto {
	private int faq_number;
	private String faq_sort;
	private String faq_title;
	private String faq_content;
	
	public int getFaq_number() {
		return faq_number;
	}
	public void setFaq_number(int faq_number) {
		this.faq_number = faq_number;
	}
	public String getFaq_sort() {
		return faq_sort;
	}
	public void setFaq_sort(String faq_sort) {
		this.faq_sort = faq_sort;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
}
