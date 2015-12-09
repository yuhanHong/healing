package com.healing.adminOrder.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.aop.HomeAspect;
import com.healing.order.dto.OrderDto;

@Component
public class AdminOrderDaoImp implements AdminOrderDao {
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<OrderDto> getAllOrderList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.adminOrderMapper.getAllOrderList");
	}

	@Override
	public List<OrderDto> adminOrderSearchOne(int search_label, String search_input) {
		// TODO Auto-generated method stub
		List<OrderDto> orderList=null;
		if(search_label==1){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getAllOrderList");
		}else if(search_label==2){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchOneOrderNumber",search_input);
		}else if(search_label==3){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchOneOrderName",search_input);
		}else if(search_label==4){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchOneMemberID",search_input);
		}else if(search_label==5){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchOneMemberName",search_input);
		}else if(search_label==6){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchOneOrderPhone",search_input);
		}else if(search_label==7){
			//도시추가해야됨.아직안함.
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchOneOrderGuest");
		}else if(search_label==8){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchOneOrderGuest");
		}
		
		return orderList;
	}

	@Override
	public List<OrderDto> adminOrderSearchMulti(int search_label, String search_input, String start_date,
			String end_date) {
		// TODO Auto-generated method stub
		List<OrderDto> orderList=null;
		
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("search_input", search_input);
		

		if(search_label==1){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getAllOrderMultiList",map);
		}else if(search_label==2){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchMultiOrderNumber",map);
		}else if(search_label==3){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchMultiOrderName",map);
		}else if(search_label==4){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchMultiMemberID",map);
		}else if(search_label==5){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchMultiMemberName",map);
		}else if(search_label==6){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchMultiOrderPhone",map);
		}else if(search_label==7){
			//도시추가해야됨.아직안함.
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchOneOrderGuest");
		}else if(search_label==8){
			orderList=sqlSessionTemplate.selectList("dao.adminOrderMapper.getadminOrderSearchMultiOrderGuest",map);
		}
		
		return orderList;
	}
}
