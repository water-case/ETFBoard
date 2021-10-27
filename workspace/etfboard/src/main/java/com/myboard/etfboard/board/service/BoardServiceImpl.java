package com.myboard.etfboard.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myboard.etfboard.board.dao.BoardDAO;
import com.myboard.etfboard.board.vo.BoardVO;

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

	@Override
	public int writeContents(BoardVO board) throws DataAccessException {
		return boardDAO.insertContents(board);
	}

	@Override
	public BoardVO getContents(int boardIndex) throws DataAccessException {
		return boardDAO.selectContents(boardIndex);
	}
	
}
