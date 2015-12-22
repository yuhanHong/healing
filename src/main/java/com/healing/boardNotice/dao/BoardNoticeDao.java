package com.healing.boardNotice.dao;

import java.util.List;

import com.healing.boardNotice.dto.BoardNoticeDto;

public interface BoardNoticeDao {
	public int boardNoticeWriteInsert(BoardNoticeDto boardNoticeDto);
	public int boardNoticeGetCount();
	public int boardNoticeGetCountTitle(String searchWord);
	public int boardNoticeGetCountContent(String searchWord);
	public List<BoardNoticeDto> boardNoticeGetList(int startRow, int endRow);
	public List<BoardNoticeDto> boardNoticeGetListTitle(int startRow, int endRow, String searchWord);
	public List<BoardNoticeDto> boardNoticeGetListContent(int startRow, int endRow, String searchWord);
	public List<BoardNoticeDto> boardNoticeReadSelect(int notice_number, String searchWord, String searchSort);
	public int boardNoticeDelete(int notice_number);
	public BoardNoticeDto boardNoticeSelect(int notice_number);
	public int boardNoticeUpdate(BoardNoticeDto boardNoticeDto);
}
