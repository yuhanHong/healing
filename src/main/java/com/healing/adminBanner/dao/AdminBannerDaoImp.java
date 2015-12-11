package com.healing.adminBanner.dao;

import java.util.HashMap;
import java.util.List;

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
	public List<ProductDto> productSelect(String product, String keyword) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("product", product);
		hMap.put("keyword", keyword);
		//HomeAspect.logger.info(HomeAspect.logMsg + "상품" + product);
		
		List<ProductDto> productDto = null;
		if(product.equals("product_name")){
			productDto = sqlSessionTemplate.selectList("dao.adminBannerMapper.productSelect0", hMap);
		}else if(product.equals("product_country")){
			productDto = sqlSessionTemplate.selectList("dao.adminBannerMapper.productSelect1", hMap);
		}
		
		return productDto;
	}

	@Override
	public int bannerRecommandInsert(int productNumber) {
		return sqlSessionTemplate.insert("dao.adminBannerMapper.bannerInsert", productNumber);
	}

}
