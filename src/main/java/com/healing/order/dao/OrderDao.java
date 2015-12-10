package com.healing.order.dao;

import com.healing.member.dto.MemberDto;
import com.healing.order.dto.OrderDto;
import com.healing.product.dto.ProductDto;

public interface OrderDao {

	public ProductDto orderProductRead(int product_number);
	public int orderInsert(OrderDto orderDto);
	public OrderDto getNewOrderDto();
	public MemberDto getMemberInfo(int member_number);
	
}
