package com.healing.boardFaq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;

import com.healing.boardFaq.dto.BoardFaqDto;

@Component
public class BoardFaqDaoImp implements BoardFaqDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public int boardFaqWriteInsert(BoardFaqDto boardFaqDto) {
		return sessionTemplate.insert("dao.boardFaqMapper.boardFaqWriteInsert", boardFaqDto);
	}

	@Override
	public int boardFaqGetCount(String faq_sort) {
		return sessionTemplate.selectOne("dao.boardFaqMapper.boardFaqGetCount", faq_sort);
	}

	@Override
	public int boardFaqGetCountSearch(String searchWord) {
		return sessionTemplate.selectOne("dao.boardFaqMapper.boardFaqGetCountSearch", searchWord);
	}
	
	@Override
	public List<BoardFaqDto> boardFaqGetList(String faq_sort) {
		return sessionTemplate.selectList("dao.boardFaqMapper.boardFaqGetList", faq_sort);
	}

	@Override
	public List<BoardFaqDto> boardFaqGetListSearch(String searchWord) {
		return sessionTemplate.selectList("dao.boardFaqMapper.boardFaqGetListSearch", searchWord);
	}

	@Override
	public int boardFaqDelete(int faq_number) {
		return sessionTemplate.delete("dao.boardFaqMapper.boardFaqDelete", faq_number);
	}

	@Override
	public BoardFaqDto boardFaqSelect(int faq_number) {
		return sessionTemplate.selectOne("dao.boardFaqMapper.boardFaqSelect", faq_number);
	}

	@Override
	public int boardFaqUpdate(BoardFaqDto boardFaqDto) {
		
		return sessionTemplate.update("dao.boardFaqMapper.boardFaqUpdate", boardFaqDto);
	}
}
