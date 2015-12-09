package com.healing.adminOrder.dao;

import java.util.List;

import org.springframework.core.annotation.Order;

import com.healing.member.dto.MemberDto;
import com.healing.order.dto.OrderDto;
import com.healing.product.dto.ProductDto;

public interface AdminOrderDao {

	public List<OrderDto> getAllOrderList();
	public List<OrderDto> adminOrderSearchOne(int search_label,String search_input);
	public List<OrderDto> adminOrderSearchMulti(int search_label,String search_input,String start_date,String end_date);
	public OrderDto adminOrderRead(int order_number);
	public ProductDto adminProductRead(int product_number);
	public MemberDto adminOrderMember(int member_number);
}
