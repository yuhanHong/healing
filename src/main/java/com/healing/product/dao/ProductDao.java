package com.healing.product.dao;

import com.healing.product.dto.FlightDto;

/**
 * @이름 : ProductDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 홍유한
 * @설명 : 상품조회 DAO 인터페이스
 */
public interface ProductDao {
	FlightDto productFlightRead(int flight_number);
}
