package com.myboard.etfboard.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface BoardDAO {
	public List selectAllBoardList() throws DataAccessException;
}
