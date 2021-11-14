package com.myboard.etfboard.rank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myboard.etfboard.rank.dao.RankDAO;

@Service("rankService")
public class RankServiceImpl implements RankService{
	@Autowired
	private RankDAO rankDAO;

	@Override
	public List GetMemberList() throws DataAccessException {
		return rankDAO.GetMemberList();
	}
}
