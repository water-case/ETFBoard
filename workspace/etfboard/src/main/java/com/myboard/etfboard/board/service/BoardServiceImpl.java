package com.myboard.etfboard.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myboard.etfboard.board.dao.BoardDAO;
import com.myboard.etfboard.board.vo.BoardVO;
import com.myboard.etfboard.board.vo.ReplyVO;

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
		boardDAO.increaseView(boardIndex);
		return boardDAO.selectContents(boardIndex);
	}

	@Override
	public int updateContents(BoardVO board) throws DataAccessException {
		return boardDAO.updateContents(board);
	}

	@Override
	public int DeleteContents(int boardIndex) throws DataAccessException {
		return boardDAO.deleteContentes(boardIndex);
	}

	@Override
	public int AddAndGetPushCount(int boardIndex) throws DataAccessException {
		boardDAO.updateContents(boardIndex);
		return boardDAO.getPushCount(boardIndex);
	}

	@Override
	public int InsertBoardReply(ReplyVO replyVO) throws DataAccessException {
		// 댓글추가
		if(replyVO.getGrade() == 0)
			boardDAO.InsertReply(replyVO);
		// 대댓글 추가
		else
			boardDAO.InsertReReply(replyVO);
		
		// 댓글수증가시키기
		return boardDAO.AddCommentsCount(replyVO.getBoardIndex());
	}

	@Override
	public List getReplyList(int boardIndex) throws DataAccessException {
		return boardDAO.getReplyList(boardIndex);
	}

	@Override
	public int UpdateBoardReply(ReplyVO replyVO) throws DataAccessException {
		return boardDAO.UpdateReply(replyVO);
	}

	@Override
	public int DeleteBoardReply(int boardIndex, int replyIndex) throws DataAccessException {
		if(boardDAO.DeleteReply(replyIndex) == 1){
			return boardDAO.SubCommentsCount(boardIndex);
		}
		return 0;
	}

	@Override
	public int ipCheck(BoardVO boardVO) throws DataAccessException {
		return boardDAO.ipCheck(boardVO);
	}
}

