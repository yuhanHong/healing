package com.healing.adminOrder.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.aop.HomeAspect;
import com.healing.member.dto.MemberDto;
import com.healing.order.dto.OrderDto;
import com.healing.product.dto.ProductDto;

@Component
public class AdminOrderDaoImp implements AdminOrderDao {
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<OrderDto> getAllOrderList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.adminOrderMapper.getAllOrderList");
	}

	//검색어 검색
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

	//날짜와 검색어 중복 검색
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


	@Override
	public OrderDto adminOrderRead(int order_number) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.adminOrderMapper.adminOrderRead",order_number);
	}

	@Override
	public ProductDto adminProductRead(int product_number) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.orderMapper.orderProductRead",product_number);
	}

	@Override
	public MemberDto adminOrderMember(int member_number) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.orderMapper.getMemberInfo",member_number);
	}

	@Override
	public int adminOrderModify(OrderDto orderDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.adminOrderMapper.adminOrderModify",orderDto);
	}

	@Override
	public int adminOrderPay(int order_number) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		String state="결제완료";
		map.put("state", state);
		map.put("order_number", order_number);
		return sqlSessionTemplate.update("dao.adminOrderMapper.adminOrderPay",map);
	}

	@Override
	public int adminOrderCancle(int order_number) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		String state="예약취소";
		map.put("state", state);
		map.put("order_number", order_number);
		return sqlSessionTemplate.update("dao.adminOrderMapper.adminOrderCancle",map);
	}

	@Override
	public List<Integer> getTodaySales(String today) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.adminOrderMapper.getTodaySales",today);
	}

	@Override
	public List<Integer> getTodayPay(String today) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.adminOrderMapper.getTodayPay",today);
	}

	@Override
	public List<String> adminOrderStatsSearchDay(String start_date,String end_date) {
		// TODO Auto-generated method stub
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
	
		return sqlSessionTemplate.selectList("dao.adminOrderMapper.adminOrderStatsSearchDay",map);
	}

	@Override
	public int adminOrderStatsSearchDayPay(String start_date, String end_date) {
		// TODO Auto-generated method stub
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
	
//		HomeAspect.logger.info(HomeAspect.logMsg + "하하하" + sqlSessionTemplate.selectOne("dao.adminOrderMapper.adminOrderStatsSearchDayPay2",map));
		
		return sqlSessionTemplate.selectOne("dao.adminOrderMapper.adminOrderStatsSearchDayPay2",map);
//		return sqlSessionTemplate.selectList("dao.adminOrderMapper.adminOrderStatsSearchDayPay",map);
	}
}
