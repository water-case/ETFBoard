package com.myboard.etfboard.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.board.vo.BoardVO;

public interface BoardDAO {
	public List selectBoardFirstList() throws DataAccessException;

	public int getIndexCount() throws DataAccessException;

	public List getBoardPageList(int page) throws DataAccessException;

	public int insertContents(BoardVO board) throws DataAccessException;
}
