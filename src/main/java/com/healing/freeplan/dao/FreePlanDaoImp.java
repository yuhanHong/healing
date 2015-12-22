package com.healing.freeplan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;

import com.healing.freeplan.dto.FreePlanDto;

@Component
public class FreePlanDaoImp implements FreePlanDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	@Override
	public int freePlanGetCount() {
		return sqlSessionTemplate.selectOne("dao.freePlanMapper.freePlanGetCount");
	}

	@Override
	public List<FreePlanDto> freePlanGetList() {
		return sqlSessionTemplate.selectList("dao.freePlanMapper.freePlanGetList");
	}

	@Override
	public int freePlanInsert(FreePlanDto freeplan) {
		return sqlSessionTemplate.insert("dao.freePlanMapper.freePlanInsert",freeplan);
	}

	// 등록된 도시의 수 반환
	@Override
	public int freePlanCtrNum() {
		return sqlSessionTemplate.selectOne("dao.freePlanMapper.freePlanCtrNum");
	}

	// 등록된 도시 list 반환
	@Override
	public List<String> freePlanCtrList() {
		return sqlSessionTemplate.selectList("dao.freePlanMapper.freePlanCtrList");
	}

	// 클릭한 국가의 도시의 수 반환
	@Override
	public int freePlanCityNum(String ctrName) {
		return sqlSessionTemplate.selectOne("dao.freePlanMapper.freePlanCityNum", ctrName);
	}

	// 클릭한 국가의 도시 list 반환
	@Override
	public List<FreePlanDto> freePlanCityList(String ctrName) {
		return sqlSessionTemplate.selectList("dao.freePlanMapper.freePlanCityList", ctrName);
	}

	@Override
	public int freePlanSelectCityNum(String cityName) {
		return sqlSessionTemplate.selectOne("dao.freePlanMapper.freePlanSelectCityNum", cityName);
	}

	// cityName(도시)의 모든 장소 정보를 갖고온다.
	@Override
	public List<FreePlanDto> freePlanSelectCityList(String cityName) {
		return sqlSessionTemplate.selectList("dao.freePlanMapper.freePlanSelectCityList", cityName);
	}
	
	// 카테고리(음식점, 관광지, 호텔)에 따라 장소 출력
	@Override
	public int freePlanCategoryNum(String cityName, String place_category) {
		HashMap<String,String> hMap = new HashMap<String, String>();
		hMap.put("place_category", place_category);
		hMap.put("cityName", cityName);
		return sqlSessionTemplate.selectOne("dao.freePlanMapper.freePlanCategoryNum", hMap);
	}

	@Override
	public List<FreePlanDto> freePlanCategoryList(String cityName, String place_category) {
		HashMap<String,String> hMap = new HashMap<String, String>();
		hMap.put("place_category", place_category);
		hMap.put("cityName", cityName);
		return sqlSessionTemplate.selectList("dao.freePlanMapper.freePlanCategoryList", hMap);
	}
	
	// 검색어에 따라 장소 출력
	@Override
	public int freePlanSearchNum(String cityName, String searchWord) {
		HashMap<String,String> hMap = new HashMap<String, String>();
		hMap.put("searchWord", searchWord);
		hMap.put("cityName", cityName);
		return sqlSessionTemplate.selectOne("dao.freePlanMapper.freePlanSearchNum", hMap);
	}

	@Override
	public List<FreePlanDto> freePlanSearchList(String cityName, String searchWord) {
		HashMap<String,String> hMap = new HashMap<String, String>();
		hMap.put("searchWord", searchWord);
		hMap.put("cityName", cityName);
		return sqlSessionTemplate.selectList("dao.freePlanMapper.freePlanSearchList", hMap);
	}

	// ctrName(국가) 내의 cityName을 제외한 모든 도시명을 받는다.
	@Override
	public List<String> freePlanCityNameList(String ctrName, String cityName) {
		HashMap<String,String> hMap = new HashMap<String, String>();
		hMap.put("ctrName", ctrName);
		hMap.put("cityName", cityName);
		return sqlSessionTemplate.selectList("dao.freePlanMapper.freePlanCityNameList", hMap);
	}
	
	@Override
	public int freePlanSaveFile(int member_number, String schedule_day, String schedule_content) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("member_number", member_number);
		hMap.put("schedule_day", schedule_day);
		hMap.put("schedule_content", schedule_content);
		
		return sqlSessionTemplate.insert("dao.freePlanMapper.freePlanSaveFile",hMap);
	}

	// 회원이 자유여행 클릭 시 자유여행 플랜 존재유무 확인
	@Override
	public int freePlanGetSchedule(int member_number) {
		return sqlSessionTemplate.selectOne("dao.freePlanMapper.freePlanGetSchedule",member_number);
	}
}
