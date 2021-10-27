package com.myboard.etfboard.board.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.board.vo.BoardVO;

public interface BoardService {
	public List FirstList() throws DataAccessException;

	public int GetIndexCount() throws DataAccessException;

	public List PageList(int page) throws DataAccessException;

	public int writeContents(BoardVO board) throws DataAccessException;

	public BoardVO getContents(int boardIndex) throws DataAccessException;
}
