package com.healing.productLike.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.productLike.dto.ProductLikeDto;

/**
 * @이름 : ProductLikeDaoImp
 * @날짜 : 2015. 12. 11.
 * @개발자 : 봉채윤
 * @설명 : 관심상품 DAOIMP
 */
@Component
public class ProductLikeDaoImp implements ProductLikeDao {
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int productLikeinsert(int member_number, int product_number) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("member_number", member_number);
		map.put("product_number", product_number);
		return sqlSessionTemplate.insert("dao.productLikeMapper.productLikeinsert", map);
	}

	@Override
	public List<ProductLikeDto> getProductLikeList(int member_number) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.productLikeMapper.getProductLikeList",member_number);
	}
}
