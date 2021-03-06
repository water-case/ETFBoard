package com.myboard.etfboard.board.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboard.etfboard.board.vo.BoardVO;
import com.myboard.etfboard.board.vo.ReplyVO;

public interface BoardService {
	public List FirstList() throws DataAccessException;

	public int GetIndexCount() throws DataAccessException;

	public List PageList(int page) throws DataAccessException;

	public int writeContents(BoardVO board) throws DataAccessException;

	public BoardVO getContents(int boardIndex) throws DataAccessException;

	public int updateContents(BoardVO board) throws DataAccessException;

	public int DeleteContents(int boardIndex) throws DataAccessException;

	public int AddAndGetPushCount(int boardIndex) throws DataAccessException;
	
	public int InsertBoardReply(ReplyVO replyVO) throws DataAccessException;

	public List getReplyList(int boardIndex) throws DataAccessException;

	public int UpdateBoardReply(ReplyVO replyVO) throws DataAccessException;

	public int DeleteBoardReply(int boardIndex, int replyIndex) throws DataAccessException;

	public int ipCheck(BoardVO boardVO) throws DataAccessException;
}
