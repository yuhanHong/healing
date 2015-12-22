package com.healing.adminOrder.dao;

import java.util.List;

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
	public int adminOrderModify(OrderDto orderDto);
	public int adminOrderPay(int order_number);
	public int adminOrderCancle(int order_number);
	public int getTodaySales(String today);
	public int getTodayPay(String today);
	
	//일별 통계
	public List<String> adminOrderStatsSearchDate(String start_date, String end_date);
	public List<String> adminOrderStatsSearchDay(String start_date,String end_date);
	public List<String> adminOrderStatsSearchDayPay(String start_date,String end_date);
	//월별 통계
	public List<String>adminOrderStatsSearchMonthly(String start_date,String end_date);
	public List<String> adminOrderStatsSearchMonth(String start_date,String end_date);
	public List<String> adminOrderStatsSearchMonthPay(String start_date,String end_date);
	//년도별 통계
	public List<String> adminOrderStatsSearchyearly();
	public List<String> adminOrderStatsSearchyear();
	public List<String> adminOrderStatsSearchyearPay();
}
