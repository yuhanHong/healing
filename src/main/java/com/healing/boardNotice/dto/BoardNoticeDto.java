package com.healing.boardNotice.dto;

import java.util.Date;

public class BoardNoticeDto {
	private int notice_number;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private Date notice_date;
	private int notice_readCount;
	private String notice_file_name;
	private String notice_file_path;
	private long notice_file_size;
	
	public int getNotice_number() {
		return notice_number;
	}
	public void setNotice_number(int notice_number) {
		this.notice_number = notice_number;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_readCount() {
		return notice_readCount;
	}
	public void setNotice_readCount(int notice_readCount) {
		this.notice_readCount = notice_readCount;
	}
	
	public String getNotice_file_name() {
		return notice_file_name;
	}
	public void setNotice_file_name(String notice_file_name) {
		this.notice_file_name = notice_file_name;
	}
	public String getNotice_file_path() {
		return notice_file_path;
	}
	public void setNotice_file_path(String notice_file_path) {
		this.notice_file_path = notice_file_path;
	}
	public long getNotice_file_size() {
		return notice_file_size;
	}
	public void setNotice_file_size(long notice_file_size) {
		this.notice_file_size = notice_file_size;
	}
}
