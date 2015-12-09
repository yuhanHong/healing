package com.healing.boardFaq.dao;

import java.util.List;

import com.healing.boardFaq.dto.BoardFaqDto;

public interface BoardFaqDao {
	public int boardFaqWriteInsert(BoardFaqDto boardFaqDto);
	public int boardFaqGetCount(String faq_sort);
	public int boardFaqGetCountSearch(String searchWord);
	public List<BoardFaqDto> boardFaqGetList(String faq_sort);
	public List<BoardFaqDto> boardFaqGetListSearch(String searchWord);
	public int boardFaqDelete(int faq_number);
	public BoardFaqDto boardFaqSelect(int faq_number);
	public int boardFaqUpdate(BoardFaqDto boardFaqDto);
}
