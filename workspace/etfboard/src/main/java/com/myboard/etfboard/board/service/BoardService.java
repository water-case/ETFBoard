package com.myboard.etfboard.board.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface BoardService {
	public List FirstList() throws DataAccessException;

	public int GetIndexCount() throws DataAccessException;

	public List PageList(int page) throws DataAccessException;
}
