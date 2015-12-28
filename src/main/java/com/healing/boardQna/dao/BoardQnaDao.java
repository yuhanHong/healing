package com.healing.boardQna.dao;

import java.util.List;

import com.healing.boardQna.dto.BoardQnaDto;

public interface BoardQnaDao {
	public int boardQnaGetMaxNumber();
	public void boardQnaNumberUpdate(BoardQnaDto boardQnaDto);
	public int boardQnaInsert(BoardQnaDto boardQnaDto);
	public int boardQnaGetCountSearch(String searchSort, String searchWord);
	public List<BoardQnaDto> boardQnaGetListSearch(int startRow, int endRow,String searchSort, String searchWord);
	public List<BoardQnaDto> boardQnaReadList(BoardQnaDto boardQnaDto);
	public BoardQnaDto boardQnaSelect(int qna_number);
	public int boardQnaDelete(int qna_number);
	public int boardQnaUpdate(BoardQnaDto boardQnaDto);
	public int boardQnaUpdateReply(BoardQnaDto boardQnaDto);
}
