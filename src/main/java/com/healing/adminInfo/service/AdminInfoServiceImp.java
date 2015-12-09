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

	/**
	 * @함수이름 : infoInsert
	 * @작성일 : 2015. 12. 7.
	 * @개발자 : 전현준
	 * @함수설명 : 관리자 페이지 회사정보 등록 실질적 작업
	 */
	@Override
	public void infoInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		AdminInfoDto adminInfoDto = (AdminInfoDto) map.get("adminInfoDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int check = adminInfoDao.infoInsert(adminInfoDto);
		HomeAspect.logger.info(HomeAspect.logMsg + "insert 체크값:" + check);
		
		mav.addObject("check", check);
		mav.setViewName("admin/infoInsertOk");
	}
}
