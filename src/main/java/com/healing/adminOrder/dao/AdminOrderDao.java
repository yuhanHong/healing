package com.healing.adminOrder.dao;

import java.util.List;

import com.healing.order.dto.OrderDto;

public interface AdminOrderDao {

	public List<OrderDto> getAllOrderList();
	public List<OrderDto> adminOrderSearchOne(int search_label,String search_input);
	public List<OrderDto> adminOrderSearchMulti(int search_label,String search_input,String start_date,String end_date);
}
