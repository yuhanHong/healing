package com.healing.boardQna.dao;

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

import com.healing.boardQna.dto.BoardQnaDto;

@Component
public class BoardQnaDaoImp implements BoardQnaDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public int boardQnaGetMaxNumber() {
		return sessionTemplate.selectOne("dao.boardQnaMapper.boardQnaGetMaxNumber");
	}

	@Override
	public void boardQnaNumberUpdate(BoardQnaDto boardQnaDto) {
		sessionTemplate.update("dao.boardQnaMapper.boardQnaNumberUpdate", boardQnaDto);
	}

	@Override
	public int boardQnaInsert(BoardQnaDto boardQnaDto) {
		return sessionTemplate.insert("dao.boardQnaMapper.boardQnaInsert", boardQnaDto);
	}

	@Override
	public int boardQnaGetCount() {
		return sessionTemplate.selectOne("dao.boardQnaMapper.boardQnaGetCount");
	}

	@Override
	public int boardQnaGetCountSearch(String searchSort, String searchWord) {
		int value = 0;
		
		if(searchSort.equals("titleSort")){
			value = sessionTemplate.selectOne("dao.boardQnaMapper.boardQnaGetCountTitle", searchWord);
		}else if(searchSort.equals("contentSort")){
			value = sessionTemplate.selectOne("dao.boardQnaMapper.boardQnaGetCountContent", searchWord);
		}else if(searchSort.equals("writerSort")){
			value = sessionTemplate.selectOne("dao.boardQnaMapper.boardQnaGetCountWriter", searchWord);
		}
		
		return value;
	}
	
	@Override
	public List<BoardQnaDto> boardQnaGetList(int startRow, int endRow) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sessionTemplate.selectList("dao.boardQnaMapper.boardQnaGetList", hMap);
	}
	
	@Override
	public List<BoardQnaDto> boardQnaGetListSearch(int startRow, int endRow, String searchSort, String searchWord) {
		List<BoardQnaDto> boardQnaList = null;
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("searchWord", searchWord);
		
		if(searchSort.equals("titleSort")){
			boardQnaList = sessionTemplate.selectList("dao.boardQnaMapper.boardQnaGetListSearchTitle", hMap);
		}else if(searchSort.equals("contentSort")){
			boardQnaList = sessionTemplate.selectList("dao.boardQnaMapper.boardQnaGetListSearchContent", hMap);
		}else if(searchSort.equals("writerSort")){
			boardQnaList = sessionTemplate.selectList("dao.boardQnaMapper.boardQnaGetListSearchWriter", hMap);
		}
		
		return boardQnaList;
	}

	@Override
	public List<BoardQnaDto> boardQnaReadList(BoardQnaDto boardQnaDto) {
		List<BoardQnaDto> boardQnaList = new LinkedList<BoardQnaDto>();
		
		// 트랜잭션
		TransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);

		try{
			int qna_number = boardQnaDto.getQna_number();
			int qna_group_number = boardQnaDto.getQna_group_number();
			sessionTemplate.update("dao.boardQnaMapper.readCount",qna_number);
			
			boardQnaList = sessionTemplate.selectList("dao.boardQnaMapper.boardQnaReadList",qna_group_number);
			
			transactionManager.commit(status);
		}catch(Throwable e){
			transactionManager.rollback(status);
			e.printStackTrace();
		}
		return boardQnaList;
	}

	@Override
	public BoardQnaDto boardQnaSelect(int qna_number) {
		return sessionTemplate.selectOne("dao.boardQnaMapper.boardQnaSelect", qna_number);
	}

	@Override
	public int boardQnaDelete(int qna_number) {
		return sessionTemplate.delete("dao.boardQnaMapper.boardQnaDelete", qna_number);
	}

	@Override
	public int boardQnaUpdate(BoardQnaDto boardQnaDto) {
		return sessionTemplate.update("dao.boardQnaMapper.boardQnaUpdate", boardQnaDto);
	}

	@Override
	public int boardQnaUpdateReply(BoardQnaDto boardQnaDto) {
		return sessionTemplate.update("dao.boardQnaMapper.boardQnaUpdateReply", boardQnaDto);
	}
}
