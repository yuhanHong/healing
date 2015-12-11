package com.healing.productLike.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @이름 : ProductLikeService
 * @날짜 : 2015. 12. 11.
 * @개발자 : 봉채윤
 * @설명 : 관심상품 Service
 */
public interface ProductLikeService {

	public void productLikeinsert(ModelAndView mav);
	public void productLikeList(ModelAndView mav);
	public void productLikeAllDelete(ModelAndView mav);
	public void productLikeSelectDel(ModelAndView mav);
}
