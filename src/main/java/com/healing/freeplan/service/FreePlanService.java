package com.healing.freeplan.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.healing.freeplan.dto.FreePlanDto;

public interface FreePlanService {
	public List<FreePlanDto> freePlanGetList(ModelAndView mav);
	public void freePlanInsertOk(ModelAndView mav);
	public void freePlanList(ModelAndView mav);
	public List<FreePlanDto> freePlanCityList(ModelAndView mav);
	public List<FreePlanDto> freePlanSelectCity(ModelAndView mav);
	public void freePlanSchedule(ModelAndView mav);
	public void freePlanSaveFile(ModelAndView mav);
}
