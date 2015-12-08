package com.healing.adminOrder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.adminOrder.dao.AdminOrderDao;
import com.healing.order.dto.OrderDto;

@Component
public class AdminOrderServiceImp implements AdminOrderService {

	@Autowired
	private AdminOrderDao adminOrderDao;
	
	
}
