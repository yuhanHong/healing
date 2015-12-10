package com.healing.adminBanner.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.aop.HomeAspect;
import com.healing.product.dto.ProductDto;

@Component
public class AdminBannerDaoImp implements AdminBannerDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public ProductDto productSelect(String product, String keyword) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("product", product);
		hMap.put("keyword", keyword);
		HomeAspect.logger.info(HomeAspect.logMsg + product);
		
		ProductDto productDto = null;
		if(product == "product_name"){
			productDto = sqlSessionTemplate.selectOne("dao.adminBannerMapper.productSelect0", hMap);
		}else if(product == "product_country"){
			productDto = sqlSessionTemplate.selectOne("dao.adminBannerMapper.productSelect1", hMap);
		}
		
		return productDto;
	}

}
