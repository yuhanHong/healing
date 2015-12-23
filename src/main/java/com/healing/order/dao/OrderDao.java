package com.healing.order.dao;

import com.healing.member.dto.MemberDto;
import com.healing.order.dto.OrderDto;

public interface OrderDao {

	public int orderInsert(OrderDto orderDto);
	public OrderDto getNewOrderDto();
	public MemberDto getMemberInfo(int member_number);
	public int getMemberMoney(int member_number);
	public int updateMemberMoney(int amount,int member_number);
}
