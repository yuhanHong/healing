package com.healing.order.dao;

import com.healing.member.dto.MemberDto;
import com.healing.order.dto.OrderDto;

public interface OrderDao {

	public int orderInsert(OrderDto orderDto);
	public OrderDto getNewOrderDto();
	public MemberDto getMemberInfo(int member_number);
}
