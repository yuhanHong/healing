package com.healing.adminMode.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import com.healing.adminMode.dao.AdminModeDao;
import com.healing.adminMode.dto.AdminModeDto;
import com.healing.aop.HomeAspect;

@Component
public class AdminModeServiceImp implements AdminModeService {
	
	@Autowired
	private AdminModeDao adminModeDao;

	@Override
	public void adminModeCreateOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		AdminModeDto adminModeDto=(AdminModeDto)map.get("adminModeDto");
		
		int check=adminModeDao.adminModeCreate(adminModeDto);
		// HomeAspect.logger.info(HomeAspect.logMsg+"관리자정보생성체크"+check);
		mav.addObject("check",check);
		mav.setViewName("adminMode/adminModeCreateOk");
		
	}

	@Override
	public void adminModeLogin(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String admin_id=request.getParameter("admin_id");
		String admin_password=request.getParameter("admin_password");
		// HomeAspect.logger.info(HomeAspect.logMsg+"입력받은 로그인정보:"+admin_id+","+admin_password);
		
		AdminModeDto admin=adminModeDao.adminModeLogin(admin_id,admin_password);
		
		mav.addObject("admin",admin);
		mav.setViewName("adminHome");
	}

	@Override
	public void adminModeUpdate(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		List<AdminModeDto> adminList=null;
		
		adminList=adminModeDao.adminMedSelect();
		HomeAspect.logger.info(HomeAspect.logMsg+"입력받은 로그인정보:"+adminList);
		
		mav.addObject("adminList",adminList);
		mav.setViewName("adminMode/adminModeUpdate");
	}
}
