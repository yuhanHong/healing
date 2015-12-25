package com.healing.detailSearch.controller;

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

import com.healing.detailSearch.service.DetailSearchService;
import com.healing.product.dto.ProductDto;

@Controller
public class DetailSearchController {
	
	@Autowired
	private DetailSearchService detailSearchService;
	
	@RequestMapping(value="/detailSearch/detailSearch.do",method=RequestMethod.GET)
	public ModelAndView detailSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.setViewName("detailSearch/detailSearch");
		
		return mav;
	}
	
	@RequestMapping(value="/detailSearch/detailSearchSort.do",method=RequestMethod.GET)
	public ModelAndView detailSearchSort(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		List<ProductDto> list=detailSearchService.detailSearchSort(mav);
		
		JSONObject jso=new JSONObject();
		jso.put("data", list);
		try{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(jso.toString());        // out.print 내용을 ajax의 dataType이 json인 놈에게 데이터 쏴줌
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
