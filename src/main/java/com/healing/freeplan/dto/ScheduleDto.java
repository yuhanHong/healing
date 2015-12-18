package com.healing.freeplan.dto;

public class ScheduleDto {
	private int schedule_number;
	private int member_number;
	private String schedule_content;
	private String schedule_day;
	
	
	public int getSchedule_number() {
		return schedule_number;
	}
	public void setSchedule_number(int schedule_number) {
		this.schedule_number = schedule_number;
	}
	public int getMember_number() {
		return member_number;
	}
	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}
	public String getSchedule_content() {
		return schedule_content;
	}
	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}
	public String getSchedule_day() {
		return schedule_day;
	}
	public void setSchedule_day(String schedule_day) {
		this.schedule_day = schedule_day;
	}
	
	
}
