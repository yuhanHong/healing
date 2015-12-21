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

/**
 * @이름 : AdminModeServiceImp
 * @날짜 : 2015. 12. 21.
 * @개발자 : 김진수
 * @설명 : 관리자 계정관리 
 */
@Component
public class AdminModeServiceImp implements AdminModeService {
	
	@Autowired
	private AdminModeDao adminModeDao;

	/**
	 * @함수이름 : adminModeCreateOk
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 계정생성
	 */
	@Override
	public void adminModeCreateOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		AdminModeDto adminModeDto=(AdminModeDto)map.get("adminModeDto");
		
		int check=adminModeDao.adminModeCreate(adminModeDto);
		// HomeAspect.logger.info(HomeAspect.logMsg+"관리자정보생성체크"+check);
		mav.addObject("check",check);
		mav.setViewName("adminMode/adminModeCreateOk");
		
	}

	/**
	 * @함수이름 : adminModeLogin
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 관리자 로그인
	 */
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

	/**
	 * @함수이름 : adminModeUpdate
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 관리자 계정 업데이트
	 */
	@Override
	public void adminModeUpdate(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		List<AdminModeDto> adminList=null;
		
		adminList=adminModeDao.adminModeSelect();
		// HomeAspect.logger.info(HomeAspect.logMsg+"입력받은 로그인정보:"+adminList);
		
		mav.addObject("adminList",adminList);
		mav.setViewName("adminMode/adminModeUpdate");
	}

	/**
	 * @함수이름 : adminModeUpdateOk
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 관리자 계정 수정
	 */
	@Override
	public void adminModeUpdateOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		AdminModeDto adminModeDto=(AdminModeDto)map.get("adminModeDto");

		int check=adminModeDao.adminModeUpdate(adminModeDto);
		// HomeAspect.logger.info(HomeAspect.logMsg+"수정체크:"+check);
		
		mav.addObject("check",check);
		mav.setViewName("adminMode/adminModeUpdateOk");
	}

	/**
	 * @함수이름 : adminModeDelete
	 * @작성일 : 2015. 12. 21.
	 * @개발자 : 김진수
	 * @함수설명 : 관리자 계정 삭제
	 */
	@Override
	public void adminModeDelete(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int admin_number=Integer.parseInt(request.getParameter("admin_number"));
		
		int check=adminModeDao.adminDelete(admin_number);
		// HomeAspect.logger.info(HomeAspect.logMsg+"삭제체크:"+check);
		mav.addObject("check",check);
		mav.setViewName("adminMode/adminModeDelete");
	}
}
