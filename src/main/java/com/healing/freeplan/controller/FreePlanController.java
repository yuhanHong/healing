package com.healing.freeplan.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.freeplan.dto.FreePlanDto;
import com.healing.freeplan.service.FreePlanService;

@Controller
public class FreePlanController {
	@Autowired
	private FreePlanService freePlanService;
	
	 @RequestMapping(value="/freeplan/freePlanInsert.do",method=RequestMethod.GET)
	   public ModelAndView freePlanInsert(HttpServletRequest request, HttpServletResponse response){
	      ModelAndView mav=new ModelAndView();
	      mav.addObject("request",request);
	      mav.setViewName("freeplan/freePlanInsert");
	      
	      return mav;
	   }
	   
	   @RequestMapping(value="/freeplan/freePlanInsertOk.do",method=RequestMethod.POST)
	   public ModelAndView freePlanInsertOk(HttpServletRequest request, HttpServletResponse response){
	      ModelAndView mav=new ModelAndView();
	      mav.addObject("request",request);
	      
	      freePlanService.freePlanInsertOk(mav);
	      
	      return mav;
	      
	   }
	
	@RequestMapping(value="/freeplan/freePlanList.do", method=RequestMethod.GET)
	public ModelAndView freePlanList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		freePlanService.freePlanList(mav);
		return mav; 
	}
	
	@RequestMapping(value="/freeplan/freePlanPrintMarker.do", method=RequestMethod.GET)
	public ModelAndView freePlanPrintMarker(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("response", response);
		
		List<FreePlanDto> freePlanList = freePlanService.freePlanGetList(mav);
		
		JSONObject obj = new JSONObject();
		obj.put("data", freePlanList);
		try{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(obj.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		//mav.setViewName("/freeplan/list");
		return null; 
	}
	
	//	국가명을 전달받아 해당 국가의 도시 list를 json으로 반환한다.
	@RequestMapping(value="/freeplan/freePlanCityList.do", method=RequestMethod.GET)
	public ModelAndView freePlanCityList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		List<FreePlanDto> freeCityList = freePlanService.freePlanCityList(mav);
		
		JSONObject obj = new JSONObject();
		obj.put("data", freeCityList);
		try{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(obj.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null; 
	}
	
	// 도시 선택 시 해당 도시의 list(관광지, 숙박, 음식점) 받아오기
	@RequestMapping(value="/freeplan/freePlanSelectCity.do", method=RequestMethod.GET)
	public ModelAndView freePlanSelectCity(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		List<FreePlanDto> freeSelectCityList = freePlanService.freePlanSelectCity(mav);
		
		JSONObject obj = new JSONObject();
		obj.put("data", freeSelectCityList);
		try{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(obj.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null; 
	}
	
	@RequestMapping(value="/freeplan/freePlanSchedule.do", method=RequestMethod.GET)
	public ModelAndView freePlanSchedule(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		freePlanService.freePlanSchedule(mav);
		return mav; 
	}
	@RequestMapping(value="/freeplan/freePlanSaveFile.do", method=RequestMethod.POST)
	public ModelAndView freePlanSaveFile(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		freePlanService.freePlanSaveFile(mav);
		return mav; 
	}
}
