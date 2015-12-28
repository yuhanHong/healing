package com.healing.boardNotice.dao;

import java.util.List;

import com.healing.boardNotice.dto.BoardNoticeDto;

public interface BoardNoticeDao {
	public int boardNoticeWriteInsert(BoardNoticeDto boardNoticeDto);
	public int boardNoticeGetCount(String searchSort, String searchWord);
	public List<BoardNoticeDto> boardNoticeGetList(int startRow, int endRow, String searchSort, String searchWord);
	public List<BoardNoticeDto> boardNoticeReadSelect(int notice_number, String searchWord, String searchSort);
	public int boardNoticeDelete(int notice_number);
	public BoardNoticeDto boardNoticeSelect(int notice_number);
	public int boardNoticeUpdate(BoardNoticeDto boardNoticeDto);
}
