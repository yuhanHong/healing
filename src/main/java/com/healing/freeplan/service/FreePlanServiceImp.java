package com.healing.freeplan.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.freeplan.dao.FreePlanDao;
import com.healing.freeplan.dto.FreePlanDto;

@Component
public class FreePlanServiceImp implements FreePlanService {
	@Autowired
	private FreePlanDao freePlanDao;

	@Override
	public List<FreePlanDto> freePlanGetList(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		int count = freePlanDao.freePlanGetCount();
		HomeAspect.logger.info(HomeAspect.logMsg+count);
		
		List<FreePlanDto> freeplanList = null;
		if(count > 0){
			freeplanList = freePlanDao.freePlanGetList();
			HomeAspect.logger.info(HomeAspect.logMsg+freeplanList.size());
		}
		
		return freeplanList;
	}
	
	 @Override
	   public void freePlanInsertOk(ModelAndView mav) {
	      Map<String, Object> map=mav.getModelMap();
	      MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
	      
	      String place_name=request.getParameter("name");
	      String place_category=request.getParameter("category");
	      String place_country=request.getParameter("country");
	      String place_city=request.getParameter("city");
	      String place_explane=request.getParameter("content");
	      
	      String wedo=request.getParameter("ex");
	      HomeAspect.logger.info(HomeAspect.logMsg+wedo);
	      String p=wedo.substring(1,wedo.length()-1);
	      String[] z=p.split(",");
	      
	      double place_latitude=Double.valueOf(z[0]).doubleValue();
	      double place_longitude=Double.valueOf(z[1]).doubleValue();
	      
	      FreePlanDto freeplan=new FreePlanDto();
	      freeplan.setPlace_name(place_name);
	      freeplan.setPlace_category(place_category);
	      freeplan.setPlace_country(place_country);
	      freeplan.setPlace_city(place_city);
	      freeplan.setPlace_explain(place_explane);
	      freeplan.setPlace_latitude(place_latitude);
	      freeplan.setPlace_longitude(place_longitude);
	      
	      MultipartFile upFile = request.getFile("file");
	      String fileName=Long.toString(System.currentTimeMillis())+"_"+upFile.getOriginalFilename();
	      long fileSize = upFile.getSize();
	      // HomeAspect.logger.info(HomeAspect.logMsg+fileName+","+fileSize);
	      
	      if(fileSize != 0){
	         File path= new File("C:\\healing\\workspace\\healing\\src\\main\\webapp\\resources\\mapImage");
	         path.mkdir();
	         
	         if(path.exists() && path.isDirectory()){
	            File file = new File(path, fileName);
	            try{
	               upFile.transferTo(file);
	               freeplan.setPlace_file_name(fileName);
	               freeplan.setPlace_file_size(fileSize);
	               freeplan.setPlace_file_path(file.getAbsolutePath());
	            }catch(Exception e){
	               e.printStackTrace();
	            }
	         }
	      }
	      
	      int check=freePlanDao.freePlanInsert(freeplan);
	      // HomeAspect.logger.info(HomeAspect.logMsg+"인설트체크:"+check);
	      mav.addObject("check",check);
	      mav.setViewName("freeplan/freePlanInsertOk");
	   }

	@Override
	public void freePlanList(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		// 국가명 list를 받아오기 전에 개수를 확인한다.
		int count = freePlanDao.freePlanCtrNum();
		HomeAspect.logger.info(HomeAspect.logMsg+count);
		
		List<String> countryList = null;
		if(count > 0){
			countryList = freePlanDao.freePlanCtrList();
			HomeAspect.logger.info(HomeAspect.logMsg+countryList.size());
		}
		
		mav.addObject("countryList", countryList);
		mav.setViewName("freeplan/freePlanList");
	}

	@Override
	public List<FreePlanDto> freePlanCityList(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String ctrName = request.getParameter("country");
		HomeAspect.logger.info(HomeAspect.logMsg+ctrName);
		
		// 해당 국가의 등록된 도시의 개수를 확인한다.
		int count = freePlanDao.freePlanCityNum(ctrName);
		HomeAspect.logger.info(HomeAspect.logMsg+count);
		
		List<FreePlanDto> cityList = null;
		if(count > 0){
			cityList = freePlanDao.freePlanCityList(ctrName);
			HomeAspect.logger.info(HomeAspect.logMsg+count);
		}
		
		return cityList;
	}

	@Override
	public List<FreePlanDto> freePlanSelectCity(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String cityName = request.getParameter("cityName");
		String place_category = request.getParameter("place_category");
		String searchWord = request.getParameter("searchWord");
		HomeAspect.logger.info(HomeAspect.logMsg+cityName+","+place_category+","+searchWord);
		
		int count = 0;
		List<FreePlanDto> freePlanList = null;
		// category가 null이고 searchWord가 null일 때는 해당 도시의 모든 장소 정보를 출력한다.
		if(place_category == null && searchWord == null){			
			count = freePlanDao.freePlanSelectCityNum(cityName);
			HomeAspect.logger.info(HomeAspect.logMsg+count);
		
			if(count > 0){
				freePlanList = freePlanDao.freePlanSelectCityList(cityName);
				HomeAspect.logger.info(HomeAspect.logMsg+freePlanList.size());
			}
		}else if(searchWord==null && place_category !=null){	// category가 null이 아닐 때는 category에 해당되는 장소 정보만 출력한다.
			count = freePlanDao.freePlanCategoryNum(cityName, place_category);
			HomeAspect.logger.info(HomeAspect.logMsg+count);
			
			if(count > 0){
				freePlanList = freePlanDao.freePlanCategoryList(cityName, place_category);
				HomeAspect.logger.info(HomeAspect.logMsg+freePlanList.size());
			}
		}else{													// searchWord가 null이 아닐 때는 검색에 의한 장소 정보가 출력된다.
			count = freePlanDao.freePlanSearchNum(cityName, searchWord);
			HomeAspect.logger.info(HomeAspect.logMsg+count);
			
			if(count > 0){
				freePlanList = freePlanDao.freePlanSearchList(cityName, searchWord);
				HomeAspect.logger.info(HomeAspect.logMsg+freePlanList.size());
			}
		}
		
		return freePlanList;
	}

	@Override
	public void freePlanSchedule(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		// 클릭된 도시명과 국가명을 전달 받는다.
		String cityName = request.getParameter("cityName");
		String ctrName = request.getParameter("ctrName");
		HomeAspect.logger.info(HomeAspect.logMsg+cityName+","+ctrName);
		
		int count = freePlanDao.freePlanSelectCityNum(cityName);
		HomeAspect.logger.info(HomeAspect.logMsg+count);
		
		List<FreePlanDto> freePlanList = null;
		List<String> freePlanCityNameList = null;
		if(count > 0){
			// cityName(도시)에 속한 모든 장소 정보를 받는다.
			freePlanList = freePlanDao.freePlanSelectCityList(cityName);
			// ctrName(국가)에 cityName를 제외한 도시명을 받는다.
			freePlanCityNameList = freePlanDao.freePlanCityNameList(ctrName, cityName);
			HomeAspect.logger.info(HomeAspect.logMsg+freePlanList.size()+","+freePlanCityNameList.size());
		}
		
		mav.addObject("ctrName", ctrName);
		mav.addObject("freePlanCityNameList", freePlanCityNameList);
		mav.addObject("freePlanList", freePlanList);
		mav.setViewName("freeplan/freePlanSchedule");
	}
	
	@Override
	public void freePlanSaveFile(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		String plan=request.getParameter("plan");
		
		// HomeAspect.logger.info(HomeAspect.logMsg+"멤버넘버:"+member_number);
		 HomeAspect.logger.info(HomeAspect.logMsg+"멤버넘버:"+plan);
		int check=0;
		
		String[] skj=plan.split("/");
		for(int i=0;i<skj.length;i++){
			// HomeAspect.logger.info(HomeAspect.logMsg+"첫번째 분할:"+skj[i]);
			String[] result=skj[i].split(",");
			String schedule_content="";
			String schedule_day="";
			for(int j=0;j<result.length;j++){
				// HomeAspect.logger.info(HomeAspect.logMsg+"두번째 분할:"+result[j]);
				if(j==0){
					schedule_day=result[0];
				}else{
					schedule_content+=result[j]+",";
				}
			}
			 // HomeAspect.logger.info(HomeAspect.logMsg+"일정:"+schedule_day);
			 // HomeAspect.logger.info(HomeAspect.logMsg+"내용:"+schedule_content);
			 
			check=freePlanDao.freePlanSaveFile(member_number,schedule_day,schedule_content);
			//  HomeAspect.logger.info(HomeAspect.logMsg+"스케줄check:"+check);
		}
		
		mav.addObject("check",check);
		mav.setViewName("freeplan/freePlanSaveFileOk");
	}
}