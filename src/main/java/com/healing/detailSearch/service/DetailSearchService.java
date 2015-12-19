package com.healing.detailSearch.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.healing.product.dto.ProductDto;

public interface DetailSearchService {

	public List<ProductDto> detailSearchSort(ModelAndView mav);
	
}
