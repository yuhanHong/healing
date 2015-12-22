package com.healing.boardFaq.service;

import org.springframework.web.servlet.ModelAndView;

public interface BoardFaqService {
	public void boardFaqWrite(ModelAndView mav);
	public void boardFaqWriteOk(ModelAndView mav);
	public void boardFaqList(ModelAndView mav);
	public void boardFaqDelete(ModelAndView mav);
	public void boardFaqUpdate(ModelAndView mav);
	public void boardFaqUpdateOk(ModelAndView mav);
}
