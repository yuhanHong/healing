package com.healing.boardQna.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.boardQna.dao.BoardQnaDao;
import com.healing.boardQna.dto.BoardQnaDto;

@Component
public class BoardQnaServiceImp implements BoardQnaService {
	@Autowired
	private BoardQnaDao boardQnaDao;

	@Override
	public void boardQnaWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int qna_number = 0;
		int qna_group_number = 1;
		int qna_sequence_number = 0;
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber);
		
		// 답글인 경우
		if(request.getParameter("qna_number") != null){
			qna_number = Integer.parseInt(request.getParameter("qna_number"));
			qna_group_number = Integer.parseInt(request.getParameter("qna_group_number"));
			qna_sequence_number = Integer.parseInt(request.getParameter("qna_sequence_number"));
			HomeAspect.logger.info(HomeAspect.logMsg+qna_number+","+qna_group_number+","+qna_sequence_number);
		}
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("qna_number", qna_number);
		mav.addObject("qna_group_number", qna_group_number);
		mav.addObject("qna_sequence_number", qna_sequence_number);
		mav.setViewName("/boardQna/write");
	}

	@Override
	public void boardQnaWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BoardQnaDto boardQnaDto =(BoardQnaDto)map.get("boardQnaDto");
		
		boardQnaDto.setQna_date(new Date());
		boardQnaDto.setQna_readCount(0);
		
		boardQnaWriteNumber(boardQnaDto);
		
		int check = boardQnaDao.boardQnaInsert(boardQnaDto);
		HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		mav.setViewName("/boardQna/wirteOk");		
	}
	
	// root 글일 경우 qna_group_number를 1 증가
	// 답글일 경우 qna_group_number가 같은 글에 qna_sequence_number를 1로 변경한다.
	// root 글 중에 qna_sequence_number가 1이면 답글이 존재한다. 0이면 답글이 존재하지 않는다.
	public void boardQnaWriteNumber(BoardQnaDto boardQnaDto){
		int qna_number=boardQnaDto.getQna_number();
		int qna_group_number=boardQnaDto.getQna_group_number();
		int qna_sequence_number=boardQnaDto.getQna_sequence_number();
		HomeAspect.logger.info(HomeAspect.logMsg+qna_number+","+qna_group_number+","+qna_sequence_number);
		
		int max = 0;
		
		// root 글
		if(qna_number==0){
			max = boardQnaDao.boardQnaGetMaxNumber();
			HomeAspect.logger.info(HomeAspect.logMsg+max);
			
			qna_group_number = max + 1;
			qna_sequence_number = 0;
		}else{
			boardQnaDao.boardQnaNumberUpdate(boardQnaDto);
			qna_sequence_number = 1;
		}
		
		boardQnaDto.setQna_group_number(qna_group_number);
		boardQnaDto.setQna_sequence_number(qna_sequence_number);
	}

	@Override
	public void boardQnaList(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber="1";
		int currentPage=Integer.parseInt(pageNumber);
		
		// searchSort ( 검색 시 제목, 내용, 작성자로 게시판 검색 가능 )
		String searchSort = request.getParameter("searchSort");
		// searchWord ( 검색할 단어 )
		String searchWord = request.getParameter("searchWord");
		HomeAspect.logger.info(HomeAspect.logMsg+searchSort+","+searchWord);
		
		int boardSize=8;
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;

		int count = boardQnaDao.boardQnaGetCount();
		HomeAspect.logger.info(HomeAspect.logMsg+count);
		
		List<BoardQnaDto> boardQnaList = null;
		if(count > 0){
			boardQnaList = boardQnaDao.boardQnaGetList(startRow, endRow);
			HomeAspect.logger.info(HomeAspect.logMsg+boardQnaList.size());
		}
		
		mav.addObject("searchSort", searchSort);
		mav.addObject("searchWord", searchWord);
		mav.addObject("boardQnaList", boardQnaList);
		mav.addObject("count",count);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize",boardSize);
		
		mav.setViewName("/boardQna/list");
	}
}
