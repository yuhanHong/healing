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

import com.healing.aop.HomeAspect;
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
	public int boardQnaGetCountSearch(String searchSort, String searchWord) {
		int value = 0;
		
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("searchSort", searchSort);
		hMap.put("searchWord", searchWord);
		
		value = sessionTemplate.selectOne("dao.boardQnaMapper.boardQnaGetCountSearch",hMap);
		
		return value;
	}
	
	@Override
	public List<BoardQnaDto> boardQnaGetListSearch(int startRow, int endRow, String searchSort, String searchWord) {
		List<BoardQnaDto> boardQnaList = null;
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("searchWord", searchWord);
		hMap.put("searchSort", searchSort);
		
		boardQnaList = sessionTemplate.selectList("dao.boardQnaMapper.boardQnaGetListSearch",hMap);
		
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
