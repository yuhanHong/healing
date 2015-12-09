package com.healing.boardQna.service;

import org.springframework.web.servlet.ModelAndView;

public interface BoardQnaService {
	public void boardQnaWrite(ModelAndView mav);
	public void boardQnaWriteOk(ModelAndView mav);
	public void boardQnaList(ModelAndView mav);
}
