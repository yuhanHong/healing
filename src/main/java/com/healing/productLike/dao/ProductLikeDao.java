package com.healing.productLike.dao;

import java.util.List;

import com.healing.productLike.dto.ProductLikeDto;

/**
 * @이름 : ProductLikeDao
 * @날짜 : 2015. 12. 11.
 * @개발자 : 봉채윤
 * @설명 : 관심상품 DAO
 */
public interface ProductLikeDao {

	public int productLikeinsert(int member_number,int product_number);
	public List<ProductLikeDto> getProductLikeList(int member_number);
}
