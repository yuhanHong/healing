package com.healing.boardQna.dao;

import java.util.List;

import com.healing.boardQna.dto.BoardQnaDto;

public interface BoardQnaDao {
	public int boardQnaGetMaxNumber();
	public void boardQnaNumberUpdate(BoardQnaDto boardQnaDto);
	public int boardQnaInsert(BoardQnaDto boardQnaDto);
	public int boardQnaGetCount();
	public List<BoardQnaDto> boardQnaGetList(int startRow, int endRow);
}
