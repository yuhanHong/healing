package com.healing.boardFaq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.boardFaq.dao.BoardFaqDao;

@Component
public class BoardFaqServiceImp implements BoardFaqService {
	@Autowired
	private BoardFaqDao boardFaqDao;
}
