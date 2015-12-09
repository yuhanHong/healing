package com.healing.boardQna.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;

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
	public List<BoardQnaDto> boardQnaGetList(int startRow, int endRow) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sessionTemplate.selectList("dao.boardQnaMapper.boardQnaGetList", hMap);
	}
}
