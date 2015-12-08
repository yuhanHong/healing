package com.healing.boardNotice.service;


import org.springframework.web.servlet.ModelAndView;

import com.healing.boardNotice.dao.BoardNoticeDao;

public interface BoardNoticeService {
	public void boardNoticeWrite(ModelAndView mav);
	public void boardNoticeWriteOk(ModelAndView mav);
	public void boardNoticeList(ModelAndView mav);
	public void boardNoticeRead(ModelAndView mav);
	public void boardNoticeDelete(ModelAndView mav);
	public void boardNoticeUpdate(ModelAndView mav);
	public void boardNoticeUpdateOk(ModelAndView mav);
	public void boardNoticeDown(ModelAndView mav);
}
