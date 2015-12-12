package com.healing.adminBanner.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.aop.HomeAspect;
import com.healing.product.dto.ProductDto;

@Component
public class AdminBannerDaoImp implements AdminBannerDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * @함수이름 : productSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 전현준
	 * @함수설명 : 추천 상품 검색(sqlSessionTemplate 변수로 xml파일 이동에서 sql문 실행)
	 */
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

	@Override
	public List<ProductDto> recBannerSelect() {
		return sqlSessionTemplate.selectList("dao.adminBannerMapper.recBannerSelect");
	}

	@Override
	public int bannerRecommandDelete(int productNumber) {
		return sqlSessionTemplate.delete("dao.adminBannerMapper.bannerDelete", productNumber);
	}

	/*@Override
	public int getBannerCount() {
		return sqlSessionTemplate.selectOne("dao.adminBannerMapper.bannerCount");
	}

	@Override
	public List<ProductDto> getBannerList(int startRow, int endRow) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.adminBannerMapper.getBannerList", hMap);
	}*/

}
