package com.myboard.etfboard.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myboard.etfboard.board.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List FirstList() throws DataAccessException {
		List boardList = null;
		boardList = boardDAO.selectBoardFirstList();
		return boardList;
	}

	@Override
	public int GetIndexCount() throws DataAccessException{
		return boardDAO.getIndexCount();
	}

	@Override
	public List PageList(int page) {
		return boardDAO.getBoardPageList(page);
	}
	
}
