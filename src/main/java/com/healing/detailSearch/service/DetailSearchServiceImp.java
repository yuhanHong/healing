package com.healing.detailSearch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.detailSearch.dao.DetailSearchDao;

@Component
public class DetailSearchServiceImp implements DetailSearchService {
	
	@Autowired
	private DetailSearchDao detailSearchDao;
}
