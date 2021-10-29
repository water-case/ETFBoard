package com.myboard.etfboard.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.board.vo.BoardVO;
import com.myboard.etfboard.board.vo.ReplyVO;

public interface BoardDAO {
	public List selectBoardFirstList() throws DataAccessException;

	public int getIndexCount() throws DataAccessException;

	public List getBoardPageList(int page) throws DataAccessException;

	public int insertContents(BoardVO board) throws DataAccessException;

	public BoardVO selectContents(int boardIndex) throws DataAccessException;

	public void increaseView(int boardIndex) throws DataAccessException;

	public int updateContents(BoardVO board) throws DataAccessException;

	public int deleteContentes(int boardIndex) throws DataAccessException;

	public void updateContents(int boardIndex) throws DataAccessException;
	
	public int getPushCount(int boardIndex) throws DataAccessException;

	public void InsertReply(ReplyVO replyVO) throws DataAccessException;

	public int AddCommentsCount(int boardIndex) throws DataAccessException;

	public List getReplyList(int boardIndex) throws DataAccessException;

	public int UpdateReply(ReplyVO replyVO) throws DataAccessException;
	
}
