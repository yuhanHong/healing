package com.healing.boardFaq.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.boardFaq.dao.BoardFaqDao;
import com.healing.boardFaq.dto.BoardFaqDto;

@Component
public class BoardFaqServiceImp implements BoardFaqService {
	@Autowired
	private BoardFaqDao boardFaqDao;

	@Override
	public void boardFaqWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int faq_number = 0;
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber);
		
//		HomeAspect.logger.info(HomeAspect.logMsg+faq_number);
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("faq_number", faq_number);
		mav.setViewName("/boardFaq/write");
	}

	@Override
	public void boardFaqWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BoardFaqDto boardFaqDto = (BoardFaqDto)map.get("boardFaqDto");
		
		boardFaqDto.setFaq_title(boardFaqDto.getFaq_title().replace("&", "&amp").replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br/>"));
		boardFaqDto.setFaq_content(boardFaqDto.getFaq_content().replace("&", "&amp").replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br/>"));
		
		int check = boardFaqDao.boardFaqWriteInsert(boardFaqDto);
//		HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		mav.addObject("check",check);
		mav.setViewName("/boardFaq/writeOk");
	}

	@Override
	public void boardFaqList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String searchWord = request.getParameter("searchWord");
		String faq_sort = request.getParameter("faq_sort");
		
		// faq_sort == null 경우  	1. list page를 처음 불러올 때(searchSort == null) 		
		//					  	2. 검색할 때(searchWord != null)
		// faq_sort != null 경우 	3. 분류 별로 list 출력(searchWord == null)

//		HomeAspect.logger.info(HomeAspect.logMsg+","+searchWord+","+faq_sort);
		
		int count = 0;
		List<BoardFaqDto> boardFaqList = null;
		
		if(searchWord == null || searchWord.equals("")){
			if(faq_sort == null || faq_sort.equals("")){	// list page를 처음 불러올 때
				if(faq_sort == null){						// FAQ 게시판 첫 페이지로 패키지여행 FAQ list 출력
					faq_sort = "package";
				}
			}
			
			count = boardFaqDao.boardFaqGetCount(faq_sort);
//			HomeAspect.logger.info(HomeAspect.logMsg+count);
			
			if(count > 0){
				boardFaqList = boardFaqDao.boardFaqGetList(faq_sort);
//				HomeAspect.logger.info(HomeAspect.logMsg+boardFaqList.size());
			}
			
		}else{												// 검색 시 list 갖고 오기
			count = boardFaqDao.boardFaqGetCountSearch(searchWord);
//			HomeAspect.logger.info(HomeAspect.logMsg+count);
			
			if(count > 0){
				boardFaqList = boardFaqDao.boardFaqGetListSearch(searchWord);
//				HomeAspect.logger.info(HomeAspect.logMsg+boardFaqList.size());
			}
		}
	
		
		mav.addObject("searchWord", searchWord);
		mav.addObject("faq_sort", faq_sort);
		mav.addObject("boardFaqList", boardFaqList);
		mav.addObject("count", count);
		mav.setViewName("/boardFaq/list");
	}

	@Override
	public void boardFaqDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int faq_number=Integer.parseInt(request.getParameter("faq_number"));
		String faq_sort = request.getParameter("faq_sort");
		String searchWord = request.getParameter("searchWord");		
//		HomeAspect.logger.info(HomeAspect.logMsg+faq_number+","+ faq_sort+","+searchWord);
		
		int check = boardFaqDao.boardFaqDelete(faq_number);
//		HomeAspect.logger.info(HomeAspect.logMsg+check);

		mav.addObject("searchWord", searchWord);
		mav.addObject("faq_sort", faq_sort);
		mav.addObject("check",check);
		mav.setViewName("/boardFaq/delete");
	}

	@Override
	public void boardFaqUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int faq_number=Integer.parseInt(request.getParameter("faq_number"));
		String faq_sort = request.getParameter("faq_sort");
		String searchWord = request.getParameter("searchWord");		
//		HomeAspect.logger.info(HomeAspect.logMsg+faq_number+","+ faq_sort+","+searchWord);
		
		BoardFaqDto boardFaqDto = boardFaqDao.boardFaqSelect(faq_number);
//		HomeAspect.logger.info(HomeAspect.logMsg+boardFaqDto);
		
		boardFaqDto.setFaq_content(boardFaqDto.getFaq_content().replace("<br/>", "\r\n"));
		
		mav.addObject("boardFaqDto",boardFaqDto);
		mav.addObject("faq_sort", faq_sort);
		mav.addObject("searchWord", searchWord);
		mav.addObject("/boardFaq/update");
	}

	@Override
	public void boardFaqUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BoardFaqDto boardFaqDto = (BoardFaqDto)map.get("boardFaqDto");
		
		boardFaqDto.setFaq_content(boardFaqDto.getFaq_content().replace("\r\n", "<br/>"));
		
		String faq_sort = request.getParameter("faq_sort");
		String searchWord = request.getParameter("searchWord");
		
		int check = boardFaqDao.boardFaqUpdate(boardFaqDto);
//		HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		mav.addObject("check",check);
		mav.addObject("faq_sort",faq_sort);
		mav.addObject("searchWord",searchWord);
		mav.setViewName("/boardFaq/updateOk");
	}
}
