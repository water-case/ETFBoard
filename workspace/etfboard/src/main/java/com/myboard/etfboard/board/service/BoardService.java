package com.myboard.etfboard.board.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface BoardService {
	public List listTexts() throws DataAccessException;
}
