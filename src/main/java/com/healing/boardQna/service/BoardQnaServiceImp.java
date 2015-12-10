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
		
		// 답변글일 경우
		BoardQnaDto boardQnaDto = null;
		if(qna_number > 0){
			boardQnaDto = boardQnaDao.boardQnaSelect(qna_number);
		}
		
		mav.addObject("boardQnaDto",boardQnaDto);
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
		boardQnaDto.setQna_reply(0);
		
		boardQnaWriteNumber(boardQnaDto);
		
		boardQnaDto.setQna_content(boardQnaDto.getQna_content().replace("\r\n", "<br/>"));
		
		int check = boardQnaDao.boardQnaInsert(boardQnaDto);
		HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		mav.addObject("check",check);
		mav.setViewName("/boardQna/writeOk");		
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
			// 답글이 달릴 경우 해당 부모글의 qna_reply는 1로 변경된다. 
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

		// searchSort == null 경우 
		int count = 0;
		List<BoardQnaDto> boardQnaList = null;
		
		if(searchSort == null || searchSort.equals("")){
			count = boardQnaDao.boardQnaGetCount();
			HomeAspect.logger.info(HomeAspect.logMsg+count);
			
			if(count > 0){
				boardQnaList = boardQnaDao.boardQnaGetList(startRow, endRow);
				HomeAspect.logger.info(HomeAspect.logMsg+boardQnaList.size());
			}
		}else{
			count = boardQnaDao.boardQnaGetCountSearch(searchSort,searchWord);
			HomeAspect.logger.info(HomeAspect.logMsg+count);
			
			if(count > 0){
				boardQnaList = boardQnaDao.boardQnaGetListSearch(startRow, endRow, searchSort, searchWord);
				HomeAspect.logger.info(HomeAspect.logMsg+boardQnaList.size());
			}
		}
		
		mav.addObject("searchSort", searchSort);
		mav.addObject("searchWord", searchWord);
		mav.addObject("boardQnaList", boardQnaList);
		mav.addObject("count",count);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize",boardSize);
		
		mav.setViewName("/boardQna/list");
	}

	@Override
	public void boardQnaRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int qna_number=Integer.parseInt(request.getParameter("qna_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		HomeAspect.logger.info(HomeAspect.logMsg+qna_number+","+pageNumber);
		
		String searchSort = request.getParameter("searchSort");
		String searchWord = request.getParameter("searchWord");
		HomeAspect.logger.info(HomeAspect.logMsg+searchSort+","+searchWord);	
		
		// read 시에 답변글이 있을 경우 질문글과 답변글을 모두 갖고오기 위해 List로 받는다.
		// 답변글이 달린 질문글을 검색하기 위해서는 질문글과 group_number가 같은 글이 답변글이다.
		BoardQnaDto boardQnaDto = boardQnaDao.boardQnaSelect(qna_number);
		HomeAspect.logger.info(HomeAspect.logMsg+boardQnaDto);
		
		List<BoardQnaDto> boardQnaList = null;
		boardQnaList = boardQnaDao.boardQnaReadList(boardQnaDto);
		HomeAspect.logger.info(HomeAspect.logMsg+boardQnaList.size());
		
		mav.addObject("boardQnaList",boardQnaList);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("searchSort",searchSort);
		mav.addObject("searchWord",searchWord);
		mav.setViewName("/boardQna/read");
	}

	@Override
	public void boardQnaDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int qna_number=Integer.parseInt(request.getParameter("qna_number"));
		int qna_sequence_number = Integer.parseInt(request.getParameter("qna_sequence_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		HomeAspect.logger.info(HomeAspect.logMsg+qna_number+","+pageNumber);
		
		String searchSort = request.getParameter("searchSort");
		String searchWord = request.getParameter("searchWord");
		HomeAspect.logger.info(HomeAspect.logMsg+searchSort+","+searchWord);	
		
		// 답변글 삭제 시 부모글의 답변 유무 필드인 qna_reply를 0으로 변경한다.
		if(qna_sequence_number == 1){
			BoardQnaDto boardQnaDto = boardQnaDao.boardQnaSelect(qna_number);
			int value = boardQnaDao.boardQnaUpdateReply(boardQnaDto);
			HomeAspect.logger.info(HomeAspect.logMsg+value);
		}
		
		int check = boardQnaDao.boardQnaDelete(qna_number);
		HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		
		mav.addObject("searchSort",searchSort);
		mav.addObject("searchWord",searchWord);
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("qna_number",qna_number);
		mav.setViewName("/boardQna/delete");
	}

	@Override
	public void boardQnaUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int qna_number=Integer.parseInt(request.getParameter("qna_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		HomeAspect.logger.info(HomeAspect.logMsg+qna_number+","+pageNumber);
		
		String searchSort = request.getParameter("searchSort");
		String searchWord = request.getParameter("searchWord");
		HomeAspect.logger.info(HomeAspect.logMsg+searchSort+","+searchWord);	
		
		BoardQnaDto boardQnaDto = boardQnaDao.boardQnaSelect(qna_number);
		HomeAspect.logger.info(HomeAspect.logMsg+boardQnaDto);
		
		boardQnaDto.setQna_content(boardQnaDto.getQna_content().replace("<br/>", "\r\n"));
		
		mav.addObject("boardQnaDto",boardQnaDto);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("searchSort",searchSort);
		mav.addObject("searchWord",searchWord);
		mav.setViewName("/boardQna/update");
	}

	@Override
	public void boardQnaUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BoardQnaDto boardQnaDto =(BoardQnaDto)map.get("boardQnaDto");
		
		boardQnaDto.setQna_content(boardQnaDto.getQna_content().replace("\r\n", "<br/>"));
		
		String searchSort = request.getParameter("searchSort");
		String searchWord = request.getParameter("searchWord");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		HomeAspect.logger.info(HomeAspect.logMsg+searchSort+","+searchWord);	
		
		int check = boardQnaDao.boardQnaUpdate(boardQnaDto);
		HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		mav.addObject("check",check);
		mav.addObject("searchSort",searchSort);
		mav.addObject("searchWord",searchWord);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("/boardQna/updateOk");
		
	}
}
