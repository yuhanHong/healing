package com.healing.adminInfo.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminInfo.dao.AdminInfoDao;
import com.healing.adminInfo.dto.AdminInfoDto;
import com.healing.aop.HomeAspect;

@Component
public class AdminInfoServiceImp implements AdminInfoService {
	@Autowired
	private AdminInfoDao adminInfoDao;

	@Override
	public void infoInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		AdminInfoDto adminInfoDto = (AdminInfoDto) map.get("adminInfoDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int check = adminInfoDao.insert(adminInfoDto);
		HomeAspect.logger.info(HomeAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("admin/infoInsertOk");
	}
}
