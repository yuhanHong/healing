package com.healing.boardFaq.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healing.boardFaq.service.BoardFaqService;

@Controller
public class BoardFaqController {
	@Autowired
	private BoardFaqService boardFaqService;
	
}
