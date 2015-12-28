package com.healing.boardNotice.dao;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.healing.aop.HomeAspect;
import com.healing.boardNotice.dto.BoardNoticeDto;

@Component
public class BoardNoticeDaoImp implements BoardNoticeDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public int boardNoticeWriteInsert(BoardNoticeDto boardNoticeDto) {
		int value=0;
		
		if(boardNoticeDto.getNotice_file_name() != null){
			value = sessionTemplate.insert("dao.boardNoticeMapper.boardNoticeWriteInsert", boardNoticeDto);
		}else{
			value = sessionTemplate.insert("dao.boardNoticeMapper.boardNoticeWriteInsert2", boardNoticeDto);
		}
		return value;
	}

	@Override
	public int boardNoticeGetCount(String searchSort, String searchWord) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("searchSort", searchSort);
		hMap.put("searchWord", searchWord);
		return sessionTemplate.selectOne("dao.boardNoticeMapper.boardNoticeGetCount", hMap);
	}
	
	@Override
	public List<BoardNoticeDto> boardNoticeGetList(int startRow, int endRow, String searchSort, String searchWord) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("searchSort", searchSort);
		hMap.put("searchWord", searchWord);
		return sessionTemplate.selectList("dao.boardNoticeMapper.boardNoticeGetList", hMap);
	}

	@Override
	public LinkedList<BoardNoticeDto> boardNoticeReadSelect(int notice_number, String searchWord, String searchSort) {
		LinkedList<BoardNoticeDto> boardNoticeList = new LinkedList<BoardNoticeDto>();
		
		// 트랜잭션
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);

		try{

			sessionTemplate.update("dao.boardNoticeMapper.readCount",notice_number);
		
			BoardNoticeDto boardNoticeDto = new BoardNoticeDto();
			boardNoticeDto=sessionTemplate.selectOne("dao.boardNoticeMapper.boardNoticeSelect", notice_number);
			boardNoticeList.add(boardNoticeDto);
			
			BoardNoticeDto boardNoticeDtoPrev = new BoardNoticeDto();
			BoardNoticeDto boardNoticeDtoNext = new BoardNoticeDto();
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("notice_number", notice_number);
			hMap.put("searchWord", searchWord);
			hMap.put("searchSort", searchSort);
			
			int notice_number_prev = sessionTemplate.selectOne("dao.boardNoticeMapper.boardNoticeNumberPrev", hMap);
			if(notice_number_prev != 0){
				boardNoticeDtoPrev=sessionTemplate.selectOne("dao.boardNoticeMapper.boardNoticeSelect", notice_number_prev);
				boardNoticeList.add(boardNoticeDtoPrev);
			}
			
			int notice_number_next = sessionTemplate.selectOne("dao.boardNoticeMapper.boardNoticeNumberNext", hMap);
			if(notice_number_next != 0){
				boardNoticeDtoNext=sessionTemplate.selectOne("dao.boardNoticeMapper.boardNoticeSelect", notice_number_next);
				boardNoticeList.add(boardNoticeDtoNext);
			}
			
			transactionManager.commit(status);
		}catch(Throwable e){
			transactionManager.rollback(status);
			e.printStackTrace();
		}
		return boardNoticeList;
	}

	@Override
	public int boardNoticeDelete(int notice_number) {
		return sessionTemplate.delete("dao.boardNoticeMapper.boardNoticeDelete",notice_number);
	}

	@Override
	public BoardNoticeDto boardNoticeSelect(int notice_number) {
		return sessionTemplate.selectOne("dao.boardNoticeMapper.boardNoticeSelect",notice_number);
	}

	@Override
	public int boardNoticeUpdate(BoardNoticeDto boardNoticeDto) {
		int check = 0;
		
		if(boardNoticeDto.getNotice_file_name() != null){
			check = sessionTemplate.update("dao.boardNoticeMapper.boardNoticeUpdate2",boardNoticeDto);
		}else{
			check = sessionTemplate.update("dao.boardNoticeMapper.boardNoticeUpdate",boardNoticeDto);
		}
		return check;
	}

}
