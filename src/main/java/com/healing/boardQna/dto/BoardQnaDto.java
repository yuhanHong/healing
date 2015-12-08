package com.healing.boardQna.dto;

import java.util.Date;

public class BoardQnaDto {
	private int qna_number;
	private String qna_sort;
	private String qna_title;
	private String qna_content;
	private String qna_writer;
	private Date qna_date;
	private String qna_password;
	private int qna_group_number;
	private int qna_sequence_number;
	
	public int getQna_number() {
		return qna_number;
	}
	public void setQna_number(int qna_number) {
		this.qna_number = qna_number;
	}
	public String getQna_sort() {
		return qna_sort;
	}
	public void setQna_sort(String qna_sort) {
		this.qna_sort = qna_sort;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_password() {
		return qna_password;
	}
	public void setQna_password(String qna_password) {
		this.qna_password = qna_password;
	}
	public int getQna_group_number() {
		return qna_group_number;
	}
	public void setQna_group_number(int qna_group_number) {
		this.qna_group_number = qna_group_number;
	}
	public int getQna_sequence_number() {
		return qna_sequence_number;
	}
	public void setQna_sequence_number(int qna_sequence_number) {
		this.qna_sequence_number = qna_sequence_number;
	}
}
