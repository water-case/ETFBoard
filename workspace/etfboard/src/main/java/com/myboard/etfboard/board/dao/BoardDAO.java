package com.myboard.etfboard.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface BoardDAO {
	public List selectBoardFirstList() throws DataAccessException;

	public int getIndexCount() throws DataAccessException;

	public List getBoardPageList(int page) throws DataAccessException;
}
