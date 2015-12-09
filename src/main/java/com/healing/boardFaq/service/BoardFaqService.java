package com.healing.boardFaq.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.healing.boardFaq.dto.BoardFaqDto;

public interface BoardFaqService {
	public void boardFaqWrite(ModelAndView mav);
	public void boardFaqWriteOk(ModelAndView mav);
	public void boardFaqList(ModelAndView mav);
	public void boardFaqDelete(ModelAndView mav);
	public void boardFaqUpdate(ModelAndView mav);
	public void boardFaqUpdateOk(ModelAndView mav);
}
