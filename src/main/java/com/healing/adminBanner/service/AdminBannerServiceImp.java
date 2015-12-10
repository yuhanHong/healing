package com.healing.adminBanner.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminBanner.dao.AdminBannerDao;
import com.healing.aop.HomeAspect;

@Component
public class AdminBannerServiceImp implements AdminBannerService {
	@Autowired
	private AdminBannerDao adminInfoDao;

	@Override
	public void bannerInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");
		HomeAspect.logger.info(HomeAspect.logMsg + "관리자 id:" + admin_id + ", 관리자 pw:" + admin_pw);
		
		mav.addObject("admin_id", admin_id);
		mav.addObject("admin_pw", admin_pw);
		mav.setViewName("adminBanner/bannerInsert");
	}
}
