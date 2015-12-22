package com.healing.freeplan.dao;

import java.util.List;

import com.healing.freeplan.dto.FreePlanDto;

public interface FreePlanDao {
	public int freePlanGetCount();
	public List<FreePlanDto> freePlanGetList();
	public int freePlanInsert(FreePlanDto freeplan);
	public int freePlanCtrNum();
	public List<String> freePlanCtrList();
	public int freePlanCityNum(String ctrName);
	public List<FreePlanDto> freePlanCityList(String ctrName);
	public int freePlanSelectCityNum(String cityName);
	public List<FreePlanDto> freePlanSelectCityList(String cityName);
	public int freePlanCategoryNum(String cityName, String place_category);
	public List<FreePlanDto> freePlanCategoryList(String cityName, String place_category);
	public int freePlanSearchNum(String cityName, String place_category);
	public List<FreePlanDto> freePlanSearchList(String cityName, String place_category);
	public List<String> freePlanCityNameList(String ctrName, String cityName);
	public int freePlanSaveFile(int member_number,String schedule_day,String schedule_content);
	public int freePlanGetSchedule(int member_number);
}
