package com.myboard.etfboard.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboard.etfboard.board.vo.BoardVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllBoardList() throws DataAccessException {
		List<BoardVO> boardList = null;
		boardList = sqlSession.selectList("mapper.board.selectAllBoardList");
		return boardList;
	}
	
}
