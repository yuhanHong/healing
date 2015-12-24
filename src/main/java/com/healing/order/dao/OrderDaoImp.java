package com.healing.order.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.aop.HomeAspect;
import com.healing.member.dto.MemberDto;
import com.healing.order.dto.OrderDto;
import com.healing.product.dto.ProductDto;


/**
 * @이름 : OrderDaoImp
 * @날짜 : 2015. 12. 8.
 * @개발자 : 봉채윤
 * @설명 : 예약 Dao
 */
@Component
public class OrderDaoImp implements OrderDao {

		@Autowired
		private SqlSessionTemplate sqlSessionTemplate;

		@Override
		public int orderInsert(OrderDto orderDto) {
			// TODO Auto-generated method stub
			return sqlSessionTemplate.insert("dao.orderMapper.orderInsert", orderDto);
		}

		@Override
		public OrderDto getNewOrderDto() {
			// TODO Auto-generated method stub
			return sqlSessionTemplate.selectOne("dao.orderMapper.getNewOrderDto");
		}

		@Override
		public MemberDto getMemberInfo(int member_number) {
			// TODO Auto-generated method stub
			return sqlSessionTemplate.selectOne("dao.orderMapper.getMemberInfo",member_number);
		}

		@Override
		public int getMemberMoney(int member_number) {
			return sqlSessionTemplate.selectOne("dao.orderMapper.getMemberMoney",member_number);
		}

		@Override
		public int updateMemberMoney(int amount, int member_number) {
			HashMap<String,Integer> hMap=new HashMap<String,Integer>();
			hMap.put("amount", amount);
			hMap.put("member_number", member_number);
			
			return sqlSessionTemplate.update("dao.orderMapper.updateMemberMoney",hMap);
		}
}
