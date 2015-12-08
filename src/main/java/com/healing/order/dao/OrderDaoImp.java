package com.healing.order.dao;

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
		public ProductDto orderProductRead(int product_number) {
			// TODO Auto-generated method stub
			HomeAspect.logger.info(HomeAspect.logMsg+"///"+product_number);
			return sqlSessionTemplate.selectOne("dao.orderMapper.orderProductRead",product_number);
		}

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
		
}
