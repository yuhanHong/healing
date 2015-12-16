package com.healing.adminBanner.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.adminBanner.dto.TestFileDto;
import com.healing.aop.HomeAspect;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;

@Component
public class AdminBannerDaoImp implements AdminBannerDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * @함수이름 : productSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 전현준
	 * @함수설명 : 관리자 페이지에서 상품 검색(sqlSessionTemplate 변수로 xml파일 이동에서 sql문 실행)
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

	/**
	 * @함수이름 : bannerRecommandInsert
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 전현준
	 * @함수설명 : 관리자 페이지에서 사용자 페이지에 메인베너를 등록시키는 함수(상태값 1로 update)
	 */
	@Override
	public int bannerRecommandInsert(int productNumber) {
		return sqlSessionTemplate.update("dao.adminBannerMapper.bannerRecommandInsert", productNumber);
	}

	/**
	 * @함수이름 : recBannerSelect
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 전현준
	 * @함수설명 : 추천상품여부가 1인 것만 조회(관리자 페이지 - 추천상품등록 링크 연결되면 직접 출력)
	 */
	@Override
	public List<ProductDto> recBannerSelect() {
		return sqlSessionTemplate.selectList("dao.adminBannerMapper.recBannerSelect");
	}

	/**
	 * @함수이름 : bannerRecommandDelete
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 전현준
	 * @함수설명 : 관리자 페이지에서 사용자 페이지에 메인베너를 등록시키는 함수(상태값 0로 update)
	 */
	@Override
	public int bannerRecommandDelete(int productNumber) {
		return sqlSessionTemplate.update("dao.adminBannerMapper.bannerRecommandDelete", productNumber);
	}

	/**
	 * @함수이름 : bannerGetCount
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 전현준
	 * @함수설명 : 메인 배너에 등록된것만 알려주는 개수 검색
	 */
	@Override
	public int bannerGetCount() {
		return sqlSessionTemplate.selectOne("dao.adminBannerMapper.bannerGetCount");
	}

	/**
	 * @함수이름 : getBannerList
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 전현준
	 * @함수설명 : 메인 배너에 등록된 리스트만 뽑아오는 함수
	 */
	@Override
	public List<ProductDto> getBannerList() {
		return sqlSessionTemplate.selectList("dao.adminBannerMapper.getBannerList");
	}

	/**
	 * @함수이름 : getProductPhotoList
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 전현준
	 * @함수설명 : 메인 배너에 등록된 리스트를 product테이블하고 product_photo테이블하고 equi join해서 뽑아오는 함수
	 */
	@Override
	public List<ProductPhotoDto> getProductPhotoList() {
		return sqlSessionTemplate.selectList("dao.adminBannerMapper.getProductPhotoList");
	}
}
