package com.healing.main;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminHomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminHomeController.class);
	
	@RequestMapping(value = "/main/adminHome.do", method = RequestMethod.GET)
	public String adminHome(Locale locale, Model model) {
		return "adminHome";
	}
	
}
