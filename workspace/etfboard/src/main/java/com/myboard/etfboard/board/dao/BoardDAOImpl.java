package com.myboard.etfboard.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboard.etfboard.board.vo.BoardVO;
import com.myboard.etfboard.board.vo.PageVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectBoardFirstList() throws DataAccessException {
		List<BoardVO> boardList = null;
		boardList = sqlSession.selectList("mapper.board.selectBoardFirstList");
		return boardList;
	}

	@Override
	public int getIndexCount() throws DataAccessException {
		List<PageVO> pageVO = null;
		pageVO = sqlSession.selectList("mapper.board.getIndexCount");
		return pageVO.get(0).getTotalIndexCount();
	}

	@Override
	public List getBoardPageList(int page) throws DataAccessException {
		List<BoardVO> boardList = null;
		boardList = sqlSession.selectList("mapper.board.selectBoardPageList", page);
		return boardList;
	}

	@Override
	public int insertContents(BoardVO board) throws DataAccessException {
		int result = sqlSession.insert("mapper.board.insertContents", board);
		return result;
	}

	@Override
	public BoardVO selectContents(int boardIndex) throws DataAccessException {
		BoardVO boardVO = sqlSession.selectOne("mapper.board.selectContents", boardIndex);
		return boardVO;
	}

	@Override
	public void increaseView(int boardIndex) throws DataAccessException {
		sqlSession.update("mapper.board.increaseView", boardIndex);
	}

	@Override
	public int updateContents(BoardVO board) throws DataAccessException {
		int result = sqlSession.update("mapper.board.updateContents", board);
		return result;
	}

	@Override
	public int deleteContentes(int boardIndex) throws DataAccessException {
		return sqlSession.delete("mapper.board.deleteContents", boardIndex);
	}
	
}
